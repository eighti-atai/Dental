'use strict';
var entityModule = angular.module('entityModule',[]);
entityModule.factory('EntityService', ['$http', '$q', function($http, $q){

    var entityRec = {
        name   :'AppointmentsDate',
        record :{key:{appointmentId:'',patientId:''} ,appointmentDate:'',appointmentTime:'',objid:null},
        emptyRecord :emptyRecord
    };
    return entityRec;
    
    function emptyRecord() {
        return {key:{appointmentId:'',patientId:''},appointmentDate:'',appointmentTime:'',objid:null};
    }	
}]);/**
 * 
 */
