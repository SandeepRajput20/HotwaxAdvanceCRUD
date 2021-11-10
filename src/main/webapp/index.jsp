<%@page import="com.mysql.cj.jdbc.ha.ReplicationMySQLConnection"%>
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
		<h1>Registration Page</h1>

		<div class="col-lg-8  m-auto  d-block">

			<form action="<%= request.getContextPath() %>/registration" method="post" onsubmit="return Validation()" class="bg-light">

				<div class="form-group">
					<label>First Name : </label> <input type="text" name="firstName"
						class="form-control" id="firstName" autocomplete="off"><br>
					<span id="firstname" style="color: red;"> </span>
				</div>
				<br>
				<div class="form-group">
					<label>Last Name : </label> <input type="text" name="lastName"
						class="form-control" id="lastName" autocomplete="off"><br>
					<span id="lastname" style="color: red;"> </span>
				</div>
				<br>
				<div class="form-group">
					<label>Address : </label> <input type="text" name="address"
						class="form-control" id="address" autocomplete="off"><br>
					<span id="Address" style="color: red;"> </span>
				</div>
				<br>
				<div class="form-group">
					<label>City : </label> <input type="text" name="city"
						class="form-control" id="city" autocomplete="off"><br>
					<span id="City" style="color: red;"> </span>
				</div>
				<br>
				<div class="form-group">
					<label>State : </label> <input type="text" name="state"
						class="form-control" id="state" autocomplete="off"><br>
					<span id="State" style="color: red;"> </span>
				</div>
				<br>
				<div class="form-group">
					<label>Country : </label> <input type="text" name="country"
						class="form-control" id="country" autocomplete="off"><br>
					<span id="Country" style="color: red;"> </span>
				</div>
				<br>
				<div class="form-group">
					<label>Pin-Code : </label> <input type="text" name="pincode1"
						class="form-control" id="pincode" autocomplete="off"><br>
					<span id="Pincode" style="color: red;"> </span>
				</div>
				<br>
				<div class="form-group">
					<label>Phone : </label> <input type="text" name="phone1"
						class="form-control" id="phone" autocomplete="off"><br>
					<span id="Phone" style="color: red;"> </span>
				</div>
				<br>

 				<div class="form-group">
					<label>Email : </label> <input type="email" name="email"
						class="form-control" id="email" autocomplete="off"><br>
					<span id="Email" style="color: red;"> </span>
				</div>
				<br>

				<div class="form-group">
					<label>Password : </label> <input type="password" name="password"
						class="form-control" id="password" autocomplete="off"><br>
					<span id="Password" style="color: red;"> </span>
				</div>

				<br> <input type="submit" id="submit" autocomplete="off">

			</form>
			<br>
			
			<form action="login.jsp" class="inline">
				<button class="float-left submit-button">Login</button>
			</form>
			
			
			
		</div>
	</div>

	<script type="text/javascript">
		function Validation() {

			var firstName = document.getElementById('firstName').value;
			var lastName = document.getElementById('lastName').value;
			var address = document.getElementById('address').value;
			var city = document.getElementById('city').value;
			var state = document.getElementById('state').value;
			var country = document.getElementById('country').value;
			var pincode = document.getElementById('pincode').value;
			var phone = document.getElementById('phone').value;
			
			var email = document.getElementById('email').value;
			var password = document.getElementById('password').value;

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

			if (address == "") {
				document.getElementById('Address').innerHTML = "Please Enter Address";
				return false;
			}

			if (city == "") {
				document.getElementById('City').innerHTML = "Please Enter City";
				return false;
			}
			if (state == "") {
				document.getElementById('State').innerHTML = "Please Enter State";
				return false;
			}

			if (country == "") {
				document.getElementById('Country').innerHTML = "Please Enter Country";
				return false;
			}

			if (pincode == "") {
				document.getElementById('Pincode').innerHTML = "Please Enter Pin-Code";
				return false;

			}
			if (isNaN(pincode)) {
				document.getElementById('Pincode').innerHTML = "PinCode must be Digit not Charecter";
				return false;
			}
			if ((pincode.length != 6) || (pincode.length < 6)) {
				document.getElementById('Pincode').innerHTML = "Enter Valid PinCode";
				return false;
			}

			if (phone == "") {
				document.getElementById('Phone').innerHTML = "Please Enter Phone";
				return false;
			}

			if (isNaN(phone)) {
				document.getElementById('Phone').innerHTML = "Phone Number must be Digits not charecter";
				return false;
			}
			if (phone.length != 10) {
				document.getElementById('Phone').innerHTML = "Mobile Number must be 10 Digit only ";
				return false;
			}

  			if (email == "") {
				document.getElementById('Email').innerHTML = "Please Enter Email ";
				return false;
			}

			if (password == "") {
				document.getElementById('Password').innerHTML = "Please Enter Password";
				return false;
			}

		}
	</script>
</body>
</html>