'use strict';
 
angular.module('generalModule').factory('RecordService', ['$http', '$q', '$location', function($http, $q, $location){
 
    var REST_SERVICE_URI;
    var current_url;
    var base_url;
 
    var factory = {
    	setRestServiceUri:setRestServiceUri,
    	fetchAllRecords: fetchAllRecords,
        createRecord: createRecord,
        updateRecord:updateRecord,
        deleteRecord:deleteRecord,
        searchRecord:searchRecord,
    };
 
    return factory;
 
    function setRestServiceUri(entity) {
    	var deferred = $q.defer();
    	current_url = $location.absUrl();
    	base_url = current_url.substr(0, current_url.indexOf('Unter')+6);
    	REST_SERVICE_URI = base_url + entity +'/';   
    	
        return deferred.promise;
    }	
    
    function fetchAllRecords() {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetching Records');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
 
    function createRecord(Record) {
        var deferred = $q.defer();
        $http.post(REST_SERVICE_URI, Record)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while creating Record');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
 
 
    function updateRecord(Record, objid) {
    	 console.error('XXXXXXXXXXXXXXXXXXXXXX '+objid);
        var deferred = $q.defer();
        $http.put(REST_SERVICE_URI, Record)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while updating Record');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
 
    function deleteRecord(objid) {
        var deferred = $q.defer();
        $http.delete(REST_SERVICE_URI+objid)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while deleting Record');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    
    function searchRecord(Record) {
        var deferred = $q.defer();
        $http.post(REST_SERVICE_URI+"Search/", Record)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while creating Record');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
 
}]);