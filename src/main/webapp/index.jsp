<html>
<script src="webjars/jquery/2.1.4/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$('#f4').attr('src',window.location.href+'AttendPatients');
    $('#f3').attr('src',window.location.href+'AppointmentsDates');
    $('#f1').attr('src',window.location.href+'Appointments');
    $('#f2').attr('src',window.location.href+'Patients');
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