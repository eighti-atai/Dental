<html>
<link rel="stylesheet" href="../webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
<script src="../webjars/jquery/2.1.4/jquery.min.js"></script>
<script>
$(document).ready(function() {
	var base_url = window.location.href.substr(0, window.location.href.indexOf('Dental')+7);
	$('#f1').attr('src',base_url+'Patients');
	$('#f2').attr('src',base_url+'TreatmentQueries');
	$('#f3').attr('src',base_url+'Payments');
    
})
  function resizeIframe() {
	iframeLoaded('f1');
	iframeLoaded('f2');
	iframeLoaded('f3');
  }
  
function iframeLoaded(x) {
	var y =($(window).width()-20);
    var iFrameID = document.getElementById(x);
    var maxH = document.getElementById('f1').contentWindow.document.body.scrollHeight ;
    var maxW = document.getElementById('f1').contentWindow.document.body.scrollWidth ;
    iFrameID.height = "";
    var h1 = maxH;
    var h2 = h1/4;
    var h3 = h2*8;
      
    if(iFrameID) {
          // here you can make the height, I delete it first, then I make it again
          
          
          
          if(x==='f1')
        	{
        	  	iFrameID.width = "";
              	iFrameID.width = y + "px";
              	iFrameID.height = maxH;
        	}
          else if(x==='f2')
      		{
      	  		iFrameID.width = "";
            	iFrameID.width = (y/2) + "px";
            	iFrameID.height = h3/2;
      		}
          else if(x==='f3')
    		{
    	  		iFrameID.width = "";
          	iFrameID.width = (y/2) + "px";
          	iFrameID.height = h3/2;
    		}
    }   
}

/*window.setInterval("reloadIFrame();", 30000);

function reloadIFrame() {
 document.getElementById('f2').contentWindow.document.location.reload();
}*/

</script>
<body onresize="resizeIframe()">

<!-- <div class="embed-responsive embed-responsive-16by9"> -->
<iframe style="display:inline" id="f1" onload="iframeLoaded('f1')">
</iframe>
<!--  </div> -->
 <div>
 </div>
<!--  <div class="embed-responsive embed-responsive-16by9"> -->
<iframe style="display:inline" id="f2" onload="iframeLoaded('f2')" >
</iframe>
<!--  </div> -->
<iframe style="display:inline"; id="f3" onload="iframeLoaded('f3')">
</iframe>

<!-- <iframe style="display:inline" id="f4"  onload="iframeLoaded('f4')"> -->
<!-- </iframe> -->

</body>
</html>