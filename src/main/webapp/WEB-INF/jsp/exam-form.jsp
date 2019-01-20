<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<title>Save Exam</title>
</head>
<body>
	<h2>Save Exam</h2>
	<br>
	<h2>
		Title:
		<c:out value="${exam.name}"></c:out>
	</h2>

	<form:form action="saveExam" modelAttribute="exam" method="POST">
		<form:hidden path="id" />
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
					<td><label></label>
					<td>
					<td><input type="submit" value="save" /></td>
				</tr>
			</tbody>
		</table>



	</form:form>
	<form:form
		action="${pageContext.request.contextPath}/questions/showFormForAdd"
		modelAttribute="exam" method="Get">
		<form:hidden path="id" />
		<form:hidden path="name" />
		<td><input type="submit" value="AddQuestions" /></td>
	</form:form>

	<form:form action="${pageContext.request.contextPath}/exams"
		method="Get">
		<td><input type="submit" value="Back To List Exams" /></td>
	</form:form>

	<h2>List of Questions</h2>
	<form:form action="saveQuestion" modelAttribute="exam" method="GET">
		<table>
			<tr>
				<th>Id</th>
				<th>Category</th>
				<th>Content</th>
				<th>Answers</th>
				<th>Correct Answers</th>
				<th>Options</th>
			</tr>
			<c:forEach var="tempQuestions" items="${exam.questions}">

				<c:url var="updateLink" value="/questions/showFormForUpdate">
					<c:param name="questionId" value="${tempQuestions.id}" />

				</c:url>

				<c:url var="deleteLink" value="/questions/delete">
					<c:param name="questionId" value="${tempQuestions.id}" />

				</c:url>

				<tr>
					<td>${tempQuestions.id }</td>
					<td>${tempQuestions.category }</td>
					<td>${tempQuestions.content }</td>
					<td>${tempQuestions.allAnswers.size() }</td>
					<td>${tempQuestions.countCorrectAnswers }</td>

					<td><a href="${updateLink}">Update</a> | <a
						href="${deleteLink}">Delete</a></td>
				</tr>

			</c:forEach>
		</table>
	</form:form>


</body>

</html>