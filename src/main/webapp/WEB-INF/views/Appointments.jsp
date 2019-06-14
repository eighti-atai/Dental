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
	    
	    .code.ng-valid {
	        background-color: lightgreen;
	    }
	    /*.code.ng-dirty.ng-invalid-required {
	        background-color: red;
	    }*/
	    .code.ng-dirty.ng-invalid-minlength {
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/momentjs/2.14.1/moment.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
</head>
<body ng-app="generalModule" class="ng-cloak">
	<div id="con" class="generic-container" data-ng-controller="RecordController as ctrl" ng-init="ctrl.MasterInit();" >
    	<div class="panel panel-default">
        	<div class="row">
            	<div class="col-md-12"> 		          
          			<div class="panel panel-default">
       					<div class="panel-heading"><span class="lead">List of Appointments </span></div>
       					<form ng-submit="ctrl.submitRecords()">
       						<div class="row">                        
		                		<div class="col-md-12">
	                                <input type="submit" class="btn btn-primary    btn-sm" value="Save"  ng-show ="ctrl.variableEditLineExist || ctrl.variableNewLineExist">
	                                <input type="button" class="btn btn-danger     btn-sm" ng-click="ctrl.deleteRecords()" value="Delete"  ng-show ="(!(ctrl.variableEditLineExist || ctrl.variableNewLineExist)) && ctrl.isRowSelected()">
	                                <input type="button" class="btn btn-warning    btn-sm" ng-click="ctrl.AddRow()" value="New"  ng-show ="!(ctrl.variableEditLineExist || ctrl.variableNewLineExist)">
	                                <input type="button" class="btn btn-warning    btn-sm" ng-click="ctrl.exitReadOnly('EditTable')" value="Edit"  ng-show ="(!(ctrl.variableEditLineExist || ctrl.variableNewLineExist)) && ctrl.isRowSelected()">
	                                <input type="button" class="btn btn-warning    btn-sm" ng-click="ctrl.resetTable()" value="Cancel" ng-show ="ctrl.variableEditLineExist || ctrl.variableNewLineExist">
	                            </div>
                            </div>
              				<div class="tablecontainer">
              				    <div class="form-group">		
              				<div id="lov" unter-lov class = "lov"></div>
               					<table id="tableId" class="table table-hover">
                  					<thead>
                        				<tr>
                        					<th><input type="checkbox" ng-model="selectedAll" ng-click="checkAll()" /></th>
		                   					<th>Date</th>
			                              	<th>Time</th>
			                              	<th>End Time</th>
			                              	<th>Doctor</th>
			                              	<th>Treatment Code</th>
			                              	
	                          			</tr>
	                      			</thead>
	           						<tbody>
	                    				<tr ng-repeat="u in ctrl.Records">
                                        	<td>
                                            	<input type="checkbox" ng-model="u.selected"  ng-disabled="(u.objid != null) && (ctrl.variableEditLineExist || ctrl.variableNewLineExist)"/></td>
                                         	<td ng-if="((u.objid != null)&&(ctrl.variableReadOnly ||((!ctrl.variableReadOnly) && (!u.selected))))">
                                            	<input type="text" class="form-control" ng-model="ctrl.setDate(u.objid, 'appointmentDate', u.appointmentDate)|date:yyyy/MM/dd" ng-readonly="(u.objid != null)&&(ctrl.variableReadOnly ||((!ctrl.variableReadOnly) && (!u.selected)))" required/></td>
	                                        <td ng-if="!((u.objid != null)&&(ctrl.variableReadOnly ||((!ctrl.variableReadOnly) && (!u.selected))))">
	                                         	<md-datepicker ng-model="u.appointmentDate" ng-change= "ctrl.ppp(u.appointmentDate,u.doctor)" id ="appointmentDate"></md-datepicker></td>
	                                        <td>
	                                            <input type="text" class="form-control" id="appointmentTime" ng-model="u.appointmentTime"  ng-readonly="(u.objid != null)&&(ctrl.variableReadOnly ||((!ctrl.variableReadOnly) && (!u.selected)))" required/></td>   
                                    		<td>
	                                            <input type="text" class="form-control" id="appointmentEndTime" ng-model="u.appointmentEndTime"  ng-readonly="(u.objid != null)&&(ctrl.variableReadOnly ||((!ctrl.variableReadOnly) && (!u.selected)))" /></td>   
                                    		
                                    		<td>
	                                            <select  ng-change= "ctrl.ppp(u.appointmentDate,u.doctor)" ng-options="x for x in ctrl.doctors" class="form-control" ng-model="u.doctor" id="doctor" ng-disabled="(u.objid != null)&&(ctrl.variableReadOnly ||((!ctrl.variableReadOnly) && (!u.selected)))" required/></select></td>   
                                    		<td>
	                                            <select ng-options="s for s in ctrl.mainTreatmentTypes" class="form-control" ng-model="u.code" id="code" ng-disabled="(u.objid != null)&&(ctrl.variableReadOnly ||((!ctrl.variableReadOnly) && (!u.selected)))" required/></select></td>   
                                    		 <td>
                                    		 <!--<div class='input-group date' id='datetimepicker3'>
	                                            <input type='text' id="datetimepicker3" ng-model="u.appointmentTime"/>
						                     <span class="input-group-addon">
						                     <span class="glyphicon glyphicon-calendar"></span>
						                     </span>
						                     </div>
                                    		  <td>
	                                            <input type="text" class="form-control" id="id.appointmentId" ng-model="u.id.appointmentId"  ng-readonly="(u.objid != null)&&(ctrl.variableReadOnly ||((!ctrl.variableReadOnly) && (!u.selected)))" /></td>   
                                    		-->
                                    		</tr>
                 					</tbody>

                  				</table>
			                  	
    						</div>
    					</form>
              		</div>
          		</div>
      		</div>
      	</div>
  	</div> 	
</body>
	<script type="text/javascript">
       //var  scope= angular.element(document.getElementById("con")).scope();
       //scope.ctrl.setPanelHeader("Appointment");

  $(function () {
    $('#datetimepicker1').datetimepicker();
 });

       function populate(patientId) 
       {
    	   //aletr(patientId);
    	   var scope = angular.element(document.getElementById("con")).scope();
    	   scope.ctrl.SearchRecord.id.patientId = patientId;
    	   scope.ctrl.TmpRecord.id.patientId = patientId;
           /*scope.ctrl.SearchRecord.id.treatmentId = treatmentId;
           scope.ctrl.Record.id.patientId = patientId;
           scope.ctrl.Record.id.appointmentId = '';
           scope.ctrl.Record.appointmentDate = '';
           scope.ctrl.Record.appointmentTime = '';
           scope.ctrl.Record.doctor = '';
           scope.ctrl.Record.code = '';
           scope.ctrl.Record.objid = null;*/
           //scope.ctrl.setPanelHeader("Appointment - "+patientName);
           //scope.$apply(scope.ctrl.searchRecords());
    	   scope.$apply(scope.ctrl.searchRecords(scope.ctrl.SearchRecord));
       }
           
       $(function() {
           $('#datetimepicker3').timepicker({
        	    'disableTimeRanges': [
    	                ['11pm', '12am'],
     	                ['12am', '6am']
  	                  ],
           'scrollDefault': 'now'                 
           });
       });

       
       function populateList(appointmentDate,doctor) 
       {
           if (typeof (parent.document.getElementById("f3").contentWindow.populate) == "function"){
        	   var date;
        	   if( typeof (appointmentDate)==="number")
        		   {
        		   date =new Date(appointmentDate);      		   
        		   }
        	   else
        		   {
        		   date = appointmentDate;
        		   }
        		   
        		   
        		   
           		parent.document.getElementById("f3").contentWindow.populate(date,doctor);
           }
           else
        	   {
               alert("f1.Reset NOT found Xwwww3");
        	   }
       }  
       
       function cc(Record) 
       {
           
               alert("f1SSSSSSSSSSSSSSSSS");
       } 
    </script>
</html>