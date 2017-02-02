'use strict';
var entityModule = angular.module('entityModule',[]);
entityModule.factory('EntityService', ['$http', '$q', function($http, $q){

    var entityRec = {
        name   :'TreatmentQuery',
        record :{id:{treatmentId:'',patientId:''} , treatmentMainType:'', treatmentSubType:'',treatmentDesc:'', treatmentStat:'', treatmentPaidStat:'', treatmentDate:'',treatmentAmount:'',treatmentDiscount:'',treatmentTotal:'',treatmentPaid:'',treatmentImage:null,objid:null},
        emptyRecord :emptyRecord
    };
    return entityRec;
    
    function emptyRecord() {
        return {id:{treatmentId:'',patientId:''} , treatmentMainType:'', treatmentSubType:'',treatmentDesc:'', treatmentStat:'', treatmentPaidStat:'', treatmentDate:'',treatmentAmount:'',treatmentDiscount:'',treatmentTotal:'',treatmentPaid:'',treatmentImage:null,objid:null};
    }	
}]);

