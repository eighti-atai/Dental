
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<style>
	.card-counter{
    box-shadow: 2px 2px 10px #DADADA;
    margin: 5px;
    padding: 20px 10px;
    background-color: #fff;
    height: 100px;
    border-radius: 5px;
    transition: .3s linear all;
  }

  .card-counter:hover{
    box-shadow: 4px 4px 20px #DADADA;
    transition: .3s linear all;
  }

  .card-counter.primary{
    background-color: #007bff;
    color: #FFF;
  }

  .card-counter.danger{
    background-color: #ef5350;
    color: #FFF;
  }  

  .card-counter.success{
    background-color: #66bb6a;
    color: #FFF;
  }  

  .card-counter.info{
    background-color: #26c6da;
    color: #FFF;
  }  

  .card-counter i{
    font-size: 5em;
    opacity: 0.2;
  }

  .card-counter .count-numbers{
    position: absolute;
    left: 35px;
    top: 20px;
    font-size: 32px;
    display: block;
  }

  .card-counter .count-name{
    position: absolute;
    left: 35px;
    top: 65px;
    font-style: italic;
    text-transform: capitalize;
    opacity: 0.5;
    display: block;
    font-size: 18px;
  }
	</style>
	<title>Complete Bootstrap 4 Website Layout</title>

	
	 <link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
	    <link rel="stylesheet" href="webjars/angular-material/1.1.1/angular-material.min.css">    
	    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
	    <link href="<c:url value='/static/css/lov.css' />" rel="stylesheet"></link>
	    
	    <script src="webjars/angularjs/1.5.8/angular.js"></script>
	    <script src="webjars/angularjs/1.5.8/angular-sanitize.js"></script>
	    <script src="webjars/jquery/2.1.4/jquery.min.js"></script> 
	    <script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js""></script>



</head>
<body>

<!-- Navigation -->

<script>
var hf1;
var hf2;
var hf3;
$(document).ready(function() {
	var base_url = window.location.href.substr(0, window.location.href.indexOf('Dental')+7);
   //var a = document.getElementById('f2'); //or grab it by tagname etc
   	   document.getElementById('x1').href = base_url+'pages/front.jsp';
       //document.getElementById('x1').onclick = window.open(document.getElementById('x1').href);
       document.getElementById('x2').href = base_url+'pages/TreatmentForDoc.jsp';
       document.getElementById('x3').href = base_url+'AttendPatients';
       document.getElementById('x4').href = base_url+'pages/TempAppointments.jsp';
    //$("f2").contents().find("body").onclick = function() { alert('hhjgh') };
})

</script>

<div class="container">
    <div class="row">
    <div class="col-md-8 text-center">
      <div class="card-counter ">
        <span class="count-numbers"></span>
        <span class="count-name"></span>
      </div>
    </div>
    </div>
	
	<a id="x1"  target="_blank"">
	<div class="row">
    <div class="col-md-8 text-center" >
      <div class="card-counter info">
        <span class="count-numbers">Patients/Appointments</span>
        <span class="count-name">Patients and Appointments Details</span>
      </div>
    </div>
    </div>
	</a>

	<a id="x2" target="_blank">
    <div class="row">
    <div class="col-md-8 text-center">
      <div class="card-counter info">
        <span class="count-numbers">Treatments/Payments</span>
        <span class="count-name">Treatments and Payments Details</span>
      </div>
    </div>
    </div>
	</a>

	<a id="x3" target="_blank">
    <div class="row">
    <div class="col-md-8 text-center">
      <div class="card-counter info">
        <span class="count-numbers"> Today Appointments </span>
        <span class="count-name">Your Appointments for Today</span>
      </div>
    </div>
    </div>
	</a>

	<a id="x4" target="_blank">
    <div class="row">
    <div class="col-md-8 text-center">
      <div class="card-counter info">
        <span class="count-numbers">Treatment Types</span>
        <span class="count-name">Treatment Types Details</span>
      </div>
    </div>
    </div>
	</a>
	
	
    <div class="row">
    <div class="col-md-8 text-center">
      <div class="card-counter ">
        <span class="count-numbers"></span>
        <span class="count-name"></span>
      </div>
    </div>
    </div>
</div>




</body>
</html>
















