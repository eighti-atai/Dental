'use strict';
var entityModule = angular.module('entityModule',[]);
entityModule.factory('EntityService', ['$http', '$q', function($http, $q){

    var entityRec = {
        name   :'Appointment',
        record :{key:{appointmentId:'',patientId:''} ,appointmentDate:'',appointmentTime:'',objid:null},
        emptyRecord :emptyRecord,
        lov :{doctor: 'DoctorLov'},
        lovRecord:{doctor:{doctor:'',userName:''}},
        lovTitles :{doctor: 'Doctors'} 
    };
    return entityRec;
    
    function emptyRecord() {
        return {key:{appointmentId:'',patientId:''},appointmentDate:'',appointmentTime:'',objid:null};
    }	
}]);/**
 * 
 */
