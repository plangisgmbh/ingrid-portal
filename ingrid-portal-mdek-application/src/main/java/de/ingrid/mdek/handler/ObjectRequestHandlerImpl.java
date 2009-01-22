package de.ingrid.mdek.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import de.ingrid.mdek.MdekError;
import de.ingrid.mdek.MdekKeys;
import de.ingrid.mdek.MdekError.MdekErrorType;
import de.ingrid.mdek.MdekUtils.IdcEntityOrderBy;
import de.ingrid.mdek.MdekUtils.IdcQAEntitiesSelectionType;
import de.ingrid.mdek.MdekUtils.IdcStatisticsSelectionType;
import de.ingrid.mdek.MdekUtils.IdcWorkEntitiesSelectionType;
import de.ingrid.mdek.MdekUtils.WorkState;
import de.ingrid.mdek.beans.object.MdekDataBean;
import de.ingrid.mdek.beans.query.ObjectSearchResultBean;
import de.ingrid.mdek.beans.query.ObjectStatisticsResultBean;
import de.ingrid.mdek.beans.query.ThesaurusStatisticsResultBean;
import de.ingrid.mdek.caller.IMdekCallerObject;
import de.ingrid.mdek.caller.IMdekClientCaller;
import de.ingrid.mdek.caller.IMdekCaller.FetchQuantity;
import de.ingrid.mdek.dwr.util.HTTPSessionHelper;
import de.ingrid.mdek.job.MdekException;
import de.ingrid.mdek.util.MdekEmailUtils;
import de.ingrid.mdek.util.MdekErrorUtils;
import de.ingrid.mdek.util.MdekObjectUtils;
import de.ingrid.mdek.util.MdekUtils;
import de.ingrid.utils.IngridDocument;

public class ObjectRequestHandlerImpl implements ObjectRequestHandler {

	private final static Logger log = Logger.getLogger(ObjectRequestHandlerImpl.class);

	// Injected by Spring
	private ConnectionFacade connectionFacade;


	// Initialized by spring through the init method
	private IMdekClientCaller mdekClientCaller;
	private IMdekCallerObject mdekCallerObject;

	public void init() {
		mdekClientCaller = connectionFacade.getMdekClientCaller();
		mdekCallerObject = connectionFacade.getMdekCallerObject();
	}

	public MdekDataBean getObjectDetail(String uuid) {
		IngridDocument response = mdekCallerObject.fetchObject(connectionFacade.getCurrentPlugId(), uuid, FetchQuantity.EDITOR_ENTITY, de.ingrid.mdek.MdekUtils.IdcEntityVersion.WORKING_VERSION, HTTPSessionHelper.getCurrentUserUuid());
		return MdekObjectUtils.extractSingleObjectFromResponse(response);
	}

	public MdekDataBean getPublishedObjectDetail(String uuid) {
		IngridDocument response = mdekCallerObject.fetchObject(connectionFacade.getCurrentPlugId(), uuid, FetchQuantity.EDITOR_ENTITY, de.ingrid.mdek.MdekUtils.IdcEntityVersion.PUBLISHED_VERSION, HTTPSessionHelper.getCurrentUserUuid());
		return MdekObjectUtils.extractSingleObjectFromResponse(response);
	}
	
	public ArrayList<HashMap<String, Object>> getRootObjects() {
		IngridDocument response = mdekCallerObject.fetchTopObjects(connectionFacade.getCurrentPlugId(), HTTPSessionHelper.getCurrentUserUuid());
		return MdekObjectUtils.extractObjectsFromResponse(response);
	}

	public boolean canCopyObject(String uuid) {
		// Copy is always allowed. Placeholder for future changes
		return true;
	}

	public boolean canCutObject(String uuid) {
		IngridDocument response = mdekCallerObject.checkObjectSubTree(connectionFacade.getCurrentPlugId(), uuid, HTTPSessionHelper.getCurrentUserUuid());
		if (mdekClientCaller.getResultFromResponse(response) == null) {
			MdekErrorUtils.handleError(response);
		} else {
			IngridDocument result = mdekClientCaller.getResultFromResponse(response);
			boolean hasWorkingCopy = result.getBoolean(MdekKeys.RESULTINFO_HAS_WORKING_COPY);
			if (hasWorkingCopy) {
				// Throw an error. A node that is about to be moved must not have working copies as children
				throw new MdekException(new MdekError(MdekErrorType.SUBTREE_HAS_WORKING_COPIES));
			}
		}
		return true;
	}

