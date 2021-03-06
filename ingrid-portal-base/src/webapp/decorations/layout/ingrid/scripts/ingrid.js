/*
 * **************************************************-
 * Ingrid Portal Base
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
function ingrid_openWindow(url, winWidth, winHeight)
{
  popupWin = window.open(url, "InternalWin", 'width=' + winWidth + ',height=' + winHeight + ',resizable=yes,scrollbars=yes,location=no,toolbar=yes');
  popupWin.focus();
}

function copyToClipboard(message) {
  var $body = document.getElementsByTagName('body')[0];
  var $tempInput = document.createElement('INPUT');
  $body.appendChild($tempInput);
  $tempInput.setAttribute('value', message)
  $tempInput.select();
  document.execCommand('copy');
  $body.removeChild($tempInput);
}

function ingrid_checkAll(group) {
  // NOTICE: first field in group has to be "checkAll" field
  if (group[0]) {
      if (group[0].checked == true) {
          for (i=1; i<group.length; i++) {
              group[i].checked = true;
          }
      } else {
          for (i=1; i<group.length; i++) {
              group[i].checked = false;
          }
      }
  }
}

function ingrid_enableButtonByCheckbox(id, buttonName){
    var checkboxes = document.getElementsByName(id);
    for (var i=0; i<checkboxes.length; i++){
        //bind event to each checkbox
        checkboxes[i].onclick = function() {
            var isCheckboxSelect = false;
            for (var j=0; j<checkboxes.length; j++){
                if(checkboxes[j].checked){
                    isCheckboxSelect = true;
                }
            }
            document.getElementsByName(buttonName)[0].disabled = !isCheckboxSelect;
        };
    }
}

// Select all or nothing in group1 and force group2 to same selection state.
function ingrid_checkAll2Groups(group1, group2) {
    group2[0].checked = group1[0].checked;
    ingrid_checkAll(group1);
    ingrid_checkAll(group2);
}

//Select all or nothing in group1 and adapt only "all field" in group2.
function ingrid_checkAllAdapt(group1, group2) {
    ingrid_checkAll(group1);
    if (group1[0].checked == false) {
        group2[0].checked = false;
    } else {
        ingrid_checkGroup(group2);
    }
}

function ingrid_checkGroup(group) {
    // NOTICE: first field in group has to be "checkAll" field
    var allChecked = true;
    for (i=1; i<group.length; i++) {
        if (group[i].checked != true) {
            allChecked = false;
            break;
        }
    }
    if (allChecked) {
        group[0].checked = true;
    } else {
        group[0].checked = false;
    }
}

//Check for selection of all field in group1 and then adapt group 2.
function ingrid_checkGroupAdapt(group1, group2) {
    ingrid_checkGroup(group1);
    if (group1[0].checked == false) {
        group2[0].checked = false;
    } else {
        ingrid_checkGroup(group2);
    }
}

function login() {
    if (document.getElementById("login").value == "admin") {
        document.location.href="mpu_admin.html";
    } else if (document.getElementById("passwd").value != "") {
        document.location.href="mpu_home.html";
    }
}

function clearUser() {
    document.getElementById("login").value = "";
}

function clearPasswd() {
    document.getElementById("passwd").value = "";
}


function adaptProviderNodes(partnerElementName, formName) {
  var partnerIdent = document.forms[formName].elements[partnerElementName].id;
  if (partnerIdent == "bund") {
    partnerIdent = "bu";
  }
  var checked = document.forms[formName].elements[partnerElementName].checked;
  for (i=0; i<document.forms[formName].elements.length; i++) {
    if (document.forms[formName].elements[i].id.indexOf(partnerIdent+'_') == 0) {
      document.forms[formName].elements[i].checked = checked;
    }
  }
}

function adaptPartnerNode(providerElementName, formName) {
  var partnerIdent = document.forms[formName].elements[providerElementName].id;
  partnerIdent = partnerIdent.substring(0, partnerIdent.indexOf('_'));
  var checked = document.forms[formName].elements[providerElementName].checked;
  var checkPartner = false;
  if (!checked) {
      for (i=0; i<document.forms[formName].elements.length; i++) {
        if (document.forms[formName].elements[i].id.indexOf(partnerIdent+'_') == 0) {
          if (document.forms[formName].elements[i].checked) {
            checkPartner = true;
            break;
          }
        }
      }
  } else {
      checkPartner = true;
  }
  if (partnerIdent == "bu") {
    partnerIdent = "bund";
  }
  document.forms[formName].elements["chk_"+partnerIdent].checked = checkPartner;
}

/* Open and close categories */
function openNode(element){
    var status = document.getElementById(element).style.display;
    var status_img = document.getElementById(element + "_img").src;

    document.getElementById(element).style.display = 'none';
    if(status == "none"){
        document.getElementById(element).style.display = "block";
    }

    document.getElementById(element + "_img").src = '/ingrid-portal-apps/images/facete/facete_cat_close.png';
    if(status_img.indexOf('/ingrid-portal-apps/images/facete/facete_cat_close.png') != -1){
        document.getElementById(element + "_img").src = '/ingrid-portal-apps/images/facete/facete_cat_open.png';
    }

}

/* Open and close facete */
function openFaceteNode(element, id_facete, id_hits){
    var status_img = document.getElementById(element + "_img").src;

    if(status_img.indexOf('/ingrid-portal-apps/images/facete/facete_close.png') > -1){
        document.getElementById(element).style.display = "block";
        document.getElementById(element + "_img").src = '/ingrid-portal-apps/images/facete/facete_open.png';
        document.getElementById(id_hits).setAttribute('class', "closeNode");
        document.getElementById(id_facete).setAttribute('class', "openNode");
    }else{
        document.getElementById(element).style.display = 'none';
        document.getElementById(element + "_img").src = '/ingrid-portal-apps/images/facete/facete_close.png';
        document.getElementById(id_hits).setAttribute('class', "openNode");
        document.getElementById(id_facete).setAttribute('class', "closeNode");
    }

}

