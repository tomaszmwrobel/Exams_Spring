<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>
<head>

<title>Make An Exams</title>

</head>

<body>

	<h3>Make An Exam Good Luck!</h3>
	<br>
	
	
		
	
	<form:form action="answers/check/send" modelAttribute="exam"
		method="GET">
		<c:forEach var="tempQ" items="${exam.questions}" varStatus="s">
			<table>
				<tr>
					<td><h4>${tempQ.content}</h4></td>
				</tr>
			
			
			<c:forEach var="tempA" items="${tempQ.allAnswers }" varStatus="t">
				<table>
					<tr>
					<td>
					<form:radiobutton path="questions[${s.index}].allAnswers" values ="${tempA.body}" />
					
					${tempA.body}</td>
					</tr>
				</table>
			</c:forEach>
			</table>
		</c:forEach>
	</form:form>



</body>


</html>
