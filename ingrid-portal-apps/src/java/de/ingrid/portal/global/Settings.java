/*
 * Copyright (c) 2006 wemove digital solutions. All rights reserved.
 */
package de.ingrid.portal.global;

import de.ingrid.utils.query.IngridQuery;

/**
 * Common resources used by our Portlet Application
 *
 * @author Martin Maidhof
 */
public class Settings {

    // ===========================================
    // Search general settings
    // ===========================================

    /** number of ranked hits per page */
    public final static int SEARCH_RANKED_HITS_PER_PAGE = 10;

    /** number of unranked hits per page */
    public final static int SEARCH_UNRANKED_HITS_PER_PAGE = 10;

    /** number of ranked pages displayed for selection ("selector pages") */
    public final static int SEARCH_RANKED_NUM_PAGES_TO_SELECT = 5;

    /** number of unranked pages displayed for selection ("selector pages") */
    public final static int SEARCH_UNRANKED_NUM_PAGES_TO_SELECT = 3;

    /** max. number of hits displayed for every iPlug (in unranked search) */
    public final static int SEARCH_NUM_HITS_PER_GROUP = 3;

    public final static String SEARCH_INITIAL_DATASOURCE = Settings.PARAMV_DATASOURCE_ENVINFO;

    // ===========================================
    // PSML pages
    // ===========================================

    /** main-search page -> displays and handles simple search, also with results */
    public final static String PAGE_SEARCH_RESULT = "/ingrid-portal/portal/main-search.psml";

    /** main-service page -> service catalogue, also displays results */
    public final static String PAGE_SERVICE = "/ingrid-portal/portal/main-service.psml";

    /** main-measures page -> measures catalogue, also displays results */
    public final static String PAGE_MEASURES = "/ingrid-portal/portal/main-measures.psml";

    /** main-environment page -> environment catalogue, also displays results */
    public final static String PAGE_ENVIRONMENT = "/ingrid-portal/portal/main-environment.psml";

    /** main-chronicle page -> environment chronicle, also displays results */
    public final static String PAGE_CHRONICLE = "/ingrid-portal/portal/main-chronicle.psml";

    /** contact page */
    public final static String PAGE_CONTACT = "/ingrid-portal/portal/service-contact.psml";

    // ===========================================
    // IngridQuery
    // ===========================================

    // ------------- query field names -----------------------------

    public final static String QFIELD_DATATYPE = IngridQuery.DATA_TYPE;

    // grouped Field
    public final static String QFIELD_GROUPED = "grouped";

    public final static String QFIELD_PARTNER = "partner";

    public static final String QFIELD_PROVIDER = "provider";
    
    // "service", "measures"; rubric
    public final static String QFIELD_RUBRIC = "topic";

    // "environment topics": first category
    public final static String QFIELD_TOPIC = "topic";

    // "environment topics": second category
    public final static String QFIELD_FUNCT_CATEGORY = "funct_category";

    // "environment chronicle": event type
    public final static String QFIELD_EVENT_TYPE = "eventtype";

    // "environment chronicle", ...: at date
    public final static String QFIELD_DATE_AT = "t0";

    // "environment chronicle", ...: from date
    public final static String QFIELD_DATE_FROM = "t1";

    // "environment chronicle", ...: to date
    public final static String QFIELD_DATE_TO = "t2";

    // search settings: search sns metadata as well
    public static final String QFIELD_INCL_META = "incl_meta";
    
    
    // ------------- query field values -----------------------------

    // datatype: area types
    // --------------------
    public final static String QVALUE_DATATYPE_AREA_SERVICE = "service";

    public final static String QVALUE_DATATYPE_AREA_MEASURES = "measure";

    public final static String QVALUE_DATATYPE_AREA_ENVTOPICS = "topics";

    public final static String QVALUE_DATATYPE_AREA_ENVINFO = "default";

    public final static String QVALUE_DATATYPE_AREA_ADDRESS = "address";

    public final static String QVALUE_DATATYPE_AREA_RESEARCH = "research";

    // datatype: source types
    // ----------------------
    public final static String QVALUE_DATATYPE_SOURCE_WWW = "www";

