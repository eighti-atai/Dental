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
    <script src="webjars/jquery/2.1.4/jquery.min.js"></script>
  <!--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>-->
    
    
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/bootstrap-datepicker.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/jquery.timepicker.css' />" rel="stylesheet"></link>
    <script src="webjars/angularjs/1.5.8/angular.js"></script>
    
    <script src="<c:url value='/static/js/app.js' />"></script>
    <script src="<c:url value='/static/js/service/service.js' />"></script>
    <script src="<c:url value='/static/js/controller/controller.js' />"></script>
    <script src="<c:url value='/static/js/filter/filter.js' />"></script>
    <script src="<c:url value='/static/js/entity/Treatment.js' />"></script>
    
    <script src="<c:url value='/static/js/other/bootstrap-datepicker.js' />"></script>
    <script src="<c:url value='/static/js/other/jquery.timepicker.js' />"></script>
    <script src="<c:url value='/static/js/other/angular-canvas-painter.js' />"></script>

    
      <script src="webjars/angularjs/1.5.8/angular-animate.min.js"></script>
      <script src="webjars/angularjs/1.5.8/angular-aria.min.js"></script>
      <script src="webjars/angularjs/1.5.8/angular-messages.min.js"></script>
      <script src="webjars/angular-material/1.1.1/angular-material.min.js"></script>
     <!-- <script src="webjars/jquery/2.1.4/jquery.min.js"></script>-->
      
      <script type="text/javascript">
        function populate(patientId,treatmentMainType) 
        {
            //alert("reset (in f1) Z1 = "+patientId);
            // angular.element(document.getElementById('MainWrap')).scope().init();
            var scope = angular.element(document.getElementById("con")).scope();
            scope.ctrl.Record.key.patientId = patientId;
            scope.ctrl.Records.patient.treatmentMainType = treatmentMainType;
            scope.ctrl.Record.appointmentDate = null;
            scope.$apply(scope.ctrl.searchRecords());
            /*scope.$apply(function () {
            scope.init();*/
        }
            
        
    </script>
</head>
<body ng-app="generalModule" class="ng-cloak">
      <div id="con" class="generic-container" data-ng-controller="RecordController as ctrl" ng-init="ctrl.init()">
           
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Appointments</span></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" ng-model="ctrl.Record.objid" /> 

						 <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="treatmentId">Appointment ID</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Record.key.treatmentId" id="treatmentId" class="treatmentId form-control input-sm" placeholder="Enter Treatmnet ID " required ng-minlength="1"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.treatmentId.$error.required">This is a required field</span>
                                      <span ng-show="myForm.treatmentId.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      	</div> 
                      	<div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="patientId">Patient ID</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Record.key.patientId" id="patientId" class="patientId form-control input-sm" placeholder="Enter Patient ID " required ng-minlength="1"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.patientId.$error.required">This is a required field</span>
                                      <span ng-show="myForm.patientId.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      	</div> 
                      	<div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="treatmentMainType">Main Type</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Record.treatmentMainType" id="treatmentMainType" class="treatmentMainType form-control input-sm" placeholder="Enter Main Type " required ng-minlength="1"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.treatmentMainType.$error.required">This is a required field</span>
                                      <span ng-show="myForm.treatmentMainType.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      	</div> 
                      	<div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="treatmentSubType">Sub Type</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Record.treatmentSubType" id="treatmentSubType" class="treatmentSubType form-control input-sm" placeholder="Enter Sub Type " required ng-minlength="1"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.treatmentSubType.$error.required">This is a required field</span>
                                      <span ng-show="myForm.treatmentSubType.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      	</div> 
