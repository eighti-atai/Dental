
'use strict';
var entityModule = angular.module('entityModule',[]);
entityModule.factory('EntityService', ['$http', '$q', function($http, $q){
    var entityRec = {
        name   :'AppointmentsDate',
        record :{appointmentId:'',patientId:null,appointmentDate:null,appointmentTime:'',appointmentEndTime:'',doctor:null,code:'',objid:null},
        recordSearch :{appointmentId:'',patientId:null,appointmentDate:null,appointmentTime:'',appointmentEndTime:'',doctor:null,code:'',objid:null},
        emptyRecord :emptyRecord,
    };
    return entityRec;
    
    function emptyRecord() {
        return {appointmentId:'',patientId:null,appointmentDate:null,appointmentTime:'',appointmentEndTime:'',doctor:null,code:'',objid:null};
    }
    
}]);/**
 * 
 */

