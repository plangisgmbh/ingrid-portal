package de.ingrid.mdek;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;

import de.ingrid.mdek.IMdekCallerAbstract.Quantity;
import de.ingrid.mdek.IMdekErrors.MdekError;
import de.ingrid.mdek.dwr.AddressSearchResultBean;
import de.ingrid.mdek.dwr.CatalogBean;
import de.ingrid.mdek.dwr.JobInfoBean;
import de.ingrid.mdek.dwr.MdekAddressBean;
import de.ingrid.mdek.dwr.MdekDataBean;
import de.ingrid.mdek.dwr.ObjectSearchResultBean;
import de.ingrid.mdek.job.MdekException;
import de.ingrid.utils.IngridDocument;

public class SimpleUDKConnection implements DataConnectionInterface {

	private final static Logger log = Logger.getLogger(SimpleUDKConnection.class);

	private IMdekCaller mdekCaller;
	private IMdekCallerObject mdekCallerObject;
	private IMdekCallerAddress mdekCallerAddress;
	private IMdekCallerQuery mdekCallerQuery;
	private IMdekCallerCatalog mdekCallerCatalog;
	private DataMapperInterface dataMapper;

	public SimpleUDKConnection(File communicationProperties) {
		if (communicationProperties == null || !(communicationProperties instanceof File)) {
			throw new IllegalStateException(
					"Please specify the location of the communication.properties file via the Property 'mdekCaller.properties' in /src/resources/mdek.properties");
		}
		MdekCaller.initialize(communicationProperties);
		mdekCaller = MdekCaller.getInstance();

		MdekCallerObject.initialize(mdekCaller);
		MdekCallerAddress.initialize(mdekCaller);
		MdekCallerQuery.initialize(mdekCaller);
		MdekCallerCatalog.initialize(mdekCaller);
		
		mdekCallerObject = MdekCallerObject.getInstance();
		mdekCallerAddress = MdekCallerAddress.getInstance();
		mdekCallerQuery = MdekCallerQuery.getInstance();
		mdekCallerCatalog = MdekCallerCatalog.getInstance();
	}

	// Shutdown Method is called by the Spring Framework on shutdown
	public void destroy() {
		MdekCaller.shutdown();
		mdekCaller = null;
		dataMapper = null;
	}

	public DataMapperInterface getDataMapper() {
		return dataMapper;
	}

	public void setDataMapper(DataMapperInterface dataMapper) {
		this.dataMapper = dataMapper;
	}

	public MdekDataBean getObjectDetail(String uuid) {
		IngridDocument response = mdekCallerObject.fetchObject(uuid, Quantity.DETAIL_ENTITY, getCurrentSessionId());
		return extractSingleObjectFromResponse(response);
	}

	public MdekAddressBean getAddressDetail(String uuid) {
		IngridDocument response = mdekCallerAddress.fetchAddress(uuid, Quantity.DETAIL_ENTITY, getCurrentSessionId());
		return extractSingleAddressFromResponse(response);	
	}
	
	
	public ArrayList<HashMap<String, Object>> getRootAddresses(boolean freeAddressesOnly) {
		IngridDocument response = mdekCallerAddress.fetchTopAddresses(getCurrentSessionId(), freeAddressesOnly);
		return extractAddressesFromResponse(response);
	}

	public ArrayList<HashMap<String, Object>> getRootObjects() {
		IngridDocument response = mdekCallerObject.fetchTopObjects(getCurrentSessionId());
		return extractObjectsFromResponse(response);
	}

	public ArrayList<HashMap<String, Object>> getSubObjects(String uuid, int depth) {
		IngridDocument response = mdekCallerObject.fetchSubObjects(uuid, getCurrentSessionId());
		return extractObjectsFromResponse(response);
	}

	public ArrayList<HashMap<String, Object>> getSubAddresses(String uuid, int depth) {
		IngridDocument response = mdekCallerAddress.fetchSubAddresses(uuid, getCurrentSessionId());
		return extractAddressesFromResponse(response);
	}

