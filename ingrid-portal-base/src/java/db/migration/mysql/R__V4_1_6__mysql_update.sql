-- DB Version
UPDATE ingrid_lookup SET item_value = '4.1.6', item_date = NOW() WHERE ingrid_lookup.item_key ='ingrid_db_version';

-- FIX character set in all tables
SET FOREIGN_KEY_CHECKS=0;
CREATE TABLE IF NOT EXISTS ingrid_portal.admin_activity(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.admin_activity CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.capability(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.capability CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.client(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.client CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.client_to_capability(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.client_to_capability CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.client_to_mimetype(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.client_to_mimetype CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.clubs(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.clubs CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.custom_portlet_mode(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.custom_portlet_mode CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.custom_window_state(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.custom_window_state CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.event_alias(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.event_alias CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.event_definition(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.event_definition CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.filter_lifecycle(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.filter_lifecycle CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.filter_mapping(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.filter_mapping CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.filtered_portlet(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.filtered_portlet CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.folder(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.folder CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.folder_constraint(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.folder_constraint CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.folder_constraints_ref(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.folder_constraints_ref CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.folder_menu(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.folder_menu CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.folder_menu_metadata(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.folder_menu_metadata CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.folder_metadata(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.folder_metadata CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.folder_order(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.folder_order CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.fragment(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.fragment CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.fragment_constraint(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.fragment_constraint CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.fragment_constraints_ref(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.fragment_constraints_ref CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.fragment_pref(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.fragment_pref CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.fragment_pref_value(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.fragment_pref_value CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.fragment_prop(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.fragment_prop CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.ingrid_anniversary(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.ingrid_anniversary CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.ingrid_chron_eventtypes(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.ingrid_chron_eventtypes CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.ingrid_cms(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.ingrid_cms CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.ingrid_cms_item(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.ingrid_cms_item CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.ingrid_env_topic(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.ingrid_env_topic CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.ingrid_lookup(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.ingrid_lookup CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.ingrid_measures_rubric(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.ingrid_measures_rubric CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.ingrid_newsletter_data(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.ingrid_newsletter_data CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.ingrid_partner(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.ingrid_partner CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.ingrid_principal_pref(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.ingrid_principal_pref CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.ingrid_provider(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.ingrid_provider CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.ingrid_rss_source(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.ingrid_rss_source CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.ingrid_rss_store(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.ingrid_rss_store CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.ingrid_service_rubric(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.ingrid_service_rubric CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.ingrid_tiny_url(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.ingrid_tiny_url CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.jetspeed_service(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.jetspeed_service CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.language(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.language CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.link(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.link CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.link_constraint(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.link_constraint CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.link_constraints_ref(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.link_constraints_ref CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.link_metadata(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.link_metadata CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.locale_encoding_mapping(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.locale_encoding_mapping CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.localized_description(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.localized_description CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.localized_display_name(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.localized_display_name CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.media_type(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.media_type CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.mediatype_to_capability(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.mediatype_to_capability CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.mediatype_to_mimetype(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.mediatype_to_mimetype CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.mimetype(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.mimetype CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.named_parameter(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.named_parameter CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.ojb_dlist(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.ojb_dlist CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.ojb_dlist_entries(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.ojb_dlist_entries CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.ojb_dmap(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.ojb_dmap CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.ojb_dset(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.ojb_dset CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.ojb_dset_entries(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.ojb_dset_entries CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.ojb_hl_seq(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.ojb_hl_seq CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.ojb_lockentry(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.ojb_lockentry CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.ojb_nrm(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.ojb_nrm CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.pa_metadata_fields(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.pa_metadata_fields CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.pa_security_constraint(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.pa_security_constraint CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.page(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.page CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.page_constraint(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.page_constraint CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.page_constraints_ref(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.page_constraints_ref CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.page_menu(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.page_menu CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.page_menu_metadata(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.page_menu_metadata CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.page_metadata(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.page_metadata CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.page_sec_constraint_def(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.page_sec_constraint_def CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.page_sec_constraints_def(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.page_sec_constraints_def CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.page_sec_constraints_ref(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.page_sec_constraints_ref CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.page_security(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.page_security CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.page_statistics(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.page_statistics CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.parameter(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.parameter CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.parameter_alias(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.parameter_alias CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.pd_metadata_fields(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.pd_metadata_fields CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.portlet_application(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.portlet_application CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.portlet_content_type(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.portlet_content_type CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.portlet_definition(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.portlet_definition CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.portlet_entity(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.portlet_entity CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.portlet_filter(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.portlet_filter CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.portlet_listener(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.portlet_listener CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.portlet_preference(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.portlet_preference CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.portlet_preference_value(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.portlet_preference_value CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.portlet_statistics(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.portlet_statistics CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.portlet_supports(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.portlet_supports CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.prefs_node(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.prefs_node CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.prefs_property_value(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.prefs_property_value CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.principal_permission(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.principal_permission CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.principal_rule_assoc(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.principal_rule_assoc CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.processing_event(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.processing_event CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.profile_page_assoc(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.profile_page_assoc CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.profiling_rule(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.profiling_rule CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.public_parameter(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.public_parameter CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.publishing_event(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.publishing_event CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.qrtz_blob_triggers(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.qrtz_blob_triggers CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.qrtz_calendars(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.qrtz_calendars CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.qrtz_cron_triggers(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.qrtz_cron_triggers CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.qrtz_fired_triggers(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.qrtz_fired_triggers CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.qrtz_job_details(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.qrtz_job_details CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.qrtz_job_listeners(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.qrtz_job_listeners CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.qrtz_locks(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.qrtz_locks CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.qrtz_paused_trigger_grps(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.qrtz_paused_trigger_grps CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.qrtz_scheduler_state(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.qrtz_scheduler_state CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.qrtz_simple_triggers(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.qrtz_simple_triggers CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.qrtz_trigger_listeners(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.qrtz_trigger_listeners CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.qrtz_triggers(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.qrtz_triggers CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.rule_criterion(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.rule_criterion CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.runtime_option(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.runtime_option CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.runtime_value(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.runtime_value CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.schema_version(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.schema_version CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.secured_portlet(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.secured_portlet CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.security_attribute(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.security_attribute CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.security_credential(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.security_credential CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.security_domain(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.security_domain CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.security_group_role(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.security_group_role CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.security_permission(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.security_permission CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.security_principal(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.security_principal CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.security_principal_assoc(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.security_principal_assoc CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.security_role(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.security_role CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.security_role_reference(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.security_role_reference CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.security_user_group(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.security_user_group CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.security_user_role(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.security_user_role CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.sso_cookie(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.sso_cookie CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.sso_cookie_to_remote(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.sso_cookie_to_remote CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.sso_principal_to_remote(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.sso_principal_to_remote CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.sso_site(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.sso_site CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.sso_site_to_principals(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.sso_site_to_principals CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.sso_site_to_remote(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.sso_site_to_remote CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.user_activity(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.user_activity CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.user_attribute(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.user_attribute CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.user_attribute_ref(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.user_attribute_ref CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.user_statistics(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.user_statistics CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS ingrid_portal.web_application(ID int(11) unsigned NOT NULL);
ALTER TABLE ingrid_portal.web_application CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
SET FOREIGN_KEY_CHECKS=1;