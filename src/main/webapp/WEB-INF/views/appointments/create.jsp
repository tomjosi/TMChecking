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

		<form:form modelAttribute="appointment" class="form-horizontal">
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
								
								<%-- <form:input id="firstName" path="session" value="${session}" type="hidden"
							class="form-control" /> --%>

								<div class="form-group">
									<div class="col-lg-offset-2 col-lg-10">
										<input type="submit" id="btnAdd"
											class="btn btn-primary btn-sm" value="Book" />
									</div>
								</div>
							</div>

						</div>

					</c:forEach>
				</div>

				<%-- <div class="form-group">
					<label class="control-label col-lg-2" for="firstName">Date</label>
					<div class="col-lg-10">
						<form:input id="firstName" path="date" type="text"
							class="form-control" />
						<form:errors path="date" cssClass="text-danger" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="lastName">Start
						Time</label>
					<div class="col-lg-10">
						<form:input id="lastName" path="startTime" type="text"
							class="form-control" />
						<form:errors path="startTime" cssClass="text-danger" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="email">Duration</label>
					<div class="col-lg-10">
						<form:input id="email" path="duration" type="text"
							class="form-control" />
						<form:errors path="duration" cssClass="text-danger" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="userName">Location</label>
					<div class="col-lg-10">
						<div class="form:input-prepend">
							<form:input id="username" path="location" type="text"
								class="form-control" />
							<form:errors path="location" cssClass="text-danger" />
						</div>
					</div>
				</div>


				<div class="form-group">
					<label class="control-label col-lg-2" for="password">Capacity</label>
					<div class="col-lg-10">
						<div class="form:input-prepend">
							<form:input id="password" path="capacity" class="form-control" />
							<form:errors path="capacity" cssClass="text-danger" />
						</div>
					</div>
				</div> --%>
			</fieldset>
		</form:form>
	</section>

	<%@ include file="../includes/footer.jsp"%>
</body>
</html>
