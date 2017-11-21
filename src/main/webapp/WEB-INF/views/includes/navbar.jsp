<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<spring:url value='/' />">Appointment Management</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="<spring:url value='/' />">Home <span
						class="sr-only">(current)</span></a></li>
				<li><a href="#">View Appointment</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<security:authorize access="isAuthenticated()">
					<p class="navbar-text navbar-right">
						Signed in as <a href="#" class="navbar-link"> <security:authentication
								property="principal.username" />
						</a>
					</p>

					<%-- <li><a href="<spring:url value='/logout' />"> Logout</a></li> --%>

					<style>
.logout {
	position: relative;
	top: 8px;
	color: #999;
	text-decoration: none;
}
</style>

					<li><spring:url value="/logout" var="logout_url" /> <form:form
							action="${logout_url}" class="form-horizontal" method="POST">
							<div class="form-group">
								<div class="col-lg-offset-2 col-lg-10">
									<button type="submit" id="btnAdd" class="btn btn-link logout"
										value="Logout">Logout</button>
								</div>
							</div>
						</form:form></li>









				</security:authorize>



				<security:authorize access="!hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
					<li><a href="<spring:url value='/login' />"> Login</a></li>
				</security:authorize>










				<!-- <li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Dropdown <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Login</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#">Separated link</a></li>
					</ul></li> -->
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>