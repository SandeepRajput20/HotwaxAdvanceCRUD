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
		<h1>Login Page</h1>

		<div class="col-lg-8  m-auto  d-block">

			<form action="<%= request.getContextPath() %>/LoginServlet" onsubmit="return Validation()" method="post">

				<div class="form-group">
					<label>Enter Email : </label> <input type="text" name="userEmail"
						class="form-control" id="email" autocomplete="off"><br>
					<span id="Email" style="color: red;"> </span>
				</div>
				<br>
				<div class="form-group">
					<label>Password : </label> <input type="password" name="userPassword"
						class="form-control" id="password" autocomplete="off"><br>
					<span id="Password" style="color: red;"> </span>
				</div>

				<br> <input type="submit" id="submit" value="Login"
					autocomplete="off">

			</form>
			<br>

			<form action="index.jsp" class="inline">
				<button class="float-left submit-button">Registration</button>
			</form>
		</div>
	</div>

	<script type="text/javascript">
		function Validation() {

			var userEmail = document.getElementById('email').value;
			var userPassword = document.getElementById('password').value;

			if (userEmail == "") {
				document.getElementById('Email').innerHTML = "Please Enter User Email";
				return false;
			}

			if (userPassword == "") {
				document.getElementById('Password').innerHTML = "Please Enter User Password";
				return false;
			}

		}
	</script>
</body>
</html>