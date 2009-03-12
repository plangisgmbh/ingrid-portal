<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml" lang="de">
<head>
<script type="text/javascript">
var scriptScope = this;

// Storage for the current catalog. We need to get the uuid from somewhere
var currentCatalogData = null;

_container_.addOnLoad(function() {
	// Fill input fields with data from the current catalog
//	dojo.debugShallow(catalogData);
//	dojo.debugShallow(catalogData.location);

	if (catalogData != null) {
		updateInputFields(catalogData);
		currentCatalogData = catalogData;
	} else {
		scriptScope.reloadCatalogData();
	}

	var checkbox = dojo.widget.byId("adminCatalogExpire");
	var inputField = dojo.widget.byId("adminCatalogExpiryDuration");

	dojo.event.connectOnce(checkbox, "onClick", function() {
		checkbox.checked ? inputField.enable() : inputField.disable();
	});
});

function updateInputFields(catalogData) {
	dojo.widget.byId("adminCatalogName").setValue(catalogData.catalogName);
	dojo.widget.byId("adminCatalogPartnerName").setValue(catalogData.partnerName);
	dojo.widget.byId("adminCatalogProviderName").setValue(catalogData.providerName);
	dojo.widget.byId("adminCatalogCountry").setValue(catalogData.country);
	dojo.widget.byId("adminCatalogLanguage").setValue(catalogData.language);
	dojo.widget.byId("adminCatalogSpatialRef").setValue(catalogData.location.name);
	dojo.widget.byId("adminCatalogSpatialRef").location = catalogData.location;
	if (catalogData.workflowControl == "Y") {
		dojo.widget.byId("adminCatalogWorkflowControl").setValue(true);
	} else {
		dojo.widget.byId("adminCatalogWorkflowControl").setValue(false);
	}
	if (catalogData.expiryDuration != null && catalogData.expiryDuration > 0) {
		dojo.widget.byId("adminCatalogExpire").setValue(true);
		dojo.widget.byId("adminCatalogExpiryDuration").enable();
		dojo.widget.byId("adminCatalogExpiryDuration").setValue(catalogData.expiryDuration);
	} else {
		dojo.widget.byId("adminCatalogExpire").setValue(false);
		dojo.widget.byId("adminCatalogExpiryDuration").setValue("0");
		dojo.widget.byId("adminCatalogExpiryDuration").disable();
	}
}

scriptScope.reloadCatalogData = function() {
	CatalogService.getCatalogData({
		callback: function(res) {
			// Update catalog Data
			updateInputFields(res);
			currentCatalogData = res;
		},
		errorHandler:function(mes){
			dialog.show(message.get("general.error"), message.get("dialog.loadCatalogError"), dialog.WARNING);
			dojo.debug(mes);
		}
	});
}

scriptScope.saveCatalogData = function() {
	var newCatalogData = {};
	newCatalogData.uuid = currentCatalogData.uuid;
	newCatalogData.catalogName = dojo.widget.byId("adminCatalogName").getValue();
	newCatalogData.partnerName = dojo.widget.byId("adminCatalogPartnerName").getValue();
	newCatalogData.providerName = dojo.widget.byId("adminCatalogProviderName").getValue();
	newCatalogData.country = dojo.widget.byId("adminCatalogCountry").getValue();
	newCatalogData.language = dojo.widget.byId("adminCatalogLanguage").getValue();
	newCatalogData.location = dojo.widget.byId("adminCatalogSpatialRef").location;
	newCatalogData.expiryDuration = (dojo.widget.byId("adminCatalogExpire").checked ? dojo.widget.byId("adminCatalogExpiryDuration").getValue() : "0");
	newCatalogData.workflowControl = dojo.widget.byId("adminCatalogWorkflowControl").checked ? "Y" : "N";

	if (!isValidCatalog(newCatalogData)) {
		dialog.show(message.get("general.error"), message.get("dialog.admin.catalog.requiredFieldsHint"), dialog.WARNING);
		return;
	}
	dojo.debugShallow(newCatalogData);

	CatalogService.storeCatalogData(newCatalogData, {
		callback: function(res) {
			// Update catalog Data
			updateInputFields(res);
			catalogData = res;
			currentCatalogData = res;
			initPageHeader();
			dialog.show(message.get("general.hint"), message.get("dialog.admin.catalog.saveSuccess"), dialog.INFO);

		},
		errorHandler:function(errMsg, err){
			if (errMsg.indexOf("USER_HAS_NO_PERMISSION_ON_ENTITY") != -1) {
				dialog.show(message.get("general.error"), message.get("dialog.admin.catalog.permissionError"), dialog.WARNING);				

			} else {
				dialog.show(message.get("general.error"), message.get("dialog.storeCatalogError"), dialog.WARNING);
			}

			dojo.debug(errMsg);
		}
	});	
}

