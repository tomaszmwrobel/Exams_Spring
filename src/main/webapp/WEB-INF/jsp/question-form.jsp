<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>
<title>Save Question</title>
</head>
<body>
	<h2>Save Question</h2>



	<form:form action="saveQuestion" modelAttribute="question"
		method="POST">
		<form:hidden path="id" />
		<c:if test="${question.exam.id !=0 }">
			<h2>for Exam:</h2>
			<h1>
				<c:out value="${examName}"></c:out>
			</h1>
			<br>
		</c:if>
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
					<td><label></label>
					<td>
					<td><input type="submit" value="save" /></td>
				</tr>
			</tbody>
		</table>



	</form:form>

	<form:form
		action="${pageContext.request.contextPath}/answers/showFormForAdd"
		modelAttribute="question" method="Get">
		<form:hidden path="id" />
		<form:hidden path="content" />
		<td><input type="submit" value="Add Answer" /></td>
	</form:form>

	<form:form
		action="${pageContext.request.contextPath}/exams/showFormForUpdateId"
		modelAttribute="question" method="GET">
		<form:hidden path="exam.id" />
		<td><input type="submit" value="Back to Exam Option" /></td>
	</form:form>

	<h2>List of Answers</h2>
	<form:form action="saveAnswer" modelAttribute="question" method="GET">
		<table>
			<tr>
				<th>Id</th>
				<th>Question</th>
				<th>Body</th>
				<th>Is_Correct</th>
				<th>Options</th>

			</tr>
			<c:forEach var="tempAnswers" items="${question.allAnswers}">



				<c:url var="updateLink" value="/answers/showFormForUpdate">
					<c:param name="answerId" value="${tempAnswers.id}" />

				</c:url>

				<c:url var="deleteLink" value="/answers/delete">
					<c:param name="answerId" value="${tempAnswers.id}" />

				</c:url>

				<tr>
					<td>${tempAnswers.id }</td>
					<td>${tempAnswers.question.id}${tempAnswers.question.content}</td>
					<td>${tempAnswers.body }</td>
					<td>${tempAnswers.correct }</td>

					<td><a href="${updateLink}">Update</a> | <a
						href="${deleteLink}">Delete</a></td>

				</tr>

			</c:forEach>

		</table>

	</form:form>

</body>

</html>