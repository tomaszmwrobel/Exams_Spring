<%@ taglib  prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib  prefix = "security" uri = "http://www.springframework.org/security/tags" %>
<html>
<head>
<title>Home Page</title>
</head>

<body>
<h1> Home Page </h1>
<br>



 User: <security:authentication property="principal.username"/>


<br><br>

<a href="${pageContext.request.contextPath}/">Back</a>

 Roles(s): <security:authentication property="principal.authorities"/>


</body>

</html>