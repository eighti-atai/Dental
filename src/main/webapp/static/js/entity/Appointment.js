'use strict';
var entityModule = angular.module('entityModule',[]);
entityModule.factory('EntityService', ['$http', '$q', function($http, $q){

    var entityRec = {
        name   :'Appointment',
        record :{id:{appointmentId:'',patientId:''} ,patient:{patientId:'',patientName:''},appointmentDate:'',appointmentTime:'',doctor:'',code:'',appointmentEndTime:'',objid:null},
        recordSearch :{id:{appointmentId:'',patientId:''} ,patient:{patientId:'',patientName:''},appointmentDate:'',appointmentTime:'',doctor:'',code:'',appointmentEndTime:'',objid:null},
        emptyRecord :emptyRecord,
        lov :{doctor: 'DoctorLov'},
        lovRecord:{doctor:{doctor:'',userName:''}, mttId:{mttId:'',mttName:'',mttDescription:''}},
        lovTitles :{doctor: 'Doctors',mttId: 'Main Treatment Type'} ,
        blurList : ['appointmentDate','appointmentTime','doctor']
    };
    return entityRec;
    
    function emptyRecord() {
        return {id:{appointmentId:'',patientId:''},patient:{patientId:'',patientName:''},appointmentDate:'',appointmentTime:'',doctor:'',code:'',appointmentEndTime:'',objid:null};
    }
    
}]);/**
 * 
 */
