/*
 * Copyright (c) 1997-2006 by wemove GmbH
 */
package de.ingrid.portal.portlets.admin;

import java.io.IOException;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletRequest;
import javax.portlet.PortletSession;
import javax.portlet.RenderRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.portals.bridges.velocity.GenericVelocityPortlet;

import de.ingrid.portal.global.Settings;
import de.ingrid.portal.global.Utils;

/**
 * This portlet is the abstract base class of all content portlets.
 * Encapsulates common stuff.
 *
 * @author martin@wemove.com
 */
abstract public class ContentPortlet extends GenericVelocityPortlet {

    private final static Log log = LogFactory.getLog(ContentPortlet.class);

    // Attributes in Session
    protected final static String KEY_BROWSER_STATE = "browserState";

    // Parameters in Request
    protected final static String PARAM_SORT_COLUMN = "sortColumn";

    protected final static String PARAM_PAGE = "currentPage";

    protected final static String PARAM_NOT_INITIAL = "notInitial";

    // ACTIONS
    protected static String PARAMV_ACTION_DO_REFRESH = "doRefresh";

    protected static String PARAMV_ACTION_DO_EDIT = "doEdit";

    protected static String PARAMV_ACTION_DO_DELETE = "doDelete";

    protected static String PARAMV_ACTION_DO_SAVE = "doSave";

    /**
     * Called from sub Portlets. Handles Actions and passes all Request Params then to render method.
     * @see javax.portlet.Portlet#processAction(javax.portlet.ActionRequest, javax.portlet.ActionResponse)
     */
    public void processAction(ActionRequest request, ActionResponse response) throws PortletException, IOException {
        try {
            StringBuffer urlViewParams = new StringBuffer("?");

            // append all params from passed request
            urlViewParams.append(Utils.getURLParams(request));

            // indicates call from same page for rendering
            String urlParam = Utils.toURLParam(PARAM_NOT_INITIAL, Settings.MSGV_TRUE);
            Utils.appendURLParameter(urlViewParams, urlParam);

            // handle ACTIONS and set action Request param for rendering

            // REFRESH
            if (request.getParameter(PARAMV_ACTION_DO_REFRESH) != null) {
                urlParam = Utils.toURLParam(Settings.PARAM_ACTION, PARAMV_ACTION_DO_REFRESH);
                Utils.appendURLParameter(urlViewParams, urlParam);

                // EDIT
            } else if (request.getParameter(PARAMV_ACTION_DO_EDIT) != null) {
                urlParam = Utils.toURLParam(Settings.PARAM_ACTION, PARAMV_ACTION_DO_EDIT);
                Utils.appendURLParameter(urlViewParams, urlParam);

                // DELETE
            } else if (request.getParameter(PARAMV_ACTION_DO_DELETE) != null) {
                urlParam = Utils.toURLParam(Settings.PARAM_ACTION, PARAMV_ACTION_DO_DELETE);
                Utils.appendURLParameter(urlViewParams, urlParam);

                // SAVE
            } else if (request.getParameter(PARAMV_ACTION_DO_SAVE) != null) {
                urlParam = Utils.toURLParam(Settings.PARAM_ACTION, PARAMV_ACTION_DO_SAVE);
                Utils.appendURLParameter(urlViewParams, urlParam);
            }

            // redirect to render method WITH URL PARAMS
            String currentPage = (String) request.getAttribute(PARAM_PAGE);
            if (currentPage != null) {
                response.sendRedirect(currentPage + urlViewParams);
            }
        } catch (Exception ex) {
            if (log.isErrorEnabled()) {
                log.error("Problems processing action:", ex);
            }
        }
    }

    /**
     * Get current Action from request. returns "" if no action found.
     * @param request
     * @return
     */
    static protected String getAction(PortletRequest request) {
        String action = request.getParameter(Settings.PARAM_ACTION);
        if (action == null) {
            action = "";
        }

        return action;
    }

    /**
     * Handle browser state dependent from "page state". Resets browser state if page is
     * entered from other page.
     * @param request
     */
    static protected void handleState(RenderRequest request) {
        if (request.getParameter(PARAM_NOT_INITIAL) == null) {
            clearBrowserState(request);
        }
    }

    /**
     * Get the column to sort after.
     * @param request
     * @param defaultValue The default column
     * @return
     */
    static protected String getSortColumn(RenderRequest request, String defaultValue) {
        ContentBrowserState state = getBrowserState(request);

        String sortCol = request.getParameter(PARAM_SORT_COLUMN);
        if (sortCol == null) {
            sortCol = state.getSortColumnName();
        }
        if (sortCol == null) {
            sortCol = defaultValue;
        }

        state.setSortColumnName(sortCol);

        return sortCol;
    }

    /**
     * Get Sort Order
     * @param request
     * @return true = ascending else descending
     */
    static protected boolean isAscendingOrder(RenderRequest request) {
        ContentBrowserState state = getBrowserState(request);

        // if no sort column in request, then keep the state
        String sortCol = request.getParameter(PARAM_SORT_COLUMN);
        if (sortCol == null) {
            return state.isAscendingOrder();
        }

        // else process sort column
        return state.isAscendingOrder(sortCol);
    }

    /**
     * Get current state of DB Browser.
     * NOTICE: Only ONE state for all DB Browsers (APPLICATION_SCOPE).
     * @param request
     * @return
     */
    static protected ContentBrowserState getBrowserState(PortletRequest request) {
        ContentBrowserState state = (ContentBrowserState) request.getPortletSession().getAttribute(KEY_BROWSER_STATE,
                PortletSession.APPLICATION_SCOPE);
        if (state == null) {
            state = new ContentBrowserState();
            setBrowserState(request, state);
        }
        return state;
    }

    /**
     * Set state of Browser.
     * NOTICE: Only ONE state for all DB Browsers (APPLICATION_SCOPE).
     * @param request
     * @param state
     */
    static protected void setBrowserState(PortletRequest request, ContentBrowserState state) {
        request.getPortletSession().setAttribute(KEY_BROWSER_STATE, state, PortletSession.APPLICATION_SCOPE);
    }

    /**
     * Clear state of Browser.
     * NOTICE: Only ONE state for all DB Browsers (APPLICATION_SCOPE).
     * @param request
     */
    static protected void clearBrowserState(PortletRequest request) {
        request.getPortletSession().removeAttribute(KEY_BROWSER_STATE, PortletSession.APPLICATION_SCOPE);
    }

}
