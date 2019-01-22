<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="common.jsp"/>

<!DOCTYPE html>

<html>
<head>
<title>Results</title>
</head>
<body>
<div class="container" style="margin-top:30px">
	<h2>Result exam</h2>

<br>

You score: <c:out value="${result}"></c:out>
<br>
Of Max Points: <c:out value="${max}"></c:out>
<br>
It is <c:out value="${pr}"></c:out> %
<br>
<c:if test="${pass==true}">
You pass
</c:if>

<c:if test="${pass==false}">
You Fail
</c:if>

</div>


</body>

</html>