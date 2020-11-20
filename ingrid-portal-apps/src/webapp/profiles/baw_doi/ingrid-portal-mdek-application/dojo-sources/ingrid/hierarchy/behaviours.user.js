/*
 * **************************************************-
 * InGrid Portal MDEK Application
 * ==================================================
 * Copyright (C) 2014 - 2020 wemove digital solutions GmbH
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
    "dojo/_base/lang",
    "ingrid/hierarchy/behaviours",
    "ingrid/hierarchy/behaviours/baw_doi/bawDoiCrossReferences",
    "ingrid/hierarchy/behaviours/baw_doi/bawDoiPublicationRestriction",
    "ingrid/hierarchy/behaviours/baw_mis/bawMisCodelists",
    "ingrid/hierarchy/behaviours/baw_mis/bawMisNewObjectTypes",
    "ingrid/hierarchy/behaviours/baw_mis/bawUiGeneral",
    "ingrid/hierarchy/behaviours/baw_mis/bawValidationRules"
], function(lang, behaviours, bawDoiCrossReferences, bawDoiPublicationRestriction, bawMisCodelists, bawMisNewObjectTypes, bawUiGeneral, bawValidationRules) {

    return lang.mixin(behaviours, {

        /**
         * Cross-References table for DOIs
         */
        bawDoiCrossReferenceBehaviours: bawDoiCrossReferences,

        /**
         * Allow publication of objects only for Cat-admin
         */
        bawDoiPublicationRestriction: bawDoiPublicationRestriction,

        /**
         * Codelist changes for BAW-MIS profile
         */
        bawMisCodelists: bawMisCodelists,

        /**
         * Allowed object types in New Object dialog box
         */
        bawMisNewObjectTypes: bawMisNewObjectTypes,

        /**
         * UI changes for BAW-MIS profile
         */
        bawUiGeneral: bawUiGeneral,

        /**
         * Extra validation rules for BAW-MIS
         */
        bawValidationRules: bawValidationRules

    });
});

