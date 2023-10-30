<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="util.CommonConstants"%>
<%@ page import="util.DBConnectionUtil"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@ page import="model.Booking"%>
<%@ page import="service.ReservationServices"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Reservation</title>

<style>
.addHotel {
	display: flex;
	justify-content: center;
}

.form-box {
	min-width: 400px;
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
	width: 80%; /* Set a maximum width for the form */
	margin: 0 auto; /* Center the form horizontally */
}

/* Form text */
.title {
	font-weight: bold;
	font-size: 1.6rem;
}

.subtitle {
	font-size: 1rem;
	color: #666;
}

/* Style labels and input containers */
.form-container {
	overflow: hidden;
	border-radius: 8px;
	background-color: #fff;
	width: 100%;
	padding: 10px; /* Add some padding to the container */
	display: flex;
	flex-wrap: wrap; /* Wrap elements to next line when there's not enough space */
	justify-content: space-between; /* Space between label and input */
	margin: 1rem 0 .5rem;
}

/* Style labels */
.form-container label {
	font-weight: bold;
	width: 30%; /* Set a fixed width for labels */
	margin: 10px 0; /* Add spacing between labels */
}

/* Style input fields */
.input {
	background: none;
	border: 0;
	outline: 0;
	height: 40px;
	width: 60%; /* Adjust the width of the input */
	border-bottom: 1px solid #eee;
	font-size: .9rem;
	padding: 8px 15px;
}

/* Button */
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
	background-color: #0044ab;
}

</style>

<link rel="stylesheet" href="../../styles/navBar.css">
</head>
<body>

	<!--  Code for Handling Session -->
	<%  
	response.setHeader("cache-control","no-cache, no-store, must-revalidate");

	if(session.getAttribute("user") == null) {
		response.sendRedirect("../../SignIn.jsp");
	}
	%>
	

	<%
	//Getting the Reservation ID from the request parameter
	int Reservaton_id = Integer.parseInt(request.getParameter("Reservaton_id"));

	//Getting the details of the reservation using the Reservation ID
	ReservationServices hs = new ReservationServices(DBConnectionUtil.getDBConnection());
	Booking bk = hs.getResrvationById(Reservaton_id);
	%>

	<%@ include file="../../includes/navBar.jsp"%>
	<div class="content ">

		<div class="addHotel">
			<div class="form-box">
				<form class="form" action="updatereservation" method="post">
					<span class="title">Edit Reservation</span>

					<div class="form-container">
                        <label> Reservation ID</label>
						<input type="number" name="Reservaton_id" class="input" value="<%=bk.getReservaton_id()%>" readonly >
							
					     <label>User ID</label>
					    <input type="number" name="User_id" class="input" value="<%=bk.getUser_id()%>" readonly>
					    
					    <label>Hotel ID</label>
						<input type="number" name="Hotel_id" class="input" value="<%=bk.getHotel_id()%>">
						
						<label>Room ID</label>
						 <input type="text" name="room_id" class="input" value="<%=bk.getRoom_id()%>">
						 
	                   <label>Check In Date</label>
						<input type="date" name="check_in_date" class="input" value="<%=bk.getCheck_in_date()%>">
						
						<label>Check Out Date</label>
						 <input type="date" name="check_out_date" class="input"value="<%=bk.getCheck_out_date()%>" > 
						 
						 <label>Number of Guests</label>
						 <input type="number" name="No_of_Gusts" class="input" value="<%=bk.getNo_of_Gusts()%>">
						 
						 <label>Amount</label>
						<input type="number" name="Amount" class="input" value="<%=bk.getAmount()%>">

					</div>

					<button type="submit">Update Reservation</button>
				</form>

				<!-- Button for going back to Admin Reservation page -->
				<a href="AdminReservation.jsp"><button class="back-btn">Back</button></a>
			</div>
		</div>
	</div>
</body>
</html>