    public final static String QVALUE_DATATYPE_SOURCE_METADATA = "metadata";

    public final static String QVALUE_DATATYPE_SOURCE_FIS = "fis";

    // datatype: IPLUG types
    // ---------------------
    public final static String QVALUE_DATATYPE_IPLUG_DSC_ECS = "dsc_ecs";

    public final static String QVALUE_DATATYPE_IPLUG_DSC_ECS_ADDRESS = "dsc_ecs_address";

    // ===========================================
    // Result data (used in templates for rendering results!)
    // IF POSSIBLE, USE THESE KEYS ALSO TO ACCESS HIT DETAIL DATA !!! 
    // ===========================================

    public final static String RESULT_KEY_TITLE = "title";

    public final static String RESULT_KEY_ABSTRACT = "abstract";

    public final static String RESULT_KEY_PARTNER = "partner";

    public final static String RESULT_KEY_RUBRIC = "topic";

    public final static String RESULT_KEY_TOPIC = "topic";

    public final static String RESULT_KEY_FUNCT_CATEGORY = "funct_category";

    public final static String RESULT_KEY_URL = "url";

    public final static String RESULT_KEY_URL_STR = "url_str";

    public final static String RESULT_KEY_PROVIDER = "provider";

    public final static String RESULT_KEY_SOURCE = "source";

    public final static String RESULT_KEY_TYPE = "type";

    public final static String RESULT_KEY_PLUG_ID = "plugid";

    public final static String RESULT_KEY_DOC_ID = "docid";

    public final static String RESULT_KEY_WMS_URL = "wms_url";

    public final static String RESULT_KEY_UDK_CLASS = "udk_class";

    public final static String RESULT_KEY_UDK_ADDRESS_FIRSTNAME = "address_firstname";

    public final static String RESULT_KEY_UDK_ADDRESS_LASTNAME = "address_lastname";

    public final static String RESULT_KEY_UDK_ADDRESS_TITLE = "address_title";

    public final static String RESULT_KEY_UDK_ADDRESS_SALUTATION = "address_salutation";

    public static final String RESULT_KEY_UDK_ADDRESS_PARENTS = "address_parents";
    
    // ===========================================
    // Hit Detail data (get data from hit details)
    // NOTICE: Define here only special stuff, WHEN YOU CAN'T USE RESULT_KEY_... from above
    // ===========================================

    public final static String HIT_KEY_WMS_URL = "T011_obj_serv_op_connpoint.connect_point";

    public final static String HIT_KEY_OBJ_ID = "T01_object.obj_id";

    public final static String HIT_KEY_UDK_CLASS = "T01_object.obj_class";

    public final static String HIT_KEY_ADDRESS_CLASS = "T02_address.typ";
    
    public static final String HIT_KEY_ADDRESS_FIRSTNAME = "T02_address.firstname";
    
    public static final String HIT_KEY_ADDRESS_LASTNAME = "T02_address.lastname";

    public static final String HIT_KEY_ADDRESS_TITLE = "T02_address.title";

    public static final String HIT_KEY_ADDRESS_ADDRESS = "T02_address.address";

    public static final String HIT_KEY_ADDRESS_ADDRID = "T02_address.adr_id";

    // ===========================================
    // PORTLET MESSAGING
    // NOTICE: Request Parameter (see next section) ARE USED AS MESSAGE KEYS AND VALUES whenever possible !
    // These messages here are additional messages for logic, caching etc.
    // topics = MSG_TOPIC_...
    // keys = MSG_...
    // values = MSGV_...
    // ===========================================

    // ------------- MESSAGE TOPICS (MSG_TOPIC_...) -----------------------------
    // define the message "scope", will be "prefix" in message key -> "topic:message" 

    /** message "scope" for search pages (start page, simple search, extended search ...) */
    public final static String MSG_TOPIC_SEARCH = "search";

    /** set message "scope" service page */
    public final static String MSG_TOPIC_SERVICE = "service";

    /** set message "scope" measures page */
    public final static String MSG_TOPIC_MEASURES = "measures";

