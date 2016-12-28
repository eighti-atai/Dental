'use strict';
var entityModule = angular.module('entityModule',[]);
entityModule.factory('EntityService', ['$http', '$q', function($http, $q){

    var entityRec = {
        name   :'AttendPatient',
        record :{key:{attendPatientId:'',patientId:''} ,doctor:'',done:'',startTime:'',objid:null},
        emptyRecord :emptyRecord
    };
    return entityRec;
    
    function emptyRecord() {
        return {key:{attendPatientId:'',patientId:''} ,doctor:'',done:'',startTime:'',objid:null};
    }	
}]);/**
 * 
 */
