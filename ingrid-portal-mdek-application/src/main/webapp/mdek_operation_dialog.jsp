<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml" lang="de">
<head>
<title>Operationen hinzufügen/bearbeiten</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="author" content="wemove digital solutions" />
<meta name="copyright" content="wemove digital solutions GmbH" />


<script type="text/javascript">
var currentOperationId = null;
var dirtyFlag = null;

var inputElements = 
	["operationsName", "operationsNameSelect", "operationsDescription", "operationsPlatform", "operationsCall",
	 "operationsParameter", "operationsAddress", "operationsDependencies", "saveButton"];//, "cancelButton"];

var requiredElements = [/*["operationsName", "operationsNameLabel"],*/	// This element is added when the operation input is initialized
					    ["operationsPlatform", "operationsPlatformLabel"],
					    ["operationsAddress", "operationsAddressLabel"]];

var _opNameIsTextInput = null;

_container_.addOnLoad(function() {
	dirtyFlag = udkDataProxy.dirtyFlag;
	init();

	disableButtonsOnWrongPermission();
});

_container_.addOnUnload(function() {
	var srcStore = dojo.widget.byId("operationsList").store;
	var dstStore = dojo.widget.byId("ref3Operation").store;
	dstStore.setData(srcStore.getData());

	dirtyFlag ? udkDataProxy.setDirtyFlag() : udkDataProxy.resetDirtyFlag();
});


initOperationNameInput = function() {
	var serviceTypeWidget = dojo.widget.byId("ref3ServiceType");
	var serviceType = ""+serviceTypeWidget.getValue();

	if (serviceType != "5" && serviceType != "6") {
		dojo.html.hide(dojo.widget.byId("operationsName").domNode);	
		requiredElements.push(["operationsNameSelect", "operationsNameLabel"]);
		var selectWidget = dojo.widget.byId("operationsNameSelect");
//		selectWidget.isValid = function() { return this.getValue() != ""; }
		selectWidget.isValid = function() { return this.getValueForDisplayValue(this.textInputNode.value) != null; }

		var listId = 5110;
		if (serviceType == "1")			// CSW
			listId = 5105;
		else if (serviceType == "2")	// WMS
			listId = 5110;
		else if (serviceType == "3")	// WFS
			listId = 5120;
		else if (serviceType == "4")	// WCTS
			listId = 5130;

		var languageCode = UtilCatalog.getCatalogLanguage();

		CatalogService.getSysLists([listId], languageCode, {
			callback: function(res) {
				selectWidget.dataProvider.setData(res[listId]);
		}});
		_opNameIsTextInput = false;
	} else {
		dojo.html.hide(dojo.widget.byId("operationsNameSelect").domNode);	
		requiredElements.push(["operationsName", "operationsNameLabel"]);
		_opNameIsTextInput = true;
	}
}


resetRequiredElements = function() {
	dojo.lang.forEach(requiredElements, function(element) {
		dojo.html.removeClass(dojo.byId(element[1]), "important");		
	});
}

setDirtyFlag = function() {
	dirtyFlag = true;
}

connectStoreWithDirtyFlag = function(store)
{
//	dojo.event.connect(store, "onSetData", this, "setDirtyFlag");
//	dojo.event.connect(store, "onClearData", this, "setDirtyFlag");
//	dojo.event.connect(store, "onAddDataRange", this, "setDirtyFlag");
	dojo.event.connect(store, "onAddData", this, "setDirtyFlag");
	dojo.event.connect(store, "onRemoveData", this, "setDirtyFlag");
	dojo.event.connect(store, "onUpdateField", this, "setDirtyFlag");
}

disableButtonsOnWrongPermission = function() {
	if (currentUdk.writePermission == false) {
		dojo.widget.byId("newButton").disable();
		dojo.widget.byId("saveButton").disable();
//		dojo.widget.byId("cancelButton").disable();
	}
}

disableInputElements = function() {
	dojo.lang.forEach(inputElements, function(item) {
		dojo.widget.byId(item).disable();
	});
}