    /** set message "scope" measures page */
    public final static String MSG_TOPIC_ENVIRONMENT = "environment";

    /** set message "scope" chronicle page */
    public final static String MSG_TOPIC_CHRONICLE = "chronicle";

    // ------------- DATA MESSAGES: KEYS (MSG_...) -----------------------------
    // define the message itself, will be "suffix" in message key -> "topic:message"

    /** this message contains the central IngridQuery object */
    public static final String MSG_QUERY = "query";

    /** this message contains the currently selected partners, from whom results should be delivered */
    public static final String MSG_PARTNER = "partner";

    /** cache for ranked search results */
    public static final String MSG_SEARCH_RESULT_RANKED = "search_result_ranked";

    /** cache for unranked search results */
    public static final String MSG_SEARCH_RESULT_UNRANKED = "search_result_unranked";

    // ------------- INFORMATION MESSAGES: KEYS (MSG_...) AND VALUES ("MSGV_...") -----------------------------

    /** this message indicates what kind of query has to be performed, e.g.
     * - a new query (form submitted),
     * - no query (click in similiar terms),
     * - ranked query (left page navigation clicked),
     * - unranked query (right page navigation clicked)  
     */
    public static final String MSG_QUERY_EXECUTION_TYPE = "query_state";

    public static final String MSGV_NO_QUERY = "no";

    public static final String MSGV_NEW_QUERY = "new";

    public static final String MSGV_RANKED_QUERY = "ranked";

    public static final String MSGV_UNRANKED_QUERY = "unranked";

    /** indicates whether JavaScript is active in Browser */
    public static final String MSG_HAS_JAVASCRIPT = "has_javascript";

    // ------------- GENERIC MESSAGE VALUES ("MSGV_...") -----------------------------

    /** dummy value for a message just to set a value for a message */
    public static final String MSGV_TRUE = "1";

    // ===========================================
    // REQUEST PARAMETERS
    // NOTICE: Also used as message keys and values in SearchState !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
    // names = PARAM_
    // values = PARAMV_
    // ===========================================

    // ------------- PARAM values -----------------------------

    public final static String PARAMV_ALL = "all";

    // ACTION VALUES used by multiple portlets
    public final static String PARAMV_ACTION_SUBMIT = "doSubmit";

    public final static String PARAMV_ACTION_ORIGINAL_SETTINGS = "doOriginalSettings";

    public final static String PARAMV_ACTION_FROM_TEASER = "doTeaser";

    public final static String PARAMV_ACTION_NEW_SEARCH = "doSearch";

    public final static String PARAMV_ACTION_CHANGE_TAB = "doChangeTab";

    // DATASOURCE VALUES
    public final static String PARAMV_DATASOURCE_ENVINFO = "1";

    public final static String PARAMV_DATASOURCE_ADDRESS = "2";

    public final static String PARAMV_DATASOURCE_RESEARCH = "3";

    // GROUPING VALUES
    public final static String PARAMV_GROUPING_OFF = "none";

    public final static String PARAMV_GROUPING_PARTNER = "partner";

    public final static String PARAMV_GROUPING_PROVIDER = "provider";
    

    // ------------- PARAM Keys, also used as message keys (SearchState) -----------------------------

    public final static String PARAM_QUERY_STRING = "q";

    public final static String PARAM_STARTHIT_RANKED = "rstart";

    public final static String PARAM_STARTHIT_UNRANKED = "nrstart";

    public final static String PARAM_DATASOURCE = "ds";

    public final static String PARAM_RANKING = "rank";

    /** this parameter holds the type of filter for search result display (usually same as grouping: partner | provider) **/
    public static final String PARAM_FILTER = "filter";
    
    // ------------- PARAM Keys, NOT used for messaging, just for access in Request -----------------------------

    public final static String PARAM_RUBRIC = "rubric";

    public final static String PARAM_PARTNER = "partner";

    public static final String PARAM_SUBJECT = "subject";

    public final static String PARAM_GROUPING = "grouping";

    public final static String PARAM_ACTION = "action";

    public final static String PARAM_TOPIC_ID = "topId";

    public final static String PARAM_TAB = "tab";



}
