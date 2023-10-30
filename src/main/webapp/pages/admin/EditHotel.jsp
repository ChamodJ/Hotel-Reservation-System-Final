<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="service.HotelServiceImplementation"%>
<%@ page import="util.CommonConstants"%>
<%@ page import="util.DBConnectionUtil"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@ page import="model.Hotel"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Hotel</title>
<style>
.addHotel {
	display: flex;
	justify-content: center;
}

.form-box {
	width: 400px;
	height: 500px;
	background: #f1f7fe;
	overflow: hidden;
	border-radius: 16px;
	color: #010101;
	text-align: center;
}

.form {
	display: flex;
	flex-direction: column;
	padding: 32px 24px 24px;
	gap: 30px;
	text-align: center;
}

/*Form text*/
.title {
	font-weight: bold;
	font-size: 1.6rem;
}

.subtitle {
	font-size: 1rem;
	color: #666;
}

/*Inputs box*/
.form-container {
	overflow: hidden;
	border-radius: 8px;
	background-color: #fff;
	margin: 1rem 0 .5rem;
	width: 100%;
}

.input {
	background: none;
	border: 0;
	outline: 0;
	height: 40px;
	width: 100%;
	border-bottom: 1px solid #eee;
	font-size: .9rem;
	padding: 8px 15px;
	gap: 10px;
}

/*Button*/
.form button {
	background-color: #0066ff;
	color: #fff;
	border: 0;
	border-radius: 24px;
	padding: 10px 16px;
	font-size: 1rem;
	font-weight: 600;
	cursor: pointer;
	transition: background-color .3s ease;
}

.form button:hover {
	background-color: #005ce6;
}

.back-btn {
	background-color: #005ce6;
	color: #fff;
	border: 0;
	border-radius: 24px;
	padding: 8px 20px;
	font-size: 1rem;
	font-weight: 600;
	cursor: pointer;
	transition: 0.3s;
}

.back-btn:hover {
	background-color: #0044ab
}
</style>

<link rel="stylesheet" href="../../styles/navBar.css">

<link rel="stylesheet" href="Header.css">
</head>
<body class="overflow">

	<!--  Code for Handling Session -->
	<%  
	response.setHeader("cache-control","no-cache, no-store, must-revalidate");

	if(session.getAttribute("user") == null) {
		response.sendRedirect("../../SignIn.jsp");
	}
	%>


	<%
	// Getting the Hotel ID from the request parameter
	int Hotel_id = Integer.parseInt(request.getParameter("Hotel_id"));

	// Getting the details of the hotel using the Hotel ID
	HotelServiceImplementation hs = new HotelServiceImplementation(DBConnectionUtil.getDBConnection());
	Hotel hotel = hs.getHotelById(Hotel_id);
	%>

	<%@ include file="../../includes/navBar.jsp"%>
	<div class="content ">

		<div class="addHotel">
			<div class="form-box">
				<form class="form" action="updatehotel" method="post">
					<span class="title">Edit Hotel</span>

					<div class="form-container">

						<input type="number" name="Hotel_id" placeholder="Hotel Id" required  class="input" value="<%=hotel.getHotel_id()%>">
						<input type="text" placeholder="Location" name="Location" class="input" required value="<%=hotel.getLocation()%>"> 
						<input type="text"placeholder="Contact_info" name="Contact_info" required  class="input"value="<%=hotel.getContact_info()%>">
					</div>

					<button type="submit">Update Hotel</button>
				</form>

				<!-- Button for going back to Hotel Info page -->
				<a href="Hotelinfo.jsp"><button class="back-btn">Back</button></a>
			</div>
		</div>
	</div>



</body>
</html>