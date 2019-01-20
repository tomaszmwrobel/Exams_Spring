<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>
<head>

<title>List Questions</title>

</head>

<body>

	<form
		action="<c:url value="${pageContext.request.contextPath}questions/showFormForAdd" />"
		method="GET">
		<input type="submit" value="Add New Questions" />
	</form>
	<table>
		<tr>
			<th>Id</th>
			<th>Exam Title</th>
			<th>Category</th>
			<th>Content</th>
			<th>Correct Answers</th>
			<th>Options</th>
		</tr>

		<c:forEach var="tempQuestions" items="${questions}">

			<c:url var="updateLink" value="/questions/showFormForUpdate">
				<c:param name="questionId" value="${tempQuestions.id}" />

			</c:url>

			<c:url var="deleteLink" value="/questions/delete">
				<c:param name="questionId" value="${tempQuestions.id}" />

			</c:url>

			<tr>
				<td>${tempQuestions.id }</td>
				<td>${tempQuestions.exam.name }</td>
				<td>${tempQuestions.category }</td>
				<td>${tempQuestions.content }</td>
				<td>${tempQuestions.countCorrectAnswers }</td>


				<td><a href="${updateLink}">Update</a> | <a
					href="${deleteLink}">Delete</a></td>
			</tr>

		</c:forEach>

	</table>



</body>


</html>
