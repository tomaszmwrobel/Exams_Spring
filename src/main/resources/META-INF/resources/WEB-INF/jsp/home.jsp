<%@ taglib  prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib  prefix = "security" uri = "http://www.springframework.org/security/tags" %>
<jsp:include page="common.jsp"/>
<html>
<head>
<title>Home Page</title>

</head>

<body>

<div class="container" style="margin-top:30px">
<hr>
<h1> Home Page </h1>
<br>
Welcome on Exams website
<br>
Project is in develop process.
<br> 
You Can make two simple test:


<br><br>
<a href="/exams/makeExam?examId=1">Simple Exam 1</a>

<br>
<a href="/exams/makeExam?examId=2">Simple Exam 2</a>
<br><br>
If you want see more options please login 
<br>
<a href="/login-page">Login Page</a>
<br><br>
<security:authorize access="hasAnyRole('ADMIN','USER','TEST')">
<a href="/exams">Management of Exams</a>
</security:authorize>
<br><br>
<security:authorize access="hasRole('ADMIN')">
<a href="/admin">Admin Panel Page</a>
</security:authorize>



</div>

 
</body>

</html>