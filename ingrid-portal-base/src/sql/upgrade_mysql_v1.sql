DROP TABLE IF EXISTS ingrid_lookup;
CREATE TABLE ingrid_lookup
(
    id MEDIUMINT NOT NULL,
    item_key VARCHAR(255) NOT NULL,
    item_value VARCHAR(255),
    PRIMARY KEY(id)
);

INSERT INTO ingrid_lookup (id, item_key, item_value) VALUES (1, 'ingrid_db_version', '1');

INSERT INTO SECURITY_PRINCIPAL VALUES(1100,'org.apache.jetspeed.security.JetspeedRolePrincipalImpl',0,1,'/role/admin-portal','2006-08-22 16:27:12.572','2006-08-22 16:27:12.572');
INSERT INTO SECURITY_PRINCIPAL VALUES(1101,'org.apache.jetspeed.security.JetspeedRolePrincipalImpl',0,1,'/role/admin-partner','2006-08-22 16:27:12.572','2006-08-22 16:27:12.572');
INSERT INTO SECURITY_PRINCIPAL VALUES(1102,'org.apache.jetspeed.security.JetspeedRolePrincipalImpl',0,1,'/role/admin-provider','2006-08-22 16:27:12.572','2006-08-22 16:27:12.572');

INSERT INTO SECURITY_PRINCIPAL VALUES(1110,'org.apache.jetspeed.security.JetspeedUserPrincipalImpl',0,1,'/user/adminportal','2006-08-22 16:27:12.572','2006-08-22 16:27:12.572');
INSERT INTO SECURITY_PRINCIPAL VALUES(1111,'org.apache.jetspeed.security.JetspeedUserPrincipalImpl',0,1,'/user/adminpartner','2006-08-22 16:27:12.572','2006-08-22 16:27:12.572');
INSERT INTO SECURITY_PRINCIPAL VALUES(1112,'org.apache.jetspeed.security.JetspeedUserPrincipalImpl',0,1,'/user/adminprovider','2006-08-22 16:27:12.572','2006-08-22 16:27:12.572');
INSERT INTO SECURITY_CREDENTIAL VALUES(1113,1110,'adminportal',0,'org.apache.jetspeed.security.spi.impl.DefaultPasswordCredentialImpl',0,0,1,0,0,'2006-08-22 16:27:12.572','2006-08-22 16:27:12.572',null,null,null);
INSERT INTO SECURITY_CREDENTIAL VALUES(1114,1111,'adminpartner',0,'org.apache.jetspeed.security.spi.impl.DefaultPasswordCredentialImpl',0,0,1,0,0,'2006-08-22 16:27:12.572','2006-08-22 16:27:12.572',null,null,null);
INSERT INTO SECURITY_CREDENTIAL VALUES(1115,1112,'adminprovider',0,'org.apache.jetspeed.security.spi.impl.DefaultPasswordCredentialImpl',0,0,1,0,0,'2006-08-22 16:27:12.572','2006-08-22 16:27:12.572',null,null,null);
INSERT INTO SECURITY_USER_ROLE VALUES(1110,8);
INSERT INTO SECURITY_USER_ROLE VALUES(1110,1100);
INSERT INTO SECURITY_USER_ROLE VALUES(1111,8);
INSERT INTO SECURITY_USER_ROLE VALUES(1111,1101);
INSERT INTO SECURITY_USER_ROLE VALUES(1112,8);
INSERT INTO SECURITY_USER_ROLE VALUES(1112,1102);
INSERT INTO SECURITY_PERMISSION VALUES(1199,'de.ingrid.portal.security.permission.IngridPortalPermission','admin','','2006-08-22 16:27:12.572','2006-08-22 16:27:12.572');
INSERT INTO SECURITY_PERMISSION VALUES(1200,'de.ingrid.portal.security.permission.IngridPortalPermission','admin.portal','','2006-08-22 16:27:12.572','2006-08-22 16:27:12.572');
INSERT INTO SECURITY_PERMISSION VALUES(1201,'de.ingrid.portal.security.permission.IngridPortalPermission','admin.portal.partner','','2006-08-22 16:27:12.572','2006-08-22 16:27:12.572');
INSERT INTO SECURITY_PERMISSION VALUES(1202,'de.ingrid.portal.security.permission.IngridPortalPermission','admin.portal.partner.provider.index','','2006-08-22 16:27:12.572','2006-08-22 16:27:12.572');
INSERT INTO SECURITY_PERMISSION VALUES(1203,'de.ingrid.portal.security.permission.IngridPortalPermission','admin.portal.partner.provider.catalog','','2006-08-22 16:27:12.572','2006-08-22 16:27:12.572');
INSERT INTO SECURITY_PERMISSION VALUES(1204,'de.ingrid.portal.security.permission.IngridPartnerPermission','partner.he','','2006-08-22 16:27:12.572','2006-08-22 16:27:12.572');
INSERT INTO SECURITY_PERMISSION VALUES(1205,'de.ingrid.portal.security.permission.IngridProviderPermission','provider.he_hmulv','','2006-08-22 16:27:12.572','2006-08-22 16:27:12.572');
INSERT INTO SECURITY_PERMISSION VALUES(1206,'de.ingrid.portal.security.permission.IngridProviderPermission','provider.he_hlug','','2006-08-22 16:27:12.572','2006-08-22 16:27:12.572');
INSERT INTO PRINCIPAL_PERMISSION VALUES(1100,1200);
INSERT INTO PRINCIPAL_PERMISSION VALUES(1111,1201);
INSERT INTO PRINCIPAL_PERMISSION VALUES(1111,1204);
INSERT INTO PRINCIPAL_PERMISSION VALUES(1112,1202);
INSERT INTO PRINCIPAL_PERMISSION VALUES(1112,1203);
INSERT INTO PRINCIPAL_PERMISSION VALUES(1112,1204);
INSERT INTO PRINCIPAL_PERMISSION VALUES(1112,1205);
INSERT INTO PRINCIPAL_PERMISSION VALUES(1112,1206);
INSERT INTO PRINCIPAL_PERMISSION VALUES(1,1199);

