<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="../includes/header.jsp"%>
<title>Create Session</title>
</head>
<body>
	<%@ include file="../includes/navbar.jsp"%>

	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>Create Appointments</h1>
				<p>Add New Appointment
				<p>
			</div>
		</div>
	</section>
	<section class="container">

		<form:form modelAttribute="appointment" id="form"
			class="form-horizontal">
			<fieldset>
				<legend>Add new appointment</legend>

				<form:errors path="*" cssClass="alert alert-danger" element="div" />

				<div class="row">
					<c:forEach items="${sessions}" var="sess">
						<div class="col-sm-6 col-md-4" style="padding-bottom: 15px">
							<div class="thumbnail">
								<div class="caption">
									<h4>Session Date - ${sess.date}</h4>
									<h4>Session StartTime - ${sess.startTime}</h4>
									<h4>Session Duration - ${sess.duration}</h4>
									<h4>Session Location - ${sess.location}</h4>
									<h4>Session Capacity - ${sess.capacity}</h4>
									<h4>Session Counsellor - ${sess.person.fullName}</h4>
								</div>

								<div class="form-group">
									<div class="col-lg-offset-2 col-lg-10">
										<input type="submit" id="btnAdd" data-session="${sess.id}"
											class="btn btn-primary btn-sm btn-submit" value="Book" />
									</div>
								</div>
							</div>

						</div>

					</c:forEach>
				</div>

				<form:input path="session.id" id="put-session" type="hidden" />
			</fieldset>
		</form:form>
	</section>

	<%@ include file="../includes/footer.jsp"%>
</body>
</html>
