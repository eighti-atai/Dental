angular.module('generalModule').directive('unterLov', function(){
	return {
		template:   "<div id='myModal'>" +
					"<div class = 'modal-content'>" +
					"<div class='modal-header'>" +
					" <span class='close' id='lovClose' ng-click='ctrl.lovClose()'>&times;</span>" +
					"<h2>{{ctrl.lovTitle}}</h2>"+
					"</div>" +
					"<table class='table table-hover'>" +
					"<thead>" +
					"<tr>" +
					"<th ng-repeat='k in ctrl.LovColumsHeads'>" +
					"<span ng-bind='k'></span>" +
					"</th>" +
					"</tr>" +
					"</thead>" +
					"<tbody>" +
					"<tr ng-repeat='u in ctrl.LovRecords' ng-click='ctrl.setLovValue(u)'>" +
					"<td ng-repeat='a in ctrl.LovColumsHeads'>"+
					"<span ng-bind='u[a]'></span>" +
					"</td>" +
					"</tr>" +
                    "</tbody>" +
                   "</table>" +
                   "</div>" +
                   "</div>"
	};
});