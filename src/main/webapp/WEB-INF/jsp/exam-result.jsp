<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>
<title>Save Exam</title>
</head>
<body>
	<h2>Save Exam</h2>

<h3>Result</h3>
<br>

<c:out value="${result}"></c:out>
<br>
Of
Max Points: <c:out value="${max}"></c:out>
<br>
It is <c:out value="${pr}"></c:out> %




</body>

</html>