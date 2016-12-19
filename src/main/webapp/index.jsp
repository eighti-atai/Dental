<html>
<script type="text/javascript">
        function Reset() 
        {
            if (document.all.f1)
                alert("resultFrame found X1");
            else
                alert("resultFrame NOT found X2");

            if (typeof (document.getElementById("f1").contentWindow.Reset) == "function")
            	document.getElementById("f1").contentWindow.Reset();
            else
                alert("f1.Reset NOT found X3");
        }
    </script>
<body>
<h2>TTT</h2>
<input type="button" onclick="Reset()" value="Reset"></input>
<iframe id="f2" src="http://localhost:8081/Dental/Patients" width="600" height="900">
</iframe>

<iframe id="f1" src="http://localhost:8081/Dental/Appointments" width="600" height="900">
</iframe>
</body>
</html>
