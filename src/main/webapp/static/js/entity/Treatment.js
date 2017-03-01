'use strict';
var entityModule = angular.module('entityModule',[]);
entityModule.factory('EntityService', ['$http', '$q', function($http, $q){

    var entityRec = {
        name   :'Treatment',
        record :{id:{treatmentId:'',patientId:''} , patientName:'', treatmentMainType:'', treatmentSubType:'',treatmentDesc:'', treatmentStat:'', treatmentPaidStat:'', treatmentDate:'',treatmentAmount:'',treatmentDiscount:'',treatmentTotal:'',treatmentPaid:'',treatmentImage:null,objid:null},
        emptyRecord :emptyRecord,
        lov :{id:{patientId: 'Patient',treatmentId: 'Treatment'},mttId:'MainTreatmentType',sttId:'SubTreatmentType'},
        lovRecord:{patientId:{patientId:'',patientName:'',patientAddress:'',patientIdNo:'',patientContactNo:'',patientGender:''}, treatmentId:{id:{treatmentId:'',patientId:''} , treatmentMainType:'', treatmentSubType:'',treatmentDesc:'', treatmentStat:'', treatmentPaidStat:'', treatmentDate:'',treatmentAmount:'',treatmentDiscount:'',treatmentTotal:'',treatmentPaid:''}},
        lovTitles :{patientId: 'Patient',treatmentId: 'Treatment',mttId: 'Main Treatment Type',sttId: 'Sub Treatment Type'},
        lovHeads :{patientId:{patientId:'Id',patientName:'Name',patientAddress:'Address',patientIdNo:'ID No',patientContactNo:'Contact No',patientGender:'Gender'}}
    };
    return entityRec;
    
    function emptyRecord() {
        return {id:{treatmentId:'',patientId:''} ,patientName:'', treatmentMainType:'', treatmentSubType:'',treatmentDesc:'', treatmentStat:'', treatmentPaidStat:'', treatmentDate:'',treatmentAmount:'',treatmentDiscount:'',treatmentTotal:'',treatmentPaid:'',treatmentImage:null,objid:null};
    }	
}]);

