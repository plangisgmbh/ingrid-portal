--
-- Daten für Tabelle help_messages
--

UPDATE info SET value_name = '3.4' WHERE  info.key_name = 'version';

-- Uodated stuff for InGrid 3.4
-- ============================

DELETE FROM help_messages WHERE gui_id = 8061;
DELETE FROM help_messages WHERE gui_id = 5064;
DELETE FROM help_messages WHERE gui_id = 10024;
DELETE FROM help_messages WHERE gui_id = 1315;
DELETE FROM help_messages WHERE gui_id = 3220;
DELETE FROM help_messages WHERE gui_id = 6010;
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(281, 0, 8061, -1, 'de', 'GetCapabilities Assistent - Dienst-URL', 'Eintrag der Dienst-URL des entsprechenden Dienstes. Die Parameter REQUEST und SERVICE werden automatisch ergänzt, können aber auch explizit mit angegeben werden.', 'http://www.portalu.de/csw202?SERVICE=CSW');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1281, 0, 8061, -1, 'en', 'Service URL', 'Enter the getCapability-URL of the corresponding service. The parameters REQUEST and SERVICE are optional and will be added automatically. However it is possible to set them explicitly.', 'http://www.portalu.de/csw202?SERVICE=CSW');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(137, 0, 5064, -1, 'de', 'INSPIRE-Themen', 'Auswahl eines INSPIRE Themengebiets zur Verschlagwortung des Datensatzes (INSPIRE-Pflichtfeld).<br/><br/>Bei Eintragung oder Löschen eines INSPIRE-Themas werden in den Pflichtfeldern Konformität/Spezifikation und Kodierungsschema automatisch Einträge vorgenommen bzw. entfernt. ', 'Boden (automatischer Eintrag von "INSPIRE Data Specification on Soil - Draft Technical Guidelines" in Konformität/Spezifikation)');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1137, 0, 5064, -1, 'en', 'INSPIRE-Topics', 'Selection of an INSPIRE subject area for providing keywords from the data set (INSPIRE-obligatory field).<br/><br/>Inserting or deleting an entry here will cause an automatic insertion or deletion of a corresponding entry in "Conformity/Specification of Conformity".', 'Soil (automatic insertion of "INSPIRE Data Specification on Soil - Draft Technical Guidelines" in Conformity/Specification of Conformity)');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(319, 0, 10024, -1, 'de', 'Konformität', 'Hier muss angegeben werden, zu welcher Durchführungsbestimmung der INSPIRE-Richtlinie bzw. zu welcher anderweitigen Spezifikation die beschriebenen Daten konform sind. (INSPIRE-Pflichtfeld)<br/><br/>Dieses Feld wird bei Eintragungen in "INSPIRE-Themen" oder "Art des Dienstes" automatisch befüllt. Es muss dann nur der Grad der Konformität manuell eingetragen werden.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1319, 0, 10024, -1, 'en', 'Conformity', 'Specify the relevant specification (obligatory for INSPIRE-relevant metadata) and whether the dataset/service is conformant or not.<br/><br/>When inserting an entry in "INSPIRE-Topics" (Geodatensatz) or a "Type of Service" (Geodatendienst), the specification will be filled in automatically.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(345, 0, 1315, -1, 'de', 'Kodierungsschema der geographischen Daten', 'Kodierung: Beschreibung des Datenformats (zum Beispiel eine Markup-Sprache wie GML), in welchem die beschriebenen Daten kodiert sind.<br/><br/>Bei Eintragung oder Löschung in "INSPIRE-Themen" (Geodatensatz) werden in diesem Feld korrespondierende Einträge automatisch vorgenommen oder entfernt.', 'Hydrography GML application schema (automatischer Eintrag bei Auswahl des INSPIRE-Themas Gewäsernetz)');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1424, 0, 1315, -1, 'en', 'Encoding scheme geographical data', 'Specify the dataformat of the data. Inserting or deleting an entry in "INSPIRE-Topics" (Geodatensatz) will cause an automatic insertion or deletion of an corresponding entry here.', 'Hydrography GML application schema (automatic insertion when selecting INSPIRE-Topic "Hydrography")');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(48, 0, 3220, 3, 'de', 'Art des Dienstes', 'In diesem Pflichtfeld kann die Art des Dienstes ausgewählt werden. Über das Feld werden die zur weiteren Befüllung auszuwählenden Angaben zu Operationen gesteuert.<br/><br/>Bei Eintragungen bzw. Änderungen dieses Feldes werden in der Tabelle Konformität die Einträge für die zugehörige Spezifikation automatisch gesetzt (gilt nicht für alle Dienstarten).', 'Darstellungsdienst (automatischer Eintrag "Technical Guidance for the implementation of INSPIRE View Services" in Konformität/Spezifikation)');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1048, 0, 3220, 3, 'en', 'Type of Service', 'This mandatory field specifies the type of the service. The input of this field controls the information that has to be provided for the operations of the service.<br/><br/>Inserting or deleting an entry here will cause an automatic insertion or deletion of an corresponding entry in "Conformity/Specification of Conformity" (not for all types of services).', 'View Service (automatic insertion of "Technical Guidance for the implementation of INSPIRE View Services" in Conformity/Specification of Conformit).');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1500, 0, 10200, -1, 'de', 'Erfassungsassistent - Nutzungsbedingungen', 'Auswahl, ob die Nutzungsbedingungen für ein neues Datenobjekt übernommen werden sollen.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1501, 0, 10200, -1, 'en', 'Assistent - Fees', 'Selection whether the fees should be adopted for the new data object.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1502, 0, 10201, -1, 'de', 'Erfassungsassistent - Zugangsbeschränkungen', 'Auswahl, welche der Zugangsbeschränkungen übernommen werden sollen. Durch einen Klick in die erste Spalte der Tabelle, kann über eine Checkbox der zu übernehmende Eintrag ausgewählt werden.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1503, 0, 10201, -1, 'en', 'Assistent - Access Constraints', 'Selection, which access constraints shall be used for the object. By clicking in the first column of the table you can activate a checkbox for selection of the chosen entry.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1504, 0, 10202, -1, 'de', 'Erfassungsassistent - Art des Dienstes', 'Auswahl des Diensttyps, der für das neue Dienst-Objekt verwendet werden soll.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1505, 0, 10202, -1, 'en', 'Assistent - Type of Service', 'Selection of the service type of this service object.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1506, 0, 10203, -1, 'de', 'Erfassungsassistent - Verweise', 'Auswahl der zu erstellenden Verweise. Durch einen Klick in die erste Spalte der Tabelle, kann über eine Checkbox der zu übernehmende Eintrag ausgewählt werden.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1507, 0, 10203, -1, 'en', 'Assistent - References', 'Selection, which references shall be used for the object. By clicking in the first column of the table you can activate a checkbox for selection of the chosen entry.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1508, 0, 10204, -1, 'de', 'Erfassungsassistent - Ressource Adresse', 'Auswahl, welche Ressource Addressen übernommen werden sollen. Durch einen Klick in die erste Spalte der Tabelle, kann über eine Checkbox der zu übernehmende Eintrag ausgewählt werden.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1509, 0, 10204, -1, 'en', 'Assistent - Resource Locator', 'Selection, which resource locators shall be used for the object. By clicking in the first column of the table you can activate a checkbox for selection of the chosen entry.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1510, 0, 10205, -1, 'de', 'Erfassungsassistent - Raumbezugssysteme', 'Auswahl, welche Raumbezugssysteme übernommen werden sollen. Durch einen Klick in die erste Spalte der Tabelle, kann über eine Checkbox der zu übernehmende Eintrag ausgewählt werden.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1511, 0, 10205, -1, 'en', 'Assistent - Spatial Reference System', 'Selection, which reference systems shall be used for the object. By clicking in the first column of the table you can activate a checkbox for selection of the chosen entry.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1512, 0, 10206, -1, 'de', 'Erfassungsassistent - Schlagwörter', 'Auswahl, welche Schlagwörter übernommen werden sollen. Durch einen Klick in die erste Spalte der Tabelle, kann über eine Checkbox der zu übernehmende Eintrag ausgewählt werden.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1513, 0, 10206, -1, 'en', 'Assistent - Keywords', 'Selection, which keywords shall be used for the object. By clicking in the first column of the table you can activate a checkbox for selection of the chosen entry.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1514, 0, 10207, -1, 'de', 'Erfassungsassistent - Konformität', 'Auswahl, welche Konformitäten übernommen werden sollen. Durch einen Klick in die erste Spalte der Tabelle, kann über eine Checkbox der zu übernehmende Eintrag ausgewählt werden.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1515, 0, 10207, -1, 'en', 'Assistent - Conformity', 'Selection, which conformities shall be used for the object. By clicking in the first column of the table you can activate a checkbox for selection of the chosen entry.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1516, 0, 10208, -1, 'de', 'Erfassungsassistent - Zeitspanne', 'Auswahl, welche Zeitspanne übernommen werden soll. Durch einen Klick in die erste Spalte der Tabelle, kann über eine Radiobox der zu übernehmende Eintrag ausgewählt werden.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1517, 0, 10208, -1, 'en', 'Assistent - Time Span', 'Selection, which time span shall be used for the object. By clicking in the first column of the table you can activate a radiobox for selection of the chosen entry.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1518, 0, 10209, -1, 'de', 'Erfassungsassistent - Adressen', 'Auswahl, welche Addressen übernommen werden sollen. Wenn eine Adresse schon existiert, wird diese verlinkt (Aktion=Link), ansonsten wird sie unter den freien Adressen neu angelegt (Aktion=Neu). Durch einen Klick in die erste Spalte der Tabelle, kann über eine Checkbox der zu übernehmende Eintrag ausgewählt werden.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1519, 0, 10209, -1, 'en', 'Assistent - Addresses', 'Selection, which addresses shall be used for the object. If an address already exists, then this will be linked to (Action=Link), otherwise it will be created under "Free Addresses" (Action=New). By clicking in the first column of the table you can activate a checkbox for selection of the chosen entry.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1520, 0, 10210, -1, 'de', 'Erfassungsassistent - Gekoppelte Daten', 'Auswahl, welche gekoppelten Daten übernommen werden sollen. Die Aktion bestimmt, ob ein Datensatz verlinkt wird, wenn dieser schon existiert oder ob dieser Datensatz neu angelegt wird. Durch einen Klick in die erste Spalte der Tabelle, kann über eine Checkbox der zu übernehmende Eintrag ausgewählt werden.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1521, 0, 10210, -1, 'en', 'Assistent - Coupled Resources', 'Selection, which coupled resources shall be used for the object. The action defines if a dataset is linked to the new service object if it already exists or otherwise it will be created as a new dataset. By clicking in the first column of the table you can activate a checkbox for selection of the chosen entry.', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1410, 0, 6010, -1, 'de', 'Open Data', 'Diese Checkbox kennzeichnet dieses Objekt als "Open Data"-Objekt. Es sind dann zusätzlich folgende Angaben verpflichtend:<ul><li>In der (nur für Opendata) erscheinenden Tabelle "Kategorien" muß mindestens ein Wert eingetragen werden.</li><li>Unter Verweisen muß mindestens ein Verweis vom Typ "Datendownload" eingetragen werden.</li><li>Unter Nutzungsbedingungen wird eine spezielle Codeliste für Lizenzen verwendet, aus der ein Eintrag gewählt werden muß.</li></ul>', '');
INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1411, 0, 6010, -1, 'en', 'Open Data', 'This checkbox defines this object as an "open data"-object. If checked, the following inputs will be mandatory:<ul><li>in the appearing table "Categories", at least one value must be entered</li><li>in the table "Links To", at least one link of type download must exist</li><li>the use constraints will have a different codelist where at least one entry must be chosen</li></ul>', '');