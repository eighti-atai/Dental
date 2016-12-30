'use strict';
var entityModule = angular.module('entityModule',[]);
entityModule.factory('EntityService', ['$http', '$q', function($http, $q){

    var entityRec = {
        name   :'Treatment',
        record :{key:{treatmentId:'',patientId:''} , treatmentMainType:'', treatmentSubType:'',treatmentImage:null,objid:null},
        emptyRecord :emptyRecord
    };
    return entityRec;
    
    function emptyRecord() {
        return {key:{treatmentId:'',patientId:''} , treatmentMainType:'', treatmentSubType:'',treatmentImage:null,objid:null};
    }	
}]);/**
 * 
 */

