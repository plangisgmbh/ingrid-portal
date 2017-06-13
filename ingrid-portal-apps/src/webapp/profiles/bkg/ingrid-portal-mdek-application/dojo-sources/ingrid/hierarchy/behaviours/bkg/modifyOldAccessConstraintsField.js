/*
 * **************************************************-
 * InGrid Portal MDEK Application
 * ==================================================
 * Copyright (C) 2014 - 2017 wemove digital solutions GmbH
 * ==================================================
 * Licensed under the EUPL, Version 1.1 or – as soon they will be
 * approved by the European Commission - subsequent versions of the
 * EUPL (the "Licence");
 * 
 * You may not use this work except in compliance with the Licence.
 * You may obtain a copy of the Licence at:
 * 
 * http://ec.europa.eu/idabc/eupl5
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the Licence is distributed on an "AS IS" basis,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the Licence for the specific language governing permissions and
 * limitations under the Licence.
 * **************************************************#
 */
define([
    "dojo/_base/declare",
    "dojo/on",
    "dojo/dom-class",
    "dojo/query",
    "dijit/registry",
    "ingrid/grid/CustomGridEditors",
    "ingrid/widgets/MultiInputInfoField"
], function(declare, on, domClass, query, registry, GridEditors, MultiInputInfoField) {

    // issue: 556
    return declare(null, {
        title: "Zugriffsbeschränkungen (INSPIRE-Liste)",
        description: "Modifiziert die bestehende Tabelle 'Zugriffsbeschränkungen' und erlaubt keine freien Einträge mehr.",
        defaultActive: true,
        category: "BKG",
        run: function() {
            domClass.remove( "uiElementN025", "required" );
            domClass.add( "uiElementN025", "show" );
            query("label[for=availabilityAccessConstraints]").addContent("Zugriffsbeschränkungen (INSPIRE-Liste)<span class='requiredSign'>*</span>", "only");
            registry.byId("availabilityAccessConstraints").columns[0].editor = GridEditors.SelectboxEditor;

            on(registry.byId("isInspireRelevant") , "change", function(isChecked) {
                if (isChecked) {
                    domClass.add( "uiElementN025", "required" );
                } else {
                    domClass.remove( "uiElementN025", "required" );
                }
            });
        }
    })();
});