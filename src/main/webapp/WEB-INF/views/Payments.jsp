<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ATAI</title>
<style>
 .salesPartId.ng-valid {
          background-color: lightgreen;
      }
      .salesPartId.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .salesPartId.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }
 
      .description.ng-valid {
          background-color: lightgreen;
      }
      .description.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .description.ng-dirty.ng-invalid-email {
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
      
      p.ex1 {
    max-height: 50px;
    overflow: auto;
}

    </style>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
    <link rel="stylesheet" href="webjars/angular-material/1.1.1/angular-material.min.css"> 
    <script src="webjars/jquery/2.1.4/jquery.min.js"></script> 
	<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js""></script>  
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/bootstrap-datepicker.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/jquery.timepicker.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/lov.css' />" rel="stylesheet"></link>
    
    <script src="webjars/angularjs/1.5.8/angular.js"></script>
    <script src="webjars/angularjs/1.5.8/angular-sanitize.js"></script>
    <script src="<c:url value='/static/js/app.js' />"></script>
    <script src="<c:url value='/static/js/service/service.js' />"></script>
    <script src="<c:url value='/static/js/controller/controller.js' />"></script>
    <script src="<c:url value='/static/js/filter/filter.js' />"></script>
    <script src="<c:url value='/static/js/entity/Appointment.js' />"></script>
    <script src="<c:url value='/static/js/other/jquery.timepicker.js' />"></script>
    <script src="<c:url value='/static/js/other/angular-canvas-painter.js' />"></script>    
    <script src="<c:url value='/static/js/other/bootbox.min.js' />"></script>   
    <script src="webjars/angularjs/1.5.8/angular-animate.min.js"></script>
    <script src="webjars/angularjs/1.5.8/angular-aria.min.js"></script>
    <script src="webjars/angularjs/1.5.8/angular-messages.min.js"></script>
    <script src="webjars/angular-material/1.1.1/angular-material.min.js"></script>
    <script src="<c:url value='/static/js/directives/unterLov.js' />"></script>
    <script src="<c:url value='/static/js/directives/unterLovSearch.js' />"></script>
    <script src="<c:url value='/static/js/entity/Payment.js' />"></script>
    <script type="text/javascript">
    
	    function reloadPageFrom() 
	    {
	        if (typeof (parent.document.getElementById("f1").contentWindow.reloadPage) == "function")
	        	parent.document.getElementById("f1").contentWindow.reloadPage();
	        else
	            alert("f1.Reset NOT found X3");
	    } 
    	
        function populate(patientId,treatmentId) 
        {
        
        	
     	   var scope = angular.element(document.getElementById("con")).scope();
     	    //scope.ctrl.SearchRecord = scope.ctrl.emptyRecord();
     	   // alert('03 = '+treatmentId);
     	   if (patientId === null ){

     		 scope.ctrl.TmpRecord.id.patientId = null;
             scope.ctrl.TmpRecord.id.treatmentId = null;
             scope.ctrl.SearchRecord.id.patientId = -1;
             scope.$apply(scope.ctrl.searchRecords(scope.ctrl.SearchRecord));
     	   }
     	   else
     	   {
            scope.ctrl.SearchRecord.id.patientId = patientId;
            scope.ctrl.SearchRecord.id.treatmentId = treatmentId;
            scope.ctrl.TmpRecord.id.patientId = patientId;
            scope.ctrl.TmpRecord.id.treatmentId = treatmentId;
            scope.$apply(scope.ctrl.searchRecords(scope.ctrl.SearchRecord));
     	   }
            //scope.ctrl.Record.paymentDate= (new Date());
           // alert('03 = '+treatmentId);
        }
        
        setInterval(function() {
		    window.top.postMessage(document.body.scrollHeight + '-' + 'iframe2', "*");
		}, 500);
		
    </script>
</head>
<body ng-app="generalModule" class="ng-cloak">
	<div id="con" class="generic-container" data-ng-controller="RecordController as ctrl" ng-init="ctrl.MasterInit();">   
    <div class="generic-container">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form ng-submit="ctrl.submitRecords()">
                        	<div class="row">
                          
		                		<div class="col-md-12">
                                <input type="submit" class="btn btn-primary    btn-sm" value="Save"  ng-show ="ctrl.variableEditLineExist || ctrl.variableNewLineExist">
                                <input  type="button" class="btn btn-danger   btn-sm" ng-click="ctrl.deleteRecords()" value="Delete"  ng-show ="(!(ctrl.variableEditLineExist || ctrl.variableNewLineExist)) && ctrl.isRowSelected()">
                                <input type="button" class="btn btn-warning    btn-sm" ng-click="ctrl.AddRow()" value="New"  ng-show ="!(ctrl.variableEditLineExist || ctrl.variableNewLineExist)">
                                <input type="button" class="btn btn-warning    btn-sm" ng-click="ctrl.exitReadOnly('EditTable')" value="Edit"  ng-show ="(!(ctrl.variableEditLineExist || ctrl.variableNewLineExist)) && ctrl.isRowSelected()">
                                <input type="button" class="btn btn-warning    btn-sm" ng-click="ctrl.resetTable()" value="Cancel" ng-show ="ctrl.variableEditLineExist || ctrl.variableNewLineExist">
                            </div>
                            </div>
                            <div class="row">
                            </div>
                            <table id = "tb1" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" ng-model="selectedAll" ng-click="checkAll()" /></th>
                                        <!--<th>Main Treatment Type</th>-->
                                        <th>Payment Date</th>
                                        <th>Amount</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="u in ctrl.Records">
                                        <td>
                                            <input type="checkbox" ng-model="u.selected" ng-disabled="(u.objid != null) && (ctrl.variableEditLineExist || ctrl.variableNewLineExist)"/></td>
                                       <!--  <td>
                                            <input type="text" class="form-control" ng-model="u.id.mttId" ng-readonly="(u.objid != null)" required /></td> 
                                              <td>
                                            <input type="hidden" class="form-control" ng-model="u.id.patientId" ng-readonly="(u.objid != null)" /></td>
                                            <td>
                                            <input type="hidden" class="form-control" ng-model="u.id.treatmentId" ng-readonly="(u.objid != null)" /></td>
                                        <td>
                                            <input type="hidden" class="form-control" ng-model="u.id.paymentNo" ng-readonly="(u.objid != null)" /></td>-->
                                        <td ng-if="((u.objid != null)&&(ctrl.variableReadOnly ||((!ctrl.variableReadOnly) && (!u.selected))))">
                                            <input type="text" class="form-control" ng-model="ctrl.setDate(u.objid, 'paymentDate', u.paymentDate)|date:yyyy/MM/dd" ng-readonly="(u.objid != null)&&(ctrl.variableReadOnly ||((!ctrl.variableReadOnly) && (!u.selected)))" required/></td>
                                        <td ng-if="!((u.objid != null)&&(ctrl.variableReadOnly ||((!ctrl.variableReadOnly) && (!u.selected))))">
                                         	<md-datepicker ng-model="u.paymentDate"></md-datepicker></td>
                                        <td>
                                            <input type="text" class="form-control" ng-model="u.amount" ng-readonly="(u.objid != null)&&(ctrl.variableReadOnly ||((!ctrl.variableReadOnly) && (!u.selected)))" required/></td>   
                                    </tr>
                                </tbody>
                            </table>
							
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</body>
</html>