	public MdekDataBean getInitialObject(String parentUuid) {
		IngridDocument obj = new IngridDocument();
		obj.put(MdekKeys.PARENT_UUID, parentUuid);

		IngridDocument response = mdekCallerObject.getInitialObject(obj, getCurrentSessionId());
		return extractSingleObjectFromResponse(response);
	}
	
	public MdekAddressBean getInitialAddress(String parentUuid) {
		IngridDocument adr = new IngridDocument();
		adr.put(MdekKeys.PARENT_UUID, parentUuid);

		IngridDocument response = mdekCallerAddress.getInitialAddress(adr, getCurrentSessionId());
		return extractSingleAddressFromResponse(response);
	}

	
	public MdekDataBean saveObject(MdekDataBean data) {
		IngridDocument obj = (IngridDocument) dataMapper.convertFromObjectRepresentation(data);

		// Handle store of a new node. Should this be handled by the
		// EntryService?
		if (data.getUuid().equalsIgnoreCase("newNode")) {
			obj.remove(MdekKeys.UUID);
			obj.remove(MdekKeys.ID);
		}

		log.debug("Sending the following object for storage:");
		log.debug(obj);

		IngridDocument response = mdekCallerObject.storeObject(obj, true, getCurrentSessionId());
		return extractSingleObjectFromResponse(response);
	}

	public MdekAddressBean saveAddress(MdekAddressBean data) {
		IngridDocument adr = (IngridDocument) dataMapper.convertFromAddressRepresentation(data);
//		log.debug("saveAddress() not implemented yet.");

		// Handle store of a new address. Should this be handled by the
		// EntryService?
		if (data.getUuid().equalsIgnoreCase("newNode")) {
			adr.remove(MdekKeys.UUID);
			adr.remove(MdekKeys.ID);
		}

		log.debug("Sending the following address for storage:");
		log.debug(adr);

		IngridDocument response = mdekCallerAddress.storeAddress(adr, true, getCurrentSessionId());
		return extractSingleAddressFromResponse(response);
	}

	
	public MdekDataBean publishObject(MdekDataBean data, boolean forcePublicationCondition) {
	IngridDocument obj = (IngridDocument) dataMapper.convertFromObjectRepresentation(data);

	if (data.getUuid().equalsIgnoreCase("newNode")) {
		obj.remove(MdekKeys.UUID);
		obj.remove(MdekKeys.ID);
	}

	log.debug("Sending the following object for publishing:");
	log.debug(obj);

	IngridDocument response = mdekCallerObject.publishObject(obj, true, forcePublicationCondition, getCurrentSessionId());
	return extractSingleObjectFromResponse(response);
}


	public MdekAddressBean publishAddress(MdekAddressBean data) {
		IngridDocument adr = (IngridDocument) dataMapper.convertFromAddressRepresentation(data);

		if (data.getUuid().equalsIgnoreCase("newNode")) {
			adr.remove(MdekKeys.UUID);
			adr.remove(MdekKeys.ID);
		}

		log.debug("Sending the following address for publishing:");
		log.debug(adr);

		IngridDocument response = mdekCallerAddress.publishAddress(adr, true, getCurrentSessionId());
		return extractSingleAddressFromResponse(response);
	}

	
	public void deleteObject(String uuid) {
		mdekCallerObject.deleteObject(uuid, getCurrentSessionId());
	}

	public void deleteAddress(String uuid) {
		mdekCallerAddress.deleteAddress(uuid, getCurrentSessionId());
	}

	public boolean deleteObjectWorkingCopy(String uuid) {
		IngridDocument response = mdekCallerObject.deleteObjectWorkingCopy(uuid, getCurrentSessionId());

		IngridDocument result = extractAdditionalInformationFromResponse(response);
		return (Boolean) result.get(MdekKeys.RESULTINFO_WAS_FULLY_DELETED);
	}