enableInputElements = function() {
	dojo.lang.forEach(inputElements, function(item) {
		dojo.widget.byId(item).enable();
	});
}

resetInputElements = function() {
	resetRequiredElements();
	
	currentOperationId = null;
	dojo.lang.forEach(inputElements, function(item) {
		var widget = dojo.widget.byId(item);
		if (widget instanceof ingrid.widget.ValidationTextbox
		 || widget instanceof ingrid.widget.Select) {
			widget.setValue("");
		} else if (widget instanceof ingrid.widget.FilteringTable) {
			widget.store.clearData();
		}
	});	
}

displayOperation = function(op) {
	if (_opNameIsTextInput)
		dojo.widget.byId("operationsName").setValue(op.name);
	else {
		var selectWidget = dojo.widget.byId("operationsNameSelect");
		selectWidget.setValue(selectWidget.getValueForDisplayValue(op.name));
	}
	
	dojo.widget.byId("operationsDescription").setValue(op.description);
	dojo.widget.byId("operationsPlatform").store.setData(op.platform);
	dojo.widget.byId("operationsCall").setValue(op.methodCall);
	dojo.widget.byId("operationsParameter").store.setData(op.paramList);
	dojo.widget.byId("operationsAddress").store.setData(op.addressList);
	dojo.widget.byId("operationsDependencies").store.setData(op.dependencies);
}

init = function() {
	disableInputElements();
	initOperationNameInput();

	var opList = dojo.widget.byId("operationsList");
	dojo.event.connectOnce("after", opList, "onDataSelect", function(op) {
		if (currentUdk.writePermission) {
			enableInputElements();
		}
		displayOperation(op);
		currentOperationId = op.Id;
		dojo.widget.byId("saveButton").setCaption(message.get("general.save"));
	});

	dojo.event.connectOnce("after", opList, "onSelect", function(e) {
		var op = opList.getSelectedData();
		if (op.length == 1) {
			if (currentUdk.writePermission) {
				enableInputElements();
			}
			displayOperation(op[0]);
			currentOperationId = op[0].Id;
			dojo.widget.byId("saveButton").setCaption(message.get("general.save"));
		} else {
			disableInputElements();
			resetInputElements();
			currentOperationId = null;
			dojo.widget.byId("saveButton").setCaption(message.get("general.add"));
		}
	});

	// If a selected object was removed from the list, reset the input fields
	dojo.event.connectOnce("after", opList.store, "onRemoveData", function(obj) {	
		if (dojo.lang.some(opList.getSelectedData(), function(item){ return item == obj.src; })) {
			resetDialog();
		}
	});

	// Load initial values
	var srcStore = dojo.widget.byId("ref3Operation").store;
	var dstStore = dojo.widget.byId("operationsList").store;
	dstStore.setData(srcStore.getData());

	connectStoreWithDirtyFlag(dstStore);

	// Init table validators
	dojo.widget.byId("operationsParameter").setValidationFunctions([
		{target: "name", validateFunction: function(item) { return (item != null && dojo.string.trim(item) != ""); }},
		{target: "optional", validateFunction: function(item) { return (item != null && item+"" != ""); }},
		{target: "multiple", validateFunction: function(item) { return (item != null && item+"" != ""); }}
	]);
	dojo.widget.byId("operationsPlatform").setValidationFunctions([
		{target: "title", validateFunction: function(item) { return (item != null && dojo.string.trim(item) != ""); }}
	]);
	dojo.widget.byId("operationsAddress").setValidationFunctions([
		{target: "title", validateFunction: function(item) { return (item != null && dojo.string.trim(item) != ""); }}
	]);
	dojo.widget.byId("operationsName").isValid = function() { return !this.isEmpty(); };
}