DROP TABLE IF EXISTS ingrid_cms;
CREATE TABLE ingrid_cms
(
    id MEDIUMINT NOT NULL,
    item_key VARCHAR(255) NOT NULL,
    item_description VARCHAR(255),
    item_changed TIMESTAMP,
    item_changed_by VARCHAR(255),
    PRIMARY KEY(id)
);
ALTER TABLE `ingrid_cms` CHANGE `id` `id` MEDIUMINT( 9 ) NOT NULL AUTO_INCREMENT;

DROP TABLE IF EXISTS ingrid_cms_item;
CREATE TABLE ingrid_cms_item
(
    id MEDIUMINT NOT NULL,
    fk_ingrid_cms_id MEDIUMINT NOT NULL,
    item_lang VARCHAR(6) NOT NULL,
    item_title VARCHAR(255),
    item_value TEXT,
    item_changed TIMESTAMP,
    item_changed_by VARCHAR(255),
    PRIMARY KEY(id)
);
ALTER TABLE `ingrid_cms_item` CHANGE `id` `id` MEDIUMINT( 9 ) NOT NULL AUTO_INCREMENT;

INSERT INTO `ingrid_cms` (`id`, `item_key`, `item_description`, `item_changed`, `item_changed_by`) VALUES (1, 'portalu.teaser.inform', 'PortalU informiert Text', '2006-09-15 00:00:00', 'admin');
INSERT INTO `ingrid_cms` (`id`, `item_key`, `item_description`, `item_changed`, `item_changed_by`) VALUES (15, 'portalu.disclaimer', 'Impressum', '2006-09-15 00:00:00', 'admin');
INSERT INTO `ingrid_cms` (`id`, `item_key`, `item_description`, `item_changed`, `item_changed_by`) VALUES (16, 'portalu.about', '�ber PortalU', '2006-09-15 00:00:00', 'admin');
INSERT INTO `ingrid_cms` (`id`, `item_key`, `item_description`, `item_changed`, `item_changed_by`) VALUES (17, 'portalu.privacy', 'Haftungsausschluss', '2006-09-15 00:00:00', 'admin');
INSERT INTO `ingrid_cms` (`id`, `item_key`, `item_description`, `item_changed`, `item_changed_by`) VALUES (18, 'portalu.contact.intro.postEmail', 'Adresse auf der Kontaktseite', '2006-09-15 00:00:00', 'admin');
INSERT INTO `ingrid_cms` (`id`, `item_key`, `item_description`, `item_changed`, `item_changed_by`) VALUES (19, 'ingrid.home.welcome', 'Ingrid Willkommens Portlet', '2006-09-15 00:00:00', 'admin');


