<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    
    <script type="text/javascript">
        function populatePage(Record) 
        {
           /* if (parent.document.all.f1)
                alert("resultFrame found X1");
            else
                alert("resultFrame NOT found X2");*/

            if (typeof (parent.document.getElementById("f1").contentWindow.populate) == "function")
            	parent.document.getElementById("f1").contentWindow.populate(Record.patientId);
            else
                alert("f1.Reset NOT found X3");
        }    

    </script>
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
 
      .patientName.ng-valid {
          background-color: lightgreen;
      }
      .patientName.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .patientName.ng-dirty.ng-invalid-email {
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
    <script src="webjars/angularjs/1.5.8/angular.js"></script>
    <script src="<c:url value='/static/js/app.js' />"></script>
    <script src="<c:url value='/static/js/service/service.js' />"></script>
    <script src="<c:url value='/static/js/controller/controller.js' />"></script>
    <script src="<c:url value='/static/js/filter/filter.js' />"></script>
    <script src="<c:url value='/static/js/entity/Patient.js' />"></script>
      <script src="webjars/angularjs/1.5.8/angular.js"></script>
      <script src="webjars/angularjs/1.5.8/angular-animate.min.js"></script>
      <script src="webjars/angularjs/1.5.8/angular-aria.min.js"></script>
      <script src="webjars/angularjs/1.5.8/angular-messages.min.js"></script>
      <script src="webjars/angular-material/1.1.1/angular-material.min.js"></script>
</head>
<body ng-app="generalModule" class="ng-cloak">
      <div id="con1" class="generic-container" data-ng-controller="RecordController as ctrl" ng-init="ctrl.init()">
           
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Patients</span></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" ng-model="ctrl.Record.objid" /> 

						<div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="patientName">Patient Name</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Record.patientName" id="patientName" class="patientName form-control input-sm" placeholder="Enter Patient Name " required ng-minlength="1"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.patientName.$error.required">This is a required field</span>
                                      <span ng-show="myForm.patientName.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="patientAddress">Address</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Record.patientAddress" id="patientAddress" class="patientAddress form-control input-sm" placeholder="Enter Address"/>
                              	  <div class="has-error" ng-show="myForm.$dirty">
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="patientIdNo">Id No</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Record.patientIdNo" id="patientIdNo" class="patientIdNo form-control input-sm" placeholder="Enter Id No" />
                              	  <div class="has-error" ng-show="myForm.$dirty">
                
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="patientBirthDate">Birth Date</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Record.patientBirthDate" id="patientBirthDate" class="patientBirthDate form-control input-sm" placeholder="Enter Birth Date"/>
                              	  <div class="has-error" ng-show="myForm.$dirty">
                                      
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="patientContactNo">Contact No</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Record.patientContactNo" id="patientContactNo" class="patientContactNo form-control input-sm" placeholder="Enter Contact No" />
                              	  <div class="has-error" ng-show="myForm.$dirty">
                                      
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
                          </div>
                      </div>
                  </form>
              </div>
          
          <div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">List of Patients </span></div>
              <div class="tablecontainer">
                  <table id="tableId" class="table table-hover">
                      <thead>
                          <tr>
                              <th>Patient Name</th>
                              <th>Address</th>
                              <th>Id No</th>
                              <th>Birth Date</th>
                              <th>Contact No</th>
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="u in ctrl.Records | startFrom:ctrl.currentPage*ctrl.pageSize | limitTo:ctrl.pageSize" ng-click="ctrl.populateRecord(u.objid)" >
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.patientName"></span></td>
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.patientAddress"></span></td>
                              
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.patientIdNo"></span></td>
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.patientBirthDate"></span></td>
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.patientContactNo"></span></td>
                                                                                          
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.patientName"style="width: 100%"/></td>
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.patientAddress" style="width: 100%""/></td>
                              
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.patientIdNo" style="width: 100%""/></td>
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.patientBirthDate" style="width: 100%""/></td>
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.patientContactNo" style="width: 100%""/></td>
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
                 <!--  <input type="text" ng-model="ctrl.Records[1].salesPartId"/>
                  ctrl.Record = ctrl.Records[1]
                              <input type="text" ng-model="u.patientAddress"/>
                              <input type="text" ng-model="u.invPartNo"/>
                              <input type="text" ng-model="u.invConversionFactor"/>
                             <input type="text" ng-model="u.uom"/>
                              <input type="text" ng-model="u.priceCategory"/>
                              <input type="text" ng-model="u.generalCategory"/>
                              <input type="text" ng-model="u.objid"/>
                              <td> {{$index}} </td> -->
              </div>
          </div>
      </div>
	</body>
</html>