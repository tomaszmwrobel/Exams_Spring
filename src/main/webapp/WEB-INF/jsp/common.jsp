<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>


<body>
Navigation
<div>
<form:form action="${pageContext.request.contextPath}/logout" 
method="POST">

<input type="submit" value ="Logout"/>

</form:form>

<form:form action="${pageContext.request.contextPath}/login-page" 
method="GET">

<input type="submit" value ="Log in"/>

</form:form>

<form:form action="${pageContext.request.contextPath}" 
method="GET">

<input type="submit" value ="Home"/>

</form:form>

</div>

</body>


</html>