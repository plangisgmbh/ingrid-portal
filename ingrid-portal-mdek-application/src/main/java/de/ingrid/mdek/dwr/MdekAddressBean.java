package de.ingrid.mdek.dwr;

import java.util.ArrayList;
import java.util.HashMap;

public class MdekAddressBean {
	
	public String objectOwner;
	public String creationTime;
	public String modificationTime;
	public String lastEditor;
	public String workState;

	public String uuid;
	public String information;
	public String nodeAppType;
	public String nodeDocType;
	public Integer parentClass;
	
	public Integer addressClass;
	public String organisation;
	public String name;
	public String givenName;
	public String nameForm;
	public String titleOrFunction;
	public String street;
	public String countryCode;
	public String postalCode;
	public String city;
	public String poboxPostalCode;
	public String pobox;
	public String task;
	public String addressDescription;

	public Integer typeOfRelation;
	public String nameOfRelation;

	public ArrayList<HashMap<String, String>> communication;

	public MdekAddressBean() {
		this.communication = new ArrayList<HashMap<String, String>>();
	}
	
	public String getObjectOwner() {
		return objectOwner;
	}

	public void setObjectOwner(String objectOwner) {
		this.objectOwner = objectOwner;
	}

	public String getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(String creationTime) {
		this.creationTime = creationTime;
	}

	public String getModificationTime() {
		return modificationTime;
	}

	public void setModificationTime(String modificationTime) {
		this.modificationTime = modificationTime;
	}

	public String getLastEditor() {
		return lastEditor;
	}

	public void setLastEditor(String lastEditor) {
		this.lastEditor = lastEditor;
	}

	public String getWorkState() {
		return workState;
	}

	public void setWorkState(String workState) {
		this.workState = workState;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getInformation() {
		return information;
	}

	public void setInformation(String information) {
		this.information = information;
	}

	public String getNodeAppType() {
		return nodeAppType;
	}

	public void setNodeAppType(String nodeAppType) {
		this.nodeAppType = nodeAppType;
	}

	public String getNodeDocType() {
		return nodeDocType;
	}

	public void setNodeDocType(String nodeDocType) {
		this.nodeDocType = nodeDocType;
	}

	public Integer getAddressClass() {
		return addressClass;
	}

	public void setAddressClass(Integer addressClass) {
		this.addressClass = addressClass;
	}

	public String getOrganisation() {
		return organisation;
	}

	public void setOrganisation(String organisation) {
		this.organisation = organisation;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGivenName() {
		return givenName;
	}

	public void setGivenName(String givenName) {
		this.givenName = givenName;
	}

	public String getNameForm() {
		return nameForm;
	}

	public void setNameForm(String nameForm) {
		this.nameForm = nameForm;
	}

	public String getTitleOrFunction() {
		return titleOrFunction;
	}

	public void setTitleOrFunction(String titleOrFunction) {
		this.titleOrFunction = titleOrFunction;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPoboxPostalCode() {
		return poboxPostalCode;
	}

	public void setPoboxPostalCode(String poboxPostalCode) {
		this.poboxPostalCode = poboxPostalCode;
	}

	public String getPobox() {
		return pobox;
	}

	public void setPobox(String pobox) {
		this.pobox = pobox;
	}

	public String getAddressDescription() {
		return addressDescription;
	}

	public void setAddressDescription(String addressDescription) {
		this.addressDescription = addressDescription;
	}

	public Integer getTypeOfRelation() {
		return typeOfRelation;
	}

	public void setTypeOfRelation(Integer typeOfRelation) {
		this.typeOfRelation = typeOfRelation;
	}

	public String getNameOfRelation() {
		return nameOfRelation;
	}

	public void setNameOfRelation(String nameOfRelation) {
		this.nameOfRelation = nameOfRelation;
	}

	public ArrayList<HashMap<String, String>> getCommunication() {
		return communication;
	}

	public void setCommunication(ArrayList<HashMap<String, String>> communication) {
		this.communication = communication;
	}

	public String getTask() {
		return task;
	}

	public void setTask(String task) {
		this.task = task;
	}

	public Integer getParentClass() {
		return parentClass;
	}

	public void setParentClass(Integer parentClass) {
		this.parentClass = parentClass;
	}
}
