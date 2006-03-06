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

import de.ingrid.portal.forms.EnvironmentSearchForm;
import de.ingrid.portal.global.Settings;
import de.ingrid.portal.global.Utils;
import de.ingrid.portal.global.UtilsDB;
import de.ingrid.portal.search.SearchState;
import de.ingrid.utils.query.FieldQuery;
import de.ingrid.utils.query.IngridQuery;

public class EnvironmentSearchPortlet extends AbstractVelocityMessagingPortlet {

    private final static Log log = LogFactory.getLog(EnvironmentSearchPortlet.class);

    public void init(PortletConfig config) throws PortletException {
        // set our message "scope" for inter portlet messaging
        setTopic(Settings.MSG_TOPIC_ENVIRONMENT);

        super.init(config);
    }

    public void doView(javax.portlet.RenderRequest request, javax.portlet.RenderResponse response)
            throws PortletException, IOException {
        Context context = getContext(request);

        // ----------------------------------
        // check for passed URL PARAMETERS (for bookmarking)
        // ----------------------------------
        // action indicates what to do !
        String action = request.getParameter(Settings.PARAM_ACTION);
        if (action == null) {
            action = "";
        }
        // indicates whether form parameters were passed -> then we're called from Service page !
        String grouping = request.getParameter(Settings.PARAM_GROUPING);

        // search if
        // - new search submitted
        // - called from teaser
        // - parameters are passed, so maybe we process bookmark !
        boolean doSearch = false;
        if (action.equals(Settings.PARAMV_ACTION_NEW_SEARCH) || action.equals(Settings.PARAMV_ACTION_FROM_TEASER)
                || grouping != null) {
            // remove query message for result portlet -> no results
            cancelRenderMessage(request, Settings.MSG_QUERY);
            doSearch = true;
        }

        // ----------------------------------
        // set data for view template 
        // ----------------------------------

        // get partners
        List partners = UtilsDB.getPartners();
        context.put("partnerList", partners);

        // update ActionForm !
        EnvironmentSearchForm af = (EnvironmentSearchForm) Utils.getActionForm(request,
                EnvironmentSearchForm.SESSION_KEY, EnvironmentSearchForm.class, PortletSession.APPLICATION_SCOPE);
        if (action.equals(Settings.PARAMV_ACTION_NEW_SEARCH)) {
            // empty form on new search
            af.clear();
        } else if (action.equals(Settings.PARAMV_ACTION_FROM_TEASER)) {
            // default values when called from teaser
            af.init();
        } else if (grouping == null) {
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
        EnvironmentSearchForm af = (EnvironmentSearchForm) Utils.getActionForm(request,
                EnvironmentSearchForm.SESSION_KEY, EnvironmentSearchForm.class, PortletSession.APPLICATION_SCOPE);
        af.clear();
        // populate doesn't clear
        af.populate(request);

        // redirect to our page with URL parameters for bookmarking
        actionResponse.sendRedirect(Settings.PAGE_ENVIRONMENT + SearchState.getURLParamsCatalogueSearch(request, af));
    }

    public void setupQuery(PortletRequest request) {
        // remove old query message for result portlet
        cancelRenderMessage(request, Settings.MSG_QUERY);

        IngridQuery query = null;
        try {
            query = new IngridQuery();
            query.addField(new FieldQuery(true, false, Settings.QFIELD_DATATYPE, Settings.QVALUE_DATATYPE_ENVTOPIC));

            // TOPIC
            String[] topics = request.getParameterValues(EnvironmentSearchForm.FIELD_TOPIC);
            // don't set anything if "all" is selected
            if (topics != null && Utils.getPosInArray(topics, Settings.PARAMV_ALL) == -1) {
                for (int i = 0; i < topics.length; i++) {
                    if (topics[i] != null) {
                        query.addField(new FieldQuery(true, false, Settings.QFIELD_TOPIC, topics[i]));
                        // TODO at the moment we only use first selection value, backend can't handle multiple OR yet
                        break;
                    }
                }
            }

            // FUNCT_CATEGORY
            String[] functCategories = request.getParameterValues(EnvironmentSearchForm.FIELD_FUNCT_CATEGORY);
            // don't set anything if "all" is selected
            if (functCategories != null && Utils.getPosInArray(functCategories, Settings.PARAMV_ALL) == -1) {
                for (int i = 0; i < functCategories.length; i++) {
                    if (functCategories[i] != null) {
                        query.addField(new FieldQuery(true, false, Settings.QFIELD_FUNCT_CATEGORY, functCategories[i]));
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
        } catch (Throwable t) {
            if (log.isErrorEnabled()) {
                log.error("Problems setting up Query !", t);
            }
        }
        // set query message for result portlet
        publishRenderMessage(request, Settings.MSG_QUERY, query);
    }
}