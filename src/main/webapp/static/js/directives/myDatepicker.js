
angular.module('generalModule', [])
.directive('myDatepicker', ['$timeout', function($timeout){
    return {
        restrict: 'A',      
        link: function(scope, elem, attrs){
            // timeout internals are called once directive rendering is complete
            $timeout(function(){                    
                $(elem).datePicker();
            });
        }
    };
}]);

