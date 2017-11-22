<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="../includes/header.jsp"%>
<title>Create Session</title>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="<spring:url value="/resource/css/wickedpicker.css"/>">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script src="<spring:url value="/resource/js/wickedpicker.js"  />"></script>


<script>
  jQuery(document).ready(function($) {
    $("#datepicker").datepicker();
    $("#startTime").wickedpicker();

  });
  
  </script>
</head>
<body>
	<%@ include file="../includes/navbar.jsp"%>

	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>Create Sessions</h1>
				<p>Add a new one
				<p>
			</div>
		</div>
	</section>
	<section class="container">

		<form:form modelAttribute="session" class="form-horizontal">
			<fieldset>
				<legend>Add new session</legend>

				<form:errors path="*" cssClass="alert alert-danger" element="div" />

				<div class="form-group">
					<label class="control-label col-lg-2" for="datepicker">Date</label>
					<div class="col-lg-10">
						<form:input id="datepicker" path="date" class="form-control"
							 placeholder="MM/DD/YYYY"/>
						<form:errors path="date" cssClass="text-danger" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="startTime">Start
						Time</label>
					<div class="col-lg-10">
						<form:input id="startTime" path="startTime" type="text"
							class="form-control" placeHolder="Starting Time"/>
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
					<label class="control-label col-lg-2" for="verifyPassword">
						Counsellor</label>
					<div class="col-lg-10">
						<div class="form:input-prepend">
							<form:select class="form-control" id="sel1" path="person.id">
								<%-- <form:option value="" label="Select Counselor" /> --%>
								<form:options items="${persons}" itemLabel="fullName"
									itemValue="id" />
							</form:select>
							<form:errors path="person.id" cssClass="text-danger" />
						</div>
					</div>
				</div>


				<div class="form-group">
					<div class="col-lg-offset-2 col-lg-10">
						<input type="submit" id="btnAdd" class="btn btn-primary btn-block"
							value="Add" />
					</div>
				</div>

			</fieldset>
		</form:form>
	</section>

	<%@ include file="../includes/footer.jsp"%>
</body>
</html>
