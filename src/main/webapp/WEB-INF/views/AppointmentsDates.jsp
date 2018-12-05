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
		}*/
	 	.appointmentDate.ng-valid {
	   		background-color: lightgreen;
	    }
	    .appointmentDate.ng-dirty.ng-invalid-required {
	        background-color: red;
	    }
	    .appointmentDate.ng-dirty.ng-invalid-minlength {
	        background-color: yellow;
	    }
	
	    .appointmentTime.ng-valid {
	        background-color: lightgreen;
	    }
	    .appointmentTime.ng-dirty.ng-invalid-required {
	        background-color: red;
	    }
	    .appointmentTime.ng-dirty.ng-invalid-email {
	        background-color: yellow;
	    }
	 	.doctor.ng-valid {
	        background-color: lightgreen;
	    }
	    .doctor.ng-dirty.ng-invalid-required {
	        background-color: red;
	    }
	    .doctor.ng-dirty.ng-invalid-minlength {
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
    
    <script src="webjars/angularjs/1.5.8/angular.js"></script>
    <script src="webjars/angularjs/1.5.8/angular-sanitize.js"></script>
    <script src="<c:url value='/static/js/app.js' />"></script>
    <script src="<c:url value='/static/js/service/service.js' />"></script>
    <script src="<c:url value='/static/js/controller/controller.js' />"></script>
    <script src="<c:url value='/static/js/filter/filter.js' />"></script>
    <script src="<c:url value='/static/js/entity/AppointmentsDate.js' />"></script>
    <script src="<c:url value='/static/js/other/jquery.timepicker.js' />"></script>
    <script src="<c:url value='/static/js/other/angular-canvas-painter.js' />"></script>     
    <script src="<c:url value='/static/js/other/bootbox.min.js' />"></script>  
    <script src="webjars/angularjs/1.5.8/angular-animate.min.js"></script>
    <script src="webjars/angularjs/1.5.8/angular-aria.min.js"></script>
    <script src="webjars/angularjs/1.5.8/angular-messages.min.js"></script>
    <script src="webjars/angular-material/1.1.1/angular-material.min.js"></script>

    <script type="text/javascript">
       function populate(appointmentDate,doctor) 
       {
    	   if(appointmentDate != "" || doctor != "" )
    	   {
	           var scope = angular.element(document.getElementById("con2")).scope();
	           scope.ctrl.SearchRecord.date = appointmentDate;
	           //scope.ctrl.SearchRecord.time = time;
	           scope.ctrl.SearchRecord.doctor = doctor;
	    	   
	           var d ='';
	           var c ='';
	           var t ='';
	           if(appointmentDate != "" )
	        	   {
	        	   		 d = appointmentDate.getDate()+'/'+(appointmentDate.getMonth()+1)+'/'+appointmentDate.getFullYear()+"///";
	        	   }
	           if(doctor != "" )
	        	   {
	        	   		 c = doctor+"///";
	        	   }
	           scope.ctrl.setPanelHeader('Appointments - '+ d+c);
	           scope.$apply(scope.ctrl.searchRecords(scope.ctrl.SearchRecord));
    	   }
       }
    </script>
</head>
<body ng-app="generalModule" class="ng-cloak">
	<div id="con2" class="generic-container" data-ng-controller="RecordController as ctrl" ng-init="ctrl.init();ctrl.setPanelHeader('Appointments')">
         
          	<div class="panel panel-default">
       			<div class="panel-heading" ng-bind-html="panelHeader"></div>
              	<div class="tablecontainer">
               		<table id="tableId" class="table table-hover">
                  		<thead>
                        	<tr>
                   				<th>Date</th>
                              	<th>Time</th>
                              	<th>Doctor</th>
                              	<th>Treatment Code</th>
                              	<th width="20%"></th>
                          	</tr>
                      	</thead>
           			<tbody>
                    	<tr ng-repeat="u in ctrl.Records | startFrom:ctrl.currentPage*ctrl.pageSize | limitTo:ctrl.pageSize " >
	                        <td ng-if="!ctrl.change(u.objid)"><span ng-bind="ctrl.setDate(u.objid, 'date', u.date)|date:yyyy/MM/dd"></span></td>
	                        <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.time"></span></td>
	                        <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.doctor"></span></td>
	                        <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.code"></span></td>
	                                                                                         
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
</html>