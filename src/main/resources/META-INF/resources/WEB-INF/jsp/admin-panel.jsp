<%@ taglib  prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib  prefix = "security" uri = "http://www.springframework.org/security/tags" %>
<jsp:include page="common.jsp"/>
<html>
<head>
<title>Home Page</title>
 <link href="webjars/bootstrap/4.2.1/css/bootstrap.min.css"
        rel="stylesheet">

</head>

<body>
<hr>
<h1>Admin Panel</h1>
<br>



<a href="${pageContext.request.contextPath}/api">API MAIN PAGE</a>

<br><br>

<a href="${pageContext.request.contextPath}/exams">Exams List</a>

<br><br>

<a href="${pageContext.request.contextPath}/questions">Questions List</a>

<br><br>

<a href="${pageContext.request.contextPath}/answers">Answers List</a>

<br><br>


<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
        <script src="webjars/bootstrap/4.2.1/js/bootstrap.min.js"></script>
 
</body>

</html>