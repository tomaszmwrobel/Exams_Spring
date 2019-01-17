<%@ taglib  prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<html>
<head>
<title>Login Page</title>
</head>

<body>
<h1> Login Page </h1>
<br>

<form:form action="${pageContext.request.contextPath}/authenticateTheUser"
			method="POST">
			
			
			<!--  chcek for login error -->
			
			
<p>
User Name: <input type="text" name="username"/>

</p>
<p>
Password: <input type="password" name="password"/>
</p>
<input type="submit" value ="Login"/>


</form:form>



</body>

</html>