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
	    
	    ::-webkit-input-placeholder { /* WebKit browsers */
		    text-transform: none;
		}
		:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
		    text-transform: none;
		}
		::-moz-placeholder { /* Mozilla Firefox 19+ */
		    text-transform: none;
		}
		
	   .mttId.ng-valid {
          background-color: lightgreen;
      }
      .mttId.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .mttId.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      } 
      .sttId.ng-valid {
          background-color: lightgreen;
      }
      .sttId.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .sttId.ng-dirty.ng-invalid-email {
          background-color: yellow;
      }
 	  .treatmentName.ng-valid {
          background-color: lightgreen;
      }
      .treatmentName.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .treatmentName.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }
 
      .treatmentAmount.ng-valid {
          background-color: lightgreen;
      }
      .treatmentAmount.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .treatmentAmount.ng-dirty.ng-invalid-email {
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
    <script src="<c:url value='/static/js/entity/SubTreatmentType.js' />"></script>
    <script src="<c:url value='/static/js/other/jquery.timepicker.js' />"></script>
    <script src="<c:url value='/static/js/other/angular-canvas-painter.js' />"></script>   
    <script src="<c:url value='/static/js/other/bootbox.min.js' />"></script>    
    <script src="webjars/angularjs/1.5.8/angular-animate.min.js"></script>
    <script src="webjars/angularjs/1.5.8/angular-aria.min.js"></script>
    <script src="webjars/angularjs/1.5.8/angular-messages.min.js"></script>
    <script src="webjars/angular-material/1.1.1/angular-material.min.js"></script>
    <script src="<c:url value='/static/js/directives/unterLov.js' />"></script>

    
</head>
<!--<body ng-app="generalModule" class="ng-cloak">
	<div id="con" class="generic-container" data-ng-controller="RecordController as ctrl" ng-init="ctrl.init();">
    	<div class="panel panel-default">
        	<!--<div class="panel-heading"><span class="lead">Sub Treatment Type Details</span></div>
             <div class="formcontainer">
           		<form ng-submit="ctrl.submit()" name="myForm1" class="form-horizontal">
           			<div id="lov" unter-lov class = "lov"></div>
					<div id="kan" unter-search class = "lov"></div>
           			<div id="lov" unter-lov class = "lov"></div>	
               		<input type="hidden" ng-model="ctrl.Record.objid" /> 
         			
               		<div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="mttId">Main Treatment ID</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Record.id.mttId" id="mttId" class="mttId form-control input-sm" placeholder="Main Treatment ID" required maxlength="20" ng-focus="ctrl.setFocusedElement()"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.mttId.$error.required">This is a required field</span>
                                      <span ng-show="myForm.sttId.$error.minlength">Maximum length is 5</span>
                                      <span ng-show="myForm.mttId.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                   	</div>
                   	
                   	<div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="sttId">Sub Treatment ID</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Record.id.sttId" id="sttId" class="sttId form-control input-sm" placeholder="Sub Treatment ID" required maxlength="20" ng-focus="ctrl.setFocusedElement()"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.sttId.$error.required">This is a required field</span>
                                      <span ng-show="myForm.sttId.$error.minlength">Maximum length is 5</span>
                                      <span ng-show="myForm.sttId.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                   	</div>
               		
               		<div class="row">
                    	<div class="form-group col-md-12">
                        	<label class="col-md-2 control-lable" for="treatmentName">Treatment Name</label>
                            <div class="col-md-7">
                            	<input type="text" ng-model="ctrl.Record.treatmentName" id="treatmentName" class="treatmentName form-control input-sm" placeholder="Enter Treatment Name" required/>
                              	<div class="has-error" ng-show="myForm.$dirty">
                               		<span ng-show="myForm.treatmentName.$error.required">This is a required field</span>
                                </div>
                     		</div>
             			</div>
               		</div>
               		
               		<div class="row">
                    	<div class="form-group col-md-12">
                        	<label class="col-md-2 control-lable" for="treatmentAmount">Amount</label>
                            <div class="col-md-7">
                            	<input type="number" step="0.01" ng-model="ctrl.Record.treatmentAmount" id="treatmentAmount" class="treatmentAmount form-control input-sm" placeholder="Enter Treatment Amount" required/>
                              	<div class="has-error" ng-show="myForm.$dirty">
                               		<span ng-show="myForm.treatmentAmount.$error.required">This is a required field</span>
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
       			<div class="panel-heading"><span class="lead">List of Sub Treatment Types </span></div>
              	<div class="tablecontainer">
               		<table class="table table-hover">
                  		<thead>
                        	<tr>
                   				<th>Main Treatment Type</th>
                              	<th>>Sub Treatment Type</th>
                              	<th>Treatment</th>
                              	<th>Amount</th>
                              	<th width="20%"></th>
                          	</tr>
                      	</thead>
           			<tbody>
                    	<tr ng-repeat="u in ctrl.Records | startFrom:ctrl.currentPage*ctrl.pageSize | limitTo:ctrl.pageSize " ng-dblclick="ctrl.edit(u.objid)">
	                        <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.id.mttId"></span></td>
	                        <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.id.sttId"></span></td>
	                        <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.treatmentName"></span></td>
	                        <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.treatmentAmount"></span></td>
	                                                                                         
	                        <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.id.mttId" style="width: 100%""/></td>
	                        <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.id.sttId" style="width: 100%""/></td>
	                        <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.treatmentName" style="width: 100%""/></td>
	                        <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.treatmentAmount" style="width: 100%""/></td>
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
</body>        -->	
  <body ng-app="generalModule" class="ng-cloak">
	<div id="con" class="generic-container" data-ng-controller="RecordController as ctrl" ng-init="ctrl.MasterInit();">   
    <div class="generic-container">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form ng-submit="ctrl.submitRecords()">
                        	<div class="row">
                          
		                		<div class="col-md-12">
                                <input type="submit" class="btn btn-primary    btn-sm" value="Save"  ng-show ="ctrl.variableEditLineExist || ctrl.variableNewLineExist">
                                <input  type="button" class="btn btn-danger   btn-sm" ng-click="ctrl.deleteRecords()" value="Delete"  ng-show ="(!(ctrl.variableEditLineExist || ctrl.variableNewLineExist)) && ctrl.isRowSelected()">
                                <input type="button" class="btn btn-warning    btn-sm" ng-click="ctrl.AddRow()" value="New"  ng-show ="!(ctrl.variableEditLineExist || ctrl.variableNewLineExist)">
                                <input type="button" class="btn btn-warning    btn-sm" ng-click="ctrl.exitReadOnly('EditTable')" value="Edit"  ng-show ="(!(ctrl.variableEditLineExist || ctrl.variableNewLineExist)) && ctrl.isRowSelected()">
                                <input type="button" class="btn btn-warning    btn-sm" ng-click="ctrl.resetTable()" value="Cancel" ng-show ="ctrl.variableEditLineExist || ctrl.variableNewLineExist">
                            </div>
                            </div>
                            <div class="row">
                            </div>
                            <table class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" ng-model="selectedAll" ng-click="checkAll()" /></th>
                                        <!--<th>Main Treatment Type</th>-->
                                        <th>Sub Treatment Type</th>
                                        <th>Treatment</th>
                                        <th>Amount</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="u in ctrl.Records">
                                        <td>
                                            <input type="checkbox" ng-model="u.selected" ng-disabled="(u.objid != null) && (ctrl.variableEditLineExist || ctrl.variableNewLineExist)"/></td>
                                       <!--  <td>
                                            <input type="text" class="form-control" ng-model="u.id.mttId" ng-readonly="(u.objid != null)" required /></td> -->
                                        <td>
                                            <input type="text" class="form-control" ng-model="u.id.sttId" ng-readonly="(u.objid != null)" required/></td>
                                        <td>
                                            <input type="text" class="form-control" ng-model="u.treatmentName" ng-readonly="(u.objid != null)&&(ctrl.variableReadOnly ||((!ctrl.variableReadOnly) && (!u.selected)))" required/></td>
                                        <td>
                                            <input type="text" class="form-control" ng-model="u.treatmentAmount" ng-readonly="(u.objid != null)&&(ctrl.variableReadOnly ||((!ctrl.variableReadOnly) && (!u.selected)))" required/></td>   
                                    </tr>
                                </tbody>
                            </table>
							<!-- <div class="row">
                            
                                <input type="submit" class="btn btn-primary    btn-sm" value="Save"  ng-show ="ctrl.variableEditLineExist || ctrl.variableNewLineExist">
                                <input  type="button" class="btn btn-danger   btn-sm" ng-click="ctrl.deleteRecords()" value="Delete"  ng-show ="(!(ctrl.variableEditLineExist || ctrl.variableNewLineExist)) && ctrl.isRowSelected()">
                                <input type="button" class="btn btn-warning    btn-sm" ng-click="ctrl.AddRow()" value="New"  ng-show ="!(ctrl.variableEditLineExist || ctrl.variableNewLineExist)">
                                <input type="button" class="btn btn-warning    btn-sm" ng-click="ctrl.exitReadOnly('EditTable')" value="Edit"  ng-show ="(!(ctrl.variableEditLineExist || ctrl.variableNewLineExist)) && ctrl.isRowSelected()">
                                <input type="button" class="btn btn-warning    btn-sm" ng-click="ctrl.resetTable()" value="Cancel" ng-show ="ctrl.variableEditLineExist || ctrl.variableNewLineExist">
                            
                            </div>-->
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</body>
      	
	<script type="text/javascript">
		setInterval(function() {
		    window.top.postMessage(document.body.scrollHeight + '-' + 'iframe2', "*");
		}, 500);
		function populate(mttId) 
	       {
	    	   var scope = angular.element(document.getElementById("con")).scope();
	           scope.ctrl.SearchRecord.id.mttId = mttId;
	           scope.ctrl.SearchRecord.id.sttId = '';
	           scope.ctrl.SearchRecord.treatmentName = '';
	           scope.ctrl.SearchRecord.treatmentAmount = '';
	           scope.ctrl.SearchRecord.objid = null;
	           scope.ctrl.TmpRecord.id.mttId = mttId;
	           scope.$apply(scope.ctrl.searchRecords(scope.ctrl.SearchRecord));
	       }
       //var scope = angular.element(document.getElementById("con")).scope();
       //scope.ctrl.setPanelHeader("SubTreatmentType");
       /*function populate(patientId,patientName) 
       {
    	   var scope = angular.element(document.getElementById("con")).scope();
           scope.ctrl.Record.key.patientId = patientId;
           scope.ctrl.Record.key.appointmentId = '';
           scope.ctrl.Record.appointmentDate = '';
           scope.ctrl.Record.appointmentTime = '';
           scope.ctrl.Record.doctor = '';
           scope.ctrl.setPanelHeader("SubTreatmentType - "+patientName);
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
       }  */
    </script>
</html>