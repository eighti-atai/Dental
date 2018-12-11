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

	::-webkit-input-placeholder { /* WebKit browsers */
	    text-transform: none;
	}
	:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
	    text-transform: none;
	}
	::-moz-placeholder { /* Mozilla Firefox 19+ */
	    text-transform: none;
	}
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
	.sttId.ng-valid {
        background-color: lightgreen;
    }
   	.sttId.ng-dirty.ng-invalid-required {
        background-color: red;
    }
   	.sttId.ng-dirty.ng-invalid-minlength {
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
    
    .input-selector-cc {
			    background-color: transparent;
			    border: 0px solid;
			    height: 20px;
			    width: 360px;
 			   color: #0000FF;
 			    font-size:14px;
			}
			.collapsible {
			    background-color: #777;
			    color: white;
			    cursor: pointer;
			    padding: 4px;
			    width: 100%;
			    border: black;
			    text-align: left;
			    font-size: 10px;
			}

			.active, .collapsible:hover {
			    background-color: #555;
			}

			.content {
			    padding: 0 18px;
			    display: none;
			    overflow: hidden;
			    background-color: #f1f1f1;
			}
			
			.input-search {
			  height: 25px;
			  padding: 5px 10px;
			  font-size: 12px;
			  color:#A9A9A9;
			  line-height: 1.5;
  			  border-radius: 3px;
			  border: 2px solid;
			}
			
			.lead-x {
			padding: 4px;
				  margin-bottom: 10px;
				  font-size: 14px;
				  font-weight: 300;
				  line-height: 1.4;
				}

    </style>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
    <link rel="stylesheet" href="webjars/angular-material/1.1.1/angular-material.min.css">
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/bootstrap-datepicker.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/jquery.timepicker.css' />" rel="stylesheet"></link>
     <link href="<c:url value='/static/css/lov.css' />" rel="stylesheet"></link>
    
    <script src="webjars/angularjs/1.5.8/angular.js"></script>
    <script src="webjars/angularjs/1.5.8/angular-sanitize.js"></script>
    <script src="webjars/jquery/2.1.4/jquery.min.js"></script> 
	<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js""></script>   
    <script src="<c:url value='/static/js/app.js' />"></script>
    <script src="<c:url value='/static/js/service/service.js' />"></script>
    <script src="<c:url value='/static/js/controller/controller.js' />"></script>
    <script src="<c:url value='/static/js/filter/filter.js' />"></script>
    <script src="<c:url value='/static/js/entity/Treatment.js' />"></script>   
    <script src="<c:url value='/static/js/other/bootstrap-datepicker.js' />"></script>
    <script src="<c:url value='/static/js/other/jquery.timepicker.js' />"></script>
    <script src="<c:url value='/static/js/other/angular-canvas-painter.js' />"></script>   
    <script src="<c:url value='/static/js/other/bootbox.min.js' />"></script>
	<script src="webjars/angularjs/1.5.8/angular-animate.min.js"></script>
    <script src="webjars/angularjs/1.5.8/angular-aria.min.js"></script>
    <script src="webjars/angularjs/1.5.8/angular-messages.min.js"></script>
    <script src="webjars/angular-material/1.1.1/angular-material.min.js"></script>
    <script src="<c:url value='/static/js/directives/unterLov.js' />"></script>
    <script src="<c:url value='/static/js/directives/prevent-enter-submit.js' />"></script>
	
    <script type="text/javascript">
	           
        function setImgBytes(dataURL)
        {
            var scope = angular.element(document.getElementById("con3")).scope();
            scope.ctrl.Record.treatmentImage = dataURL;       
        }
            
        function getImgBytes()
        {
            var scope = angular.element(document.getElementById("con3")).scope();		   
            var dataURL =  scope.ctrl.Record.treatmentImage ;
            return dataURL;
        }
        function setTotalAmount()
        {
        	var scope = angular.element(document.getElementById("con3")).scope();
        	//scope.ctrl.Record.treatmentTotal = scope.ctrl.Record.treatmentAmount - scope.ctrl.Record.treatmentDiscount;
        	
        	var x = document.getElementById("treatmentTotal");
        	var x1 = document.getElementById("treatmentAmount");
        	var x2 = document.getElementById("treatmentDiscount");
        	x.value= x1.value-x2.value;
        	scope.ctrl.Record.treatmentTotal =  x1.value-x2.value;
        }
        function populateThis(patientId,patientname) 
        {
        	var scope = angular.element(document.getElementById("con3")).scope();
     	    //scope.ctrl.SearchRecord = scope.ctrl.emptyRecord();
            scope.ctrl.SearchRecord.id.patientId = patientId;
            //alert(patientId);
            //const patient = urlParams.get('patientid');
        	//const patientname = urlParams.get('patientname');
        	scope.ctrl.TmpRecord.id.patientId = Number(patientId);
        	scope.ctrl.TmpRecord.patient.patientId = Number(patientId);
        	scope.ctrl.TmpRecord.patient.patientName = patientname;
            /*scope.ctrl.SearchRecord.id.treatmentId = treatmentId;
            
            scope.ctrl.TmpRecord.id.treatmentId = treatmentId;*/
            //console.error('ddddddddddddd');
            scope.$apply(scope.ctrl.searchRecords(scope.ctrl.SearchRecord));
            /*if(x !== undefined)
            	{
            	 x.then(
                         function(d) {
         					populateChild();
                         
                     },
                     function(errResponse){
                         console.error('Error while fetching Records');
                         bootbox.alert({
                 		    message: "Error while fetching record",
                 		    title: "<font  color='red'>Error!</font>"
                 		});
                     }
                 );
            	}*/
            
            
            
        }
        
        
        function isNumberKey(evt){
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
        setInterval(function() {
	        window.top.postMessage(document.body.scrollHeight + '-' + 'iframe1', "*");
	    }, 500);
        function populatePage(Record) 
        {
        	//alert('02 = '+self.Record.id.treatmentId);
        	
            if (typeof (parent.document.getElementById("iframe-container-2").contentWindow.populate) == "function"){
            	if(Record === undefined)
           		{
            		parent.document.getElementById("iframe-container-2").contentWindow.populate(null,null);
           		}
            	else
           		{
            		parent.document.getElementById("iframe-container-2").contentWindow.populate(Record.id.patientId,Record.id.treatmentId);
           		}
            	
            }
            
        } 
        function populateChild() 
	       {
	    	   var scope = angular.element(document.getElementById("con3")).scope();
	    	   populatePage(scope.ctrl.Record);
	       }
    </script>
</head>

<body ng-app="generalModule" class="ng-cloak">
	<div id="con3" class="generic-container" data-ng-controller="RecordController as ctrl" ng-init="ctrl.init();">
    	<div class="panel panel-default">
        	<div class="panel-heading">
        	<span class="lead">Treatment
        	<select
					id="headerDropDownSelector" class=" input-selector-cc "
					ng-model="ctrl.headerDropDownSelector"
					ng-change="ctrl.edit(ctrl.headerDropDownSelector); ">
					<option  ng-repeat="u in ctrl.Records"  value="{{u.objid}}" >{{u.id.patientId}}
						- {{u.patient.patientName}} - {{u.id.treatmentId}} - {{u.mttId}} - {{u.sttId}}</option> 
				</select>
			</span>
			</div>
			<div class="formcontainer">
				<div class="collapsible"><span class="lead-x">Search Criteria </span> </div>
				<div class="content">	
					<input id="mttId" type="text" ng-model="ctrl.SearchRecord.id.patientId" class="input-search" placeholder="Patient ID"/> 				
					<input type="text" ng-model="ctrl.SearchRecord.patientName" id="patientName" class="input-search" placeholder="Patient Name"/>
					<input type="text" ng-model="ctrl.SearchRecord.mttId" id="mttId" class="input-search" placeholder="Main Tratment Type"/>
				    <input type="text" ng-model="ctrl.SearchRecord.sttId" id="mttName" class="input-search" placeholder="Sub Tratment Type"/>
					<md-datepicker ng-model="ctrl.SearchRecord.treatmentDate" md-placeholder="Treatment Date"></md-datepicker>
					<input type="text" ng-model="ctrl.SearchRecord.treatmentDesc" id="treatmentDesc" class="input-search" placeholder="Treatment Desc"/>
				</div> 
			</div> 
            	<div class="formcontainer">
                	<form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal" prevent-enter-submit>
                		<div id="lov" unter-lov class = "lov"></div>
						<div id="kan" unter-search class = "lov"></div>
                    	<input type="hidden" ng-model="ctrl.Record.objid" /> 
                    	<input type="hidden" ng-model="ctrl.Record.id.treatmentId" id="treatmentId" class="treatmentId form-control input-sm" placeholder="Enter Treatmnet ID"/>

                      	<div class="row">
                        	<div class="form-group col-sm-4">
                            <label class="col-sm-3 control-lable" for="patientId">Patient ID</label>
                            	<div class="col-sm-7">
                                <input type="number" ng-model="ctrl.Record.id.patientId" id="patientId" ng-readonly="ctrl.variableReadOnly" ng-model-options="{ allowInvalid: true}" ng-blur="ctrl.validateRecords('Patient',{patientId:ctrl.Record.id.patientId},['FULLRECORD'],['patient'])" ng-focus="ctrl.setFocusedElement()" class="patientId form-control input-sm" placeholder="Enter Patient ID " required ng-minlength="1" />
                                	<div class="has-error" ng-show="myForm.$dirty">
                                    	<span ng-show="myForm.patientId.$error.required">This is a required field</span>
                                      	<span ng-show="myForm.patientId.$invalid">This field is invalid </span>
                                  	</div>
                              	</div>
                          	</div>
                          
                          	<div class="form-group col-sm-4">
                            	<label class="col-sm-3 control-lable" for="patient.patientName">Patient Name</label>
                              	<div class="col-sm-7">
                                	<input type="text" ng-model="ctrl.Record.patient.patientName" id="patient.patientName" readonly class="patientName form-control input-sm" placeholder="Patient Name " />
                                  	<div class="has-error" ng-show="myForm.$dirty">
                                    	<span ng-show="myForm.patientName.$error.required">This is a required field</span>
                                      	<span ng-show="myForm.patientName.$invalid">This field is invalid </span>
                                  	</div>
                              	</div>
                          	</div>

                          	<div class="form-group col-sm-4">
                            	<label class="col-sm-3 control-lable" for="mttId">Main Type</label>
                              	<div class="col-sm-7">
                                	<select ng-options="s for s in ctrl.mainTreatmentTypes" ng-model="ctrl.Record.mttId" id="mttId" ng-disabled="ctrl.variableReadOnly" ng-model-options="{ allowInvalid: true}" ng-blur="ctrl.validateRecords('SubTreatmentType',{id:{mttId:ctrl.Record.mttId,sttId:ctrl.Record.sttId}},['treatmentAmount','treatmentAmount','treatmentDiscount'],['treatmentAmount','treatmentTotal','treatmentDiscount'])" ng-focus="ctrl.setFocusedElement()" class="mttId form-control input-sm" placeholder="Enter Main Type " required maxlength="20" /></select>
                                  			
                                  	<div class="has-error" ng-show="myForm.$dirty">
                                      	<span ng-show="myForm.mttId.$error.required">This is a required field</span>
                                      	<span ng-show="myForm.mttId.$invalid">This field is invalid </span>
                                  	</div>
                              	</div>
                          	</div>
                      	</div> 
                      	
                      	<div class="row">
                        	<div class="form-group col-sm-4">
                            	<label class="col-sm-3 control-lable" for="sttId">Sub Type</label>
                              	<div class="col-sm-7">
                                	<select ng-options="s for s in ctrl.filteredSubTreatmentTypes(ctrl.Record.mttId)" ng-model="ctrl.Record.sttId" id="sttId" ng-readonly="ctrl.variableReadOnly" ng-model-options="{ allowInvalid: true}" ng-blur="ctrl.validateRecords('SubTreatmentType',{id:{mttId:ctrl.Record.mttId,sttId:ctrl.Record.sttId}},['treatmentAmount','treatmentAmount','treatmentDiscount'],['treatmentAmount','treatmentTotal','treatmentDiscount'])" ng-focus="ctrl.setFocusedElement()" class="sttId form-control input-sm" placeholder="Enter Sub Type " required maxlength="20" /></select>
                                  	
                                  	<div class="has-error" ng-show="myForm.$dirty">
                                      	<span ng-show="myForm.sttId.$error.required">This is a required field</span>
                                      	<span ng-show="myForm.sttId.$invalid">This field is invalid </span>
                                  	</div>
                              	</div>
                          	</div>

		                	<div class="form-group col-sm-4">
		                    	<label class="col-sm-3 control-lable" for="treatmentDate">Treatment Date</label>
		                        <div class="col-sm-7">		                        	
		                        	<md-datepicker ng-model="ctrl.Record.treatmentDate"  ng-disabled="ctrl.variableReadOnly" md-placeholder="Enter Date"></md-datepicker>
		                        	<div class="has-error" ng-show="myForm.$dirty"></div>
		                        </div>
		                	</div>

                          	<div class="form-group col-sm-4">
                            	<label class="col-sm-3 control-lable" for="treatmentAmount">Treatment Amount</label>
                              	<div class="col-sm-7">
                                  	<input type="number" step="0.01" readonly ng-model="ctrl.Record.treatmentAmount" id="treatmentAmount" class="treatmentAmount form-control input-sm" placeholder="Treatment Amount " />
                                  	<div class="has-error" ng-show="myForm.$dirty">
                                    	<span ng-show="myForm.treatmentAmount.$error.required">This is a required field</span>
                                      	<span ng-show="myForm.treatmentAmount.$invalid">This field is invalid </span>
                                  	</div>
                              	</div>
                          	</div>
                      	</div>
                      	
                      	<div class="row">
                        	<div class="form-group col-sm-4">
                              	<label class="col-sm-3 control-lable" for="treatmentDiscount">Discount</label>
                              	<div class="col-sm-7">
                                  	<input type="number" step="0.01" ng-model="ctrl.Record.treatmentDiscount" id="treatmentDiscount" ng-readonly="ctrl.variableReadOnly" onblur ="setTotalAmount()" class="treatmentDiscount form-control input-sm" placeholder="Enter Treatment Discount " />
                                  	<div class="has-error" ng-show="myForm.$dirty">
                                      	<span ng-show="myForm.treatmentDiscount.$error.required">This is a required field</span>
                                      	<span ng-show="myForm.treatmentDiscount.$invalid">This field is invalid </span>
                                  	</div>
                              	</div>
                          	</div>

                          	<div class="form-group col-sm-4">
                              	<label class="col-sm-3 control-lable" for="treatmentTotal">Total Amount</label>
                              	<div class="col-sm-7">
                                  	<input type="number" step="0.01" readonly ng-model="ctrl.Record.treatmentTotal" id="treatmentTotal" class="treatmentTotal form-control input-sm" placeholder="Treatment Total " />
                                  	<div class="has-error" ng-show="myForm.$dirty">
                                      	<span ng-show="myForm.treatmentTotal.$error.required">This is a required field</span>
                                      	<span ng-show="myForm.treatmentTotal.$invalid">This field is invalid </span>
                                  	</div>
                              	</div>
                          	</div>

                          	<div class="form-group col-sm-4">
                              	<label class="col-sm-3 control-lable" for="treatmentPaid">Paid Amount</label>
                              	<div class="col-sm-7">
                                  	<input type="number" step="0.01" readonly ng-model="ctrl.Record.treatmentPaid" id="treatmentPaid" class="treatmentPaid form-control input-sm" placeholder="Paid Amount " />
                                  	<div class="has-error" ng-show="myForm.$dirty">
                                      	<span ng-show="myForm.treatmentPaid.$error.required">This is a required field</span>
                                      	<span ng-show="myForm.treatmentPaid.$invalid">This field is invalid </span>
                                  	</div>
                              	</div>
                          	</div>
                      	</div>
                      	
                      	<div class="row">
                          	<div class="form-group col-sm-4">
                              	<label class="col-sm-3 control-lable" for="treatmentDesc">Description</label>
                              	<div class="col-sm-7">
<!--                                   <input type="text" ng-model="ctrl.Record.treatmentDesc" id="treatmentDesc" class="treatmentDesc form-control input-sm" placeholder="Enter Treatment Desc " /> -->
                                  	<textarea rows="1" cols="50" ng-model="ctrl.Record.treatmentDesc" id="treatmentDesc" ng-readonly="ctrl.variableReadOnly"  class="treatmentDesc form-control input-sm" placeholder="Enter Treatment Desc "></textarea>
                                  	<div class="has-error" ng-show="myForm.$dirty">
                                      	<span ng-show="myForm.treatmentDesc.$error.required">This is a required field</span>
                                      	<span ng-show="myForm.treatmentDesc.$invalid">This field is invalid </span>
                                  	</div>
                              	</div>
                          	</div>
                      	</div> 
                      	
                      	<div class="row">
                          	<div class="form-group col-md-6">
		                		<div class="col-md-12">
			                    	<input type="submit"  value="Save" class="btn btn-primary btn-sm"  ng-show ="!ctrl.variableReadOnly">
			                        <button type="button" ng-click="ctrl.reset(ctrl.Record.objid)" class="btn btn-warning btn-sm" ng-show ="!ctrl.variableReadOnly" >Cancel</button>
			                        <button type="button" ng-click="ctrl.exitReadOnly('Add')" class="btn btn-warning btn-sm" ng-show ="ctrl.variableReadOnly" >New</button>
			                        <button type="button" ng-click="ctrl.exitReadOnly('Edit')" class="btn btn-warning btn-sm" ng-show ="ctrl.enableEdit()">Edit</button>
			                        <button type="button" ng-click="ctrl.remove(ctrl.Record.objid)" class="btn btn-danger btn-sm" ng-show ="ctrl.Record.objid!=null">Delete</button>
			                        <button type="button" ng-click="ctrl.searchRecords(ctrl.SearchRecord)" class="btn btn-warning btn-sm" >Search</button>
			                        <button type="button" ng-click="ctrl.ListOfValues()" class = "btn btn-warning btn-sm">List...</button>
			                         <button type="button" ng-click="ctrl.printReport()" class="btn btn-warning btn-sm" >Print</button>
		                    	</div>
		                    </div>
                      	</div>
                  </form>
			</div>
      	</div>
      	</div>
	</body>
	<script type="text/javascript">
			var coll = document.getElementsByClassName("collapsible");
			var i;
		
			for (i = 0; i < coll.length; i++) {
			  coll[i].addEventListener("click", function() {
			    this.classList.toggle("active");
			    var content = this.nextElementSibling;
			    if (content.style.display === "block") {
			      content.style.display = "none";
			    } else {
			      content.style.display = "block";
			    }
			  });
			}
	    </script>
</html>