	public Map<String, Object> copyObject(String fromUuid, String toUuid, boolean copySubTree) {
		IngridDocument response = mdekCallerObject.copyObject(connectionFacade.getCurrentPlugId(), fromUuid, toUuid, copySubTree, HTTPSessionHelper.getCurrentUserUuid());
		return MdekObjectUtils.extractSingleSimpleObjectFromResponse(response);
	}

	public void deleteObject(String uuid, boolean forceDeleteReferences) {
		IngridDocument response = mdekCallerObject.deleteObject(connectionFacade.getCurrentPlugId(), uuid, forceDeleteReferences, HTTPSessionHelper.getCurrentUserUuid());
		IngridDocument result = MdekUtils.extractAdditionalInformationFromResponse(response);

		boolean markedDeleted = result.getBoolean(MdekKeys.RESULTINFO_WAS_MARKED_DELETED);
		if (markedDeleted) {
			MdekEmailUtils.sendObjectMarkedDeletedMail(uuid);
		}
	}

	public boolean deleteObjectWorkingCopy(String uuid, boolean forceDeleteReferences) {
		IngridDocument response = mdekCallerObject.deleteObjectWorkingCopy(connectionFacade.getCurrentPlugId(), uuid, forceDeleteReferences, HTTPSessionHelper.getCurrentUserUuid());

		IngridDocument result = MdekUtils.extractAdditionalInformationFromResponse(response);
		return (Boolean) result.get(MdekKeys.RESULTINFO_WAS_FULLY_DELETED);
	}

	public MdekDataBean getInitialObject(String parentUuid) {
		IngridDocument obj = new IngridDocument();
		obj.put(MdekKeys.PARENT_UUID, parentUuid);

		IngridDocument response = mdekCallerObject.getInitialObject(connectionFacade.getCurrentPlugId(), obj, HTTPSessionHelper.getCurrentUserUuid());

		// TODO: Set this value in the backend. Temproarily set it here till it gets fixed!
		MdekDataBean dat = MdekObjectUtils.extractSingleObjectFromResponse(response);
		dat.setObjectOwner(HTTPSessionHelper.getCurrentUserUuid());
		return dat;
	}

	public List<String> getPathToObject(String uuid) {
		IngridDocument response = mdekCallerObject.getObjectPath(connectionFacade.getCurrentPlugId(), uuid, HTTPSessionHelper.getCurrentUserUuid());
		return MdekUtils.extractPathFromResponse(response);
	}
	
	public ArrayList<HashMap<String, Object>> getSubObjects(String uuid, int depth) {
		IngridDocument response = mdekCallerObject.fetchSubObjects(connectionFacade.getCurrentPlugId(), uuid, HTTPSessionHelper.getCurrentUserUuid());
		return MdekObjectUtils.extractObjectsFromResponse(response);
	}

	public void moveObjectSubTree(String fromUuid, String oldParentUuid, String newParentUuid, boolean forcePublicationCondition) {
		IngridDocument response = mdekCallerObject.moveObject(connectionFacade.getCurrentPlugId(), fromUuid, newParentUuid, forcePublicationCondition, HTTPSessionHelper.getCurrentUserUuid());
		if (mdekClientCaller.getResultFromResponse(response) == null) {
			MdekErrorUtils.handleError(response);

		} else {
			MdekEmailUtils.sendObjectMovedMail(fromUuid, oldParentUuid, newParentUuid);
		}
	}

	public MdekDataBean publishObject(MdekDataBean data, boolean forcePublicationCondition) {
		IngridDocument obj = (IngridDocument) MdekObjectUtils.convertFromObjectRepresentation(data);

		if (data.getUuid().equalsIgnoreCase("newNode")) {
			obj.remove(MdekKeys.UUID);
			obj.remove(MdekKeys.ID);
		}

		log.debug("Sending the following object for publishing:");
		log.debug(obj);

		IngridDocument response = mdekCallerObject.publishObject(connectionFacade.getCurrentPlugId(), obj, true, forcePublicationCondition, HTTPSessionHelper.getCurrentUserUuid());
		return MdekObjectUtils.extractSingleObjectFromResponse(response);
	}

	public MdekDataBean saveObject(MdekDataBean data) {
		IngridDocument obj = (IngridDocument) MdekObjectUtils.convertFromObjectRepresentation(data);

		if (data.getUuid().equalsIgnoreCase("newNode")) {
			obj.remove(MdekKeys.UUID);
			obj.remove(MdekKeys.ID);
		}

		log.debug("Sending the following object for storage:");
		log.debug(obj);

		IngridDocument response = mdekCallerObject.storeObject(connectionFacade.getCurrentPlugId(), obj, true, HTTPSessionHelper.getCurrentUserUuid());
		return MdekObjectUtils.extractSingleObjectFromResponse(response);
	}

