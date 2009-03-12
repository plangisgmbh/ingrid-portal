<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml" lang="de">
<head>
<title>Objekt zuordnen</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="author" content="wemove digital solutions" />
<meta name="copyright" content="wemove digital solutions GmbH" />

<script type="text/javascript">
_container_.addOnLoad(function() {
	init();
});
_container_.addOnUnload(function() {
	// If the dialog was cancelled via the dialogs close button
	// we need to signal an error (cancel action)
	if (_container_.customParams.resultHandler.fired == -1) {
		_container_.customParams.resultHandler.errback();
	}
});



// Expands the tree according to the nodeIds in pathList.
// pathList should be a list containing node IDs from the top element to the target node.
// index is the index where the expand process is started
// resultHandler is an optional deferred obj which is called when all nodes have been expanded
_expandPathAssignObjRec = function(pathList, index, resultHandler) {
	if (index >= pathList.length) {
		resultHandler.callback();
		return;
	} else {
		if (!dojo.widget.byId("AssignObj_objectRoot").isExpanded) {
			// Expand the root object if it isn't already expanded
			var treeController = dojo.widget.byId("treeControllerAssignObj");
			var deferred = treeController.expand(dojo.widget.byId("AssignObj_objectRoot"));
			deferred.addCallback(function() {
				_expandPathAssignObjRec(pathList, 0, resultHandler);
			});
		} else {
			var treeController = dojo.widget.byId("treeControllerAssignObj");
			var deferred = treeController.expand(dojo.widget.byId(pathList[index]));
			deferred.addCallback(function() {
				_expandPathAssignObjRec(pathList, index+1, resultHandler);
			});
		}
	}
}

// Expands the tree according to the nodeIds in pathList.
// pathList should be a list containing node IDs from the top element to the target node.
// The return value is a deferred object which is invoked after all nodes have been expanded
_expandPathAssignObj = function(pathList) {
	for (var i = 0; i < pathList.length; i++)
		pathList[i] = "AssignObj_"+pathList[i];

	var deferred = new dojo.Deferred();
	_expandPathAssignObjRec(pathList, 0, deferred);
	return deferred;
}



init = function() {
	// Deferred object which is called when the Tree has been initialized.
	// After the tree has been initialized, the tree is expanded to the targetNode
	// specified in the customParameter 'jumpToNode' 
	var treeInitDef = new dojo.Deferred();
	if (_container_.customParams.jumpToNode) {
		treeInitDef.addCallback(function() {
			var deferred = new dojo.Deferred();
			var treeController = dojo.widget.byId("treeControllerAssignObj");

			deferred.addCallback(function(pathList) {
				var def = _expandPathAssignObj(pathList);
				def.addCallback(function(){
					var tree = dojo.widget.byId("treeAssignObj");
					var treeListener = dojo.widget.byId("treeListenerAssignObj");
					var targetNode = dojo.widget.byId(pathList[pathList.length-1]);
					tree.selectNode(targetNode);
					tree.selectedNode = targetNode;
					dojo.event.topic.publish(treeListener.eventNames.select, {node: targetNode});
					if (!dojo.render.html.ie)				
						dojo.html.scrollIntoView(targetNode.domNode);
				
				});
			});
			dojo.event.topic.publish("/getObjectPathRequest", {
				id: _container_.customParams.jumpToNode,
				resultHandler: deferred,
				ignoreDirtyFlag: true
			});
		});
	}
	
	// Load initial first level of the tree from the server
	TreeService.getSubTree(null, null, 1, 
		function (str) {
			for (var i = 0; i < str.length; i++) {
				str[i].id = "AssignObj_"+str[i].id;
			}

			var tree = dojo.widget.byId('treeAssignObj');

			// Only use 'objects' and drop 'addresses'
			tree.setChildren([str[0]]);
			treeInitDef.callback();
		});

	// Load children of the node from server
	// Overwritten to work with dwr.
	var treeController = dojo.widget.byId("treeControllerAssignObj");
	treeController.loadRemote = function(node, sync){
		var _this = this;

		var params = {
			node: this.getInfo(node),
			tree: this.getInfo(node.tree)
		};

		var deferred = new dojo.Deferred();

		TreeService.getSubTree(node.id.substring(10, node.id.length), node.nodeAppType, 1, {
  			callback:function(res) { deferred.callback(res); },
//			timeout:5000,
			errorHandler:function(message) { deferred.errback(new dojo.RpcError(message, this)); },
			exceptionHandler:function(message) { deferred.errback(new dojo.RpcError(message, this)); }
  		});

		deferred.addCallback(function(res) {
			for (var i = 0; i < res.length; i++) {
				res[i].id = "AssignObj_"+res[i].id;
			}
			return _this.loadProcessResponse(node,res);
		});
		
		deferred.addErrback(function(res) { alert("Error while loading data from the server. Please check your connection and try again!"); return res;});
		return deferred;
	};
};

assignObject = function() {
	var node = dojo.widget.byId("treeAssignObj").selectedNode;
	if (node) {
		var retVal = {};
		retVal.uuid = node.id.substring(10, node.id.length);
		retVal.title = node.title;
		retVal.objectClass = node.nodeDocType.substr(5, 1);

		_container_.customParams.resultHandler.callback(retVal);
	}

	_container_.closeWindow(); 
}

</script>
</head>

<body>

<div dojoType="ContentPane">

  <div id="catalogueObject" class="contentBlockWhite top w478">
    <div id="winNavi">
		<a href="javascript:void(0);" onclick="javascript:dialog.showContextHelp(arguments[0], 7074)" title="Hilfe">[?]</a>
	  </div>
	  <div id="objectContent" class="content">

      <!-- CONTENT START -->
      <div class="inputContainer w478 h413 scrollable">
      	<div dojoType="ContentPane" id="treeContainerAssignObj">
          <!-- tree components -->
          <div dojoType="ingrid:TreeController" widgetId="treeControllerAssignObj" RpcUrl="server/treelistener.php"></div>
          <div dojoType="ingrid:TreeListener" widgetId="treeListenerAssignObj"></div>	
          <div dojoType="ingrid:TreeDocIcons" widgetId="treeDocIconsAssignObj"></div>	
          <div dojoType="ingrid:TreeDecorator" listener="treeListenerAssignObj"></div>
          
          <!-- tree -->
          <div dojoType="ingrid:Tree" listeners="treeControllerAssignObj;treeListenerAssignObj;treeDocIconsAssignObj" widgetId="treeAssignObj">
		  </div>
        </div>
        <div class="spacer"></div>
      </div>
      <div class="inputContainer w478">
        <span class="button w442 transparent">
		  <span style="float:right;"><button dojoType="ingrid:Button" onClick="assignObject"><fmt:message key="dialog.links.select.assign" /></button></span>
        </span>
  	  </div>
      <!-- CONTENT END -->

    </div>
  </div>
</div>

</body>
</html>
