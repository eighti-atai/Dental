<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>ATAI</title>
	    
	    <script type="text/javascript">
	        function populatePage(Record) 
	        {
	            if (typeof (parent.document.getElementById("f1").contentWindow.populate) == "function")
	            	parent.document.getElementById("f1").contentWindow.populate(Record.patientId, Record.mttId);
	            else
	                alert("f1.Reset NOT found X3");
	        } 
	        
	    </script>
		
		<style>
			/*html
			{
			    position: relative;
			    min-width: 500px;
			    min-height: 300px;
			    height: 100%;
			}
			body
			{	
			    position:                        absolute;
			    height:                             300px;
			    width:                             500px;
			}
			
			{
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}*/

	 		.patientId.ng-valid {
	         	background-color: lightgreen;
	      	}
	      	.patientId.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.patientId.ng-dirty.ng-invalid-minlength {
	          	background-color: yellow;
	      	}
	 
	      	.mttId.ng-valid {
	          	background-color: lightgreen;
	      	}
	      	.mttId.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.mttId.ng-dirty.ng-invalid-email {
	          	background-color: yellow;
	      	}
	      	
	 		.mttName.ng-valid {
	          	background-color: lightgreen;
	      	}
	      	.mttName.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.mttName.ng-dirty.ng-invalid-minlength {
	          	background-color: yellow;
	      	}
	 
	      	.mttDescription.ng-valid {
	          	background-color: lightgreen;
	      	}
	      	.mttDescription.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.mttDescription.ng-dirty.ng-invalid-email {
	          	background-color: yellow;
	      	}
	      	
	      	
	 
	      	.patientContactNo.ng-valid {
	          	background-color: lightgreen;
	      	}
	      	.patientContactNo.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.patientContactNo.ng-dirty.ng-invalid-email {
	          	background-color: yellow;
	      	}

	       .patientGender.ng-valid {
	          	background-color: lightgreen;
	      	}
	      	.patientGender.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.patientGender.ng-dirty.ng-invalid-email {
	          	background-color: yellow;
	      	}
	
	
			.modal {
			    display: none; /* Hidden by default */
			    position: fixed; /* Stay in place */
			    z-index: 1; /* Sit on top */
			    padding-top: 100px; /* Location of the box */
			    left: 0;
			    top: 0;
			    width: 100%; /* Full width */
			    height: 100%; /* Full height */
			    overflow: auto; /* Enable scroll if needed */
			    background-color: rgb(0,0,0); /* Fallback color */
			    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
			}
		
			/* Modal Content */
			.modal-content {
			    background-color: #fefefe;
			    margin: auto;
			    padding: 20px;
			    border: 1px solid #888;
			    width: 80%;
			}
		
			/* The Close Button */
			.close {
			    color: #aaaaaa;
			    float: right;
			    font-size: 28px;
			    font-weight: bold;
			}
		
			.close:hover,
			.close:focus {
			    color: #000;
			    text-decoration: none;
			    cursor: pointer;
			}
	    </style>
	    
	    <link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
	    <link rel="stylesheet" href="webjars/angular-material/1.1.1/angular-material.min.css">    
	    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
	    
	    <script src="webjars/angularjs/1.5.8/angular.js"></script>
	    <script src="webjars/angularjs/1.5.8/angular-sanitize.js"></script>
	    <script src="webjars/jquery/2.1.4/jquery.min.js"></script> 
	    <script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js""></script>
	    <script src="<c:url value='/static/js/app.js' />"></script>
	    <script src="<c:url value='/static/js/service/service.js' />"></script>
	    <script src="<c:url value='/static/js/controller/controller.js' />"></script>
	    <script src="<c:url value='/static/js/filter/filter.js' />"></script>
	    <script src="<c:url value='/static/js/entity/MainTreatmentType.js' />"></script>
	    <script src="<c:url value='/static/js/other/angular-canvas-painter.js' />"></script>   
        <script src="<c:url value='/static/js/other/bootbox.min.js' />"></script>    
	    <script src="webjars/angularjs/1.5.8/angular-animate.min.js"></script>
	    <script src="webjars/angularjs/1.5.8/angular-aria.min.js"></script>
	    <script src="webjars/angularjs/1.5.8/angular-messages.min.js"></script>
	    <script src="webjars/angular-material/1.1.1/angular-material.min.js"></script>
	</head>

