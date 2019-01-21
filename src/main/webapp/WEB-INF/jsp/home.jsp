<%@ taglib  prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib  prefix = "security" uri = "http://www.springframework.org/security/tags" %>
<jsp:include page="common.jsp"/>
<html>
<head>
<title>Home Page</title>
</head>

<body>
<hr>
<h1> Home Page </h1>
<br>



<a href="/login-page">Login</a>
<br>

<a href="/api">API MAIN PAGE</a>

<br><br>

<a href="/exams">Exams List</a>

<br><br>

<a href="/questions">Questions List</a>

<br><br>

<a href="/answers">Answers List</a>

<br><br>


<a href="${pageContext.request.contextPath}/test">Test</a>


</body>

</html>