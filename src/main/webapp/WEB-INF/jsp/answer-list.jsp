<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>
<head>

<title>List Answers</title>

</head>

<body>

<br>
	<form action="<c:url value="answers/showFormForAdd" />" method="GET">
		<input type="submit" value="Add New Answer" />
	</form>
	<table>
		<tr>
			<th>Id</th>
			<th>Question</th>
			<th>Body</th>
			<th>Is_Correct</th>	
			<th>Options</th>

		</tr>

		<c:forEach var="tempAnswers" items="${answers}">
			
			<!--<c:url var="listAnswers" value="${pageContext.request.contextPath}/answers">
				<c:param name="answersId" value="${tempAnswers.id}" />

			</c:url>-->
			
			<c:url var="updateLink" value="/answers/showFormForUpdate">
				<c:param name="answerId" value="${tempAnswers.id}" />

			</c:url>

			<c:url var="deleteLink" value="/answers/delete">
				<c:param name="answerId" value="${tempAnswers.id}" />

			</c:url>

			<tr>
				<td>${tempAnswers.id }</td>
				<td>${tempAnswers.question.id} ${tempAnswers.question.content}</td>
				<td>${tempAnswers.body }</td>
				<td>${tempAnswers.correct }</td>

				<td><a href="${updateLink}">Update</a>
				|
				<a href="${deleteLink}">Delete</a></td>
				
			</tr>

		</c:forEach>

	</table>



</body>


</html>
