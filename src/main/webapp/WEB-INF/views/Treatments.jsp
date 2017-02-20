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
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/bootstrap-datepicker.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/jquery.timepicker.css' />" rel="stylesheet"></link>
    
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
      
    <script type="text/javascript">
    	function populatePage(Record) 
        {
        	var url = Record.treatmentImage;
        }  
        
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
        function populate(patientId) 
        {
     	   var scope = angular.element(document.getElementById("con3")).scope();
     	  	scope.ctrl.Record = {id:{treatmentId:'',patientId:''} , treatmentMainType:'', treatmentSubType:'',treatmentDesc:'', treatmentStat:'', treatmentPaidStat:'', treatmentDate:'',treatmentAmount:'',treatmentDiscount:'',treatmentTotal:'',treatmentPaid:'',treatmentImage:null,objid:null};
            scope.ctrl.Record.id.patientId = patientId;
            //scope.ctrl.setPanelHeader("Appointment - "+patientName);
            scope.$apply(scope.ctrl.searchRecords());
        }
    </script>
</head>
	<body ng-app="generalModule" class="ng-cloak">
    	<div id="con3" class="generic-container" data-ng-controller="RecordController as ctrl" ng-init="ctrl.init();ctrl.fetchAllRecords()">
          	<div class="panel panel-default">
              	<div class="panel-heading"><span class="lead">Treatment</span></div>
              	<div class="formcontainer">
                	<form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                    	<input type="hidden" ng-model="ctrl.Record.objid" /> 
                    	<input type="hidden" ng-model="ctrl.Record.id.treatmentId" id="treatmentId" class="treatmentId form-control input-sm" placeholder="Enter Treatmnet ID"/>

                      	<div class="row">
                          <div class="form-group col-sm-4">
                              <label class="col-sm-3 control-lable" for="patientId">Patient ID</label>
                              <div class="col-sm-7">
                                  <input type="number" ng-model="ctrl.Record.id.patientId" id="patientId" ng-focus="ctrl.setFocusedElement()" class="patientId form-control input-sm" placeholder="Enter Patient ID " required ng-minlength="1"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.patientId.$error.required">This is a required field</span>
                                      <span ng-show="myForm.patientId.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
<!--                       	</div>  -->
                      	
<!--                       	<div class="row"> -->
                          <div class="form-group col-sm-4">
                              <label class="col-sm-3 control-lable" for="treatmentMainType">Main Type</label>
                              <div class="col-sm-7">
                                  <input type="text" ng-model="ctrl.Record.treatmentMainType" id="treatmentMainType" class="treatmentMainType form-control input-sm" placeholder="Enter Main Type " required maxlength="20" style="text-transform:uppercase"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.treatmentMainType.$error.required">This is a required field</span>
                                      <span ng-show="myForm.treatmentMainType.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
<!--                       	</div>  -->
                      	
<!--                       	<div class="row"> -->
                          <div class="form-group col-sm-4">
                              <label class="col-sm-3 control-lable" for="treatmentSubType">Sub Type</label>
                              <div class="col-sm-7">
                                  <input type="text" ng-model="ctrl.Record.treatmentSubType" id="treatmentSubType" ng-blur="ctrl.validateRecords('SubTreatmentType',{id:{mttId:ctrl.Record.treatmentMainType,sttId:ctrl.Record.treatmentSubType}},['treatmentAmount','treatmentAmount','treatmentDiscount'],['treatmentAmount','treatmentTotal','treatmentDiscount'])" class="treatmentSubType form-control input-sm" placeholder="Enter Sub Type " required maxlength="20" style="text-transform:uppercase"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.treatmentSubType.$error.required">This is a required field</span>
                                      <span ng-show="myForm.treatmentSubType.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      	</div> 

                      	<div class="row">
<!--                           <div class="form-group col-sm-4"> -->
<!--                               <label class="col-sm-3 control-lable" for="treatmentStat">Treatment State</label> -->
<!--                               <div class="col-sm-7"> -->
<!--                                   <input type="text" ng-model="ctrl.Record.treatmentStat" id="treatmentStat" class="treatmentStat form-control input-sm" placeholder="Enter Treatment State " /> -->
<!--                                   <div class="has-error" ng-show="myForm.$dirty"> -->
<!--                                       <span ng-show="myForm.treatmentStat.$error.required">This is a required field</span> -->
<!--                                       <span ng-show="myForm.treatmentStat.$invalid">This field is invalid </span> -->
<!--                                   </div> -->
<!--                               </div> -->
<!--                           </div> -->
<!--                       	</div>  -->
                      	
<!--                       	<div class="row"> -->
<!--                           <div class="form-group col-sm-4"> -->
<!--                               <label class="col-sm-3 control-lable" for="treatmentPaidStat">Payment State</label> -->
<!--                               <div class="col-sm-7"> -->
<!--                                   <input type="text" ng-model="ctrl.Record.treatmentPaidStat" id="treatmentPaidStat" class="treatmentPaidStat form-control input-sm" placeholder="Enter Payment State " /> -->
<!--                                   <div class="has-error" ng-show="myForm.$dirty"> -->
<!--                                       <span ng-show="myForm.treatmentPaidStat.$error.required">This is a required field</span> -->
<!--                                       <span ng-show="myForm.treatmentPaidStat.$invalid">This field is invalid </span> -->
<!--                                   </div> -->
<!--                               </div> -->
<!--                           </div> -->
<!--                       	</div> -->
                      	
