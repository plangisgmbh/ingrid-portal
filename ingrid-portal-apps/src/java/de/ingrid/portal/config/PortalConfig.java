/*
 * Copyright (c) 2006 wemove digital solutions. All rights reserved.
 */
package de.ingrid.portal.config;

import org.apache.commons.configuration.PropertiesConfiguration;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * TODO Describe your created type (class, etc.) here.
 *
 * @author joachim@wemove.com
 */
public class PortalConfig extends PropertiesConfiguration {

    // how old can rss news be, before the are deleted from news history in days    
    public final static String RSS_HISTORY_DAYS = "rss.history.days";

    // timout for queries in ms 
    // should be larger than query.timout.ranked and query.timout.unranked
    // because ranked and unranked query is encapsulated inside a threaded query
    public final static String QUERY_TIMEOUT_THREADED = "query.timout.threaded";

    // timout for ranked queries in ms
    public final static String QUERY_TIMEOUT_RANKED = "query.timout.ranked";

    // timout for unranked queries in ms
    public final static String QUERY_TIMEOUT_UNRANKED = "query.timout.unranked";
    
    
    private static PortalConfig instance = null;

    private final static Log log = LogFactory.getLog(PortalConfig.class);
    
    public static synchronized PortalConfig getInstance() {
        if (instance == null) {
            try {
                instance = new PortalConfig();
            } catch (Exception e) {
                if (log.isFatalEnabled()) {
                    log.fatal("Error loading the portal config application config file. (ingrid-portal-apps.properties)", e);
                }
            }
        }
        return instance;
    }
    
    private PortalConfig() throws Exception {
        super("ingrid-portal-apps.properties");
    }
}
