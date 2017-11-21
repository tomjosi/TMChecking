<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="../includes/header.jsp"%>
<title>List All Sessions</title>
</head>
<body>
	<%@ include file="../includes/navbar.jsp"%>
	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>View all your Appointments</h1>
				<p>Appointment For TM Checking</p>

				<div class="pull-left">
					<h3>${SpecialBlurb}</h3>
				</div>
			</div>
			<a href="<spring:url value="/appointments/create" />"
				class="btn btn-primary btn-mini pull-right">Add a new one</a>

		</div>
	</section>

	<section class="container">
		<div class="row">
			<c:forEach items="${sessions}" var="session">
				<div class="col-sm-6 col-md-4" style="padding-bottom: 15px">
					<div class="thumbnail">
						<div class="caption">
							<h4>Session Date - ${session.date}</h4>
							<h4>Session StartTime - ${session.startTime}</h4>
							<h4>Session Duration - ${session.duration}</h4>
							<h4>Session Location - ${session.location}</h4>
							<h4>Session Capacity - ${session.capacity}</h4>
							<h4>Session Counsellor - ${session.person.fullName}</h4>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>