	public boolean deleteAddressWorkingCopy(String uuid) {
		IngridDocument response = mdekCallerAddress.deleteAddressWorkingCopy(uuid, getCurrentSessionId());

		IngridDocument result = extractAdditionalInformationFromResponse(response);
		return (Boolean) result.get(MdekKeys.RESULTINFO_WAS_FULLY_DELETED);
	}

	public boolean canCutObject(String uuid) {
		IngridDocument response = mdekCallerObject.checkObjectSubTree(uuid, getCurrentSessionId());
		if (mdekCaller.getResultFromResponse(response) == null) {
			handleError(response);
		} else {
			IngridDocument result = mdekCaller.getResultFromResponse(response);
			boolean hasWorkingCopy = result.getBoolean(MdekKeys.RESULTINFO_HAS_WORKING_COPY);
			if (hasWorkingCopy) {
				// Throw an error. A node that is about to be moved must not have working copies as children
				throw new MdekException(MdekError.SUBTREE_HAS_WORKING_COPIES);
			}
		}
		return true;
	}

	public boolean canCutAddress(String uuid) {
		IngridDocument response = mdekCallerAddress.checkAddressSubTree(uuid, getCurrentSessionId());
		if (mdekCaller.getResultFromResponse(response) == null) {
			handleError(response);
		} else {
			IngridDocument result = mdekCaller.getResultFromResponse(response);
			boolean hasWorkingCopy = result.getBoolean(MdekKeys.RESULTINFO_HAS_WORKING_COPY);
			if (hasWorkingCopy) {
				// Throw an error. An address that is about to be moved must not have working copies as children
				throw new MdekException(MdekError.SUBTREE_HAS_WORKING_COPIES);
			}
		}
		return true;
	}

	public boolean canCopyObject(String uuid) {
		// Copy is always allowed. Placeholder for future changes
		return true;
	}

	public boolean canCopyAddress(String uuid) {
		// Copy is always allowed. Placeholder for future changes
		return true;
	}

	
	public List<String> getPathToObject(String uuid) {
		IngridDocument response = mdekCallerObject.getObjectPath(uuid, getCurrentSessionId());
		return extractPathFromResponse(response);
	}

	public List<String> getPathToAddress(String uuid) {
		IngridDocument response = mdekCallerAddress.getAddressPath(uuid, getCurrentSessionId());
		return extractPathFromResponse(response);
	}

	public Map<String, Object> copyObject(String fromUuid, String toUuid, boolean copySubTree) {
		IngridDocument response = mdekCallerObject.copyObject(fromUuid, toUuid, copySubTree, getCurrentSessionId());
		return extractSingleSimpleObjectFromResponse(response);
	}

	public Map<String, Object> copyAddress(String fromUuid, String toUuid, boolean copySubTree, boolean copyToFreeAddress) {
		IngridDocument response = mdekCallerAddress.copyAddress(fromUuid, toUuid, copySubTree, copyToFreeAddress, getCurrentSessionId());
		return extractSingleSimpleAddressFromResponse(response);
	}

	public void moveObjectSubTree(String fromUuid, String toUuid, boolean forcePublicationCondition) {
		IngridDocument response = mdekCallerObject.moveObject(fromUuid, toUuid, true, forcePublicationCondition, getCurrentSessionId());
		if (mdekCaller.getResultFromResponse(response) == null) {
			handleError(response);
		}
	}

	public void moveAddressSubTree(String fromUuid, String toUuid, boolean moveToFreeAddress) {
//		log.debug("moveAddressSubTree(String, String) not implemented yet.");
		IngridDocument response = mdekCallerAddress.moveAddress(fromUuid, toUuid, true, moveToFreeAddress, getCurrentSessionId());
		if (mdekCaller.getResultFromResponse(response) == null) {
			handleError(response);
		}
	}
	
