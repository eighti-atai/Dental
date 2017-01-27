<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome</title>

    <link href="${contextPath}/static/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
		<a href = "${contextPath}/salespartlist1"> Sales Price List </a>
		<a href = "${contextPath}/addresses"> Address </a>
		<a href = "${contextPath}/site2"> Site </a>
		<a href = "${contextPath}/invPart"> Inventory Part</a>
		<a href = "${contextPath}/invlocations"> Inventory Location</a>
		<a href = "${contextPath}/invPartCosts"> Inventory Part Cost</a>
		<a href = "${contextPath}/invpartinstocks"> Inventory Part Cost</a>
		<a href = "${contextPath}/customers"> Customer</a>
		<a href = "${contextPath}/payments"> Payment</a>
		<a href = "${contextPath}/customerorders"> Customer Order Head</a>
		<a href = "${contextPath}/CustomerOrderLines"> Customer Order Lines</a>
    </c:if>

</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/static/js/bootstrap.min.js"></script>
</body>
</html>