scriptScope.selectSpatialReference = function() {
	var def = new dojo.Deferred();
	dialog.showPage(message.get("dialog.admin.catalog.selectLocation.title"), "mdek_admin_catalog_spatial_reference_dialog.jsp", 530, 230, true, { resultHandler: def });

	def.addCallback(function(result) {
		var spatialRefWidget = dojo.widget.byId("adminCatalogSpatialRef");
		spatialRefWidget.setValue(result.name);
		spatialRefWidget.location = result;
	});
}

function isValidCatalog(cat) {
	return (dojo.string.trim(cat.country).length != 0
		 && dojo.string.trim(cat.language).length != 0
		 && dojo.string.trim(cat.location.name).length != 0
		 && dojo.validate.isInteger(cat.expiryDuration)
		 && dojo.validate.isInRange(cat.expiryDuration, { min:0, max:2147483647 }));
}

</script>
</head>

<body>
<!-- CONTENT START -->
	<div dojoType="ContentPane" layoutAlign="client">
	
		<div id="contentSection" class="contentBlockWhite top">
			<div id="winNavi">
			<a href="javascript:void(0);" onclick="javascript:dialog.showContextHelp(arguments[0], 8000)" title="Hilfe">[?]</a>
			</div>
			<div id="adminCatalog" class="content">

				<!-- LEFT HAND SIDE CONTENT START -->
				<div class="spacer"></div>
				<div class="spacer"></div>
				<div class="inputContainer field grey noSpaceBelow">
					<span class="label"><label for="adminCatalogName" onclick="javascript:dialog.showContextHelp(arguments[0], 8001, 'Name des Kataloges')"><fmt:message key="dialog.admin.catalog.catalogName" /></label></span>
					<span class="input spaceBelow"><input type="text" id="adminCatalogName" class="w640" dojoType="ingrid:ValidationTextBox" /></span>

					<span class="label"><label for="adminCatalogPartnerName" onclick="javascript:dialog.showContextHelp(arguments[0], 8002, 'Name des Partners')"><fmt:message key="dialog.admin.catalog.partnerName" /></label></span>
					<span class="input spaceBelow"><input type="text" id="adminCatalogPartnerName" class="w640" dojoType="ingrid:ValidationTextBox" /></span>
		
					<span class="label"><label for="adminCatalogProviderName" onclick="javascript:dialog.showContextHelp(arguments[0], 8003, 'Name des Anbieters')"><fmt:message key="dialog.admin.catalog.providerName" /></label></span>
					<span class="input spaceBelow"><input type="text" id="adminCatalogProviderName" class="w640" dojoType="ingrid:ValidationTextBox" /></span>
		
					<span class="label required"><label for="adminCatalogCountry" onclick="javascript:dialog.showContextHelp(arguments[0], 8004, 'Staat')"><fmt:message key="dialog.admin.catalog.state" />*</label></span>
					<select class="spaceBelow" dojoType="ingrid:Select" required="true" style="width:622px;" id="adminCatalogCountry" >
						<option value='af'>Afghanistan</option>
						<option value='eg'>&Auml;gypten</option>
						<option value='al'>Albanien</option>
						<option value='dz'>Algerien</option>
						<option value='ad'>Andorra</option>
						<option value='ao'>Angola</option>
						<option value='ai'>Anguilla</option>
						<option value='aq'>Antarktis</option>
						<option value='ag'>Antigua und Barbuda</option>
						<option value='gq'>&Auml;quatorial Guinea</option>
						<option value='ar'>Argentinien</option>
						<option value='am'>Armenien</option>
						<option value='aw'>Aruba</option>
						<option value='az'>Aserbaidschan</option>
						<option value='et'>&Auml;thiopien</option>
						<option value='au'>Australien</option>
						<option value='bs'>Bahamas</option>
						<option value='bh'>Bahrain</option>
						<option value='bd'>Bangladesh</option>
						<option value='bb'>Barbados</option>
						<option value='be'>Belgien</option>
						<option value='bz'>Belize</option>
						<option value='bj'>Benin</option>
						<option value='bm'>Bermudas</option>
						<option value='bt'>Bhutan</option>
						<option value='mm'>Birma</option>
						<option value='bo'>Bolivien</option>
						<option value='ba'>Bosnien-Herzegowina</option>
						<option value='bw'>Botswana</option>
						<option value='bv'>Bouvet Inseln</option>
						<option value='br'>Brasilien</option>
						<option value='io'>Britisch-Indischer Ozean</option>
						<option value='bn'>Brunei</option>
						<option value='bg'>Bulgarien</option>
						<option value='bf'>Burkina Faso</option>
						<option value='bi'>Burundi</option>
						<option value='cl'>Chile</option>
						<option value='cn'>China</option>
						<option value='cx'>Christmas Island</option>
						<option value='ck'>Cook Inseln</option>
						<option value='cr'>Costa Rica</option>
						<option value='dk'>D&auml;nemark</option>
						<option value='de'>Deutschland</option>
						<option value='dj'>Djibuti</option>
						<option value='dm'>Dominika</option>
						<option value='do'>Dominikanische Republik</option>
						<option value='ec'>Ecuador</option>
						<option value='sv'>El Salvador</option>
						<option value='ci'>Elfenbeink&uuml;ste</option>
						<option value='er'>Eritrea</option>
						<option value='ee'>Estland</option>
						<option value='fk'>Falkland Inseln</option>
						<option value='fo'>F&auml;r&ouml;er Inseln</option>
						<option value='fj'>Fidschi</option>
						<option value='fi'>Finnland</option>
						<option value='fr'>Frankreich</option>
						<option value='gf'>franz&ouml;sisch Guyana</option>
						<option value='pf'>Franz&ouml;sisch Polynesien</option>
						<option value='tf'>Franz&ouml;sisches S&uuml;d-Territorium</option>
						<option value='ga'>Gabun</option>
						<option value='gm'>Gambia</option>
						<option value='ge'>Georgien</option>
						<option value='gh'>Ghana</option>
						<option value='gi'>Gibraltar</option>
						<option value='gd'>Grenada</option>
						<option value='gr'>Griechenland</option>
						<option value='gl'>Gr&ouml;nland</option>
						<option value='uk'>Gro&szlig;britannien</option>
						<option value='gb'>Gro&szlig;britannien (UK)</option>
						<option value='gp'>Guadeloupe</option>
						<option value='gu'>Guam</option>
						<option value='gt'>Guatemala</option>
						<option value='gn'>Guinea</option>
						<option value='gw'>Guinea Bissau</option>
						<option value='gy'>Guyana</option>
						<option value='ht'>Haiti</option>
						<option value='hm'>Heard und McDonald Islands</option>
						<option value='hn'>Honduras</option>
						<option value='hk'>Hong Kong</option>
						<option value='in'>Indien</option>
						<option value='id'>Indonesien</option>
						<option value='iq'>Irak</option>
						<option value='ir'>Iran</option>
						<option value='ie'>Irland</option>
						<option value='is'>Island</option>
						<option value='il'>Israel</option>
						<option value='it'>Italien</option>
						<option value='jm'>Jamaika</option>
						<option value='jp'>Japan</option>
						<option value='ye'>Jemen</option>
						<option value='jo'>Jordanien</option>
						<option value='yu'>Jugoslawien</option>
						<option value='ky'>Kaiman Inseln</option>
						<option value='kh'>Kambodscha</option>
						<option value='cm'>Kamerun</option>
						<option value='ca'>Kanada</option>
						<option value='cv'>Kap Verde</option>
						<option value='kz'>Kasachstan</option>
						<option value='ke'>Kenia</option>
						<option value='kg'>Kirgisistan</option>
						<option value='ki'>Kiribati</option>
						<option value='cc'>Kokosinseln</option>
						<option value='co'>Kolumbien</option>
						<option value='km'>Komoren</option>
						<option value='cg'>Kongo</option>
						<option value='cd'>Kongo, Demokratische Republik</option>
						<option value='hr'>Kroatien</option>
						<option value='cu'>Kuba</option>
						<option value='kw'>Kuwait</option>
						<option value='la'>Laos</option>
						<option value='ls'>Lesotho</option>
						<option value='lv'>Lettland</option>
						<option value='lb'>Libanon</option>
						<option value='lr'>Liberia</option>
						<option value='ly'>Libyen</option>
						<option value='li'>Liechtenstein</option>
						<option value='lt'>Litauen</option>
						<option value='lu'>Luxemburg</option>
						<option value='mo'>Macao</option>
						<option value='mg'>Madagaskar</option>
						<option value='mw'>Malawi</option>
						<option value='my'>Malaysia</option>
						<option value='mv'>Malediven</option>
						<option value='ml'>Mali</option>
						<option value='mt'>Malta</option>
						<option value='mp'>Marianen</option>
						<option value='ma'>Marokko</option>
						<option value='mh'>Marshall Inseln</option>
						<option value='mq'>Martinique</option>
						<option value='mr'>Mauretanien</option>
						<option value='mu'>Mauritius</option>
						<option value='yt'>Mayotte</option>
						<option value='mk'>Mazedonien</option>
						<option value='mx'>Mexiko</option>
						<option value='fm'>Mikronesien</option>
						<option value='mz'>Mocambique</option>
						<option value='md'>Moldavien</option>
						<option value='mc'>Monaco</option>
						<option value='mn'>Mongolei</option>
						<option value='ms'>Montserrat</option>
						<option value='na'>Namibia</option>
						<option value='nr'>Nauru</option>
						<option value='np'>Nepal</option>
						<option value='nc'>Neukaledonien</option>
						<option value='nz'>Neuseeland</option>
						<option value='ni'>Nicaragua</option>
						<option value='nl'>Niederlande</option>
						<option value='an'>Niederl&auml;ndische Antillen</option>
						<option value='ne'>Niger</option>
						<option value='ng'>Nigeria</option>
						<option value='nu'>Niue</option>
						<option value='kp'>Nord Korea</option>
						<option value='nf'>Norfolk Inseln</option>
						<option value='no'>Norwegen</option>
						<option value='om'>Oman</option>
						<option value='at'>&Ouml;sterreich</option>
						<option value='pk'>Pakistan</option>
						<option value='ps'>Pal&auml;stina</option>
						<option value='pw'>Palau</option>
						<option value='pa'>Panama</option>
						<option value='pg'>Papua Neuguinea</option>
						<option value='py'>Paraguay</option>
						<option value='pe'>Peru</option>
						<option value='ph'>Philippinen</option>
						<option value='pn'>Pitcairn</option>
						<option value='pl'>Polen</option>
						<option value='pt'>Portugal</option>
						<option value='pr'>Puerto Rico</option>
						<option value='qa'>Qatar</option>
						<option value='re'>Reunion</option>
						<option value='rw'>Ruanda</option>
						<option value='ro'>Rum&auml;nien</option>
						<option value='ru'>Ru&szlig;land</option>
						<option value='lc'>Saint Lucia</option>
						<option value='zm'>Sambia</option>
						<option value='as'>Samoa</option>
						<option value='ws'>Samoa</option>
						<option value='sm'>San Marino</option>
						<option value='st'>Sao Tome</option>
						<option value='sa'>Saudi Arabien</option>
						<option value='se'>Schweden</option>
						<option value='ch'>Schweiz</option>
						<option value='sn'>Senegal</option>
						<option value='sc'>Seychellen</option>
						<option value='sl'>Sierra Leone</option>
						<option value='sg'>Singapur</option>
						<option value='sk'>Slowakei -slowakische Republik-</option>
						<option value='si'>Slowenien</option>
						<option value='sb'>Solomon Inseln</option>
						<option value='so'>Somalia</option>
						<option value='gs'>South Georgia, South Sandwich Isl.</option>
						<option value='es'>Spanien</option>
						<option value='lk'>Sri Lanka</option>
						<option value='sh'>St. Helena</option>
						<option value='kn'>St. Kitts Nevis Anguilla</option>
						<option value='pm'>St. Pierre und Miquelon</option>
						<option value='vc'>St. Vincent</option>
						<option value='kr'>S&uuml;d Korea</option>
						<option value='za'>S&uuml;dafrika</option>
						<option value='sd'>Sudan</option>
						<option value='sr'>Surinam</option>
						<option value='sj'>Svalbard und Jan Mayen Islands</option>
						<option value='sz'>Swasiland</option>
						<option value='sy'>Syrien</option>
						<option value='tj'>Tadschikistan</option>
						<option value='tw'>Taiwan</option>
						<option value='tz'>Tansania</option>
						<option value='th'>Thailand</option>
						<option value='tp'>Timor</option>
						<option value='tg'>Togo</option>
						<option value='tk'>Tokelau</option>
						<option value='to'>Tonga</option>
						<option value='tt'>Trinidad Tobago</option>
						<option value='td'>Tschad</option>
						<option value='cz'>Tschechische Republik</option>
						<option value='tn'>Tunesien</option>
						<option value='tr'>T&uuml;rkei</option>
						<option value='tm'>Turkmenistan</option>
						<option value='tc'>Turks und Kaikos Inseln</option>
						<option value='tv'>Tuvalu</option>
						<option value='ug'>Uganda</option>
						<option value='ua'>Ukraine</option>
						<option value='hu'>Ungarn</option>
						<option value='uy'>Uruguay</option>
						<option value='uz'>Usbekistan</option>
						<option value='vu'>Vanuatu</option>
						<option value='va'>Vatikan</option>
						<option value='ve'>Venezuela</option>
						<option value='ae'>Vereinigte Arabische Emirate</option>
						<option value='us'>Vereinigte Staaten von Amerika</option>
						<option value='vn'>Vietnam</option>
						<option value='vg'>Virgin Island (Brit.)</option>
						<option value='vi'>Virgin Island (USA)</option>
						<option value='wf'>Wallis et Futuna</option>
						<option value='by'>Wei&szlig;ru&szlig;land</option>
						<option value='eh'>Westsahara</option>
						<option value='cf'>Zentralafrikanische Republik</option>
						<option value='zw'>Zimbabwe</option>
						<option value='cy'>Zypern</option>
					</select>

					<span class="label required"><label for="adminCatalogLanguage" onclick="javascript:dialog.showContextHelp(arguments[0], 8005, 'Katalogsprache')"><fmt:message key="dialog.admin.catalog.language" />*</label></span>
					<select class="spaceBelow" dojoType="ingrid:Select" required="true" style="width:622px;" disabled="true" id="adminCatalogLanguage" >
						<option value="de">Deutsch</option>
						<option value="en">Englisch</option>
					</select>

					<span class="label required"><label for="adminCatalogSpatialRef" onclick="javascript:dialog.showContextHelp(arguments[0], 8006, 'Raumbezug')"><fmt:message key="dialog.admin.catalog.location" />*</label></span>
					<span class="functionalLink marginRight"><img src="img/ic_fl_popup.gif" width="10" height="9" alt="Popup" /><a href="javascript:void(0);" onClick="javascript:scriptScope.selectSpatialReference();" title="Raumbezug ausw&auml;hlen [Popup]"><fmt:message key="dialog.admin.catalog.locationLink" /></a></span>
					<span class="input spaceBelow"><input type="text" required="true" widgetId="adminCatalogSpatialRef" class="w640" disabled="true" dojoType="ingrid:ValidationTextBox" /></span>
					
					<div class="checkboxContainer">
						<span class="input"><input type="checkbox" id="adminCatalogWorkflowControl" dojoType="Checkbox" /><label class="inActive"><fmt:message key="dialog.admin.catalog.activateWorkflowControl" /></label></span>
						<span class="input"><input type="checkbox" id="adminCatalogExpire" dojoType="Checkbox" /><label class="inActive"><fmt:message key="dialog.admin.catalog.expireAfter" /> <input widgetId="adminCatalogExpiryDuration" class="w033" min="1" max="2147483647" maxlength="10" dojoType="IntegerTextbox" /> <fmt:message key="dialog.admin.catalog.days" /></label></span>
					</div>
		
					<div class="spacerField"></div>
				</div>
		<!-- 
						<div class="inputContainer">
		          			<span class="button w644"><a href="#" class="buttonBlue" title="Speichern">Speichern</a><a href="#" class="buttonBlue" title="Abbrechen">Abbrechen</a></span>
						</div>
		 -->
				<div class="inputContainer">
					<span class="button w644" style="height:20px !important;">
						<span style="float:right;">
							<button dojoType="ingrid:Button" title="Speichern" onClick="javascript:scriptScope.saveCatalogData();"><fmt:message key="dialog.admin.catalog.save" /></button>
						</span>
						<span style="float:right;">
							<button dojoType="ingrid:Button" title="Zur&uuml;cksetzen" onClick="javascript:scriptScope.reloadCatalogData();"><fmt:message key="dialog.admin.catalog.reset" /></button>
						</span>
						<span id="adminCatalogLoadingZone" style="float:left; margin-top:1px; z-index: 100; visibility:hidden">
							<img src="img/ladekreis.gif" />
						</span>
					</span>
				</div>
				<!-- LEFT HAND SIDE CONTENT END -->
			</div>
		</div>
	</div>
<!-- CONTENT END -->

</body>
</html>
