<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="false" %>
<html>
<head>
<title>Inventory Part</title>   
</head> 
<body>
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
    <script src="<c:url value='/static/js/entity/InventoryPart.js' />"></script>
    <script src="<c:url value='/static/js/directives/unterLov.js' />"></script>
</head>
<body>
	<body ng-app="generalModule" class="ng-cloak">
      <div class="generic-container" data-ng-controller="RecordController as ctrl" ng-init="ctrl.init()">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Inventory Parts</span></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                  	  <div id="lov" unter-lov class = "lov"></div>	
                      <input type="hidden" ng-model="ctrl.Record.objid" /> 
					  
					  <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="category">Category</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Record.category" id="category" class="category form-control input-sm" placeholder="Enter/Select from lov." required ng-focus="ctrl.setFocusedElement()"/>
                              </div>
                          </div>
                      </div>
                      
					  <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="invPartNo">Inventory Part No</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Record.invPartNo" id="invPartNo" class="invPartNo form-control input-sm" placeholder="Enter Inventory Part No." required/>
                              	  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.invPartId.$error.required">This is a required field</span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="description">Description</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Record.description" id="description" class="description form-control input-sm" placeholder="Enter Location Type." required/>
                              	  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.description.$error.required">This is a required field</span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="reorderLevel">Reorder Level</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Record.reorderLevel" id="reorderLevel" class="reorderLevel form-control input-sm" placeholder="Enter reorder level."/>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="description">Safety Stock Level</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Record.safetyStockLevel" id="safetyStockLevel" class="safetyStockLevel form-control input-sm" placeholder="Enter safety stock level."/>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="uomId">UoM</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Record.uomId" id="uomId" class="uomId form-control input-sm" placeholder="Enter Location Type."/>
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
              <div class="panel-heading"><span class="lead">List of Inventory Locations </span></div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>Inventory Part No</th>
                              <th>Description</th>
                              <th>UoM</th>
                              <th>Reorder Level</th>
                              <th>Safety Stock Level</th>
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="u in ctrl.Records | startFrom:ctrl.currentPage*ctrl.pageSize | limitTo:ctrl.pageSize " >
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.invPartNo"></span></td>
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.category"></span></td>
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.description"></span></td>
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.uomId"></span></td>
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.reorderLevel"></span></td>
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.safetyStockLevel"></span></td>
                                                                                          
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.invPartNo" style="width: 100%""/></td>
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.category" style="width: 100%""/></td>
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.description"style="width: 100%""/></td>
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.uomId"style="width: 100%"/></td>
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.reorderLevel" style="width: 100%""/></td>
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model=u.safetyStockLevelstyle="width: 100%""/></td>
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