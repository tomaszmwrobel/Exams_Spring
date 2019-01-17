<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>
<head>
<title>Save Question</title>
</head>
<body>
	<h2>Save Question</h2>

	<form:form action="saveQuestion" modelAttribute="question" method="POST">
		<form:hidden path="id"/>
			<table>
				<tbody>
					<tr>
						<td><label>Id</label></td>
						<td><form:input path="id" /></td>
					</tr>
					<tr>
						<td><label>Content</label></td>
						<td><form:input path="content" /></td>
					</tr>
					<tr>
						<td><label>Category</label></td>
						<td><form:input path="category" /></td>
					</tr>
					<tr>
						<td><label>CorrectAnswers</label></td>
						<td><form:input path="countCorrectAnswers" /></td>
					</tr>
					
					<tr>
						<td><label>Exam_Id</label></td>
						<td><form:input path="exam.id" /></td>
					</tr>
					
					<tr>
					<td><label></label><td>
					<td><input type="submit" value="save"/></td>
					</tr>
				</tbody>
			</table>

	</form:form>


</body>

</html>