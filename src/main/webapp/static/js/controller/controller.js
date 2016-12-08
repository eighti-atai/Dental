'use strict';
 
angular.module('generalModule').controller('RecordController', ['$scope', 'RecordService','EntityService', function($scope, RecordService,EntityService) {
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
    self.currentPage  = 0;
    self.pageSize  = 5;
    self.myDate = new Date();
 
 
    
 
    function init(){
    	self.Record= EntityService.record;
    	//self.EmptyRecord = angular.copy(EntityService.record);
    	RecordService.setRestServiceUri(EntityService.name);
    	fetchAllRecords();
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
            fetchAllRecords,
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
        reset();
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
 
}]);