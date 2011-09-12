/*
 * Copyright (c) 2006 wemove digital solutions. All rights reserved.
 */
package de.ingrid.portal.portlets.searchext;

import java.io.IOException;

import javax.portlet.ActionResponse;
import javax.portlet.PortletException;

import org.apache.portals.bridges.velocity.GenericVelocityPortlet;
import org.apache.velocity.context.Context;

import de.ingrid.portal.global.IngridResourceBundle;

/**
 * This portlet is the abstract base class of all "wizard" portlets in the research
 * area of the extended search. Encapsulates common stuff (Main Tab Navigation, ressources ...).
 *
 * @author martin@wemove.com
 */
abstract class SearchExtRes extends GenericVelocityPortlet {

    // TAB values from action request (request parameter)

    /** tab param value if main tab place is clicked */
    protected final static String PARAMV_TAB_TOPIC = "1";

    // START PAGES FOR MAIN TABS

    /** page for main tab "topic" */
    protected final static String PAGE_TOPIC = "/portal/search-extended/search-ext-res-topic-attributes.psml";

    // VARIABLE NAMES FOR VELOCITY

    /** velocity variable name for main tab, has to be put to context, so correct tab is selected */
    protected final static String VAR_MAIN_TAB = "tab";

    /** velocity variable name for sub tab, has to be put to context, so correct sub tab is selected */
    protected final static String VAR_SUB_TAB = "subtab";

    public void doView(javax.portlet.RenderRequest request, javax.portlet.RenderResponse response)
            throws PortletException, IOException {
        Context context = getContext(request);
        IngridResourceBundle messages = new IngridResourceBundle(getPortletConfig().getResourceBundle(
                request.getLocale()));
        context.put("MESSAGES", messages);

        super.doView(request, response);
    }

    protected void processTab(ActionResponse actionResponse, String tab) throws PortletException, IOException {
        if (tab.equals(PARAMV_TAB_TOPIC)) {
            actionResponse.sendRedirect(actionResponse.encodeURL(PAGE_TOPIC));
        }
    }
}