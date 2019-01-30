<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<jsp:include page="common.jsp" />
<!DOCTYPE html>

<html>
<head>
<title>Save Exam</title>


</head>
<body>
	<h2>Save Exam</h2>
	<br>

	<div class="container">

		<form:form action="${pageContext.request.contextPath}/exams"
			method="Get">
			<td><input type="submit" value="Back To List Exams"
				class="btn btn-primary" /></td>
		</form:form>
	</div>

	<form:form action="saveExam" modelAttribute="exam" method="POST"
		cssClass="container">
		<form:hidden path="id" />
		<table class="table ">
			<tbody>
				<tr>
					<td><label>Title</label></td>
					<td><form:input path="name" /></td>
				</tr>
				<tr>
					<td><label>Description</label></td>
					<td><form:input path="description" /></td>
				</tr>

				<security:authorize access="hasRole('ADMIN')">
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
				</security:authorize>
				<tr>
					<td><label></label>
					<td>
					<td><input type="submit" value="save" class="btn btn-success" /></td>
				</tr>
			</tbody>
		</table>



	</form:form>

	<div class="container">
		<c:if test="${exam.id!=0}">

			<form:form
				action="${pageContext.request.contextPath}/questions/showFormForAdd"
				modelAttribute="exam" method="Get">
				<form:hidden path="id" />
				<form:hidden path="name" />
				<td><input type="submit" value="Add Question "
					class="btn btn-primary" /></td>
			</form:form>

			<h2>List of Questions</h2>
			<form:form action="saveQuestion" modelAttribute="exam" method="GET">
				<table class="table table-hover">
					<tr>
						<security:authorize access="hasRole('ADMIN')">
							<th>Id</th>
							<th>Correct Answers</th>
							<th>Category</th>
						</security:authorize>

						<th>Content</th>
						<th>Answers</th>
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
							<security:authorize access="hasRole('ADMIN')">
								<td>${tempQuestions.id }</td>
								<td>${tempQuestions.countCorrectAnswers }</td>
								<td>${tempQuestions.category }</td>
							</security:authorize>
							<td>${tempQuestions.content }</td>
							<td>${tempQuestions.allAnswers.size() }</td>
							<security:authorize access="hasRole('TEST')">
								<td><a href="${updateLink}">Update</a>
							</security:authorize>

							<security:authorize access="hasRole('ADMIN')">
								<td><a href="${updateLink}">Update</a> | <a
									href="${deleteLink}">Delete</a></td>
							</security:authorize>
						</tr>

					</c:forEach>
				</table>
			</form:form>
		</c:if>
	</div>

</body>

</html>