	public MdekDataBean assignObjectToQA(MdekDataBean data) {
		IngridDocument obj = (IngridDocument) MdekObjectUtils.convertFromObjectRepresentation(data);

		if (data.getUuid().equalsIgnoreCase("newNode")) {
			obj.remove(MdekKeys.UUID);
			obj.remove(MdekKeys.ID);
		}

		log.debug("Sending the following object for publishing to QA:");
		log.debug(obj);

		IngridDocument response = mdekCallerObject.assignObjectToQA(connectionFacade.getCurrentPlugId(), obj, true, HTTPSessionHelper.getCurrentUserUuid());
		MdekDataBean result = MdekObjectUtils.extractSingleObjectFromResponse(response);
		if (result != null) {
			MdekEmailUtils.sendObjectAssignedToQAMail(result);
		}

		return result;
	}

	public MdekDataBean reassignObjectToAuthor(MdekDataBean data) {
		IngridDocument obj = (IngridDocument) MdekObjectUtils.convertFromObjectRepresentation(data);

		log.debug("Sending the following object to the author:");
		log.debug(obj);

		IngridDocument response = mdekCallerObject.reassignObjectToAuthor(connectionFacade.getCurrentPlugId(), obj, true, HTTPSessionHelper.getCurrentUserUuid());
		MdekDataBean result = MdekObjectUtils.extractSingleObjectFromResponse(response);
		if (result != null) {
			MdekEmailUtils.sendObjectReassignedMail(result);
		}

		return result;
	}

	public ObjectSearchResultBean getWorkObjects(IdcWorkEntitiesSelectionType selectionType, IdcEntityOrderBy orderBy, boolean orderAsc, Integer startHit, Integer numHits) {
		IngridDocument response = mdekCallerObject.getWorkObjects(connectionFacade.getCurrentPlugId(), selectionType, orderBy, orderAsc, startHit, numHits, HTTPSessionHelper.getCurrentUserUuid());
		return MdekObjectUtils.extractObjectSearchResultsFromResponse(response);
	}

	public ObjectSearchResultBean getQAObjects(WorkState workState, IdcQAEntitiesSelectionType selectionType, IdcEntityOrderBy orderBy, boolean orderAsc, Integer startHit, Integer numHits) {
		IngridDocument response = mdekCallerObject.getQAObjects(connectionFacade.getCurrentPlugId(), workState, selectionType, orderBy, orderAsc, startHit, numHits, HTTPSessionHelper.getCurrentUserUuid());
		return MdekObjectUtils.extractObjectSearchResultsFromResponse(response);
	}

	public ObjectStatisticsResultBean getObjectStatistics(String objUuid) {
		// startHit and numHits parameters are ignored for STATISTICS_CLASSES_AND_STATES
		int startHit = 0;
		int numHits = 0;
		IngridDocument response = mdekCallerObject.getObjectStatistics(connectionFacade.getCurrentPlugId(), objUuid, IdcStatisticsSelectionType.CLASSES_AND_STATES, startHit, numHits, HTTPSessionHelper.getCurrentUserUuid());
		IngridDocument result = MdekUtils.getResultFromResponse(response);
		return MdekObjectUtils.extractObjectStatistics(result);
	}

	public ThesaurusStatisticsResultBean getObjectThesaurusStatistics(String objUuid, boolean thesaurusTerms, int startHit, int numHits) {
		IdcStatisticsSelectionType selectionType = thesaurusTerms ? IdcStatisticsSelectionType.SEARCHTERMS_THESAURUS : IdcStatisticsSelectionType.SEARCHTERMS_FREE;
		IngridDocument response = mdekCallerObject.getObjectStatistics(connectionFacade.getCurrentPlugId(), objUuid, selectionType, startHit, numHits, HTTPSessionHelper.getCurrentUserUuid());
		IngridDocument result = MdekUtils.getResultFromResponse(response);
		return MdekUtils.extractThesaurusStatistics(result);
	}
	
	public ConnectionFacade getConnectionFacade() {
		return connectionFacade;
	}


	public void setConnectionFacade(ConnectionFacade connectionFacade) {
		this.connectionFacade = connectionFacade;
	}
}
