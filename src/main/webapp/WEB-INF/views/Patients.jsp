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
	            	parent.document.getElementById("f1").contentWindow.populate(Record.patientId, Record.patientName);
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
	 
	      	.patientName.ng-valid {
	          	background-color: lightgreen;
	      	}
	      	.patientName.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.patientName.ng-dirty.ng-invalid-email {
	          	background-color: yellow;
	      	}
	      	
	 		.patientAddress.ng-valid {
	          	background-color: lightgreen;
	      	}
	      	.patientAddress.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.patientAddress.ng-dirty.ng-invalid-minlength {
	          	background-color: yellow;
	      	}
	 
	      	.patientIdNo.ng-valid {
	          	background-color: lightgreen;
	      	}
	      	.patientIdNo.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.patientIdNo.ng-dirty.ng-invalid-email {
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
	    <script src="<c:url value='/static/js/app.js' />"></script>
	    <script src="<c:url value='/static/js/service/service.js' />"></script>
	    <script src="<c:url value='/static/js/controller/controller.js' />"></script>
	    <script src="<c:url value='/static/js/filter/filter.js' />"></script>
	    <script src="<c:url value='/static/js/entity/Patient.js' />"></script>
	    <script src="<c:url value='/static/js/other/angular-canvas-painter.js' />"></script>    
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
		    	<div class="panel-heading"><span class="lead">Patient Details</span></div>
		        <div class="formcontainer">
		        	<form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
		            	<input type="hidden" ng-model="ctrl.Record.objid" /> 
		            	<input id="patientId" type="hidden" ng-model="ctrl.Record.patientId" /> 
		
						<div class="row">
		                	<div class="form-group col-xs-4">
		                    	<label class="col-md-2 control-lable" for="patientName">Name</label>
		                        <div class="col-md-10">
		                        	<input type="text" ng-model="ctrl.Record.patientName" id="patientName" class="patientName form-control input-sm" placeholder="Enter Patient Name " required ng-minlength="1"/>
		                        	<div class="has-error" ng-show="myForm.$dirty">
		                            	<span ng-show="myForm.patientName.$error.required">This is a required field</span>
		                                <span ng-show="myForm.patientName.$invalid">This field is invalid </span>
		                            </div>
		                		</div>
		                	</div>
<!-- 		                </div> -->
		                      
<!-- 		                <div class="row"> -->
		                	<div class="form-group col-xs-4">
		                    	<label class="col-md-2 control-lable" for="patientAddress">Address</label>
		                        <div class="col-md-10">
		                           	<input type="text" ng-model="ctrl.Record.patientAddress" id="patientAddress" class="patientAddress form-control input-sm" placeholder="Enter Address"/>
		                           	<div class="has-error" ng-show="myForm.$dirty">
		                            </div>
		                        </div>
		                	</div>
<!-- 		                </div> -->
		                      
<!-- 		                <div class="row"> -->
		                	<div class="form-group col-xs-4">
		                    	<label class="col-md-2 control-lable" for="patientBirthDate">Date of Birth</label>
		                        <div class="col-md-7">		                        	
		                        	<md-datepicker ng-model="ctrl.Record.patientBirthDate" md-placeholder="Enter date"></md-datepicker>
		                        	<div class="has-error" ng-show="myForm.$dirty">
		                        	</div>
		                        </div>
		                	</div>
<!-- 		                </div> -->
		                      
<!-- 		                <div class="row"> -->
		                	<div class="form-group col-xs-4">
		                    <label class="col-md-2 control-lable" for="patientIdNo">ID Number</label>
		                    	<div class="col-md-7">
		                        	<input type="text" ng-model="ctrl.Record.patientIdNo" id="patientIdNo" class="patientIdNo form-control input-sm" placeholder="Enter Id No" />
		                            <div class="has-error" ng-show="myForm.$dirty">
		                			</div>
		                        </div>
		                    </div>
<!-- 		                </div> -->
		                      
<!-- 		                <div class="row"> -->
		                	<div class="form-group col-xs-4">
		                    	<label class="col-md-2 control-lable" for="patientContactNo">Contact Number</label>
		                        <div class="col-md-7">
		                        	<input type="text" ng-model="ctrl.Record.patientContactNo" id="patientContactNo" class="patientContactNo form-control input-sm" placeholder="Enter Contact No" />
		                            <div class="has-error" ng-show="myForm.$dirty">
		                            </div>
		                        </div>
		                	</div>
<!-- 		                </div> -->
		                      
<!-- 		                <div class="row"> -->
		                	<div class="form-group col-xs-4">
		                    	<label class="col-md-2 control-lable" for="patientGender">Gender</label>
		                        <div class="col-md-7">
		                      		<select ng-model="ctrl.Record.patientGender" id="patientGender" class="patientGender form-control input-sm" placeholder="Selet Gender">
								  		<option value=""></option>
								  		<option value="Male">Male</option>
								  		<option value="Female">Female</option>
									</select>
								</div>
							</div>
		                </div>
		
		                <div class="row">
		                	<div class="form-actions floatRight">
		                    	<input type="submit"  value="{{!ctrl.Record.objid ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
		                        <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="IsDisabled">Reset Form</button>
		                        <button type="button" ng-click="ctrl.searchRecords()" class="btn btn-warning btn-sm" >Search</button>
		                        <button id="mbtn" type="button" class="btn btn-warning btn-sm" >Add to Q</button>
		                    </div>
		               	</div>
		                
		        	</form>  
		        </div>
		              		          
		        <div class="panel panel-default">
		        	<div class="panel-heading"><span class="lead">List of Patients </span></div>
		            <div class="tablecontainer">
		                <table id="tableId" class="table table-hover">
		                	<thead>
		                    	<tr>
		                        	<th>Name</th>
		                            <th>Address</th>
		                            <th>Date of Birth</th>
		                            <th>ID No</th>	                            
		                            <th>Contact No</th>
		                            <th>Gender</th>
		                            <th width="10%"></th>
		                        </tr>
		                  	</thead>
		                	<tbody>
		                    	<tr ng-repeat="u in ctrl.Records | startFrom:ctrl.currentPage*ctrl.pageSize | limitTo:ctrl.pageSize" ng-dblclick="ctrl.populateRecord(u.objid)" >
		                        	<td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.patientName"></span></td>
		                            <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.patientAddress"></span></td>
		                            <td ng-if="!ctrl.change(u.objid)"><span ng-bind="ctrl.setDate(u.objid, 'patientBirthDate', u.patientBirthDate)|date:yyyy/MM/dd"></span></td>  
		                           	<td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.patientIdNo"></span></td>
		                           	<td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.patientContactNo"></span></td>
		                           	<td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.patientGender"></span></td>
		                                                                                          
		                           	<td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.patientName"style="width: 100%"/></td>
		                           	<td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.patientAddress" style="width: 100%""/></td>
		                            <td ng-if="ctrl.change(u.objid)"><md-datepicker ng-model="u.patientBirthDate"></md-datepicker></td>
		                           	<td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.patientIdNo" style="width: 100%""/></td>
		                           	<td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.patientContactNo" style="width: 100%""/></td>
		                           	<td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.patientGender" style="width: 100%""/></td>
		                              
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
	        
	     // Get the modal
	        var modal = document.getElementById('myModal');

	        // Get the button that opens the modal
	        var btn = document.getElementById("mbtn");
	        //var okBtn = document.getElementById("okBtn");

	        // Get the <span> element that closes the modal
	        var span = document.getElementsByClassName("close")[0];

	        // When the user clicks the button, open the modal 
	        btn.onclick = function() {
	            modal.style.display = "block";
	        }
	        
	        /*okBtn.onclick = function() {
	            modal.style.display = "none";
	        }*/

	        // When the user clicks on <span> (x), close the modal
	        span.onclick = function() {
	        	//var field = document.getElementById("doctor");
	            modal.style.display = "none";
	        }

	        // When the user clicks anywhere outside of the modal, close it
	        window.onclick = function(event) {
	            if (event.target == modal) {
	                modal.style.display = "none";
	            }
	        }
	        $('#okBtn').click(function(){
	        	var doctor = $('#doctor').val();
	        	var scope = angular.element(document.getElementById("con1")).scope();
	            
	            $("#doctor").val("");
	            modal.style.display = "none";
            	var pId= scope.ctrl.Record.patientId;
	            if (typeof (parent.document.getElementById("f4").contentWindow.insertAttendPatient) == "function")
	            	parent.document.getElementById("f4").contentWindow.insertAttendPatient(pId, doctor);
	            else
	                alert("f1.Reset NOT found X3");
	        });
	    </script>
</html>