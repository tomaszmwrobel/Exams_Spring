<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="common.jsp"/>

<!DOCTYPE html>

<html>
<head>

<title>Make An Exams</title>

</head>

<body>

	

	<div class="container" style="margin-top:30px">
	<h3>Make An Exam Good Luck!</h3>
	<hr>
	<br>
	<form:form action="${pageContext.request.contextPath}/answers/check"
		modelAttribute="exam" method="GET">
		<c:forEach var="tempQ" items="${exam.questions}" varStatus="s">
			<table>
				<tr>
					<td><h4>${s.index+1}. ${tempQ.content}</h4></td>
				</tr>


				<c:forEach var="tempA" items="${tempQ.allAnswers }" varStatus="t">
					<table>
						<tr>
							<td><form:radiobutton
									path="questions[${s.index}].allAnswers" value="${tempA.id}" />
								${tempA.body}</td>
						</tr>
					</table>
				</c:forEach>
			</table>
		</c:forEach>
		
		<br>
		<td><input type="submit" value="Submit" class="btn btn-primary"/></td>
	</form:form>

	</div>

</body>


</html>
