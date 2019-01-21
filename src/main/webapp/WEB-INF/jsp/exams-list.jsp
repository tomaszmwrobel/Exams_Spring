<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="common.jsp"/>

<!DOCTYPE html>

<html>
<head>

<title>List All Exams</title>

</head>

<body>

	<br>
	<form action="<c:url value="exams/showFormForAdd" />" method="GET">
		<input type="submit" value="Add New" />
	</form>


	<table>
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Description</th>
			<th>PointsToPass</th>
			<th>Questions</th>
			<th>Options</th>
			<th>Make An Exam</th>

		</tr>

		<c:forEach var="tempExams" items="${exams}">
			<c:url var="makeExam"
				value="exams/makeExam">
				<c:param name="examId" value="${tempExams.id}" />
			</c:url>

			<c:url var="updateLink" value="/exams/showFormForUpdate">
				<c:param name="examId" value="${tempExams.id}" />

			</c:url>

			<c:url var="deleteLink" value="/exams/delete">
				<c:param name="examId" value="${tempExams.id}" />

			</c:url>

			<tr>
				<td>${tempExams.id }</td>
				<td>${tempExams.name }</td>
				<td>${tempExams.description }</td>
				<td>${tempExams.positiveResult }</td>
				<td>${tempExams.questions.size() }</td>

				<td><a href="${updateLink}">Update</a>
				|
				<a href="${deleteLink}">Delete</a>
				
				
				</td>
				<td><a href="${makeExam}">MakeExam</a></td>
			</tr>

		</c:forEach>

	</table>



</body>


</html>
