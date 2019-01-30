<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="common.jsp" />
<html>
<head>
<title>Login Page</title>

<link href="webjars/bootstrap/4.2.1/css/bootstrap.min.css"
        rel="stylesheet">
        
        
</head>

<body>
	
	<div class ="container" style="margin-top:30px" >
	<div class= "">
	<h1>Login Page</h1>
	<br>
		<form:form
			action="${pageContext.request.contextPath}/authenticateTheUser"
			method="POST"
			cssClass="form-group"
			>


			<!--  chcek for login error -->
			<div class="input-group mb-3">
			<c:if test="${param.error !=null }">

				<div class="alert alert-danger col-xs-offset-1 col-xs-10">
					Invalid username and password.</div>
			</c:if>

			<c:if test="${param.logout !=null }">
				<div class="alert alert-success col-xs-offset-1 col-xs-10">
					You have been logged out.</div>
			</c:if>
			</div>
			<div class="input-group mb-3">
				<p>
					User Name: <input type="text" name="username"  class="input-group mb-3"/>
				</p>
			</div>
			<div class="input-group mb-3">
			<p>
				Password: <input type="password" name="password" class="input-group mb-3"/>
			</p>
			</div>
			<input type="submit" value="Login" class="btn btn-primary"/>
			
		</form:form>
		</div>
	</div>

<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
        <script src="webjars/bootstrap/4.2.1/js/bootstrap.min.js"></script>

</body>

</html>