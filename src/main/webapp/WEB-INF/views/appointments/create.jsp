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
				<h1>Books Appointments</h1>
				<p>Re-Energize Yourself</p>
			</div>
		</div>
	</section>

	<section class="container">
		<c:if test="${ not empty message}">
			<div class="alert alert-danger alert-dismissible fade in"
				role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				${message}
			</div>
		</c:if>
		<form:form modelAttribute="appointment" id="form"
			class="form-horizontal">
			<fieldset>

				<form:errors path="*" cssClass="alert alert-danger" element="div" />

				<div class="row">
					<c:forEach items="${sessions}" var="sess">
						<div class="col-sm-6 col-md-4" style="padding-bottom: 15px">
							<div class="thumbnail">
								<div class="caption">
									<h4>Appointment Date - ${sess.date}</h4>
									<hr />
									<p>Session StartTime - ${sess.startTime}</p>
									<p>Session Duration - ${sess.duration}</p>
									<p>Session Location - ${sess.location}</p>
									<p>Session Capacity - ${sess.capacity}</p>
									<p>Session Counsellor - ${sess.person.fullName}</p>
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
