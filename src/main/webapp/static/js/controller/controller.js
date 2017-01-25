'use strict';
 
angular.module('generalModule').controller('RecordController', ['$scope', 'RecordService','EntityService', '$location','$http', function($scope, RecordService,EntityService,$location,$http) {
    var self = this;
    
    self.Records=[];
    self.Rows=[];
    self.Record ;
    self.EmptyRecord;
    self.submit = submit;
    self.edit   = edit;
    self.remove = remove;
    self.reset  = reset;
    self.init   = init;
    self.change   = change;
    self.editRow   = editRow;
    self.updateAll = updateAll;
    self.searchRecords = searchRecords;
    self.numberOfPages = numberOfPages;
    self.entity = '';
    self.populateRecord = populateRecord;
    self.currentPage  = 0;
    self.pageSize  = 5;
    self.myDate = new Date();
    self.setDate = setDate;
    self.setFocusedElement = setFocusedElement;
    self.lastFocused;
    self.lov;
    self.lovTitles;
    self.lovRecord;
    self.ListOfValues = ListOfValues;
    self.LovRecords = [];
    self.LovColumsHeads = [];
    self.lovClose = lovClose;
    self.setLovValue = setLovValue;
    self.lovTitle;
    self.recordHasValue = recordHasValue;
    self.fetchAllRecords =fetchAllRecords;
    self.setPanelHeader = setPanelHeader;
    self.clearImage=clearImage;
 
    function populateRecord(objid){
    	edit(objid);
    	populatePage(self.Record);
    	
    }
 
    function init(){
    	self.Record= EntityService.record;
    	//self.EmptyRecord = angular.copy(EntityService.record);
    	RecordService.setRestServiceUri(EntityService.name);
    	//fetchAllRecords();
    	self.lov = EntityService.lov;
    	self.lovTitles = EntityService.lovTitles;
    	self.lovRecord = EntityService.lovRecord;
    	//setPanelHeader(title);
    }
    
    function fetchAllRecords(){
        RecordService.fetchAllRecords()
            .then(
            function(d) {
                self.Records = d;
            },
            function(errResponse){
                console.error('Error while fetching Records');
            }
        );
    }
 
    function createRecord(Record){
        RecordService.createRecord(Record)
            .then(
            		null,
            //fetchAllRecords,
            function(errResponse){
                console.error('Error while creating Record');
            }
        );
    }
 
    function updateRecord(Record, objid){
        RecordService.updateRecord(Record, objid)
            .then(
            fetchAllRecords,
            function(errResponse){
                console.error('Error while updating Record');
            }
        );
    }
 
    function deleteRecord(objid){
        RecordService.deleteRecord(objid)
            .then(
            fetchAllRecords,
            function(errResponse){
                console.error('Error while deleting Record');
            }
        );
    }
 
    function submit() {
        if(self.Record.objid===null){
            console.log('Saving New Record', self.Record);
            createRecord(self.Record);
        }else{
            updateRecord(self.Record, self.Record.objid);
            console.log('Record updated with id ', self.Record.objid);
        }

    }
     
    function searchRecords(){
        RecordService.searchRecord(self.Record)
            .then(
            function(d) {
                self.Records = d;
            },
            function(errResponse){
                console.error('Error while fetching Records');
            }
        );
    }
    
    function edit(objid){
        console.log('id to be edited', objid);
        for(var i = 0; i < self.Records.length; i++){
            if(self.Records[i].objid === objid) {
                self.Record = angular.copy(self.Records[i]);
                break;
            }
        }
    }
 
    function remove(objid){
        console.log('id to be deleted', objid);
        if(self.Record.objid === objid) {//clean form if the Record to be deleted is shown there.
            reset();
        }
        deleteRecord(objid);
    }
 
    function change(objid){
    	for(var i = 0; i < self.Rows.length; i++){
            if(self.Rows[i] === objid) {
                return true;
            }
        }
    	return false;
        
    }
 
    function editRow(objid){
    	self.Rows.push(objid);
    	return false;
    }
    
    function updateAll(){
        for(var j = 0; j < self.Rows.length; j++){
	        for(var i = 0; i < self.Records.length; i++){
	            if(self.Records[i].objid === self.Rows[j]) {
	                self.Record = angular.copy(self.Records[i]);
	                break;
	            }
	        }
	        updateRecord(self.Record, self.Rows[j]);
        }
        self.Rows = [];
        reset();
    }
    function reset(){
    	self.Record = EntityService.emptyRecord();
        $scope.myForm.$setPristine(); //reset Form
        
    }
    
    function numberOfPages() {
        return Math.ceil(self.Records.length/self.pageSize);                
    }
    
    function setDate(objid, field, value){
    	if(value===null)
    	{
    		return null;
    	}
    	else
    	{
	    	for(var i = 0; i < self.Records.length; i++){
		            if(self.Records[i].objid === objid) {
		               Reflect.set(self.Records[i], field, (new Date(value)));
		            }
		    }
	    	field = new Date(value);
	    	return field;
    	}
    	
    }
    
    function setFocusedElement()
    {
    	self.lastFocused = document.activeElement;
    }
    
    function recordHasValue(){
    	self.EmptyRecord = EntityService.emptyRecord();
    	if(self.Record === self.EmptyRecord)
		{
    		return false;
		}
    	return true; //reset Form
        
    }
    
    function ListOfValues()
    {
    	var isLovField;
    	for (var field in self.lov)
		{
    		if (!(self.lov[field] instanceof Object))
    		{    				
    			if (field === self.lastFocused.id)
				{
    				var isLovField = self.lov[self.lastFocused.id];
				}
			}
    		else
			{
    			for (var field2 in self.lov[field])
				{
    				if (field2 === self.lastFocused.id)
    				{
        				isLovField = self.lov[field][self.lastFocused.id];
    				}
				}
			}
		}
    	
    	if (isLovField !== undefined)
		{
    		self.lovTitle = self.lovTitles[self.lastFocused.id];
	    	self.LovColumsHeads = [];
	    	document.getElementById("lov").style.display = "none";
	    	var lovField = Reflect.get(EntityService.lov, self.lastFocused.id);
	    	var current_url = $location.absUrl();
	    	var base_url = current_url.substr(0, current_url.indexOf('Dental')+7);
	    	var lovUrl = base_url + isLovField + '/';  
	    	//$http.get(lovUrl)
	    	$http.post(lovUrl+"Search/", self.lovRecord[self.lastFocused.id])
	    	.then(
		        function (response) {
		        	self.LovRecords = response.data;
		        	for (var key in self.LovRecords[0])
	        		{
	        			if (self.LovRecords[0].hasOwnProperty(key) && typeof self.LovRecords[0][key] !== 'function'){
	        				if (key != 'objid')
	    					{
	        					self.LovColumsHeads.push(key);
	    					}
	        			}
	        		}
		        },
		        function(errResponse){
		            console.error('Error while fetching Records');
		        }
	        );
	    	document.getElementById("lov").style.display = "block";
		}
    }
    
    function lovClose()
    {
    	document.getElementById("lov").style.display = "none";
    }
    
    window.onclick = function(event) {
        if (event.target == document.getElementById("lov")) {
        	document.getElementById("lov").style.display = "none";
        }
    }
    
    function setLovValue(lovRecord)
    {
    	for (var key in lovRecord)
		{
			if (lovRecord.hasOwnProperty(key) && typeof lovRecord[key] !== 'function'){
				if (key != 'objid')
				{
					for (var field in self.lov)
					{
						if (key === self.lastFocused.id)
						{
							if (!(self.lov[field] instanceof Object))
							{
								//if (self.lov[self.lastFocused.id] === key)
								//{
									self.Record[key] = lovRecord[key];
								//}
							}
							else
							{
								//if (self.lov[field][self.lastFocused.id] === key)
								//{
									self.Record[field][key] = lovRecord[key];
								//}
							}
						}
					}
				}
			}
		}
    	document.getElementById("lov").style.display = "none";
    }
    
    $scope.$watch('ctrl.Record.objid', function (nval, oval) {
        if (oval !== nval) {
        	if (typeof (populatePage) == "function")
        	{
        		populatePage(self.Record);
        	}
        }
    });
    
    $scope.$watch('ctrl.Record.appointmentDate', function (nval, oval) {
        if (oval !== nval) {
        	if (typeof (populatePage) == "function")
        	{
        		populatePage(self.Record);
        	}
        }
    });
    
    function setPanelHeader(title)
    {
    	if (typeof ($scope.panelHeader) !== "undefine")
    	{
    		$scope.panelHeader = "<span class='lead'>"+title+"</span>"
    	}
    }
   
    function clearImage(){
        $scope.$broadcast('clearImage',{});
    }
 
}]);