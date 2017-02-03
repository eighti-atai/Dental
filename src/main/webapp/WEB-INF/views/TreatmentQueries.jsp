<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
<title>ATAI</title>
	<style>
	/*html
	{
	    position: relative;
	    min-width: 300px;
	    min-height: 500px;
	    height: 100%;
	}*/
	
	/**
	 *     Set the body as a 1024 x 768 rectangle in center of the screen
	 */
	/*body
	{
	
	    position:                        absolute;
	    height:                             500px;
	    width:                            300px;
	}*/

	::-webkit-input-placeholder { /* WebKit browsers */
	    text-transform: none;
	}
	:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
	    text-transform: none;
	}
	::-moz-placeholder { /* Mozilla Firefox 19+ */
	    text-transform: none;
	}
	.pwCanvasPaint canvas:first-child {
    	box-shadow: 2px 2px 8px rgba(0,0,0,0.1), -1px -1px 4px rgba(0,0,0,0.1);
        -webkit-box-shadow: 2px 2px 8px rgba(0,0,0,0.1), -1px -1px 4px rgba(0,0,0,0.1);
     }
     .pwColorSelector {
        list-style: none;
     }
     .pwColor {
        display: inline-block;
        border-radius: 50%;
        width: 30px;
        height: 30px;
        margin-right: 5px;
        border: 2px solid transparent;
	}
      	.pwColor.active {
        transform: scale(1.1);
        -webkit-transform: scale(1.1);
        box-shadow: 2px 3px 2px rgba(0,0,0,0.2);
        -webkit-box-shadow: 2px 3px 2px rgba(0,0,0,0.2);
	}
      	.lineWidthSelector {
        width: 100%;
    }
   	.undo {
        margin-top: 20px;
    }
   	.undo > button {
        background-color: orange;
        color: white;
        border: none;
        padding: 10px;
        border-radius: 4px;
    }
   	.undo > button[disabled] {
        background-color: #aaa;
    }
	.salesPartId.ng-valid {
        background-color: lightgreen;
    }
   	.salesPartId.ng-dirty.ng-invalid-required {
        background-color: red;
    }
   	.salesPartId.ng-dirty.ng-invalid-minlength {
        background-color: yellow;
    }

   	.patientAddress.ng-valid {
        background-color: lightgreen;
    }
   	.patientAddress.ng-dirty.ng-invalid-required {
        background-color: red;
    }
   	.patientAddress.ng-dirty.ng-invalid-email {
        background-color: yellow;
    }
	.invPartNo.ng-valid {
        background-color: lightgreen;
    }
   	.invPartNo.ng-dirty.ng-invalid-required {
        background-color: red;
    }
   	.invPartNo.ng-dirty.ng-invalid-minlength {
        background-color: yellow;
    }

    .invConversionFactor.ng-valid {
        background-color: lightgreen;
    }
    .invConversionFactor.ng-dirty.ng-invalid-required {
        background-color: red;
    }
    .invConversionFactor.ng-dirty.ng-invalid-email {
        background-color: yellow;
    }
    .uom.ng-valid {
        background-color: lightgreen;
    }
    .uom.ng-dirty.ng-invalid-required {
        background-color: red;
    }
    .uom.ng-dirty.ng-invalid-minlength {
        background-color: yellow;
    }
 
    .priceCategory.ng-valid {
        background-color: lightgreen;
    }
    .priceCategory.ng-dirty.ng-invalid-required {
        background-color: red;
    }
    .priceCategory.ng-dirty.ng-invalid-email {
        background-color: yellow;
    }
    
     .generalCategory.ng-valid {
        background-color: lightgreen;
    }
    .generalCategory.ng-dirty.ng-invalid-required {
        background-color: red;
    }
    .generalCategory.ng-dirty.ng-invalid-email {
        background-color: yellow;
    }

    </style>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
    <link rel="stylesheet" href="webjars/angular-material/1.1.1/angular-material.min.css">
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/bootstrap-datepicker.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/jquery.timepicker.css' />" rel="stylesheet"></link>
    
    <script src="webjars/angularjs/1.5.8/angular.js"></script>
    <script src="webjars/angularjs/1.5.8/angular-sanitize.js"></script>
    <script src="webjars/jquery/2.1.4/jquery.min.js"></script>    
    <script src="<c:url value='/static/js/app.js' />"></script>
    <script src="<c:url value='/static/js/service/service.js' />"></script>
    <script src="<c:url value='/static/js/controller/controller.js' />"></script>
    <script src="<c:url value='/static/js/filter/filter.js' />"></script>
    <script src="<c:url value='/static/js/entity/TreatmentsQueries.js' />"></script>   
    <script src="<c:url value='/static/js/other/bootstrap-datepicker.js' />"></script>
    <script src="<c:url value='/static/js/other/jquery.timepicker.js' />"></script>
    <script src="<c:url value='/static/js/other/angular-canvas-painter.js' />"></script>
	<script src="webjars/angularjs/1.5.8/angular-animate.min.js"></script>
    <script src="webjars/angularjs/1.5.8/angular-aria.min.js"></script>
    <script src="webjars/angularjs/1.5.8/angular-messages.min.js"></script>
    <script src="webjars/angular-material/1.1.1/angular-material.min.js"></script>
      
    <script type="text/javascript">
    	
        function populate(patientId) 
        {
     	   var scope = angular.element(document.getElementById("con3")).scope();
     	  	scope.ctrl.Record = {id:{treatmentId:'',patientId:''} , treatmentMainType:'', treatmentSubType:'',treatmentDesc:'', treatmentStat:'', treatmentPaidStat:'', treatmentDate:'',treatmentAmount:'',treatmentDiscount:'',treatmentTotal:'',treatmentPaid:'',treatmentImage:null,objid:null};
            scope.ctrl.Record.id.patientId = patientId;
            //scope.ctrl.setPanelHeader("Appointment - "+patientName);
            scope.$apply(scope.ctrl.searchRecords());
        }
    </script>
</head>
	<body ng-app="generalModule" class="ng-cloak">
    	<div id="con3" class="generic-container" data-ng-controller="RecordController as ctrl" ng-init="ctrl.init();ctrl.fetchAllRecords();">

          
          <div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">List of Treatments </span></div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>Treatment ID</th>
                              <th>Treatment Date</th>
                              <th>Main Type</th>
                              <th>Sub Type</th>
                              <th>Total Amount</th>
                              <th>Paid Amount</th>
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="u in ctrl.Records | startFrom:ctrl.currentPage*ctrl.pageSize | limitTo:ctrl.pageSize " ng-dblclick="ctrl.edit(u.objid)">
                               <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.id.treatmentId"></span></td>
                               <td ng-if="!ctrl.change(u.objid)"><span ng-bind="ctrl.setDate(u.objid, 'treatmentDate', u.treatmentDate)|date:yyyy/MM/dd"></span></td>
                               <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.treatmentMainType"></span></td>
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.treatmentSubType"></span></td> 
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.treatmentTotal"></span></td> 
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.treatmentPaid"></span></td> 
                              <td>
                              </td>
                          </tr>
                      </tbody>
                      
                  </table>
                  <button ng-disabled="ctrl.currentPage == 0" ng-click="ctrl.currentPage=ctrl.currentPage-1">
        			Previous
    			  </button>
    						{{ctrl.currentPage+1}}/{{ctrl.numberOfPages()}}
    			  <button ng-disabled="ctrl.currentPage >= ctrl.Records.length/ctrl.pageSize - 1" ng-click="ctrl.currentPage=ctrl.currentPage+1">
       						 	Next
    					  </button>
              </div>
          </div>
      </div>
	</body>
</html>