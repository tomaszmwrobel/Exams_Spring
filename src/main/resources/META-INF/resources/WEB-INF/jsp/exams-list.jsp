<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<jsp:include page="common.jsp" />

<!DOCTYPE html>

<html>
<head>

<title>List All Exams</title>

</head>

<body>

	<security:authorize access="hasRole('ADMIN')">

	You Log In as Admin
	</security:authorize>
	<br>


	<div class="container">
		<form action="<c:url value="exams/showFormForAdd" />" method="GET">
			<input type="submit" value="Add New Exam"  class="btn btn-primary"/>
		</form>
		<table class="table table-hover">
			<tr>
				<security:authorize access="hasRole('ADMIN')">
					<th>Id</th>
				</security:authorize>
				<th>Name</th>
				<th>Description</th>
				
				<th>Questions</th>
				<security:authorize access="hasAnyRole('ADMIN','TEST')">
					<th>Options</th>
				</security:authorize>
				<security:authorize access="hasRole('ADMIN')">
				<th>PointsToPass</th>
				</security:authorize>
				<th>Make An Exam</th>

			</tr>

			<c:forEach var="tempExams" items="${exams}">
				<c:url var="makeExam" value="exams/makeExam">
					<c:param name="examId" value="${tempExams.id}" />
				</c:url>

				<c:url var="updateLink" value="/exams/showFormForUpdate">
					<c:param name="examId" value="${tempExams.id}" />

				</c:url>

				<c:url var="deleteLink" value="/exams/delete">
					<c:param name="examId" value="${tempExams.id}" />

				</c:url>

				<tr>
					<security:authorize access="hasRole('ADMIN')">
						<td>${tempExams.id }</td>
					</security:authorize>
					<td>${tempExams.name }</td>
					<td>${tempExams.description }</td>
					
					<td>${tempExams.questions.size() }</td>

					<security:authorize access="hasAnyRole('ADMIN','TEST')">
						<td><a href="${updateLink}">Update</a> 
					</security:authorize>
					<security:authorize access="hasRole('ADMIN')">
						<td><a href="${updateLink}">Update</a> | <a
							href="${deleteLink}">Delete</a></td>
					</security:authorize>
					
					
					<security:authorize access="hasRole('ADMIN')">
					<td>${tempExams.positiveResult }</td>
					</security:authorize>
					<td><a href="${makeExam}">MakeExam</a></td>
				</tr>

			</c:forEach>

		</table>
	</div>


</body>


</html>
