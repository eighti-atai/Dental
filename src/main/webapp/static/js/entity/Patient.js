'use strict';
var entityModule = angular.module('entityModule',[]);
entityModule.factory('EntityService', ['$http', '$q', function($http, $q){

    var entityRec = {
        name   :'Patient',
        record :{patientId:'',patientName:'',patientAddress:'',patientIdNo:'',patientBirthDate:'',patientContactNo:'',patientGender:'',objid:null},
        emptyRecord :emptyRecord
    };
    return entityRec;
    
    function emptyRecord() {
        return {patientId:'',patientName:'',patientAddress:'',patientIdNo:'',patientBirthDate:'',patientContactNo:'',patientGender:'',objid:null};
    }	
}]);/**
 * 
 */