	public AddressSearchResultBean searchAddresses(MdekAddressBean adr, int startHit, int numHits) {
		IngridDocument adrDoc = (IngridDocument) dataMapper.convertFromAddressRepresentation(adr);

		log.debug("Sending the following address search:");
		log.debug(adrDoc);

		IngridDocument response = mdekCallerAddress.searchAddresses(adrDoc, startHit, numHits, getCurrentSessionId());
		
		// TODO Convert the response
		return extractAddressSearchResultsFromResponse(response);
	}

	public AddressSearchResultBean queryAddressesThesaurusTerm(String topicId, int startHit, int numHits) {
		log.debug("Searching for addresses with topicId: "+topicId);

		IngridDocument response = mdekCallerQuery.queryAddressesThesaurusTerm(topicId, startHit, numHits, getCurrentSessionId());
		
		// TODO Convert the response
		return extractAddressSearchResultsFromResponse(response);
	}
	
	
	public ObjectSearchResultBean queryObjectsThesaurusTerm(String topicId, int startHit, int numHits) {
		log.debug("Searching for objects with topicId: "+topicId);

		IngridDocument response = mdekCallerQuery.queryObjectsThesaurusTerm(topicId, startHit, numHits, getCurrentSessionId());
		
		// TODO Convert the response
		return extractObjectSearchResultsFromResponse(response);
	}

	
	public Map<Integer, List<String[]>> getSysLists(Integer[] listIds, Integer languageCode) {
		IngridDocument response = mdekCallerCatalog.getSysLists(listIds, languageCode, getCurrentSessionId());
		return extractSysListFromResponse(response);
	}

	public CatalogBean getCatalogData() {
		IngridDocument response = mdekCallerCatalog.fetchCatalog(getCurrentSessionId());
		return extractCatalogFromResponse(response);
	}

	public JobInfoBean getRunningJobInfo() {
		IngridDocument response = mdekCaller.getRunningJobInfo(getCurrentSessionId());
		return extractJobInfoFromResponse(response);
	}

	public JobInfoBean cancelRunningJob() {
		IngridDocument response = mdekCaller.cancelRunningJob(getCurrentSessionId());
		return extractJobInfoFromResponse(response);	
	}

	
	// ------------------------ Helper Methods ---------------------------------------

	private ArrayList<HashMap<String, Object>> extractObjectsFromResponse(IngridDocument response) {
		IngridDocument result = mdekCaller.getResultFromResponse(response);

		ArrayList<HashMap<String, Object>> nodeList = null;

		if (result != null) {
			nodeList = new ArrayList<HashMap<String, Object>>();
			List<IngridDocument> objs = (List<IngridDocument>) result.get(MdekKeys.OBJ_ENTITIES);
			for (IngridDocument objEntity : objs) {
				nodeList.add(dataMapper.getSimpleObjectRepresentation(objEntity));
			}
		} else {
			handleError(response);
		}
		return nodeList;
	}

	private ArrayList<HashMap<String, Object>> extractAddressesFromResponse(IngridDocument response) {
		IngridDocument result = mdekCaller.getResultFromResponse(response);

		ArrayList<HashMap<String, Object>> nodeList = null;

		if (result != null) {
			nodeList = new ArrayList<HashMap<String, Object>>();
			List<IngridDocument> adrs = (List<IngridDocument>) result.get(MdekKeys.ADR_ENTITIES);
			for (IngridDocument adrEntity : adrs) {
				nodeList.add(dataMapper.getSimpleAddressRepresentation(adrEntity));
			}
		} else {
			handleError(response);
		}
		return nodeList;
	}

	private HashMap<String, Object> extractSingleSimpleObjectFromResponse(IngridDocument response) {
		IngridDocument result = mdekCaller.getResultFromResponse(response);

		if (result != null) {
			return dataMapper.getSimpleObjectRepresentation(result);
		} else {
			handleError(response);
			return null;
		}
	}

