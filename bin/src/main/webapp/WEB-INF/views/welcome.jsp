<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="includes/header.jsp"%>
<title>Welcome</title>
</head>
<body>
	<%@ include file="includes/navbar.jsp"%>
	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>${greeting}</h1>
				<p>${tagline}</p>
				<p>
					<security:authorize access="isAuthenticated()">
  					Welcome  <security:authentication property="principal.username" />
					</security:authorize>
			</div>

			<div class="container">
				<security:authorize access="isAnonymous()">

					<a href="<spring:url value='/login' />"
						class="btn btn-default pull-right"> Login</a>

				</security:authorize>

				<a href="<spring:url value='/persons' />" class="btn btn-default">
					<span class="glyphicon-hand-left glyphicon"></span> Persons
				</a> <a href="<spring:url value='/persons' />" class="btn btn-default">
					<span class="glyphicon-hand-left glyphicon"></span> Create
				</a> <a href="<spring:url value='/persons' />" class="btn btn-default">
					<span class="glyphicon-hand-left glyphicon"></span> View
				</a>

			</div>
			<%-- <div class="pull-left">
				<h3>${SpecialBlurb}</h3>
			</div> --%>
		</div>
	</section>
	<%@ include file="includes/footer.jsp"%>
</body>
</html>
