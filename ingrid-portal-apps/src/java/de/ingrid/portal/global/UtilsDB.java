/*
 * Copyright (c) 2006 wemove digital solutions. All rights reserved.
 */
package de.ingrid.portal.global;

import java.util.List;

import de.ingrid.portal.hibernate.HibernateManager;
import de.ingrid.portal.om.IngridPartner;

/**
 * Global STATIC data and utility methods for Database.
 * 
 * @author Martin Maidhof
 */
public class UtilsDB {

    /** this flag controls whether Data is always fetched from Database or from cache  */
    // TODO keep possibilty to always reload data from DB ???? makes it complicated ! maybe instable ?
    private static boolean alwaysReloadDBData = false;

    /** cache for partners */
    private static List partners = null;
    
    public static boolean getAlwaysReloadDBData() {
        return alwaysReloadDBData;
    }
    public static synchronized void setAlwaysReloadDBData(boolean reload) {
        alwaysReloadDBData = reload;
    }

    /**
     * Get all the partners. NOTICE: Partners are always reloaded from database
     * if flag alwaysReloadDBData in our class is set to true. Otherwise we load
     * the partners one and return our cache !
     * @return
     */
    public static List getPartners() {
        if (alwaysReloadDBData) {
            HibernateManager hibernateManager = HibernateManager.getInstance();
            return hibernateManager.loadAllData(IngridPartner.class, 0);
        }
        synchronized (UtilsDB.class) {
            if (partners == null) {
                HibernateManager hibernateManager = HibernateManager.getInstance();
                partners =  hibernateManager.loadAllData(IngridPartner.class, 0);
            }
        }
        
        return partners;
    }
    /**
     * Get the name of the partner with the according ident.
     * @param ident
     * @return the name of the partner OR the key, if no matching partner was found
     */
    public static String getPartnerFromKey(String ident) {
        List partners = getPartners();
        IngridPartner partner = null;
        for (int i = 0; i < partners.size(); i++) {
            partner = (IngridPartner) partners.get(i);
            if (partner.getIdent().equals(ident)) {
                return partner.getName();
            }
        }

        return ident;
    }
}
