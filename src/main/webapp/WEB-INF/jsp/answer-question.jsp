<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>
<head>

<title>Make An Exams</title>

</head>

<body>

	<h3>Try with one Answer</h3>
	<br>


	<h2>${question.name}</h2>

	<form:form action="answers/check/send" modelAttribute="questions2"
		method="GET">

		<c:forEach var="tempAnswers" items="${questions2.allAnswers}">
			<table>
				<tr>

					<td><form:radiobutton path="allAnswers"
							value="${tempAnswers.body}" />
					<td>
					<td>${tempAnswers.body}</td>
				</tr>

			</table>
		</c:forEach>

		<input type="submit" value="save" />
	</form:form>

	<br>
	<br>
	<form:form action="answers/check/send" modelAttribute="questions3"
		method="GET">

		<c:forEach var="tempAnswers" items="${questions3.allAnswers}">
			<table>
				<tr>

					<td><form:radiobutton path="allAnswers"
							value="${tempAnswers.body}" />
					<td>
					<td>${tempAnswers.body}</td>
				</tr>

			</table>
		</c:forEach>

		<input type="submit" value="save" />
	</form:form>

</body>


</html>
