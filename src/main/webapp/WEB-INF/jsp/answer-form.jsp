<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<jsp:include page="common.jsp" />
<!DOCTYPE html>

<html>
<head>
<title>Save Answer</title>
</head>
<body>

	<div class="container" style="margin-top: 30px">

		<form:form
			action="${pageContext.request.contextPath}/questions/showFormForUpdateBack"
			modelAttribute="answer" method="GET">
			<form:hidden path="question.id" />
			<td><input type="submit" value="Back to Question"
				class="btn btn-primary" /></td>
		</form:form>

		<form:form action="saveAnswer" modelAttribute="answer" method="POST">
			<form:hidden path="id" />
			<form:hidden path="question.id"/>
			<h2>Save Answer</h2>
			<c:if test="${answer.question.id !=0 }">
			<h2>For Question: <c:out value="${answer.question.content }"></c:out></h2>
			</c:if>
			
			<table class="table">
				<tbody>

					<tr>
						<td><label>Body</label></td>
						<td><form:input path="body" /></td>
					</tr>
					<tr>
						<td><label>IsCorrect</label></td>
						<td><form:select path="correct">
								<form:option value="false"></form:option>
								<form:option value="true"></form:option>

							</form:select></td>
					</tr>
					<security:authorize access="hasRole('ADMIN')">
					<tr>
						<td><label>Question Id</label></td>
						<td><form:input path="question.id" /></td>
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



</body>

</html>