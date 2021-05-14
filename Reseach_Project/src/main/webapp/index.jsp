<%@page import="com.Project"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Project Details</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery.min.js"></script>
<script src="Components/doctor.js"></script>
<script src="Components/jquery.min.js"></script>
<link rel="stylesheet" href="assets">
<link rel="stylesheet" href="Views/bootstrap.min.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

	<div class="row">
		<div class="col-lg-12">
			<div class="card m-b-32">
				<div class="card-body">

					<form id="formProject" name="formProject" method="post"
						action="index.jsp" required>

						<label>Project Code</label> <input id="proCode"
							name="proCode" type="text"
							class="form-control form-control-sm" required>
							<br> 
							
						<label>Project Name</label> <input id="proName"
							name="proName" type="text"
							class="form-control form-control-sm" required>
							<br>
						<label>Project Price</label> <input id="proPrice"
							name="proPrice" type="text"
							class="form-control form-control-sm" required>
							<br>
						<label>Project Description</label> <input id="proDesc"
							name="proDesc" type="text"
							class="form-control form-control-sm" required>
							<br>
						<label>Project Type</label> <input id="proType"
							name="proType" type="text"
							class="form-control form-control-sm" required>
							<br>
							
							
						<br>	
							
							 <input id="btnSave" name="btnSave" type="button" value="Save"
							class="btn btn-primary"> <input type="hidden"
							id="hidIdSave" name="hidIdSave" value="">
					</form>
					<br>
					<div id="alertSuccess" class="alert alert-success"></div>
					<div id="alertError" class="alert alert-danger"></div>
					<br> <br>
					
					<div id="divDoctorGrid">
						<%
							Project proObj = new Project();
							out.print(proObj.readProjects());
						%>
					</div>
				</div>
</div>
</div>
</div>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>