getOperation = function() {
	var operation = {};
	if (_opNameIsTextInput)
		operation.name = dojo.widget.byId("operationsName").getValue();
	else {
		var selectWidget = dojo.widget.byId("operationsNameSelect");
		operation.name = selectWidget.getDisplayValue();
	}
	operation.description = dojo.widget.byId("operationsDescription").getValue();
	operation.platform = dojo.widget.byId("operationsPlatform").store.getData();
	operation.methodCall = dojo.widget.byId("operationsCall").getValue();
	operation.paramList = dojo.widget.byId("operationsParameter").store.getData();
	operation.addressList = dojo.widget.byId("operationsAddress").store.getData();
	operation.dependencies = dojo.widget.byId("operationsDependencies").store.getData();
	operation.Id = currentOperationId;
	return operation;
}

isValidOperation = function(op) {
	resetRequiredElements();

	var valid = true;

	dojo.lang.forEach(requiredElements, function(element) {
		if (!dojo.widget.byId(element[0]).isValid()) {
			dojo.html.addClass(dojo.byId(element[1]), "important");		
			valid = false;
		}
	});

	if (op.paramList.length != 0) {
		if (!dojo.widget.byId("operationsParameter").isValid())
			valid = false;
	}

	if (op.platform.length == 0) {
		dojo.html.addClass(dojo.byId("operationsPlatformLabel"), "important");		
		valid = false;
	}
	
	if (op.addressList.length == 0) {
		dojo.html.addClass(dojo.byId("operationsAddressLabel"), "important");		
		valid = false;
	}

	return valid;
}

// New Button onClick function
//
newOperation = function() {
	enableInputElements();
	resetInputElements();
	dojo.widget.byId("operationsList").resetSelections();
	dojo.widget.byId("operationsList").renderSelections();
	currentOperationId = null;
	dojo.widget.byId("saveButton").setCaption(message.get("general.add"));
}

// Save/Add Button onClick function
//
saveOperation = function() {
	var operation = getOperation();
	if (!isValidOperation(operation)) {
  		dialog.show(message.get("general.hint"), message.get("links.fillRequiredFieldsHint"), dialog.WARNING);
		return;
	} else {
		var opList = dojo.widget.byId("operationsList");
		if (operation.Id == null) {
			var key = UtilStore.getNewKey(opList.store);
			operation.Id = key;
			opList.store.addData(operation);
			opList.resetSelections();
			opList.select(operation);
			opList.renderSelections();
		} else {
			var oldOp = opList.getSelectedData()[0];
			oldOp.name = operation.name;
			for (i in operation) {
				oldOp[i] = operation[i];
			}

			opList.store.update(oldOp, "name", operation.name);		
			opList.store.update(oldOp, "description", operation.description);		
		}
	}
}

// Cancel Button onClick function
//
resetDialog = function() {
	disableInputElements();
	resetInputElements();
	dojo.widget.byId("operationsList").resetSelections();
	dojo.widget.byId("operationsList").renderSelections();
	currentOperationId = null;
	closeDialog();
}

closeDialog = function() {
	_container_.closeWindow();
}

</script> 
</head>

<body>