/* select all checkboxes in form */
function faceteDialogSelectAll(field){
    for (i = 0; i < field.length; i++)
        field[i].checked = true ;
}

/* deselect all checkboxes in form */
function faceteDialogDeselectAll(field){
    for (i = 0; i < field.length; i++)
        field[i].checked = false ;
}

/* cancel dialog */
function faceteDialogCancel(id){
    var dialog = dijit.byId(id);
    dialog.hide();
}

/* open dialog by onclick-event */
function prepareDialog (id) {
   var dialog = dijit.byId(id);
   dialog.show();
}

/* open dialog for map */
function prepareDialogMap (id, wms, divId, iframeId) {
        var dialog = dijit.byId(id);
        var map = document.getElementById(divId);
        //render iFrame, but only if doest exist already
        if (map.childNodes.length <= 1 && dojo.byId(iframeId) == null) {
            var iframe = document.createElement('iframe');
            iframe.setAttribute('id', iframeId);
            iframe.setAttribute('class', 'facete_map');
            iframe.setAttribute('name', 'ingrid-webmap-client');
            iframe.setAttribute('marginheight', '0');
            iframe.setAttribute('marginwidth', '0');
            iframe.setAttribute('frameborder', '0');
            iframe.setAttribute('height', '505');
            iframe.setAttribute('width', '805');
            iframe.setAttribute('border', 'none');
            iframe.setAttribute('src', wms);
            map.appendChild(iframe);
        }

        dialog.show();

}

/* open dialog */
function loadDialog(id){
    var dialog = id;
    dialog.show();
}

function loadingProgressDialog(element){
    var status = document.getElementById(element).style.display;
    if(status == "inline"){
        document.getElementById(element).style.display = "none";
    }
    if(status == "none"){
        document.getElementById(element).style.display = "inline";
    }
}

function showButtonSelectCheckboxForm (form, button, coordDiv){
    var status = document.getElementById(button).style.display;
    var isSelect = false
    var divStatus = document.getElementById(coordDiv).firstChild;
    for (i = 0; i < form.length; i++){
        if(form[i].checked){
            isSelect = true;
            break;
        }
    }

    if(isSelect && divStatus != null){
        if(status == "none"){
            document.getElementById(button).style.display = "inline";
        }
    }else{
        if(status == "inline"){
            document.getElementById(button).style.display = "none";
        }
    }

}

function getAndSetMultiple(ob){
    var arraySelect = new Array();
    while (ob.selectedIndex != -1)
    {
        if (ob.selectedIndex != 0) arraySelect.push(ob.selectedIndex);
        ob.options[ob.selectedIndex].selected = false;
    }
    if(arraySelect.length == 0){
        arraySelect.push(0);
    }
    setMultiple(ob, arraySelect)
}

function setMultiple(ob, arraySelect){
    for (var i = 0;i < arraySelect.length; i++)
    {
        ob.options[arraySelect[i]].selected = true;
    }
}

function goToByScroll(id, time){
    if(time == undefined){
        time = 1200;
    }
    id = id.replace("link", "");
    $('html,body').animate({
        scrollTop: $("#"+id).offset().top
    }, time);
}

function openURL(url){
    window.location = url;
}

function getLinkFileSize(url, element)
{
    var respJson;
    var http = new XMLHttpRequest();
    http.open('GET', url, true);
    http.onreadystatechange = function() {
        if (this.readyState == this.DONE) {
            if (this.status === 200) {
                if(this.response){
                    respJson = JSON.parse(this.response);
                    if(respJson){
                        if(respJson.contentLength){
                            if(element){
                                element.text(convertFileSize(respJson.contentLength, true));
                            }
                        }
                    }
                }
            }
        }
    };
    http.send();
    return ('');
}

function convertFileSize(bytes, si) {
    var thresh = si ? 1000 : 1024;
    if(Math.abs(bytes) < thresh) {
        return bytes + ' B';
    }
    var units = si
        ? ['kB','MB','GB','TB','PB','EB','ZB','YB']
        : ['KiB','MiB','GiB','TiB','PiB','EiB','ZiB','YiB'];
    var u = -1;
    do {
        bytes /= thresh;
        ++u;
    } while(Math.abs(bytes) >= thresh && u < units.length - 1);

    var unit = units[u];
    var val = bytes.toFixed(1);

    if((units[u] == units[0]) && (val / 1000 >= 0.1)){
        return (val / 1009).toFixed(1) + ' ' + units[1];
    }
    return bytes.toFixed(1) + ' ' + units[u];
}

function checkPassword(pwd, idMeter, idText) {
    var meter = document.getElementById(idMeter);
    // fallback meter needed for IE browser compability
    var fallBackMeter = meter.lastElementChild.lastElementChild;
    var text = document.getElementById(idText);

    if (pwd != '') {
        var result = zxcvbn(pwd);
        meter.value = result.score;
        meter.style.display = 'block';
        // 4 is the max score from zxcvbn
        fallBackMeter.style.width =  (result.score/4 * 100)+"%";
        fallBackMeter.style.background =  meterStrengthColors[result.score];
        text.innerHTML = meterStrength[result.score];
    } else {
        text.innerHTML  = ' ';
        meter.value = 0;
        fallBackMeter.style.width = "0%";
        meter.style.display = 'none';
    }
}