<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    
    <p>Please select doctor..</p>
    <input type="text" id="doctor"  placeholder="Enter Doctor"/>
    <button id="okBtn">OK</button>
  </div>

	<div class="modal-content">


    </div>
</div>

	<body ng-app="generalModule" class="ng-cloak">
		<div id="con1" class="generic-container" data-ng-controller="RecordController as ctrl" ng-init="ctrl.init()">           
		    <div class="panel panel-default">
		    	<div class="panel-heading"><span class="lead">Main Treatment Type Details</span></div>
		        <div class="formcontainer">
		        	<form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
		            	<input type="hidden" ng-model="ctrl.Record.objid" /> 
		
						<div class="row">
		                	<div class="form-group col-md-12">
		                    	<label class="col-md-2 control-lable" for="mttId">Type ID</label>
		                        <div class="col-md-7">
		                        	<input type="text" ng-model="ctrl.Record.mttId" id="mttId" class="mttId form-control input-sm" placeholder="Enter MainTreatmentType Name " required ng-minlength="1"/>
		                        	<div class="has-error" ng-show="myForm.$dirty">
		                            	<span ng-show="myForm.mttId.$error.required">This is a required field</span>
		                                <span ng-show="myForm.mttId.$invalid">This field is invalid </span>
		                            </div>
		                		</div>
		                	</div>
		                </div>
		                      
		                <div class="row">
		                	<div class="form-group col-md-12">
		                    	<label class="col-md-2 control-lable" for="mttName">Type Name</label>
		                        <div class="col-md-7">
		                           	<input type="text" ng-model="ctrl.Record.mttName" id="mttName" class="mttName form-control input-sm" placeholder="Enter Type Name"/>
		                           	<div class="has-error" ng-show="myForm.$dirty">
		                            </div>
		                        </div>
		                	</div>
		                </div>
		                      
		                <div class="row">
		                	<div class="form-group col-md-12">
		                    <label class="col-md-2 control-lable" for="mttDescription">Type Description</label>
		                    	<div class="col-md-7">
		                        	<input type="text" ng-model="ctrl.Record.mttDescription" id="mttDescription" class="mttDescription form-control input-sm" placeholder="Enter Type Description" />
		                            <div class="has-error" ng-show="myForm.$dirty">
		                			</div>
		                        </div>
		                    </div>
		                </div>
		                      		
		                <div class="row">
		                	<div class="form-actions floatRight">
		                    	<input type="submit"  value="{{!ctrl.Record.objid ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
		                        <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="IsDisabled">Reset Form</button>
		                        <button type="button" ng-click="ctrl.searchRecords()" class="btn btn-warning btn-sm" >Search</button>
		                    </div>
		               	</div>
		                
		        	</form>  
		        </div>
		              		          
		        <div class="panel panel-default">
		        	<div class="panel-heading"><span class="lead">List of Main Treatment Types </span></div>
		            <div class="tablecontainer">
		                <table id="tableId" class="table table-hover">
		                	<thead>
		                    	<tr>
		                        	<th>Type ID</th>
		                            <th>Type Name</th>
		                            <th>Type Description</th>
		                            <th width="10%"></th>
		                        </tr>
		                  	</thead>
		                	<tbody>
		                    	<tr ng-repeat="u in ctrl.Records | startFrom:ctrl.currentPage*ctrl.pageSize | limitTo:ctrl.pageSize" ng-dblclick="ctrl.populateRecord(u.objid)" >
		                        	<td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.mttId"></span></td>
		                            <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.mttName"></span></td> 
		                           	<td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.mttDescription"></span></td>
		                                                                                          
		                           	<td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.mttId"style="width: 100%"/></td>
		                           	<td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.mttName" style="width: 100%""/></td>
		                           	<td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.mttDescription" style="width: 100%""/></td>
		                              
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