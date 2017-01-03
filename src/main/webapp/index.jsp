<html>
<script src="webjars/jquery/2.1.4/jquery.min.js"></script>
<script>
$(document).ready(function() {
    $('#f3').attr('src',window.location.href+'AttendPatients');
    $('#f1').attr('src',window.location.href+'Appointments');
    $('#f2').attr('src',window.location.href+'Patients');
})
  function resizeIframe(obj) {
    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
    obj.style.width = obj.contentWindow.document.body.scrollWidth + 'px';
  }
</script>
<body>
<iframe id="f2" src="" width="712" height="1050"  scrolling="no" >
</iframe>
 
<iframe id="f1" src="" width="512" height="1050"  scrolling="no" >
</iframe>
 
<iframe id="f3" src="" width="600" height="900"  >
</iframe>
</body>
</html>