<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container" style="text-align: center;">
		<h1>Search Page</h1>

		<div class="col-lg-8  m-auto  d-block">

			<form action="<%= request.getContextPath() %>/searchServlet" method="post" onsubmit="return Validation()"
				style="bg-light">

				<div class="form-group">
					<label>First Name : </label> <input type="text" name="first_Name"
						class="form-control" id="firstName" autocomplete="off"><br>
					<span id="firstname" style="color: red;"> </span>
				</div>
				<br>
				<div class="form-group">
					<label>Last Name : </label> <input type="text" name="last_Name"
						class="form-control" id="lastName" autocomplete="off"><br>
					<span id="lastname" style="color: red;"> </span>
				</div>

				<br> <input type="submit" id="submit" value="Search" autocomplete="off">

			</form>
	</div>

	<script type="text/javascript">
		function Validation() {

			var firstName = document.getElementById('first_Name').value;
			var lastName = document.getElementById('last_Name').value;

			if (firstName == "") {
				document.getElementById('firstname').innerHTML = "Please Enter First Name";
				return false;
			}

			if ((firstName.length <= 2) || (firstName >= 15)) {
				document.getElementById('firstname').innerHTML = "First Name must be between 2 to 15";
				return false;
			}
			if (!isNaN(firstName)) {
				document.getElementById('firstname').innerHTML = "First Name must be Charecter";
				return false;
			}

			if (lastName == "") {
				document.getElementById('lastname').innerHTML = "Please Enter Last Name";
				return false;
			}

			if ((lastName.length <= 2) || (lastName >= 15)) {
				document.getElementById('lastname').innerHTML = "Last Name must be between 2 to 15";
				return false;
			}
			if (!isNaN(firstName)) {
				document.getElementById('lastname').innerHTML = "Last Name must be Charecter";
				return false;
			}
		}
	</script>
</body>
</html>