<!--                       	<div class="row"> -->
<!--                           <div class="form-group col-md-12"> -->
<!--                               <label class="col-md-2 control-lable" for="treatmentImage">Image</label> -->
<!--                               <div class="col-md-7"> -->
<!--                                   <input type="text" ng-model="ctrl.Record.treatmentImage" id="treatmentImage" class="treatmentImage form-control input-sm" placeholder="Enter Image " /> -->
<!--                                   <div class="has-error" ng-show="myForm.$dirty"> -->
<!--                                       <span ng-show="myForm.treatmentImage.$error.required">This is a required field</span> -->
<!--                                       <span ng-show="myForm.treatmentImage.$invalid">This field is invalid </span> -->
<!--                                   </div> -->
<!--                               </div> -->
<!--                           </div> -->
<!--                       	</div>  -->
                      	<div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="treatmentMainType">Doctor</label>
                              <div class="col-md-7">
                                  <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAZAAAAEsCAYAAADtt+XCAAALmUlEQVR4nO3dXXHrVhuA0dIwAomAjSAhYBNIEeQQSBEEQUogDIJACMzACMxA303b6fSTpXe/kb2laK2Zc78nPvET7T/91gNAwm+1BwDAOgkIACkCAkCKgACQIiAApAgIACkCAkCKgACQIiAApAgIACkCAkCKgACQIiAApAgIACkCAkCKgACQIiAApAgIACkCAkCKgACQIiAApAgIACkCAkCKgACQIiAApAgIACkCAkCKgACQIiAApAgIACkCAkCKgACQIiAApAgIACkCAkCKgACQIiAApAgIACkCAkCKgACQIiAApAgIACkCAkCKgACQIiAApAgIACkCAkCKgACQIiAApAgIACkCAkCKgACQIiAApAgIACkCAkCKgACQIiAApAgIACkCAkCKgACQIiAApAgIACkCAkCKgACQIiAApAgIACkCAkCKgACQIiAApAgIACkCAkCKgACQIiAApAgIACkCAkCKgACQIiAApAgIACkCAkCKgACQIiAApAgIACkCAkCKgACQIiAApAgIACkCAkCKgACQIiAApAgIACkCAkCKgACQIiAApAgIACkCAsym67r+dDr1bdv2bdv2p9Op77qu9rC4EwEBvu16vfa/fv3q27btd7vd//17f3+vPUTuQECAb+m67mY4/v3Pk8jPIyBAWjQeu92uPx6PtYfLzAQESLler+F47Ha7vm3b2kNmZgICpLy9vYXjsdvt+qZpag+ZmQkIkPL8/FwUEFNYP4+AACkl8bCI/jMJCJBSEg/beH8mAQGKXa/XcDy+vr5qD5c7ERCg2Pv7++SC+d87tPi5BAQoUrJ918L5zyYgQJGPj4/w9NXb21vt4XJHAsJDuWxv/V5eXsIBuVwutYfLHQkIDzM2b26Xznocj0dPH/R9LyA8SNd1k9dc/PHHH/5iXYHo08f1eq09VO5MQHiI6F+tbdv2f/75Z+3hMiIaEH4+AeEhSi7d2+12/a9fv2oPmRsEhL8JCA9REg/rIss1NRX597+np6faQ+UBBISHeHp6SkXEKeZl+fr6Cn1uzn9sg4DwEKVXf/97TcRi7HJMnUC3A2tbBISHuF6vfdM0qYj8/vvvtYfPX15fX00/8g8B4WG6rktHxFTWMkR30/m8tkFAeKjL5dK/vr4Wh+RwOJjK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">
                              </div>
                          </div>
                      </div>
<div pw-canvas
           version="ctrl.version" ng-model="ctrl.Record.treatmentImage"
           options="{undo: true, width: 400, height: 300, color: selectedColor, lineWidth: selectedLineWidth}"></div>
      <div pw-color-selector="['#000', '#9CB199', '#CF3759', '#485247', '#E77547', '#D38E47', '#0A6A74', '#153974']" color="selectedColor"></div>
      <input type="range" min="1" max="50" ng-model="selectedLineWidth" class="lineWidthSelector">{{selectedLineWidth}}

      <div class="undo">
        <button ng-click="ctrl.undo()"
                ng-disabled="ctrl.version < 1">Undo (Version {{ctrl.version}})</button>
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
              <div class="panel-heading"><span class="lead">List of Appointments </span></div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>Treatment ID</th>
                             <!--  <th>Patient ID</th> -->
                              <th>Main Type</th>
                              <th>Sub Type</th>
                              <th>Img</th>
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="u in ctrl.Records | startFrom:ctrl.currentPage*ctrl.pageSize | limitTo:ctrl.pageSize " >
                               <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.key.treatmentId"></span></td>
                               <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.treatmentMainType"></span></td>
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.treatmentSubType"></span></td> 
<!--                               <td><img ng-src="data:image/png;base64,u.treatmentImage"></img></td>   -->
<!--                               <td><img src="data:image/png;base64,></img></td -->
<!--                               <td ng-if="!ctrl.change(u.objid)"><img id="ItemPreview1" src="data:image/jpg;base64,u.treatmentImage" /></td>  -->
                               
                              <!-- <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.key.treatmentId"style="width: 100%"/></td>                                                           
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.treatmentMainType" style="width: 100%""/></td>
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.treatmentSubType" style="width: 100%""/></td> -->
                              <!-- <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.treatmentImage" style="width: 100%""/></td> -->
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