<!--                       	<div class="row">  -->
		                	<div class="form-group col-sm-4">
		                    	<label class="col-sm-3 control-lable" for="treatmentDate">Treatment Date</label>
		                        <div class="col-sm-7">		                        	
		                        	<md-datepicker ng-model="ctrl.Record.treatmentDate" md-placeholder="Enter Date"></md-datepicker>
		                        	<div class="has-error" ng-show="myForm.$dirty">
		                        	</div>
		                        </div>
		                	</div>
<!--  		                </div> -->

<!--                       	<div class="row"> -->
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
<!--                       	</div> -->
                      	
<!--                       	<div class="row"> -->
                          <div class="form-group col-sm-4">
                              <label class="col-sm-3 control-lable" for="treatmentDiscount">Discount</label>
                              <div class="col-sm-7">
                                  <input type="number" step="0.01" ng-model="ctrl.Record.treatmentDiscount" id="treatmentDiscount" onblur ="setTotalAmount()" class="treatmentDiscount form-control input-sm" placeholder="Enter Treatment Discount " />
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.treatmentDiscount.$error.required">This is a required field</span>
                                      <span ng-show="myForm.treatmentDiscount.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      	</div>
                      	
                      	<div class="row">
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
<!--                       	</div> -->
                      	
<!--                       	<div class="row"> -->
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
<!--                       	</div> -->
                      	
<!--                       	<div class="row"> -->
                          <div class="form-group col-sm-4">
                              <label class="col-sm-3 control-lable" for="treatmentDesc">Description</label>
                              <div class="col-sm-7">
<!--                                   <input type="text" ng-model="ctrl.Record.treatmentDesc" id="treatmentDesc" class="treatmentDesc form-control input-sm" placeholder="Enter Treatment Desc " /> -->
                                  <textarea rows="1" cols="50" ng-model="ctrl.Record.treatmentDesc" id="treatmentDesc" class="treatmentDesc form-control input-sm" placeholder="Enter Treatment Desc "></textarea>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.treatmentDesc.$error.required">This is a required field</span>
                                      <span ng-show="myForm.treatmentDesc.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      	</div> 
                      	
						<div pw-canvas version="ctrl.version" ng-click="ctrl.undo()"
           						options="{undo: true, width: 400, height: 300, color: selectedColor, lineWidth: selectedLineWidth,imageData:emptyImageData}"></div>
      						<div pw-color-selector="['#000', '#9CB199', '#CF3759', '#485247', '#E77547', '#D38E47', '#0A6A74', '#ffffff']" color="selectedColor"></div>
      						<input type="range" min="1" max="50" ng-model="selectedLineWidth" class="lineWidthSelector">{{selectedLineWidth}} 
<!--       						<input id="h1" type="text" ng-model="emptyImageData" > -->
						</div>
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.Record.objid ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset();ctrl.clearImage();" class="btn btn-warning btn-sm">Reset Form</button>
                               <button type="button" ng-click="ctrl.searchRecords()" class="btn btn-warning btn-sm" >Search</button>
                          </div>
                      </div>
                  </form>
                  
              </div>
          
          <div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">List of Treatments </span></div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>Treatment ID</th>
                              <th>Treatment Date</th>
                             <!--  <th>Patient ID</th> -->
                              <th>Main Type</th>
                              <th>Sub Type</th>
                              <th>Total Amount</th>
                              <th>Paid Amount</th>
<!--                               <th>Img</th> -->
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="u in ctrl.Records | startFrom:ctrl.currentPage*ctrl.pageSize | limitTo:ctrl.pageSize " ng-dblclick="ctrl.edit(u.objid)">
                               <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.id.treatmentId"></span></td>
                               <td ng-if="!ctrl.change(u.objid)"><span ng-bind="ctrl.setDate(u.objid, 'treatmentDate', u.treatmentDate)|date:yyyy/MM/dd"></span></td>
                               <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.treatmentMainType"></span></td>
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.treatmentSubType"></span></td> 
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.treatmentTotal"></span></td> 
                              <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.treatmentPaid"></span></td> 
<!--                               <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.treatmentImage"></span></td>  -->
<!--                              <td ng-if="!ctrl.change(u.objid)"><img src="u.treatmentImage"></img></td>     -->
<!--                               <td><img src="data:image/png;base64,></img></td -->
<!--                               <td ng-if="!ctrl.change(u.objid)"><img id="ItemPreview1" src="data:image/jpg;base64,u.treatmentImage" /></td>  -->
                               
                              <!-- <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.key.treatmentId"style="width: 100%"/></td>                                                           
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.treatmentMainType" style="width: 100%""/></td>
                              <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.treatmentSubType" style="width: 100%""/></td> -->
                              <!-- <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.treatmentImage" style="width: 100%""/></td> -->
                              <!-- <td ng-if="ctrl.change(u.objid)"><input type="hidden" ng-model="u.objid" style="width: 80px;"/></td> -->
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