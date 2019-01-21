<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="common.jsp"/>
<html>
<head>
<title>Login Page</title>
</head>

<body>
	<h1>Login Page</h1>
	<br>

	<form:form
		action="${pageContext.request.contextPath}/authenticateTheUser"
		method="POST">


		<!--  chcek for login error -->
		<c:if test="${param.error !=null }">	
										            
									<div class="alert alert-danger col-xs-offset-1 col-xs-10">
										Invalid username and password.
									</div>
									</c:if>
									
									<c:if test="${param.logout !=null }">            
									<div class="alert alert-success col-xs-offset-1 col-xs-10">
										You have been logged out.
									</div>
								    </c:if>


		<p>
			User Name: <input type="text" name="username" />

		</p>
		<p>
			Password: <input type="password" name="password" />
		</p>
		<input type="submit" value="Login" />


	</form:form>



</body>

</html>