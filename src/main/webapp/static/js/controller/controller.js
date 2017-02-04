'use strict';
 
angular.module('generalModule').controller('RecordController', ['$scope', 'RecordService','EntityService', '$location','$http','$compile', function($scope, RecordService,EntityService,$location,$http,$compile) {
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
    self.validateRecords = validateRecords;
    self.validate;
    self.ValRecord;
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
    self.lovDataRecord = [];
    self.lovClose = lovClose;
    self.setLovValue = setLovValue;
    self.lovTitle;
    self.lovSearch = lovSearch;
    self.lovSearchClose = lovSearchClose;
    self.recordHasValue = recordHasValue;
    self.fetchAllRecords =fetchAllRecords;
    self.setPanelHeader = setPanelHeader;
    self.clearImage=clearImage;
    self.smartBind = smartBind;
    self.populatePageFromRecord = populatePageFromRecord;

    self.today = new Date();
 
    function populateRecord(objid){
    	edit(objid);
    	populatePage(self.Record);
    	
    }
    function populatePageFromRecord(objid){
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
            null,
            function(errResponse){
                console.error('Error while updating Record');
            }
        );
    }
 
    function deleteRecord(objid){
        /**/
    	var retVal = confirm("Do you want to remove the record ?");
        if( retVal == true ){
        	RecordService.deleteRecord(objid)
            .then(
            		searchRecords,
            function(errResponse){
                console.error('Error while deleting Record');
            }
        );
        }
    }
 
    function deleteRecordWithFetch(objid){
        /**/
    	var retVal = confirm("Do you want to remove the record ?");
        if( retVal == true ){
        	RecordService.deleteRecord(objid)
            .then(
            		fetchAllRecords,
            function(errResponse){
                console.error('Error while deleting Record');
            }
        );
        }
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
    
    function validateRecords(entity, keys,sourceList,destList){
      
    	if (entity !== undefined)
		{
	    	var current_url = $location.absUrl();
	    	var base_url = current_url.substr(0, current_url.indexOf('Dental')+7);
	    	var valUrl = base_url + entity + '/GetByKeys/';  
	    	$http.post(valUrl,keys)
	        .then(
		        function (response) {
		        	self.ValRecord = response.data;
		        	for(var i = 0; i < sourceList.length; i++){
		                self.Record[destList[i]] =self.ValRecord[sourceList[i]] ;
		            }
		        },
		        function(errResponse){
		            console.error('Error while fetching Records');
		        }
	        );
		}
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
 
    function remove(objid,fetchAll){
        console.log('id to be deleted', objid);
        if(self.Record.objid === objid) {//clean form if the Record to be deleted is shown there.
            reset();
        }
        if(fetchAll === 'true')
        	{deleteRecordWithFetch(objid)}
        else
        	{deleteRecord(objid);}
        
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
    	var count = 0;
    	var isLovField;
    	var obj;
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
	    	self.LovRecords = [];
	    	document.getElementById("lov").style.display = "none";
	    	//document.getElementById("kan").style.display = "none";
	    	var lovField = Reflect.get(EntityService.lov, self.lastFocused.id);
	    	var current_url = $location.absUrl();
	    	var base_url = current_url.substr(0, current_url.indexOf('Dental')+7);
	    	var lovUrl = base_url + isLovField + '/';  
	    	//$http.get(lovUrl)
	    	mergeRecAndLovRec(self.Record, self.lovRecord);
	    	$http.post(lovUrl+"Search/", self.lovRecord[self.lastFocused.id])
	    	.then(
		        function (response) {
		        	//self.LovRecords = response.data;
		        	for (var key0 in response.data)
	        		{
		        		self.lovDataRecord = [];
		        		for(var key1 in response.data[key0])
	        			{
			        		if ((response.data[key0][key1] instanceof Object) && (key1 === "id"))
		        			{
			        			for (var key3 in response.data[key0][key1])
		        				{
			        				self.lovDataRecord[key3] = response.data[key0][key1][key3];
			        				if(count === 0)
			        				{
				        				self.LovColumsHeads.push(key3);
			        				}
		        				}
		        			}
			        		else
		        			{
			        			var obj = new Object();
			        			obj[key1] = response.data[key0][key1];
			        			self.lovDataRecord[key1] = response.data[key0][key1];
			        			if(count === 0)
		        				{
			        				self.LovColumsHeads.push(key1);
		        				}
		        			}
	        			}
		        		self.LovRecords.push(self.lovDataRecord);
		        		count++;
	        		}
		        	/*for (var key in self.LovRecords[0])
	        		{
	        			if (self.LovRecords[0].hasOwnProperty(key) && typeof self.LovRecords[0][key] !== 'function'){
	        				if (key != 'objid')
	    					{
	        					self.LovColumsHeads.push(key);
	    					}
	        			}
	        		}*/
		        },
		        function(errResponse){
		            console.error('Error while fetching Records');
		        }
	        );
	    	document.getElementById("lov").style.display = "block";
		}
    }
    
    
    function mergeRecAndLovRec(Record, lovRecord)
    {
    	for(var fld in Record)
		{
    		if (Record[fld] instanceof Object)
    		{ 
    			mergeRecAndLovRec(Record[fld], lovRecord);
    		}
    		else
			{
    			merge(Record, lovRecord, fld);
    			/*for(var lovFld in lovRecord)
				{
    				if(!lovRecord[lovFld] instanceof Object)
    				{
    					if (lovFld === fld)
						{
    						lovRecord[lovFld] = Record[lovFld];
						}
    				}
    				else
					{
    					for(var lovFld2 in lovRecord[lovFld])
						{
    						if(lovFld2 === fld)
							{
    							lovRecord[lovFld][lovFld2] = Record[lovFld];
							}
						}
					}
				}*/
			}
		}
    }
    
    function merge(Record, lovRecord, fld)
    {
    	for(var lovFld in lovRecord)
		{
			if(!(lovRecord[lovFld] instanceof Object))
			{
				if (lovFld === fld)
				{
					lovRecord[lovFld] = Record[lovFld];
				}
			}
			else
			{
				//for(var lovFld2 in lovRecord[lovFld])
				//{
					merge(Record, lovRecord[lovFld], fld);
					/*if(lovFld2 === fld)
					{
						lovRecord[lovFld][lovFld2] = Record[lovFld];
					}*/
				//}
			}
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
								if (self.Record[key]  !== undefined)
								{
									self.Record[key] = lovRecord[key];
								}
								else
								{
									document.getElementById(key).value = lovRecord[key];
								}
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
    
    function lovSearch()
    {
    	lovClose();
    	smartBind();
    	document.getElementById("kan").style.display = "block";
    }
    
    function lovSearchClose()
    {
    	document.getElementById("kan").style.display = "none";
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
    
    function smartBind()
    {
    	var stmt;
    	var rec = {};
    	rec = self.lovRecord[self.lastFocused.id];
    	stmt = "<div id='myModal'>" +
				"<div class = 'modal-content'>" +
				"<div class='modal-header'>" +
				"<span class='close' id='lovClose' onclick='ctrl.lovSearchClose()'>&times;</span>" +
				"<h2>{{"+self.lovTitle+"}} - Search</h2>"+
				"</div>" +
				"<table class='table table-hover'>";
    	for (var fld in rec)
		{
    		stmt += 	"<tr>" +
						"<td>"+
						"<span> "+fld+": </span>" +
						"<span><input type='text' ng-model='ctrl.lovRecord."+self.lastFocused.id+"."+fld+"' style='width: 100%'/></span>"+
						"</td>" +
						"</tr>";
		}
    	stmt +="</table>" +
		    	"</div>" +
		        "</div>";
    	//stmt = $compile(stmt)($scope);
    	//return 'ctrl.lovRecord.patientId.'+a;
    	document.getElementById("kan").innerHTML = stmt;
    	/*var injector = $('[ng-app]').injector();
    	var $compile = injector.get('$compile');
    	var $rootScope = injector.get('$rootScope');
    	$compile(self.$el)($rootScope);
    	$rootScope.$digest();*/
    }
 
}]);