INSERT INTO `ingrid_cms_item` (`id`, `fk_ingrid_cms_id`, `item_lang`, `item_title`, `item_value`, `item_changed`, `item_changed_by`) VALUES (1, 1, 'de', '<span style="text-transform: none;">PortalU INFORMIERT</span>', '<p>Besuchen Sie PortalU� vom 6. bis 8. September auf dem 20. Internationalen Symposium Umweltinformatik - EnviroInfo 2006 - in Graz</p> <p class="iconLink"> <span class="icon"><img src="/ingrid-portal-apps/images/icn_linkextern.gif" alt="externer Link"></span> <span><a href="http://enviroinfo.know-center.tugraz.at/" target="_new" title="Link �ffnet in neuem Fenster">enviroinfo.know-center.tugraz.at/</a></span> <span class="clearer"></span></p>', '2006-09-15 00:00:00', 'admin');
INSERT INTO `ingrid_cms_item` (`id`, `fk_ingrid_cms_id`, `item_lang`, `item_title`, `item_value`, `item_changed`, `item_changed_by`) VALUES (2, 1, 'en', '<span style="text-transform: none;">PortalU INFORMS</span>', '<p>Visit PortalU� on September 6 to 8 at the 20th International Symposium on Informatics for Environmental Protection - EnviroInfo 2006 - in Graz (Austria)</p> <p class="iconLink"> <span class="icon"><img src="/ingrid-portal-apps/images/icn_linkextern.gif" alt="External Link"></span> <span><a href="http://enviroinfo.know-center.tugraz.at/" target="_new" title="Link opens new window">enviroinfo.know-center.tugraz.at/</a></span> <span class="clearer"></span></p>', '2006-09-15 00:00:00', 'admin');
INSERT INTO `ingrid_cms_item` (`id`, `fk_ingrid_cms_id`, `item_lang`, `item_title`, `item_value`, `item_changed`, `item_changed_by`) VALUES (27, 15, 'en', 'Disclaimer', '<a name="herausgeber"></a>\r\n<h2>Publisher</h2>\r\n<p>PortalU is managed by the Coordination Center PortalU at the Environment Ministry of Lower Saxony, Hannover, Germany. Development and maintenance of the portal is financed by a administrative agreement between the German Federal States (L�nder) and the Federal Government. </p>\r\n<h3>Coordination Center PortalU</h3>\r\n<p>Nieders�chsisches Umweltministerium<br>Archivstrasse 2<br>D-30169 Hannover<br>\r\n	<a href="/ingrid-portal/portal/service-contact.psml">Contact</a>\r\n</p>\r\n<br>\r\n<a name="verantwortlich"></a>\r\n<h2>Overall Responsibility</h2>\r\n<p>Dr. Fred Kruse</p>\r\n<br>\r\n<a name="realisierung"></a>\r\n<h2>Implementation</h2>\r\n<h3><a href="http://www.gistec-online.de/" target="_new" title="Link opens new window">GIStec GmbH</a></h3>\r\n<h3><a href="http://www.media-style.com/" target="_new" title="Link opens new window">media style GmbH</a></h3>\r\n<h3><a href="http://www.wemove.com/contact.php" target="_new" title="Link opens new window">wemove digital solutions GmbH</a></h3>\r\n<h3><a href="http://www.chives.de/" target="_new" title="Link opens new window">chives - B�ro f�r Webdesign Plus</a></h3>\r\n<br>\r\n<a name="betrieb"></a>\r\n<h2>Operation</h2>     \r\n<h3><a href="http://www.its-technidata.de/" target="_new" title="Link opens new window">TechniData IT Service GmbH</a></h3>\r\n<br>\r\n<a name="haftung"></a>\r\n<h2>Liability Disclaimer</h2>     \r\n<p>The Environment Ministry of Lower Saxony (Nieders�chsisches Umweltministerium) does not take any responisbility for the content of web-sites that can be reached through PortalU. Web-sites that are included in the portal are evaluated only technically. A continuous evaluation of the content of the included web-pages in neither possible nor intended. The Environment Ministry of Lower Saxony explicitly rejects all content that potentially infringes upon German legislation or general morality.</p>', '2006-09-15 00:00:00', 'admin');
INSERT INTO `ingrid_cms_item` (`id`, `fk_ingrid_cms_id`, `item_lang`, `item_title`, `item_value`, `item_changed`, `item_changed_by`) VALUES (28, 15, 'de', 'Impressum', '<a name="herausgeber"></a>\r\n<h2>Herausgeber</h2>\r\n<p>PortalU wird von der Koordinierungsstelle PortalU im Nieders�chsischen Umweltministerium auf der Grundlage der <a href="http://www.kst.portalu.de/ueberuns/VVGEIN_endg.pdf" target="_new" title="Link �ffnet in neuem Fenster">Bund-L�nder-Verwaltungsvereinbarung UDK/GEIN</a> betrieben und weiterentwickelt.</p>\r\n<h3>Koordinierungsstelle PortalU</h3>\r\n<p>\r\nNieders�chsisches Umweltministerium<br>Archivstrasse 2<br>D-30169 Hannover<br>\r\n<a href="/ingrid-portal/portal/service-contact.psml">Kontakt</a>\r\n</p>\r\n<br>\r\n<a name="verantwortlich"></a>\r\n<h2>Verantwortliche Gesamtredaktion</h2>\r\n<p>Dr. Fred Kruse</p>\r\n<br>\r\n<a name="realisierung"></a>\r\n<h2>Realisierung</h2>\r\n<h3><a href="http://www.gistec-online.de/" target="_new" title="Link �ffnet in neuem Fenster">GIStec GmbH</a></h3>\r\n<h3><a href="http://www.media-style.com/" target="_new" title="Link �ffnet in neuem Fenster">media style GmbH</a></h3>\r\n<h3><a href="http://www.wemove.com/contact.php" target="_new" title="Link �ffnet in neuem Fenster">wemove digital solutions GmbH</a></h3>\r\n<h3><a href="http://www.chives.de/" target="_new" title="Link �ffnet in neuem Fenster">chives - B�ro f�r Webdesign Plus Darmstadt</a></h3>\r\n<br>\r\n<a name="betrieb"></a>\r\n<h2>Technischer Betrieb</h2>     \r\n<h3><a href="http://www.its-technidata.de/" target="_new" title="Link �ffnet in neuem Fenster">TechniData IT Service GmbH</a></h3>\r\n<br>\r\n<a name="haftung"></a>\r\n<h2>Haftungsausschluss</h2>     \r\n<p>Das Nieders�chsische Umweltministerium �bernimmt keine Verantwortung f�r die Inhalte von Websites, die �ber Links erreicht werden. Die Links werden bei der Aufnahme nur kursorisch angesehen und bewertet. Eine kontinuierliche Pr�fung der Inhalte ist weder beabsichtigt noch m�glich. Das Nieders�chsische Umweltministerium distanziert sich ausdr�cklich von allen Inhalten, die m�glicherweise straf- oder haftungsrechtlich relevant sind oder gegen die guten Sitten versto�en.</p>', '2006-09-15 00:00:00', 'admin');
INSERT INTO `ingrid_cms_item` (`id`, `fk_ingrid_cms_id`, `item_lang`, `item_title`, `item_value`, `item_changed`, `item_changed_by`) VALUES (29, 16, 'de', '�ber PortalU', '<p>Willkommen bei PortalU, dem Umweltportal Deutschland! Wir bieten Ihnen einen zentralen Zugriff auf mehrere hunderttausend Internetseiten und Datenbankeintr�ge von �ffentlichen Institutionen und Organisationen. Zus�tzlich k�nnen Sie aktuelle Nachrichten und Veranstaltungshinweise, Umweltmesswerte, Hintergrundinformationen und historische Umweltereignisse �ber PortalU abrufen.</p><p>Die integrierte Suchmaschine ist eine zentrale Komponente von PortalU. Mit ihrer Hilfe k�nnen Sie Webseiten und Datenbankeintr�ge nach Stichworten durchsuchen. �ber die Option "Erweiterte Suche" k�nnen Sie zus�tzlich ein differenziertes Fachvokabular und deutschlandweite Hintergrundkarten zur Zusammenstellung Ihrer Suchanfrage nutzen.</p><p>PortalU ist eine Kooperation der Umweltverwaltungen im Bund und in den L�ndern. Inhaltlich und technisch wird PortalU von der <a href="http://www.kst.portalu.de/" target="_new" title="Link �ffnet in neuem Fenster">Koordinierungsstelle PortalU</a> im Nieders�chsischen Umweltministerium verwaltet. Wir sind darum bem�ht, das System kontinuierlich zu erweitern und zu optimieren. Bei Fragen und Verbesserungsvorschl�gen wenden Sie sich bitte an die <a href="mailto:kst@portalu.de">Koordinierungsstelle PortalU</a>.</p>', '2006-09-15 00:00:00', 'admin');
INSERT INTO `ingrid_cms_item` (`id`, `fk_ingrid_cms_id`, `item_lang`, `item_title`, `item_value`, `item_changed`, `item_changed_by`) VALUES (30, 16, 'en', 'About PortalU', '<p>Welcome to PortalU, the German Environmental Information Portal! We offer a comfortable and central access to over 1.000.000 web-pages and database entries from public agencies in Germany. We also guide you directly to up-to-date environmental news, upcoming and past environmental events, environmental monitoring data, and interesting background information on many environmental topics.</p><p>Core-component of PortalU is a powerful search-engine that you can use to look up your terms of interest in web-pages and databases. In the "Extended Search" mode, you can use an environmental thesaurus and a digital mapping tool to compose complex spatio-thematic queries.</p><p>PortalU is the result of a cooperation between the German "L�nder" and the German Federal Government. The project is managed by the <a href="http://www.kst.portalu.de/" target="_new" title="Link opens new window">Coordination Center PortalU</a>, a group of environmental and IT experts attached to the Environment Ministry of Lower Saxony in Hannover, Germany. We strive to continuously improve and extend the portal. Please help us in this effort and mail your suggestions or questions to <a href="mailto:kst@portalu.de">Coordination Center PortalU</a>.</p>', '2006-09-15 00:00:00', 'admin');
INSERT INTO `ingrid_cms_item` (`id`, `fk_ingrid_cms_id`, `item_lang`, `item_title`, `item_value`, `item_changed`, `item_changed_by`) VALUES (31, 17, 'de', 'Datenschutz', '<p>PortalU enth�lt sowohl Inhalte, die als Teledienst nach � 2 Teledienstgesetz (TDG) als auch Inhalte, die als Mediendienst nach � 2 Mediendienste-Staatsvertrag (MDStV) zu bewerten sind. Hierbei werden folgende Verfahrensgrunds�tze gew�hrleistet:<br></p>\r\n<ul>\r\n<li>Bei jedem Zugriff eines Nutzers auf eine Seite aus dem Angebot von PortalU und bei jedem Abruf einer Datei werden Daten �ber diesen Vorgang in einer Protokolldatei gespeichert. Diese Daten sind nicht personenbezogen. Wir k�nnen also nicht nachvollziehen, welcher Nutzer welche Daten abgerufen hat. Die Protokolldaten werden lediglich in anonymisierter Form statistisch ausgewertet und dienen damit der inhaltlichen Verbesserung unseres Angebotes.<br><br>\r\n</li>\r\n<li>Eine Ausnahme besteht innerhalb des Internetangebotes mit der Eingabe pers�nlicher oder gesch�ftlicher Daten (eMail-Adresse, Name, Anschrift) zur Anmeldung bei "Mein PortalU" oder der Bestellung des PortalU-Newsletters. Dabei erfolgt die Angabe dieser Daten durch Nutzerinnen und Nutzer ausdr�cklich freiwillig. Ihre pers�nlichen Daten werden von uns selbstverst�ndlich nicht an Dritte weitergegeben. Die Inanspruchnahme aller angebotenen Dienste ist, soweit dies technisch m�glich und zumutbar ist, auch ohne Angabe solcher Daten beziehungsweise unter Angabe anonymisierter Daten oder eines Pseudonyms m�glich.<br><br>\r\n</li>\r\n<li>Sie k�nnen alle allgemein zug�nglichen PortalU-Seiten ohne den Einsatz von Cookies benutzen. Wenn Ihre Browser-Einstellungen das Setzen von Cookies zulassen, werden von PortalU sowohl Session-Cookies als auch permanente Cookies gesetzt. Diese dienen ausschlie�lich der Erh�hung des Bedienungskomforts.\r\n</li>\r\n</ul>', '2006-09-15 00:00:00', 'admin');
INSERT INTO `ingrid_cms_item` (`id`, `fk_ingrid_cms_id`, `item_lang`, `item_title`, `item_value`, `item_changed`, `item_changed_by`) VALUES (32, 17, 'en', 'Privacy Policy', '<p>PortalU contains content that is categorized as "Teledienst" (after � 2 Teledienstgesetz (TDG)), as well as content that is categorized as "Mediendienst" (after � 2 Mediendienste-Staatsvertrag (MDStV)). The following policies do apply:<br></p>\r\n<ul>\r\n<li>With each user-access to a content-page in PortalU, the relevant access-data are saved in a log file. This information is not personalized. Therefore it is not possible to reason which user has had access to which content page. The purpose of the log file is purely statistical. The evaluation of the log file helps to improve PortalU.<br><br>\r\n</li>\r\n<li>An exeption to our general privacy policy is made when personal data (e-mail, name, address) are provided to register for the PortalU newsletter. This information is provided by the user on a voluntary basis an is saved for internal purposes (mailing of newsletter). The information is not given to third-parties. The use of specific Portal functions does not, as far as technically feasible, depend on the provision of personal data.<br><br>\r\n</li>\r\n<li>You can take benefit of virtually all functions of PortalU without the use of cookies. However, if you choose to allow cookies in your browser, this will increase the useability of the application. \r\n</li>\r\n</ul>', '2006-09-15 00:00:00', 'admin');
INSERT INTO `ingrid_cms_item` (`id`, `fk_ingrid_cms_id`, `item_lang`, `item_title`, `item_value`, `item_changed`, `item_changed_by`) VALUES (33, 18, 'de', '', '.</p><p>Unsere Postadresse:</p>\r\n<p>Nieders�chsisches Umweltministerium<br />Koordinierungsstelle PortalU<br />Archivstrasse 2<br />D-30169 Hannover<br /></p> <p>Nehmen Sie online Kontakt mit uns auf! Wir werden Ihnen schnellstm�glichst per E-Mail antworten. Die eingegebenen Informationen und Daten werden nur zur Bearbeitung Ihrer Anfrage gespeichert und genutzt.</p>', '2006-09-15 00:00:00', 'admin');
INSERT INTO `ingrid_cms_item` (`id`, `fk_ingrid_cms_id`, `item_lang`, `item_title`, `item_value`, `item_changed`, `item_changed_by`) VALUES (34, 18, 'en', '', '.</p><p>Our address:</p><p>Nieders�chsisches Umweltministerium<br />Koordinierungsstelle PortalU<br />Archivstrasse 2<br />D-30169 Hannover<br /></p> <p>Please contact us! We will answer your request as soon as possible. All data you entered will be saved only to process your request.</p>', '2006-09-15 00:00:00', 'admin');
INSERT INTO `ingrid_cms_item` (`id`, `fk_ingrid_cms_id`, `item_lang`, `item_title`, `item_value`, `item_changed`, `item_changed_by`) VALUES (35, 19, 'de', 'Willkommen bei PortalU', '<p>Willkommen bei PortalU, dem Umweltportal Deutschland! Wir bieten Ihnen einen zentralen Zugriff auf mehrere hunderttausend Internetseiten und Datenbankeintr�ge von �ffentlichen Institutionen und Organisationen. Zus�tzlich k�nnen Sie aktuelle Nachrichten und Veranstaltungshinweise, Umweltmesswerte, Hintergrundinformationen und historische Umweltereignisse �ber PortalU abrufen.</p><p>Die integrierte Suchmaschine ist eine zentrale Komponente von PortalU. Mit ihrer Hilfe k�nnen Sie Webseiten und Datenbankeintr�ge nach Stichworten durchsuchen. �ber die Option "Erweiterte Suche" k�nnen Sie zus�tzlich ein differenziertes Fachvokabular und deutschlandweite Hintergrundkarten zur Zusammenstellung Ihrer Suchanfrage nutzen.</p><p>PortalU ist eine Kooperation der Umweltverwaltungen im Bund und in den L�ndern. Inhaltlich und technisch wird PortalU von der <a href="http://www.kst.portalu.de/" target="_new" title="Link �ffnet in neuem Fenster">Koordinierungsstelle PortalU</a> im Nieders�chsischen Umweltministerium verwaltet. Wir sind darum bem�ht, das System kontinuierlich zu erweitern und zu optimieren. Bei Fragen und Verbesserungsvorschl�gen wenden Sie sich bitte an die <a href="mailto:kst@portalu.de">Koordinierungsstelle PortalU</a>.</p>', '2006-09-15 00:00:00', 'admin');
INSERT INTO `ingrid_cms_item` (`id`, `fk_ingrid_cms_id`, `item_lang`, `item_title`, `item_value`, `item_changed`, `item_changed_by`) VALUES (36, 19, 'en', 'Welcome to PortalU', '<p>Welcome to PortalU, the German Environmental Information Portal! We offer a comfortable and central access to over 1.000.000 web-pages and database entries from public agencies in Germany. We also guide you directly to up-to-date environmental news, upcoming and past environmental events, environmental monitoring data, and interesting background information on many environmental topics.</p><p>Core-component of PortalU is a powerful search-engine that you can use to look up your terms of interest in web-pages and databases. In the "Extended Search" mode, you can use an environmental thesaurus and a digital mapping tool to compose complex spatio-thematic queries.</p><p>PortalU is the result of a cooperation between the German "L�nder" and the German Federal Government. The project is managed by the <a href="http://www.kst.portalu.de/" target="_new" title="Link opens new window">Coordination Center PortalU</a>, a group of environmental and IT experts attached to the Environment Ministry of Lower Saxony in Hannover, Germany. We strive to continuously improve and extend the portal. Please help us in this effort and mail your suggestions or questions to <a href="mailto:kst@portalu.de">Coordination Center PortalU</a>.</p>', '2006-09-15 00:00:00', 'admin');

