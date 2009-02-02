package de.ingrid.mdek.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;

import de.ingrid.mdek.EnumUtil;
import de.ingrid.mdek.MdekKeys;
import de.ingrid.mdek.MdekUtils.AdditionalFieldType;
import de.ingrid.mdek.beans.AdditionalFieldBean;
import de.ingrid.mdek.beans.CatalogBean;
import de.ingrid.mdek.beans.JobInfoBean;
import de.ingrid.mdek.beans.AdditionalFieldBean.Type;
import de.ingrid.mdek.beans.JobInfoBean.EntityType;
import de.ingrid.mdek.beans.object.LocationBean;
import de.ingrid.mdek.caller.MdekCaller;
import de.ingrid.utils.IngridDocument;

public class MdekCatalogUtils {

	private final static Logger log = Logger.getLogger(MdekCatalogUtils.class);	

	private static final String SYS_GUI_ID = "id";
	private static final String SYS_GUI_MODE = "mode";

	public static Map<Integer, List<String[]>> extractSysListFromResponse(IngridDocument response) {
		IngridDocument result = MdekUtils.getResultFromResponse(response);
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
					resultList.add( new String[] {entry.getString(MdekKeys.ENTRY_NAME), ((Integer) entry.get(MdekKeys.ENTRY_ID)).toString(), (String) entry.get(MdekKeys.IS_DEFAULT) } );
				}
				resultMap.put(listId, resultList);
			}
			return resultMap;

		} else {
			MdekErrorUtils.handleError(response);
			return null;
		}
	}

	public static List<AdditionalFieldBean> extractSysAdditionalFieldsFromResponse(IngridDocument response) {
		IngridDocument result = MdekUtils.getResultFromResponse(response);
		if (result != null) {
			List<AdditionalFieldBean> resultList = new ArrayList<AdditionalFieldBean>();
			for (String key : (Set<String>) result.keySet()) {
				IngridDocument fieldDefinition = (IngridDocument) result.get(key);
				Long fieldId = fieldDefinition.getLong(MdekKeys.SYS_ADDITIONAL_FIELD_IDENTIFIER);
				Integer fieldSize = fieldDefinition.getInt(MdekKeys.SYS_ADDITIONAL_FIELD_LENGTH);
				String fieldName = fieldDefinition.getString(MdekKeys.SYS_ADDITIONAL_FIELD_NAME);
				String fieldTypeStr = fieldDefinition.getString(MdekKeys.SYS_ADDITIONAL_FIELD_TYPE);
				AdditionalFieldType dbFieldType = EnumUtil.mapDatabaseToEnumConst(AdditionalFieldType.class, fieldTypeStr);
				Type fieldType = (AdditionalFieldType.TEXT == dbFieldType)? Type.TEXT : Type.LIST;

				String listLanguage = null;
				String[] listEntries = null;
				if (Type.LIST == fieldType) {
					for (String fieldDefinitionKey : (Set<String>) fieldDefinition.keySet()) {
						if (fieldDefinitionKey.startsWith(MdekKeys.SYS_ADDITIONAL_FIELD_LIST_ITEMS_KEY_PREFIX)) {
							listLanguage = fieldDefinitionKey.substring(MdekKeys.SYS_ADDITIONAL_FIELD_LIST_ITEMS_KEY_PREFIX.length());
							listEntries = (String[]) fieldDefinition.get(fieldDefinitionKey);
							break;
						}
					}
				}

				AdditionalFieldBean additionalField = new AdditionalFieldBean();
				additionalField.setId(fieldId);
				additionalField.setName(fieldName);
				additionalField.setType(fieldType);
				additionalField.setSize(fieldSize);
				additionalField.setListLanguage(listLanguage);
				List<String> entries = (listEntries != null)? Arrays.asList(listEntries) : null;
				additionalField.setListEntries(entries);
				resultList.add(additionalField);
			}
			return resultList;

		} else {
			MdekErrorUtils.handleError(response);
			return null;
		}
	}

	public static List<Map<String, String>> extractSysGuisFromResponse(IngridDocument response) {
		IngridDocument result = MdekUtils.getResultFromResponse(response);
		List<Map<String, String>> sysGuiList = new ArrayList<Map<String,String>>();

		Set<Map.Entry<String, Map<String, Object>>> entrySet = result.entrySet();
		Iterator<Map.Entry<String, Map<String, Object>>> it = entrySet.iterator();

		while (it.hasNext()) {
			Map.Entry<String, Map<String, Object>> entry = it.next();
			Map<String, Object> guiEntry = entry.getValue();
			
			Map<String, String> res = new HashMap<String, String>();
			res.put(SYS_GUI_ID, (String) guiEntry.get(MdekKeys.SYS_GUI_ID));
			res.put(SYS_GUI_MODE, ((Integer) guiEntry.get(MdekKeys.SYS_GUI_BEHAVIOUR)).toString());

			sysGuiList.add(res);
		}
		
		return sysGuiList;
	}

	public static List<IngridDocument> convertFromSysGuiRepresentation(List<Map<String, String>> sysGuiList) {
		List<IngridDocument> result = new ArrayList<IngridDocument>();

		for (Map<String, String> sysGuiEntry : sysGuiList) {
			IngridDocument doc = new IngridDocument();
			doc.put(MdekKeys.SYS_GUI_ID, sysGuiEntry.get(SYS_GUI_ID));
			doc.put(MdekKeys.SYS_GUI_BEHAVIOUR, new Integer(sysGuiEntry.get(SYS_GUI_MODE)));

			result.add(doc);
		}
		return result;
	}

	public static CatalogBean extractCatalogFromResponse(IngridDocument response) {
		IngridDocument result = MdekUtils.getResultFromResponse(response);
		
		if (result != null) {
			CatalogBean resultCat = new CatalogBean();
	
			resultCat.setUuid(result.getString(MdekKeys.UUID));
			resultCat.setCatalogName(result.getString(MdekKeys.CATALOG_NAME));
			resultCat.setPartnerName(result.getString(MdekKeys.PARTNER_NAME));
			resultCat.setProviderName(result.getString(MdekKeys.PROVIDER_NAME));
			resultCat.setCountry(result.getString(MdekKeys.COUNTRY));
			resultCat.setLanguage(result.getString(MdekKeys.LANGUAGE));
			resultCat.setWorkflowControl(result.getString(MdekKeys.WORKFLOW_CONTROL));
			resultCat.setExpiryDuration((Integer) result.get(MdekKeys.EXPIRY_DURATION));
			resultCat.setDateOfCreation(MdekUtils.convertTimestampToDate((String) result.get(MdekKeys.DATE_OF_CREATION)));
			resultCat.setDateOfLastModification(MdekUtils.convertTimestampToDate((String) result.get(MdekKeys.DATE_OF_LAST_MODIFICATION)));
			resultCat.setLocation(mapToLocationBean((IngridDocument) result.get(MdekKeys.CATALOG_LOCATION)));			

			IngridDocument modUserDoc = (IngridDocument) result.get(MdekKeys.MOD_USER);
			if (modUserDoc != null)
				resultCat.setModUuid((String) modUserDoc.get(MdekKeys.UUID));

			return resultCat;
		} else {
			MdekErrorUtils.handleError(response);
			return null;
		}
	}

	public static JobInfoBean extractJobInfoFromResponse(IngridDocument response) {
		IngridDocument jobInfoDoc = MdekUtils.getResultFromResponse(response);

		if (jobInfoDoc != null) {
			JobInfoBean jobInfo = new JobInfoBean();
			jobInfo.setDescription(jobInfoDoc.getString(MdekKeys.JOBINFO_MESSAGES));
			jobInfo.setStartTime(MdekUtils.convertTimestampToDate(jobInfoDoc.getString(MdekKeys.JOBINFO_START_TIME)));
			jobInfo.setEndTime(MdekUtils.convertTimestampToDate(jobInfoDoc.getString(MdekKeys.JOBINFO_END_TIME)));
			if (jobInfoDoc.get(MdekKeys.JOBINFO_NUM_OBJECTS) != null) {
				jobInfo.setNumProcessedEntities(jobInfoDoc.getInt(MdekKeys.JOBINFO_NUM_OBJECTS));
				jobInfo.setNumEntities(jobInfoDoc.getInt(MdekKeys.JOBINFO_TOTAL_NUM_OBJECTS));
				jobInfo.setEntityType(EntityType.OBJECT);

			} else if (jobInfoDoc.get(MdekKeys.JOBINFO_NUM_ADDRESSES) != null) {
				jobInfo.setNumProcessedEntities(jobInfoDoc.getInt(MdekKeys.JOBINFO_NUM_ADDRESSES));
				jobInfo.setNumEntities(jobInfoDoc.getInt(MdekKeys.JOBINFO_TOTAL_NUM_ADDRESSES));
				jobInfo.setEntityType(EntityType.ADDRESS);
			}
			jobInfo.setResult((byte[]) jobInfoDoc.get(MdekKeys.EXPORT_RESULT));

			// Check if an exception occured while executing the job and add it to JobInfoBean
			Exception jobException = MdekCaller.getExceptionFromJobInfo(jobInfoDoc);
			if (jobException != null) {
				jobInfo.setException(jobException);
			}

			return jobInfo;

		} else {
			MdekErrorUtils.handleError(response);
			return null;
		}
	}

	public static IngridDocument convertFromCatalogRepresentation(CatalogBean cat) {
		IngridDocument catDoc = new IngridDocument();

		catDoc.put(MdekKeys.UUID, cat.getUuid());
		catDoc.put(MdekKeys.CATALOG_NAME, cat.getCatalogName());
		catDoc.put(MdekKeys.PARTNER_NAME, cat.getPartnerName());
		catDoc.put(MdekKeys.PROVIDER_NAME, cat.getProviderName());
		catDoc.put(MdekKeys.COUNTRY, cat.getCountry());
		catDoc.put(MdekKeys.LANGUAGE, cat.getLanguage());
		catDoc.put(MdekKeys.WORKFLOW_CONTROL, cat.getWorkflowControl());
		catDoc.put(MdekKeys.EXPIRY_DURATION, cat.getExpiryDuration());
		catDoc.put(MdekKeys.CATALOG_LOCATION, mapLocationBeanToIngridDoc(cat.getLocation()));

		return catDoc;
	}

	private static LocationBean mapToLocationBean(IngridDocument locationDoc) {
		LocationBean location = new LocationBean();

		if (locationDoc == null) {
			return location;
		}

		location.setType((String) locationDoc.get(MdekKeys.LOCATION_TYPE));
		location.setName((String) locationDoc.get(MdekKeys.LOCATION_NAME));
		location.setNativeKey((String) locationDoc.get(MdekKeys.LOCATION_CODE));
		location.setTopicId((String) locationDoc.get(MdekKeys.LOCATION_SNS_ID));
		location.setLongitude1((Double) locationDoc.get(MdekKeys.WEST_BOUNDING_COORDINATE));
		location.setLatitude1((Double) locationDoc.get(MdekKeys.SOUTH_BOUNDING_COORDINATE));
		location.setLongitude2((Double) locationDoc.get(MdekKeys.EAST_BOUNDING_COORDINATE));
		location.setLatitude2((Double) locationDoc.get(MdekKeys.NORTH_BOUNDING_COORDINATE));
		return location;
	}

	private static IngridDocument mapLocationBeanToIngridDoc(LocationBean loc) {
		IngridDocument locDoc = new IngridDocument();

		locDoc.put(MdekKeys.LOCATION_TYPE, "G");
		locDoc.put(MdekKeys.LOCATION_NAME, loc.getName());
		locDoc.put(MdekKeys.LOCATION_CODE, loc.getNativeKey());
		locDoc.put(MdekKeys.LOCATION_SNS_ID, loc.getTopicId());
		locDoc.put(MdekKeys.WEST_BOUNDING_COORDINATE, loc.getLongitude1());
		locDoc.put(MdekKeys.SOUTH_BOUNDING_COORDINATE, loc.getLatitude1());
		locDoc.put(MdekKeys.EAST_BOUNDING_COORDINATE, loc.getLongitude2());
		locDoc.put(MdekKeys.NORTH_BOUNDING_COORDINATE, loc.getLatitude2());
		locDoc.put(MdekKeys.SNS_TOPIC_TYPE, loc.getTopicTypeId());

		return locDoc;
	}
}