	private HashMap<String, Object> extractSingleSimpleAddressFromResponse(IngridDocument response) {
		IngridDocument result = mdekCaller.getResultFromResponse(response);

		if (result != null) {
			return dataMapper.getSimpleAddressRepresentation(result);
		} else {
			handleError(response);
			return null;
		}
	}

	
	private MdekDataBean extractSingleObjectFromResponse(IngridDocument response) {
		IngridDocument result = mdekCaller.getResultFromResponse(response);

		if (result != null) {
			return dataMapper.getDetailedObjectRepresentation(result);
		} else {
			handleError(response);
			return null;
		}
	}

	private MdekAddressBean extractSingleAddressFromResponse(IngridDocument response) {
		IngridDocument result = mdekCaller.getResultFromResponse(response);

		if (result != null) {
			return dataMapper.getDetailedAddressRepresentation(result);
		} else {
			handleError(response);
			return null;
		}
	}

	private IngridDocument extractAdditionalInformationFromResponse(IngridDocument response) {
		IngridDocument result = mdekCaller.getResultFromResponse(response);
		if (result != null) {
			return result;
		} else {
			handleError(response);
			return null;
		}

	}

	private List<String> extractPathFromResponse(IngridDocument response) {
		IngridDocument result = mdekCaller.getResultFromResponse(response);
		if (result != null) {
			List<String> uuidList = (List<String>) result.get(MdekKeys.PATH);
			return uuidList;
		} else {
			handleError(response);
			return null;
		}
	}

	private IngridDocument wrapObject(IngridDocument obj) {
		ArrayList<IngridDocument> list = new ArrayList();
		IngridDocument doc = new IngridDocument();

		list.add(obj);
		doc.put(MdekKeys.OBJ_ENTITIES, list);
		return doc;
	}

	private AddressSearchResultBean extractAddressSearchResultsFromResponse(IngridDocument response) {
		IngridDocument result = mdekCaller.getResultFromResponse(response);

		AddressSearchResultBean searchResult = new AddressSearchResultBean();

		if (result != null) {
			List<IngridDocument> adrs = (List<IngridDocument>) result.get(MdekKeys.ADR_ENTITIES);
			ArrayList<MdekAddressBean> nodeList = new ArrayList<MdekAddressBean>();
			for (IngridDocument adrEntity : adrs) {
				nodeList.add(dataMapper.getDetailedAddressRepresentation(adrEntity));
			}

			searchResult.setNumHits((Integer) result.get(MdekKeys.SEARCH_NUM_HITS));
			searchResult.setTotalNumHits((Long) result.get(MdekKeys.SEARCH_TOTAL_NUM_HITS));
			searchResult.setResultList(nodeList);
		} else {
			handleError(response);
		}
		return searchResult;
	}
	
	private ObjectSearchResultBean extractObjectSearchResultsFromResponse(IngridDocument response) {
		IngridDocument result = mdekCaller.getResultFromResponse(response);

		ObjectSearchResultBean searchResult = new ObjectSearchResultBean();

		if (result != null) {
			List<IngridDocument> objs = (List<IngridDocument>) result.get(MdekKeys.OBJ_ENTITIES);
			ArrayList<MdekDataBean> nodeList = new ArrayList<MdekDataBean>();
			for (IngridDocument objEntity : objs) {
				nodeList.add(dataMapper.getDetailedObjectRepresentation(objEntity));
			}

			searchResult.setNumHits((Integer) result.get(MdekKeys.SEARCH_NUM_HITS));
			searchResult.setTotalNumHits((Long) result.get(MdekKeys.SEARCH_TOTAL_NUM_HITS));
			searchResult.setResultList(nodeList);
		} else {
			handleError(response);
		}
		return searchResult;
	}

	
	private Map<Integer, List<String[]>> extractSysListFromResponse(IngridDocument response) {
		IngridDocument result = mdekCaller.getResultFromResponse(response);
		if (result != null) {
			Map<Integer, List<String[]>> resultMap = new HashMap<Integer, List<String[]>>();
			Set<String> listKeys = (Set<String>) result.keySet();
			for (String listKey : listKeys) {
				IngridDocument listDocument = (IngridDocument) result.get(listKey);
				ArrayList<String[]> resultList = new ArrayList<String[]>();
				Integer listId = (Integer) listDocument.get(MdekKeys.LST_ID);

				List<IngridDocument> entries = (List<IngridDocument>) listDocument.get(MdekKeys.LST_ENTRY_LIST);
//				resultList.add( new String[] {"", ""} );
				for (IngridDocument entry : entries) {
//					resultList.add( new String[] {StringEscapeUtils.escapeJavaScript(entry.getString(MdekKeys.ENTRY_NAME)), ((Integer) entry.get(MdekKeys.ENTRY_ID)).toString()} );
					resultList.add( new String[] {entry.getString(MdekKeys.ENTRY_NAME), ((Integer) entry.get(MdekKeys.ENTRY_ID)).toString()} );
				}
				resultMap.put(listId, resultList);
			}
			return resultMap;

		} else {
			handleError(response);
			return null;
		}
	}

