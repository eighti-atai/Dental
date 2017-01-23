'use strict';
var entityModule = angular.module('entityModule',[]);
entityModule.factory('EntityService', ['$http', '$q', function($http, $q){

    var entityRec = {
        name   :'Payment',
        record :{id:{patientId:'', treatmentId:'', paymentNo:''},paymentDate:(new Date()), paymentType:'',paymentMethod:'',amount:'',chequeNo:'',chequeExpDate:'',chequeBank:'',objid:null},
        emptyRecord :emptyRecord,
        lov :{patientId: 'Patient',treatmentId: 'Treatment'},
        lovTitles :{patientId: 'Patient',treatmentId: 'Treatment'}
    };
    return entityRec;
    
    function emptyRecord() {
        return {id:{patientId:'', treatmentId:'', paymentNo:''},paymentDate:(new Date()), paymentType:'',paymentMethod:'',amount:'', chequeNo:'',chequeExpDate:'',chequeBank:'',objid:null};
    }	
}]);/**
 * 
 */