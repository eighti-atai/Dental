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
    <script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js""></script>
  <!--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>-->
    
    
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/bootstrap-datepicker.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/jquery.timepicker.css' />" rel="stylesheet"></link>
    <script src="webjars/angularjs/1.5.8/angular.js"></script>
    <script src="webjars/angularjs/1.5.8/angular-sanitize.js"></script>
    
    <script src="<c:url value='/static/js/app.js' />"></script>
    <script src="<c:url value='/static/js/service/service.js' />"></script>
    <script src="<c:url value='/static/js/controller/controller.js' />"></script>
    <script src="<c:url value='/static/js/filter/filter.js' />"></script>
    <script src="<c:url value='/static/js/entity/Appointment.js' />"></script>
    
    <script src="<c:url value='/static/js/other/bootstrap-datepicker.js' />"></script>
    <script src="<c:url value='/static/js/other/jquery.timepicker.js' />"></script>
	<script src="<c:url value='/static/js/other/angular-canvas-painter.js' />"></script>
    <script src="<c:url value='/static/js/other/bootbox.min.js' />"></script>
      <script src="webjars/angularjs/1.5.8/angular-animate.min.js"></script>
      <script src="webjars/angularjs/1.5.8/angular-aria.min.js"></script>
      <script src="webjars/angularjs/1.5.8/angular-messages.min.js"></script>
      <script src="webjars/angular-material/1.1.1/angular-material.min.js"></script>
     <!-- <script src="webjars/jquery/2.1.4/jquery.min.js"></script>-->
      
      <script type="text/javascript">
      function populatePage(Record) 
      {
    	  var base_url = parent.document.getElementById("f1").contentDocument.location.href
    	  var url = base_url.substr(base_url.indexOf('Dental')+7,base_url.length);
    	  if(url === 'Treatments')
    	  {
	            if (typeof (parent.document.getElementById("f1").contentWindow.populate) == "function")
	            	parent.document.getElementById("f1").contentWindow.populate(Record.id.patientId);
	            else
	                alert("f1.Reset NOT found X3");
      		}
      } 

        $(function() {
            $('#startTime').timepicker();
        });
        
        $(function () {
            $('#datetimepicker3').datetimepicker({
                format: 'HH:mm'
            });
        });
        
        function insertAttendPatient(patientId,doctor) 
        {
            var scope = angular.element(document.getElementById("conX")).scope();
            scope.$apply(scope.ctrl.reset());
            scope.ctrl.Record.id.patientId = patientId;
            scope.ctrl.Record.doctor = doctor;
            scope.$apply(scope.ctrl.submit());
            scope.$apply(scope.ctrl.fetchAllRecords());
        }
    </script>
</head>
<body ng-app="generalModule" class="ng-cloak" >
      <div id="conX" class="generic-container" data-ng-controller="RecordController as ctrl" ng-init="ctrl.init('AttendPatient');" >
           
          <div class="panel panel-default" >
              <div class="panel-heading" style="display: none;"><span class="lead">Patients Queue</span> </div>
              <div class="formcontainer" style="display: none;">
                 <!--  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" ng-model="ctrl.Record.objid" /> 
                      <input type="text" ng-model="ctrl.Record.id.attendPatientId" id="attendPatientId" class="attendPatientId form-control input-sm" placeholder="Enter Appointment ID "/>
                      <input type="text" ng-model="ctrl.Record.id.patientId" id="patientId" class="patientId form-control input-sm" placeholder="Enter Patient ID " />  
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="startTime">Start Time</label>
                              <div class="col-md-7">
                                 <p> <input type="text" ng-model="ctrl.Record.startTime" id="startTime" class="startTime form-control input-sm" placeholder="Enter Appointment Time" /></p>
                              	  
                              </div>
                          </div>
                      </div>
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="doctor">Doctor</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Record.doctor" id="doctor" class="doctor form-control input-sm" placeholder="Enter Doctor" />
                              	  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.startTime.$error.required">This is a required field</span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.Record.objid ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                               <button type="button" ng-click="ctrl.searchRecords()" class="btn btn-warning btn-sm" >Search</button>
                          </div>
                      </div>
                  </form> -->
                  
              </div>
          
          <div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">Patients Queue </span></div>
              <div  class="tablecontainer">
                  <table  id="tableId" class="table table-hover">
                      <thead>
                          <tr>
                              <th>Patient ID</th>
                              <th>Name</th>
                              <th>Time</th>
                              <th>Doctor</th>
                              <th>Treatment Code</th>
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      
                      	<tbody>
           					<tr ng-repeat="u in ctrl.Records">
                              	<td><span ng-bind="u.id.patientId"></span></td>  
                              	<td><span ng-bind="u.patient.patientName"></span></td>                            
                              	<td><span ng-bind="u.appointmentTime"></span></td>
                              	<td><span ng-bind="u.doctor"></span></td>
                              	<td><span ng-bind="u.code"></span></td>
                              	<td>
                                	<button type="button" ng-click="ctrl.remove(u.objid,'true');" class="btn btn-danger btn-sm">Remove</button>
                                	<button type="button" ng-click="ctrl.openWindow('treatment',u.id.patientId,u.patient.patientName);" class="btn btn-primary btn-sm">Go</button>
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