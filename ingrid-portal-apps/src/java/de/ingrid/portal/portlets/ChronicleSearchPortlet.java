package de.ingrid.portal.portlets;

import java.io.IOException;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletConfig;
import javax.portlet.PortletException;
import javax.portlet.PortletRequest;
import javax.portlet.PortletSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.portals.bridges.velocity.AbstractVelocityMessagingPortlet;
import org.apache.velocity.context.Context;

import de.ingrid.iplug.sns.utils.Topic;
import de.ingrid.portal.forms.ChronicleSearchForm;
import de.ingrid.portal.global.IngridResourceBundle;
import de.ingrid.portal.global.Settings;
import de.ingrid.portal.global.Utils;
import de.ingrid.portal.global.UtilsDB;
import de.ingrid.portal.search.SearchState;
import de.ingrid.utils.query.FieldQuery;
import de.ingrid.utils.query.IngridQuery;
import de.ingrid.utils.queryparser.IDataTypes;

public class ChronicleSearchPortlet extends AbstractVelocityMessagingPortlet {

    private final static Log log = LogFactory.getLog(ChronicleSearchPortlet.class);

    public void init(PortletConfig config) throws PortletException {
        // set our message "scope" for inter portlet messaging
        setTopic(Settings.MSG_TOPIC_CHRONICLE);

        super.init(config);
    }

    public void doView(javax.portlet.RenderRequest request, javax.portlet.RenderResponse response)
            throws PortletException, IOException {
        Context context = getContext(request);
        IngridResourceBundle messages = new IngridResourceBundle(getPortletConfig().getResourceBundle(
                request.getLocale()));
        context.put("MESSAGES", messages);

        // ----------------------------------
        // check for passed URL PARAMETERS (for bookmarking)
        // ----------------------------------
        // action indicates what to do !
        String action = request.getParameter(Settings.PARAM_ACTION);
        if (action == null) {
            action = "";
        }

        // search if action parameter is passed, every action on page should cause new search 
        boolean doSearch = false;
        if (action.length() != 0) {
            // remove query message for result portlet -> no results
            cancelRenderMessage(request, Settings.MSG_QUERY);
            doSearch = true;
        }

        // ----------------------------------
        // set data for view template 
        // ----------------------------------

        // get event types
        List eventTypes = UtilsDB.getChronicleEventTypes();
        context.put("evtypesList", eventTypes);

        // update ActionForm !
        ChronicleSearchForm af = (ChronicleSearchForm) Utils.getActionForm(request, ChronicleSearchForm.SESSION_KEY,
                ChronicleSearchForm.class, PortletSession.APPLICATION_SCOPE);
        // if no initial rubric selection set, set it and initialize the form (first instantiation)
        if (ChronicleSearchForm.getINITIAL_EVENT_TYPES().length() == 0) {
            // compute initial selection string for all event types and initialize selection
            ChronicleSearchForm.setInitialSelectedEventTypes(eventTypes);
            af.init();
        }

        if (action.equals(Settings.PARAMV_ACTION_NEW_SEARCH)) {
            // empty form on new search
            af.clear();
        } else if (action.equals(Settings.PARAMV_ACTION_FROM_TEASER)) {
            // default values when called from teaser
            af.init();
        } else if (action.length() == 0) {
            // no URL parameters, we're called from other page -> default values
            af.init();
        }
        // replaces only the ones in request
        af.populate(request);
        context.put("actionForm", af);

        // validate via ActionForm
        if (!af.validate()) {
            super.doView(request, response);
            return;
        }

        // ----------------------------------
        // prepare Search, Search will be performed in Result portlet 
        // ----------------------------------
        if (doSearch) {
            setupQuery(request);
        } else {
            // remove query message for result portlet -> no results
            cancelRenderMessage(request, Settings.MSG_QUERY);
        }

        super.doView(request, response);
    }

    public void processAction(ActionRequest request, ActionResponse actionResponse) throws PortletException,
            IOException {
        // get our ActionForm for generating URL params from current form state
        // we have a new submit, so bring form up to date !
        ChronicleSearchForm af = (ChronicleSearchForm) Utils.getActionForm(request, ChronicleSearchForm.SESSION_KEY,
                ChronicleSearchForm.class, PortletSession.APPLICATION_SCOPE);
        af.clear();
        // populate doesn't clear
        af.populate(request);

        // redirect to our page with URL parameters for bookmarking
        actionResponse.sendRedirect(Settings.PAGE_CHRONICLE + SearchState.getURLParamsCatalogueSearch(request, af));
    }

    public void setupQuery(PortletRequest request) {
        // remove old query message for result portlet
        cancelRenderMessage(request, Settings.MSG_QUERY);

        // our action form encapsulating form input
        ChronicleSearchForm af = (ChronicleSearchForm) Utils.getActionForm(request, ChronicleSearchForm.SESSION_KEY,
                ChronicleSearchForm.class, PortletSession.APPLICATION_SCOPE);

        IngridQuery query = null;
        try {
            query = new IngridQuery();
            query.addField(new FieldQuery(true, false, Settings.QFIELD_DATATYPE, IDataTypes.SNS));
            query.putInt(Topic.REQUEST_TYPE, Topic.EVENT_FROM_TOPIC);

            // Event Type
            String queryValue = null;
            String[] eventTypes = af.getInputAsArray(ChronicleSearchForm.FIELD_EVENT);
            // don't set anything if "all" is selected
            if (eventTypes != null && Utils.getPosInArray(eventTypes, Settings.PARAMV_ALL) == -1) {
                for (int i = 0; i < eventTypes.length; i++) {
                    if (eventTypes[i] != null) {
                        queryValue = UtilsDB.getChronicleEventTypeFromKey(eventTypes[i]);
                        query.addField(new FieldQuery(true, false, Settings.QFIELD_EVENT_TYPE, queryValue));
                        // TODO at the moment we only use first selection value, backend can't handle multiple OR yet
                        break;
                    }
                }
            }
            /*
             // FUNCT_CATEGORY
             String[] functCategories = request.getParameterValues(EnvironmentSearchForm.FIELD_FUNCT_CATEGORY);
             // don't set anything if "all" is selected
             if (functCategories != null && Utils.getPosInArray(functCategories, Settings.PARAMV_ALL) == -1) {
             for (int i = 0; i < functCategories.length; i++) {
             if (functCategories[i] != null) {
             queryValue = UtilsDB.getFunctCategoryFromKey(functCategories[i]);
             query.addField(new FieldQuery(true, false, Settings.QFIELD_FUNCT_CATEGORY, queryValue));
             // TODO at the moment we only use first selection value, backend can't handle multiple OR yet
             break;
             }
             }
             }

             // PARTNER
             String[] partners = request.getParameterValues(EnvironmentSearchForm.FIELD_PARTNER);
             // don't set anything if "all" is selected
             if (partners != null && Utils.getPosInArray(partners, Settings.PARAMV_ALL) == -1) {
             for (int i = 0; i < partners.length; i++) {
             if (partners[i] != null) {
             query.addField(new FieldQuery(true, false, Settings.QFIELD_PARTNER, partners[i]));
             // TODO at the moment we only use first selection value, backend can't handle multiple OR yet
             break;
             }
             }
             }
             */
            // RANKING
            //            query.put(IngridQuery.RANKED, IngridQuery.DATE_RANKED);
        } catch (Exception ex) {
            if (log.isErrorEnabled()) {
                log.error("Problems setting up Query !", ex);
            }
        }

        // set query message for result portlet
        publishRenderMessage(request, Settings.MSG_QUERY, query);
    }
}