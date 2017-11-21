<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="../includes/header.jsp"%>
<title>Edit Session</title>
</head>
<body>
	<%@ include file="../includes/navbar.jsp"%>
	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>Add Session</h1>
				<p>Refresh Yourself with TM Checking</p>
			</div>
			<a href="<spring:url value="/sessions/create" />"
				class="btn btn-primary btn-mini pull-right">Add a new one</a>


			<div class="pull-left">
				<h3>${SpecialBlurb}</h3>
			</div>

		</div>
	</section>

	<section class="container">
	
	<form:form modelAttribute="session" action="../sessions/${session.id}" method="post" class="form-horizontal">
			<fieldset>
				<legend>Edit session</legend>

				<form:errors path="*" cssClass="alert alert-danger" element="div" />

				<div class="form-group">
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
				</div>


				<div class="form-group">
					<div class="col-lg-offset-2 col-lg-10">
						<input type="submit" id="btnAdd" class="btn btn-primary btn-block"
							value="Update" />
					</div>
				</div>

			</fieldset>
		</form:form>
	
		<div class="row">
			<div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
				<div class="thumbnail">
					<div class="caption">
						<h3>Date - ${session.date}</h3>
						<h3>Duration - ${session.duration}</h3>
					</div>
				</div>
			</div>

		</div>
	</section>
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>
