<html>
<script src="../webjars/jquery/2.1.4/jquery.min.js"></script>
<script>
$(document).ready(function() {
	var base_url = window.location.href.substr(0, window.location.href.indexOf('Dental')+7);
	$('#f4').attr('src',base_url+'AttendPatients');
    $('#f3').attr('src',base_url+'AppointmentsDates');
    $('#f1').attr('src',base_url+'Appointments');
    $('#f2').attr('src',base_url+'Patients');
})
  function resizeIframe(obj) {
    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
    obj.style.width = obj.contentWindow.document.body.scrollWidth + 'px';
  }
</script>
<body>
<iframe style="margin-left:-8px;margin-top:0px;position:absolute;" id="f2" src="" width="512" height="1000">
</iframe>
 
<iframe style="margin-left:514px;margin-top:0px;position:absolute;"; id="f1" src="" width="362" height="1000" >
</iframe>
 
<iframe style="margin-left:882px;margin-top:0px;position:absolute;"; id="f3" src="" width="300" height="600">
</iframe>

<iframe style="margin-left:882px;margin-top:600px;position:absolute;" id="f4" src="" width="300" height="400"  >
</iframe>

</body>
</html>