<div dojoType="ContentPane">

  <div id="operations" class="contentBlockWhite top fullBlock">
    <div id="winNavi">
			<a href="javascript:closeDialog();" title="schlie&szlig;en"><img src="img/ic_close.gif" /><fmt:message key="dialog.operation.close" /></a>
			<a href="javascript:void(0);" onclick="javascript:window.open('mdek_help.jsp?hkey=maintanance-of-objects-9#maintanance-of-objects-9', 'Hilfe', 'width=750,height=550,resizable=yes,scrollbars=yes,locationbar=no');" title="Hilfe">[?]</a>
	  </div>
	  <div id="operationsContent" class="content">

      <!-- LEFT HAND SIDE CONTENT START -->
      <div class="spacer"></div>
      <div class="spacer"></div>
      <div class="inputContainer field grey noSpaceBelow fullField">
        <div class="tableContainer rows4 fullInside">
    	    <table id="operationsList" dojoType="ingrid:FilteringTable" minRows="4" cellspacing="0" class="filteringTable nosort interactive">
    	      <thead>
    		      <tr>
          			<th nosort="true" field="name" dataType="String" width="160"><fmt:message key="dialog.operation.name" /></th>
          			<th nosort="true" field="description" dataType="String" width="488"><fmt:message key="dialog.operation.description" /></th>
    		      </tr>
    	      </thead>
    	      <tbody>
    	      </tbody>
    	    </table>
        </div>
        <div class="spacerField"></div>
      </div>

      <div class="inputContainer full">
        <span class="button w644" style="height:20px !important;">
        	<span style="float:right;"><button dojoType="ingrid:Button" id="newButton" onClick="newOperation"><fmt:message key="dialog.operation.new" /></button></span>
        </span>
  	  </div>

      <div class="inputContainer field grey fullField noSpaceBelow">
        <span class="label required"><label id="operationsNameLabel" for="operationsName" onclick="javascript:dialog.showContextHelp(arguments[0], 5201, 'Name der Operation')"><fmt:message key="dialog.operation.opName" />*</label></span>
		<span class="input">
			<select dojoType="ingrid:Select" class="w616" id="operationsNameSelect" />
			<input type="text" maxlength="120" id="operationsName" class="w640" dojoType="ingrid:ValidationTextBox" />
		</span>
        <div class="spacer"></div>
        
        <div class="inputContainer spaceBelow">
          <span class="entry first">
            <span class="label"><label for="operationsDescription" onclick="javascript:dialog.showContextHelp(arguments[0], 5202, 'Beschreibung')"><fmt:message key="dialog.operation.description" /></label></span>
            <span class="input">
				<input type="text" mode="textarea" id="operationsDescription" class="w308 h041" dojoType="ingrid:ValidationTextbox" />            
            </span>
          </span>
          <span class="entry">
            <span class="label required"><label id="operationsPlatformLabel" for="operationsPlatform" onclick="javascript:dialog.showContextHelp(arguments[0], 5203, 'Unterst&uuml;tzte Plattformen')"><fmt:message key="dialog.operation.platforms" />*</label></span>
            <div class="tableContainer headHiddenRows2 halfInside">
              <div class="cellEditors" id="operationsPlatformEditors">
                <div dojoType="ingrid:ValidationTextbox" maxlength="120" class="w277" widgetId="operationsPlatformText"></div>
              </div>
         	    <table id="operationsPlatform" dojoType="ingrid:FilteringTable" minRows="2" headClass="hidden" cellspacing="0" class="filteringTable interactive">
        	      <thead>
        		      <tr>
              			<th field="title" dataType="String" editor="operationsPlatformText"><fmt:message key="dialog.operation.name" /></th>
        		      </tr>
        	      </thead>
        	      <tbody>
        	      </tbody>
        	    </table>
            </div>
          </span>
          <div class="fill"></div>
        </div>

        <span class="label"><label for="operationsCall" onclick="javascript:dialog.showContextHelp(arguments[0], 5204, 'Aufruf')"><fmt:message key="dialog.operation.call" /></label></span>
        <span class="input spaceBelow"><input type="text" maxlength="255" id="operationsCall" name="operationsCall" class="w640" dojoType="ingrid:ValidationTextBox" /></span>

        <div class="inputContainer h130">
          <span class="label"><label id="operationsParameterLabel" for="operationsParameter" onclick="javascript:dialog.showContextHelp(arguments[0], 5205, 'Parameter')"><fmt:message key="dialog.operation.parameter" /></label></span>
          <div class="tableContainer rows4 fullInside">
            <div class="cellEditors" id="operationsParameterEditors">
              <div dojoType="ingrid:ValidationTextbox" maxlength="120" widgetId="operationsParameterName"></div>
              <div dojoType="ingrid:Select" maxlength="20" toggle="plain" dataUrl="js/data/ref3OperationDirection.js" style="width:90px;" widgetId="operationsParameterDir"></div>
              <div dojoType="ingrid:ValidationTextbox" widgetId="operationsParameterDesc"></div>
              <div dojoType="ingrid:Select" toggle="plain" dataUrl="js/data/ref3OperationYesNo.js" style="width:32px;" widgetId="operationsParameterOpt"></div>
              <div dojoType="ingrid:Select" toggle="plain" dataUrl="js/data/ref3OperationYesNo.js" style="width:70px;" widgetId="operationsParameterMulti"></div>
            </div>
      	    <table id="operationsParameter" dojoType="ingrid:FilteringTable" minRows="4" cellspacing="0" class="filteringTable nosort interactive">
      	      <thead>
      		      <tr>
            			<th nosort="true" field="name" dataType="String" width="105" editor="operationsParameterName"><fmt:message key="dialog.operation.name" />*</th>
            			<th nosort="true" field="direction" dataType="String" width="100" editor="operationsParameterDir"><fmt:message key="dialog.operation.direction" /></th>
            			<th nosort="true" field="description" dataType="String" width="210" editor="operationsParameterDesc"><fmt:message key="dialog.operation.description" /></th>
            			<th nosort="true" field="optional" dataType="String" width="65" editor="operationsParameterOpt"><fmt:message key="dialog.operation.optional" />*</th>
            			<th nosort="true" field="multiple" dataType="String" width="110" editor="operationsParameterMulti"><fmt:message key="dialog.operation.multiplicity" />*</th>
      		      </tr>
      	      </thead>
      	      <tbody>
      	      </tbody>
      	    </table>
          </div>
        </div>
        <div class="spacer"></div>

        <div class="inputContainer noSpaceBelow h067">
          <span class="half left">
            <span class="label required"><label id="operationsAddressLabel" for="operationsAddress" onclick="javascript:dialog.showContextHelp(arguments[0], 5206, 'Zugriffsadresse')"><fmt:message key="dialog.operation.address" />*</label></span>
            <div class="tableContainer headHiddenRows2 halfInside">
              <div class="cellEditors" id="operationsAddressEditors">
                <div dojoType="ingrid:ValidationTextbox" maxlength="255" class="w277" widgetId="operationsAddressText"></div>
              </div>
         	    <table id="operationsAddress" dojoType="ingrid:FilteringTable" minRows="2" headClass="hidden" cellspacing="0" class="filteringTable interactive">
        	      <thead>
        		      <tr>
              			<th field="title" dataType="String" editor="operationsAddressText">Adresse</th>
        		      </tr>
        	      </thead>
        	      <tbody>
        	      </tbody>
        	    </table>
            </div>
          </span>
          <span class="half">
            <span class="label"><label for="operationsDependencies" onclick="javascript:dialog.showContextHelp(arguments[0], 5207, 'Abh&auml;ngigkeiten')"><fmt:message key="dialog.operation.dependencies" /></label></span>
            <div class="tableContainer headHiddenRows2 halfInside">
              <div class="cellEditors" id="operationsDependenciesEditors">
                <div dojoType="ingrid:ValidationTextbox" maxlength="120" class="w277" widgetId="operationsDependenciesText"></div>
              </div>
         	    <table id="operationsDependencies" dojoType="ingrid:FilteringTable" minRows="2" headClass="hidden" cellspacing="0" class="filteringTable interactive">
        	      <thead>
        		      <tr>
              			<th field="title" dataType="String" editor="operationsDependenciesText">Abh&auml;ngigkeit</th>
        		      </tr>
        	      </thead>
        	      <tbody>
        	      </tbody>
        	    </table>
            </div>
          </span>
        </div>
        <div class="spacerField"></div>
  	  </div>

      <div class="inputContainer noSpaceBelow">
        <span class="button w644" style="height:20px !important;">
        	<span style="float:right;"><button dojoType="ingrid:Button" id="cancelButton" onClick="resetDialog"><fmt:message key="dialog.operation.cancel" /></button></span>
        	<span style="float:right;"><button dojoType="ingrid:Button" id="saveButton" onClick="saveOperation"><fmt:message key="dialog.operation.add" /></button></span>
        </span>
  	  </div>
      <!-- LEFT HAND SIDE CONTENT END -->

    </div>
  </div>
</div>

</body>
</html>
