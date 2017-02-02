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
		    min-height: 500px;
		    min-width: 300px;
		    height: 100%;
		}
		
		body
		{
		
		    position:                        absolute;
		    height:                          500px;
		    width:                           350px;
		}
	 	.appointmentDate.ng-valid {
	   		background-color: lightgreen;
	    }*/
	   /* .appointmentDate.ng-dirty.ng-invalid-required {
	        background-color: red;
	    }*/
	    .appointmentDate.ng-dirty.ng-invalid-minlength {
	        background-color: yellow;
	    }
	
	    .appointmentTime.ng-valid {
	        background-color: lightgreen;
	    }
	    /*.appointmentTime.ng-dirty.ng-invalid-required {
	        background-color: red;
	    }*/
	    .appointmentTime.ng-dirty.ng-invalid-email {
	        background-color: yellow;
	    }
	 	.doctor.ng-valid {
	        background-color: lightgreen;
	    }
	    /*.doctor.ng-dirty.ng-invalid-required {
	        background-color: red;
	    }*/
	    .doctor.ng-dirty.ng-invalid-minlength {
	        background-color: yellow;
	    }

    </style>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
    <link rel="stylesheet" href="webjars/angular-material/1.1.1/angular-material.min.css"> 
    <script src="webjars/jquery/2.1.4/jquery.min.js"></script>   
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
    <script src="webjars/angularjs/1.5.8/angular-animate.min.js"></script>
    <script src="webjars/angularjs/1.5.8/angular-aria.min.js"></script>
    <script src="webjars/angularjs/1.5.8/angular-messages.min.js"></script>
    <script src="webjars/angular-material/1.1.1/angular-material.min.js"></script>
    <script src="<c:url value='/static/js/directives/unterLov.js' />"></script>

    
</head>
<body ng-app="generalModule" class="ng-cloak">
	<div id="con" class="generic-container" data-ng-controller="RecordController as ctrl" ng-init="ctrl.init();ctrl.setPanelHeader('Appointment')">
    	<div class="panel panel-default">
        	<div class="panel-heading" ng-bind-html="panelHeader"></div>
            <div class="formcontainer">
           		<form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
           			<div id="lov" unter-lov class = "lov"></div>	
               		<input type="hidden" ng-model="ctrl.Record.objid" /> 
         			<input type="hidden" ng-model="ctrl.Record.key.patientId" id="patientId" class="patientId form-control input-sm" placeholder="Enter Patient ID " required/>
                    <div class="row">
                    	<div class="form-group col-xs-5">
                    		<label class="col-md-2 control-lable" for="appointmentDate">Date</label>
                    		<div class="col-md-3">
	                            <p><md-datepicker ng-model="ctrl.Record.appointmentDate"  md-placeholder="Enter Date" required></md-datepicker></p>
	                            <div class="has-error" ng-show="myForm.$dirty">
	                            	<span ng-show="myForm.appointmentDate.$error.required">This is a required field</span>
	                                <span ng-show="myForm.appointmentDate.$invalid">This field is invalid </span>
	                            </div>
                            </div>
                 		</div>
<!--   					</div> -->
<!--                    	<div class="row"> -->
                    	<div class="form-group col-xs-3">
                         	<label class="col-md-2 control-lable" for="appointmentTime">Time</label>
                            <div class="col-md-3">
                            	<p> <input type="text" ng-model="ctrl.Record.appointmentTime" id="appointmentTime" class="doctor form-control input-sm" placeholder="Enter Appointment Time" required/></p>
                              	<div class="has-error" ng-show="myForm.$dirty">
                                	<span ng-show="myForm.appointmentTime.$error.required">This is a required field</span>
                                </div> 
                      		</div>
                		</div>
<!--             		</div> -->
<!--                     <div class="row"> -->
                    	<div class="form-group col-xs-4">
                        	<label class="col-md-2 control-lable" for="doctor">Doctor</label>
                            <div class="col-md-3">
                            	<input type="text" ng-model="ctrl.Record.doctor" id="doctor" class="doctor form-control input-sm" placeholder="Enter Doctor" required/>
                              	<div class="has-error" ng-show="myForm.$dirty">
                               		<span ng-show="myForm.appointmentTime.$error.required">This is a required field</span>
                                </div>
                     		</div>
             			</div>
               		</div>
                    <div class="row">
            			<div class="form-actions floatRight">
                       		<input type="submit"  value="{{!ctrl.Record.objid ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                            <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                            <button type="button" ng-click="ctrl.searchRecords()" class="btn btn-warning btn-sm" >Search</button>
                            <button type="button" ng-click="ctrl.ListOfValues()" class = "btn btn-warning btn-sm">List...</button>
                    	</div>
               		</div>
    			</form>
			</div>
          
          	<div class="panel panel-default">
       			<div class="panel-heading"><span class="lead">List of Appointments </span></div>
              	<div class="tablecontainer">
               		<table class="table table-hover">
                  		<thead>
                        	<tr>
                   				<th>Date</th>
                              	<th>Time</th>
                              	<th>Doctor</th>
                              	<th width="20%"></th>
                          	</tr>
                      	</thead>
           			<tbody>
                    	<tr ng-repeat="u in ctrl.Records | startFrom:ctrl.currentPage*ctrl.pageSize | limitTo:ctrl.pageSize " >
	                        <td ng-if="!ctrl.change(u.objid)"><span ng-bind="ctrl.setDate(u.objid, 'appointmentDate', u.appointmentDate)|date:yyyy/MM/dd"></span></td>
	                        <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.appointmentTime"></span></td>
	                        <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.doctor"></span></td>
	                                                                                         
	                        <td ng-if="ctrl.change(u.objid)"><md-datepicker ng-model="u.appointmentDate"></md-datepicker></td>
	                        <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.appointmentTime" style="width: 100%""/></td>
	                        <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.doctor" style="width: 100%""/></td>
	                        <td>
	                        	<button type="button" ng-click="ctrl.remove(u.objid)" class="btn btn-danger custom-width">Remove</button>
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
  	</div>
</body>
	<script type="text/javascript">
       //var scope = angular.element(document.getElementById("con")).scope();
       //scope.ctrl.setPanelHeader("Appointment");
       function populate(patientId,patientName) 
       {
    	   var scope = angular.element(document.getElementById("con")).scope();
           scope.ctrl.Record.key.patientId = patientId;
           scope.ctrl.Record.key.appointmentId = '';
           scope.ctrl.Record.appointmentDate = '';
           scope.ctrl.Record.appointmentTime = '';
           scope.ctrl.Record.doctor = '';
           scope.ctrl.Record.objid = null;
           scope.ctrl.setPanelHeader("Appointment - "+patientName);
           scope.$apply(scope.ctrl.searchRecords());
       }
           
       $(function() {
           $('#appointmentTime').timepicker();
       });
       
       function populatePage(Record) 
       {
           if (typeof (parent.document.getElementById("f3").contentWindow.populate) == "function")
           		parent.document.getElementById("f3").contentWindow.populate(Record.appointmentDate);
           else
               alert("f1.Reset NOT found X3");
       }  
    </script>
</html>