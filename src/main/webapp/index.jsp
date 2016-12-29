<html>
<script>
  function resizeIframe(obj) {
    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
    obj.style.width = obj.contentWindow.document.body.scrollWidth + 'px';
  }
</script>
<body>
<iframe id="f2" src="http://localhost:8080/Dental/Patients" width="712" height="1050"  scrolling="no" >
</iframe>

<iframe id="f1" src="http://localhost:8080/Dental/Appointments" width="512" height="1050"  scrolling="no" >
</iframe>

<iframe id="f3" src="http://localhost:8080/Dental/AttendPatients" width="600" height="900">
</iframe>
</body>
</html>
