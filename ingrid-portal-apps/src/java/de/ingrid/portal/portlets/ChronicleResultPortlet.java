package de.ingrid.portal.portlets;

import java.io.IOException;
import java.util.HashMap;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletConfig;
import javax.portlet.PortletException;
import javax.portlet.PortletSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.portals.bridges.velocity.AbstractVelocityMessagingPortlet;
import org.apache.velocity.context.Context;

import de.ingrid.iplug.sns.utils.Topic;
import de.ingrid.portal.config.PortalConfig;
import de.ingrid.portal.forms.ChronicleSearchForm;
import de.ingrid.portal.global.IngridResourceBundle;
import de.ingrid.portal.global.Settings;
import de.ingrid.portal.global.Utils;
import de.ingrid.portal.interfaces.IBUSInterface;
import de.ingrid.portal.interfaces.impl.IBUSInterfaceImpl;
import de.ingrid.portal.search.SearchState;
import de.ingrid.portal.search.UtilsSearch;
import de.ingrid.utils.IngridHit;
import de.ingrid.utils.IngridHits;
import de.ingrid.utils.query.IngridQuery;

public class ChronicleResultPortlet extends AbstractVelocityMessagingPortlet {

    private final static Log log = LogFactory.getLog(ChronicleResultPortlet.class);

    /** view templates */
    private final static String TEMPLATE_NO_QUERY = "/WEB-INF/templates/empty.vm";

    private final static String TEMPLATE_RESULT = "/WEB-INF/templates/chronicle_result.vm";

    private final static String TEMPLATE_NO_RESULT = "/WEB-INF/templates/chronicle_no_result.vm";

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
        // set initial view template
        // ----------------------------------

        // if no query display "nothing"
        IngridQuery query = (IngridQuery) receiveRenderMessage(request, Settings.MSG_QUERY);
        if (query == null) {
            setDefaultViewPage(TEMPLATE_NO_QUERY);
            super.doView(request, response);
            return;
        }

        // if query assume we have results
        setDefaultViewPage(TEMPLATE_RESULT);

        // ----------------------------------
        // fetch data
        // ----------------------------------

        // default: start at the beginning with the first hit (display first result page)
        int startHit = 0;
        try {
            startHit = (new Integer(request.getParameter(Settings.PARAM_STARTHIT_RANKED))).intValue();
        } catch (Exception ex) {
            if (log.isDebugEnabled()) {
                log.debug("No starthit of CHRONICLE page from render request, set starthit to 0");
            }
        }

        // ----------------------------------
        // business logic
        // ----------------------------------

        int HITS_PER_PAGE = Settings.SEARCH_RANKED_HITS_PER_PAGE;

        // do search
        IngridHits hits = null;
        int numberOfHits = 0;
        try {
            hits = doSearch(query, startHit, HITS_PER_PAGE, messages);
            if (hits != null) {
                numberOfHits = (int) hits.length();
            }
        } catch (Exception ex) {
            if (log.isErrorEnabled()) {
                log.error("Problems performing CHRONICLE search !", ex);
            }
        }

        if (numberOfHits == 0) {
            // TODO Chronik keine Eintr�ge, WAS ANZEIGEN ??? -> Layouten
            setDefaultViewPage(TEMPLATE_NO_RESULT);
            super.doView(request, response);
            return;
        }

        // adapt settings of page nagihation
        HashMap pageNavigation = UtilsSearch.getPageNavigation(startHit, HITS_PER_PAGE, numberOfHits,
                Settings.SEARCH_RANKED_NUM_PAGES_TO_SELECT);

        // ----------------------------------
        // prepare view
        // ----------------------------------

        context.put("rankedPageSelector", pageNavigation);
        context.put("rankedResultList", hits);

        super.doView(request, response);
    }

    public void processAction(ActionRequest request, ActionResponse actionResponse) throws PortletException,
            IOException {
        // get our ActionForm for generating URL params from current form input
        ChronicleSearchForm af = (ChronicleSearchForm) Utils.getActionForm(request, ChronicleSearchForm.SESSION_KEY,
                ChronicleSearchForm.class, PortletSession.APPLICATION_SCOPE);

        // redirect to our page wih URL parameters for bookmarking
        actionResponse.sendRedirect(Settings.PAGE_CHRONICLE + SearchState.getURLParamsCatalogueSearch(request, af));
    }

    private IngridHits doSearch(IngridQuery query, int startHit, int hitsPerPage, IngridResourceBundle resources) {
        int currentPage = (int) (startHit / hitsPerPage) + 1;

        IngridHits hits = null;
        try {
            IBUSInterface ibus = IBUSInterfaceImpl.getInstance();
            hits = ibus.search(query, hitsPerPage, currentPage, hitsPerPage, PortalConfig.getInstance().getInt(
                    PortalConfig.SNS_TIMEOUT_DEFAULT, 30000));
            IngridHit[] results = hits.getHits();

            IngridHit result = null;
            for (int i = 0; i < results.length; i++) {
                try {
                    Topic topic = (Topic) results[i];
                    if (log.isDebugEnabled()) {
                        log.debug("chronicle topic" + i + "=" + topic);
                    }

                } catch (Throwable t) {
                    if (log.isErrorEnabled()) {
                        log.error("Problems processing Hit, hit = " + result, t);
                    }
                }
            }
        } catch (Throwable t) {
            if (log.isErrorEnabled()) {
                log.error("Problems performing Search !", t);
            }
        }

        return hits;
    }
}