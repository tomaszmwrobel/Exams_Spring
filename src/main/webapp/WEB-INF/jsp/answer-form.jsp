<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>
<head>
<title>Save Answer</title>
</head>
<body>
	<h2>Save Answer</h2>

	<form:form action="saveAnswer" modelAttribute="answer" method="POST">
		<form:hidden path="id" />
		<table>
			<tbody>
				<tr>
					<td><label> ${answer.question.content}</label></td>
					<td></td>
				</tr>
				<tr>
					<td><label>Question Id</label></td>
					<td><form:input path="question.id" /></td>
				</tr>
				<tr>
					<td><label>Body</label></td>
					<td><form:input path="body" /></td>
				</tr>
				<tr>
					<td><label>IsCorrect</label></td>
					<td><form:input path="correct" /></td>
				</tr>


				<tr>
					<td><label></label>
					<td>
					<td><input type="submit" value="save" /></td>
				</tr>
			</tbody>
		</table>

	</form:form>

	<form:form
		action="${pageContext.request.contextPath}/questions/showFormForUpdateBack"
		modelAttribute="answer" method="GET">
		<form:hidden path="question.id" />
		<td><input type="submit" value="Back to Question" /></td>
	</form:form>


</body>

</html>