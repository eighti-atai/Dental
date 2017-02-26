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
    	
        function populate(patientId,treatmentId) 
        {
     	   var scope = angular.element(document.getElementById("con3")).scope();
     	  	scope.ctrl.Record = {id:{patientId:'', treatmentId:'', paymentNo:''},paymentDate:(new Date()), paymentType:'',paymentMethod:'',amount:'', chequeNo:'',chequeExpDate:'',chequeBank:'',objid:null};
            scope.ctrl.Record.id.patientId = patientId;
            scope.ctrl.Record.id.treatmentId = treatmentId;
            scope.ctrl.setPanelHeader("Payments - Patient ID: "+patientId+"Treatment ID: "+treatmentId);
            scope.$apply(scope.ctrl.searchRecords());
        }
    </script>
</head>
<body ng-app="generalModule" class="ng-cloak">
      <div id = "con3" class="generic-container" data-ng-controller="RecordController as ctrl" ng-init="ctrl.init();ctrl.setPanelHeader('Payment');">
           
          <div class="panel panel-default">
              <div class="panel-heading" ng-bind-html="panelHeader"></div>
              <div class="formcontainer">
              	  <!-- <md-content> -->
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                  	 <div id="lov" unter-lov class = "lov"></div>
<!--                   	 <div id="kan" unter-search class = "lov"></div> -->
					  <div id="kan" unter-search class = "lov"></div>
                      <input type="hidden" ng-model="ctrl.Record.objid" /> 
					  <input type="hidden" ng-model="ctrl.Record.id.patientId" id="patientId" class="salesPartId form-control input-sm" placeholder="Enter Patient ID " required ng-minlength="1" ng-focus="ctrl.setFocusedElement()"/>
					  <input type="hidden" ng-model="ctrl.Record.id.treatmentId" id="treatmentId" class="salesPartId form-control input-sm" placeholder="Enter Treatment ID " required ng-minlength="1" ng-focus="ctrl.setFocusedElement()"/>
					  <input type="hidden" ng-model="ctrl.Record.id.paymentNo" id="paymentNo" class="salesPartId form-control input-sm" placeholder="Enter Payment No "/>
						
<!--                       </div> -->
                      
                      <div class="row">
                          <div class="form-group col-xs-6">
                              <label class="col-xs-3 control-lable" for="amount">Amount</label>
                              <div class="col-xs-7">
                                  <input type="number" step="0.01" ng-model="ctrl.Record.amount" id="amount" class="salesPartId form-control input-sm" placeholder="Enter Amount " required ng-minlength="1"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.amount.$error.required">This is a required field</span>
                                      <span ng-show="myForm.amount.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.amount.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
<!--                       </div> -->
                      
<!--                       <div class="row"> -->
                          <div class="form-group col-xs-6">
                              <label class="col-xs-3 control-lable" for="paymentDate">Payment Date</label>
<!--                               <div class="col-xs-7">    ng-model="ctrl.myDate" -->
									<md-datepicker ng-model="ctrl.Record.paymentDate" md-placeholder="Enter date" required></md-datepicker>
<!--                                   <input type="date" ng-model="ctrl.Record.chequeExpDate" id="chequeExpDate" class="description form-control input-sm" placeholder="Enter Cheque Exp Date." required/> -->
<!--                               </div> -->
                          </div>
                      </div>
                      

                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.Record.objid ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" >Reset Form</button>
                              <button type="submit" ng-click="ctrl.printReport()" class="btn btn-warning btn-sm" >Print Invoice</button>
                          </div>
                      </div>
                  </form>
                  
                  <!-- </md-content> -->
              </div>
              
              <!--           </div> -->
          
          <div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">List of Payments </span></div>
              <div class="tablecontainer">
                  <table  id="tableId" class="table table-hover">
                      <thead>
                          <tr>
                          	  <th>Patient ID</th>
                          	  <th>Treatment ID</th>
                              <th>Payment No</th>
                              <th>Amount</th>
                              <th>Payment Date</th>
                              <!-- <th>Payment Type</th>
                              <th>Payment Method</th>
                              <th>Cheque No</th>
                              <th>Cheque Exp Date</th>
                              <th>Cheque Bank</th> -->
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="u in ctrl.Records | startFrom:ctrl.currentPage*ctrl.pageSize | limitTo:ctrl.pageSize " >
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.id.patientId"></span></td>
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.id.treatmentId"></span></td>
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.id.paymentNo"></span></td>
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.amount"></span></td>
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="ctrl.setDate(u.objid, 'paymentDate', u.paymentDate)|date:yyyy/MM/dd"></span></td>
                              <!-- <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.paymentType"></span></td>
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.paymentMethod"></span></td> -->
<!--                               <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.chequeNo"></span></td> -->
<!--                               <td ng-if="!ctrl.change(u.objid)"><span ng-bind="ctrl.setDate(u.objid, 'chequeExpDate', u.chequeExpDate)|date:yyyy/MM/dd"></span></td> -->
<!--                               <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.chequeBank"></span></td> -->
                              
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.id.patientId"style="width: 100%"/></td>
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.id.treatmentId"style="width: 100%"/></td>                                                            
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.id.paymentNo"style="width: 100%"/></td>
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.amount"style="width: 100%"/></td>
                              <td ng-if="ctrl.change(u.objid)"><md-datepicker ng-model="u.paymentDate"></md-datepicker></td>
                              <!-- <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.paymentType" style="width: 100%""/></td>
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.paymentMethod"style="width: 100%""/></td> -->
<!--                               <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.chequeNo"style="width: 100%""/></td> -->
<!--                               <td ng-if="ctrl.change(u.objid)"><md-datepicker ng-model="u.chequeExpDate"></md-datepicker></td> -->
<!--                               <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.chequeBank"style="width: 100%""/></td> -->
                              <!-- <td ng-if="ctrl.change(u.objid)"><input type="hidden" ng-model="u.objid" style="width: 80px;"/></td> -->
                              <td>
                              <button type="button" ng-click="ctrl.editRow(u.objid)" class="btn btn-success custom-width">Edit</button>  <button type="button" ng-click="ctrl.remove(u.objid)" class="btn btn-danger custom-width">Remove</button>
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