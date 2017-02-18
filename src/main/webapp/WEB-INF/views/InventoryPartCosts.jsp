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
    <script src="<c:url value='/static/js/entity/InventoryPartCost.js' />"></script>
</head>
<body ng-app="generalModule" class="ng-cloak">
      <div class="generic-container" data-ng-controller="RecordController as ctrl" ng-init="ctrl.init()">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Inventory Part Costs</span></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                  <div id="lov" unter-lov class = "lov"></div>
                      <input type="hidden" ng-model="ctrl.Record.objid" /> 
					  
					  					  
					  <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="invPartNo">Inventory Part No</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Record.id.invPartNo" id="invPartNo" class="salesPartId form-control input-sm" placeholder="Enter Inventory Part No " required ng-minlength="1" ng-focus="ctrl.setFocusedElement()"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.invPartNo.$error.required">This is a required field</span>
                                      <span ng-show="myForm.invPartNo.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.invPartNo.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="invPartCostNo">Inventory Part Cost No</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Record.id.invPartCostNo" id="invPartCostNo" class="description form-control input-sm" placeholder="Enter Inventory Part Cost No." required/>
                              	  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.invPartCostNo.$error.required">This is a required field</span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                       <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="cost">Cost</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Record.cost" id="cost" class="description form-control input-sm" placeholder="Enter Cost." required/>
                              	  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.cost.$error.required">This is a required field</span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="quantity">Quantity</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Record.quantity" id="quantity" class="description form-control input-sm" placeholder="Enter Quantity." required/>
                              	  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.quantity.$error.required">This is a required field</span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.Record.objid ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                              <button type="button" ng-click="ctrl.updateAll()" class="btn btn-warning btn-sm" >Save All</button>
                              <button type="button" ng-click="ctrl.searchRecords()" class="btn btn-warning btn-sm" >Search</button>
                          	  <button type="button" ng-click="ctrl.ListOfValues()" class = "btn btn-warning btn-sm">List...</button>
                          </div>
                      </div>
                  </form>
              </div>
          </div>
                      
                      
		<div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">List of Inventory Part Costs </span></div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                          	  <th>Site Id</th>
                              <th>Inventory Part No</th>
                              <th>Inventory Part Cost No</th>
                              <th>Cost</th>
                              <th>Quantity</th>
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="u in ctrl.Records | startFrom:ctrl.currentPage*ctrl.pageSize | limitTo:ctrl.pageSize " >
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.id.invPartNo"></span></td>
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.id.invPartCostNo"></span></td>
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.cost"></span></td>
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.quantity"></span></td>
                                   
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.id.invPartNo"style="width: 100%"/></td>
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.id.invPartCostNo" style="width: 100%""/></td>
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.cost"style="width: 100%""/></td>
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.quantity"style="width: 100%""/></td>
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