<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>
<head>
<title>Save Exam</title>
</head>
<body>
	<h2>Save Exam</h2>

	<form:form action="saveExam" modelAttribute="exam" method="POST">
		<form:hidden path="id"/>
			<table>
				<tbody>
					<tr>
						<td><label>Title</label></td>
						<td><form:input path="name" /></td>
					</tr>
					<tr>
						<td><label>Description</label></td>
						<td><form:input path="description" /></td>
					</tr>
					<tr>
						<td><label>Positive_Result</label></td>
						<td><form:input path="positiveResult" /></td>
					</tr>
					<tr>
						<td><label>Code</label></td>
						<td><form:input path="code" /></td>
					</tr>
					<tr>
						<td><label>User_Id</label></td>
						<td><form:input path="userId" /></td>
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