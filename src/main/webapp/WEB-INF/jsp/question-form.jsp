<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<jsp:include page="common.jsp" />
<!DOCTYPE html>

<html>
<head>
<title>Save Question</title>
</head>
<body>

	<div class="container" style="margin-top: 30px">

		<form:form
			action="${pageContext.request.contextPath}/exams/showFormForUpdateId"
			modelAttribute="question" method="GET">
			<form:hidden path="exam.id" />
			<td><input type="submit" value="Back to Exam Option"
				class="btn btn-primary" /></td>
		</form:form>

		<form:form action="saveQuestion" modelAttribute="question"
			method="POST">
			<form:hidden path="id" />
			<form:hidden path="exam.id" />
			<h2>Edit Question</h2>
			<c:if test="${question.exam.id!=0 }">
				<h2>
					for Exam:
					<c:out value="${question.exam.name}"></c:out>
				</h2>

				<br>
			</c:if>
			<table class="table">
				<tbody>

					<tr>
						<td><label>Content Question</label></td>
						<td><form:input path="content" /></td>
					</tr>

					<security:authorize access="hasRole('ADMIN')">
						<tr>
							<td><label>Id</label></td>
							<td><form:input path="id" /></td>
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
					</security:authorize>
					<tr>
						<td><label></label>
						<td>
						<td><input type="submit" value="save" class="btn btn-success" /></td>
					</tr>
				</tbody>
			</table>



		</form:form>
	</div>



	<div class="container">
		<c:if test="${question.id!=0}">
			<form:form
				action="${pageContext.request.contextPath}/answers/showFormForAdd"
				modelAttribute="question" method="Get">
				<form:hidden path="id" />
				<form:hidden path="content" />
				<td><input type="submit" value="Add Answer"
					class="btn btn-primary" /></td>
			</form:form>
			<h2>
				Question:
				<c:out value="${question.content}"></c:out>
			</h2>
			<h2>List Answers</h2>
			<form:form action="saveAnswer" modelAttribute="question" method="GET">
				<table class="table table-hover ">
					<tr>
						<security:authorize access="hasRole('ADMIN')">
							<th>Id</th>
						</security:authorize>
						<th>Question</th>
						<th>Answer Body</th>
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
							<security:authorize access="hasRole('ADMIN')">
								<td>${tempAnswers.id }</td>
							</security:authorize>
							<td>${tempAnswers.question.content}</td>
							<td>${tempAnswers.body }</td>
							<td>${tempAnswers.correct }</td>
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