UPDATE `ingrid_provider` SET `name` = 'Gewerbeaufsicht Baden-W�rttemberg' WHERE `id` =46;
UPDATE `ingrid_rss_source` SET `url` = 'http://www.bfn.de/0502_skripten.100.html' WHERE `id` =4;
UPDATE `ingrid_provider` SET `name` = 'Landesforsten Rheinland-Pfalz' WHERE `id` =115;
UPDATE `ingrid_provider` SET `name` = 'Ministerium f�r Umwelt, Forsten und Verbraucherschutz Rheinland-Pfalz' WHERE `id` =112;
INSERT INTO `ingrid_provider` (`id`, `ident`, `name`, `url`, `sortkey`, `sortkey_partner`) VALUES (137, 'rp_luwg', 'Landesamt f�r Umwelt, Wasserwirtschaft und Gewerbeaufsicht Rheinland-Pfalz', 'http://www.luwg.rlp.de/', 6, 12);
INSERT INTO `ingrid_provider` (`id`, `ident`, `name`, `url`, `sortkey`, `sortkey_partner`) VALUES (138, 'rp_lua', 'Landesuntersuchungsamt Rheinland-Pfalz', 'http://www.lua.rlp.de/', 7, 12);
INSERT INTO `ingrid_provider` ( `id` , `ident` , `name` , `url` , `sortkey` , `sortkey_partner` ) VALUES (139, 'bw_saa', 'SAA Sonderabfallagentur', 'http://www.saa.de/', '12', '2');
INSERT INTO `ingrid_provider` ( `id` , `ident` , `name` , `url` , `sortkey` , `sortkey_partner` ) VALUES (140, 'bw_rp', 'Regierungspr�sidien Baden-W�rttemberg', 'http://www.rp.baden-wuerttemberg.de/', '13', '2');
INSERT INTO `ingrid_provider` ( `id` , `ident` , `name` , `url` , `sortkey` , `sortkey_partner` ) VALUES (141, 'bw_rps', 'Regierungspr�sidium Stuttgart', 'http://www.landentwicklung-mlr.baden-wuerttemberg.de/', '14', '2');

DELETE FROM `ingrid_provider` WHERE `id` =113;
DELETE FROM `ingrid_provider` WHERE `id` =114;
INSERT INTO `ingrid_provider` VALUES (137, 'rp_luwg', 'Landesamt f�r Umwelt, Wasserwirtschaft und Gewerbeaufsicht Rheinland-Pfalz', 'http://www.luwg.rlp.de/', 4, 12);
INSERT INTO `ingrid_provider` VALUES (138, 'rp_lua', 'Landesuntersuchungsamt Rheinland-Pfalz', 'http://www.lua.rlp.de/', 5, 12);

UPDATE `ingrid_provider` SET `sortkey` = 1 WHERE `id` =112;
UPDATE `ingrid_provider` SET `sortkey` = 2 WHERE `id` =115;
UPDATE `ingrid_provider` SET `sortkey` = 3 WHERE `id` =116;
UPDATE `ingrid_provider` SET `sortkey` = 4 WHERE `id` =137;
UPDATE `ingrid_provider` SET `sortkey` = 5 WHERE `id` =138;