	private CatalogBean extractCatalogFromResponse(IngridDocument response) {
		IngridDocument result = mdekCaller.getResultFromResponse(response);
		
		if (result != null) {
			CatalogBean resultCat = new CatalogBean();
	
			resultCat.setUuid(result.getString(MdekKeys.UUID));
			resultCat.setCatalogName(result.getString(MdekKeys.CATALOG_NAME));
			resultCat.setCountry(result.getString(MdekKeys.COUNTRY));
			resultCat.setWorkflowControl(result.getString(MdekKeys.WORKFLOW_CONTROL));
			resultCat.setExpiryDuration((Integer) result.get(MdekKeys.EXPIRY_DURATION));
			resultCat.setDateOfCreation(convertTimestampToDate((String) result.get(MdekKeys.DATE_OF_CREATION)));
			resultCat.setDateOfLastModification(convertTimestampToDate((String) result.get(MdekKeys.DATE_OF_LAST_MODIFICATION)));
			resultCat.setModUuid(result.getString(MdekKeys.MOD_UUID));
			return resultCat;
		} else {
			handleError(response);
			return null;
		}
	}

	private JobInfoBean extractJobInfoFromResponse(IngridDocument response) {
		IngridDocument result = mdekCaller.getResultFromResponse(response);

		if (result != null) {
			JobInfoBean job = new JobInfoBean();
			job.setDescription(result.getString(MdekKeys.RUNNINGJOB_DESCRIPTION));
			job.setNumEntities((Integer) result.get(MdekKeys.RUNNINGJOB_NUMBER_TOTAL_ENTITIES));
			job.setNumProcessedEntities((Integer) result.get(MdekKeys.RUNNINGJOB_NUMBER_PROCESSED_ENTITIES));
			return job;
		} else {
			handleError(response);
			return null;
		}		
	}
	
	private void handleError(IngridDocument response) throws RuntimeException {
		String errorMessage = mdekCaller.getErrorMsgFromResponse(response);
		log.error(errorMessage);
		List<MdekError> err = mdekCaller.getErrorsFromResponse(response);
		if (err != null)
			throw new MdekException(err);
		else
			throw new RuntimeException(errorMessage);
	}

	private final static SimpleDateFormat timestampFormatter = new SimpleDateFormat("yyyyMMddHHmmssSSS");

	private static Date convertTimestampToDate(String timeStamp) {
		if (timeStamp != null && timeStamp.length() != 0) {
			try {
				Date date = timestampFormatter.parse(timeStamp);
				return date;
			} catch (Exception ex){
				log.error("Problems parsing timestamp from database: " + timeStamp, ex);
				return null;
			}
		} else {
			return null;
		}
	}

	// Helper method to get the current sesison Id. Will be replaced by the user id somday
	private String getCurrentSessionId() {
		try {
			WebContext wctx = WebContextFactory.get();
			HttpSession session = wctx.getSession();
			return session.getId();
		} catch (Exception e) {
			return "";
		}
	}

}