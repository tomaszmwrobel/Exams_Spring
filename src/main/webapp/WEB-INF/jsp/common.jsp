<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<html>
<head>
<link href="/webjars/bootstrap/4.2.1/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="#">Navbar</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">

				<!--  
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/">Home</a></li>

				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/login-page">Login</a></li> -->



				<li><form:form action="${pageContext.request.contextPath}/"
						method="GET" cssClass="nav-item">
						<input type="submit" value="Home" class="btn btn-link nav-link" />
					</form:form></li>
					<security:authorize access="hasAnyRole('TEST','USER','ADMIN')">
				<li><form:form
						action="${pageContext.request.contextPath}/exams"
						method="GET" cssClass="nav-item">
						<input type="submit" value="Exams" class="btn btn-link nav-link" />
					</form:form></li>
					</security:authorize>
				<li><form:form
						action="${pageContext.request.contextPath}/login-page"
						method="GET" cssClass="nav-item">
						<input type="submit" value="Login" class="btn btn-link nav-link" />
					</form:form></li>
				<li><form:form
						action="${pageContext.request.contextPath}/logout" method="POST"
						cssClass="nav-item">
						<input type="submit" value="Logout" class="btn btn-link nav-link" />
					</form:form></li>
				<li><form:form
						action="https://github.com/tomaszmwrobel/Exams_Spring"
						method="GET" cssClass="nav-item">
						<input type="submit" value="GitHub" class="btn btn-link nav-link" />
					</form:form></li>

			</ul>
		</div>
	</nav>


	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/4.2.1/js/bootstrap.min.js"></script>

</body>
</html>