'use strict';
var entityModule = angular.module('entityModule',[]);
entityModule.factory('EntityService', ['$http', '$q', function($http, $q){

    var entityRec = {
        name   :'SubTreatmentType',
        record :{id:{sttId:'',mttId:''} , treatmentName:'', treatmentAmount:'', objid:null},
        emptyRecord :emptyRecord
    };
    return entityRec;
    
    function emptyRecord() {
        return {id:{sttId:'',mttId:''} , treatmentName:'', treatmentAmount:'', objid:null};
    }	
}]);

