<html>
<link rel="stylesheet" href="../webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
<script src="../webjars/jquery/2.1.4/jquery.min.js"></script>
<script>
$(document).ready(function() {
	var base_url = window.location.href.substr(0, window.location.href.indexOf('Dental')+7);
	$('#f4').attr('src',base_url+'AttendPatients');
    $('#f3').attr('src',base_url+'AppointmentsDates');
    $('#f1').attr('src',base_url+'Appointments');
    $('#f2').attr('src',base_url+'Patients');
})
  function resizeIframe() {
	iframeLoaded('f2');
	iframeLoaded('f1');
	iframeLoaded('f3');
	iframeLoaded('f4');
  }
  
function iframeLoaded(x) {
	var y =($(window).width()-20);
    var iFrameID = document.getElementById(x);
    var maxH = document.getElementById('f2').contentWindow.document.body.scrollHeight ;
    var maxW = document.getElementById('f2').contentWindow.document.body.scrollWidth ;
      
    if(iFrameID) {
          // here you can make the height, I delete it first, then I make it again
          iFrameID.height = "";
          iFrameID.height = maxH;
          if(x==='f1')
        	{
        	  	iFrameID.width = "";
              	iFrameID.width = (y/2) + "px";
        	}
          else if(x==='f2')
        	{
        	  	iFrameID.width = "";
              	iFrameID.width = y + "px";
        	}
          else
      		{
      	  		iFrameID.width = "";
            	iFrameID.width = (y/4) + "px";
      		}
    }   
}
</script>
<body onresize="resizeIframe()">

<!-- <div class="embed-responsive embed-responsive-16by9"> -->
<iframe style="display:inline" id="f2" onload="iframeLoaded('f2')">
</iframe>
<!--  </div> -->
 <div>
 </div>
<!--  <div class="embed-responsive embed-responsive-16by9"> -->
<iframe style="display:inline"; id="f1" onload="iframeLoaded('f1')" >
</iframe>
<!--  </div> -->
<iframe style="display:inline"; id="f3" onload="iframeLoaded('f3')">
</iframe>

<iframe style="display:inline" id="f4"  onload="iframeLoaded('f4')">
</iframe>

</body>
</html>