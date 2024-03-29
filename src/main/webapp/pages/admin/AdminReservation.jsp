<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="service.AdminServices"%>
<%@ page import="model.Booking"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservations</title>
<style>
.click {
	text-align: center;
}

.btn {
	padding: 10px 20px;
	border: none;
	border-radius: 20px;
	background-color: #2667ff;
	color: white;
	align-items: center;
}

.btn:hover {
	background-color: #005ce6;
	color: white;
	cursor: pointer;
}

.A {
	border-radius: 10px;
	text-decoration: none;
}

.D {
	background-color: #ff4d6d;
}

.D:hover {
	background-color: #c9184a;
	color: white;
}

.detailtable {
	display: flex;
	justify-content: center;
}

.detailtable table {
	max-width: 1100px;
	text-align: center;
	padding: 20px;
}

.detailtable thead tr {
	background-color: rgb(90, 90, 117);
	color: #ffff;
	text-align: center;
}

.detailtable thead th {
	padding: 12px;
}

.detailtable td {
	padding: 12px 15px;
	text-align: center;
}

.detailtable tbody tr {
	border-bottom: 1px solid #e74242;
}

.detailtable tbody tr:nth-of-type(even) {
	background-color: rgb(122, 151, 151);
}

.detailtable tbody tr:last-of-type {
	border-bottom: 2px solid black;
}
</style>

<link rel="stylesheet" href="../../styles/navBar.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>


	<!--  Code for Handling Session -->
	<%  
	response.setHeader("cache-control","no-cache, no-store, must-revalidate");

	if(session.getAttribute("user") == null) {
		response.sendRedirect("../../SignIn.jsp");
	}
	%>
	

	<!-- Include Navigation Bar -->
	<%@ include file="../../includes/navBar.jsp"%>

	<div class="content ">

		<div class="click">
			<h1>Upcoming Reservations</h1>
			<!--<a href="AddRoom.jsp"><button class="btn">Manage Reservations</button></a>-->
		</div>

		<!-- Table to Display Reservations -->
		<div class="detailtable">
			<table>
				<thead>
					<tr>
						<th>Reservation ID</th>
						<th>User ID</th>
						<th>Hotel ID</th>
						<th>Room ID</th>
						<th>Check In Date</th>
						<th>Check Out Date</th>
						<th>Reservation Date</th>
						<th>No Of Guests</th>
						<th>Amount</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<!-- Loop through the list of reservations -->
					<%
					AdminServices as = new AdminServices();
					List<Booking> Reservations = as.getReservations();
					for (Booking r : Reservations) {
					%>

					<tr>
						<td><%=r.getReservaton_id()%></td>
						<td><%=r.getUser_id()%></td>
						<td><%=r.getHotel_id()%></td>
						<td><%=r.getRoom_id()%></td>
						<td><%=r.getCheck_in_date()%></td>
						<td><%=r.getCheck_out_date()%></td>
						<td><%=r.getReservation_date()%></td>
						<td><%=r.getNo_of_Gusts()%></td>
						<td><%=r.getAmount()%></td>

						<td><a
							href="EditReservation.jsp?Reservaton_id=<%=r.getReservaton_id()%>">
								<button class="btn A">Edit</button>
						</a> 
						<button class="btn A D" onclick="confirmDelete(<%=r.getReservaton_id()%>)">Delete</button>
						</td>
					</tr>

					<%
					}
					%>

				</tbody>
			</table>
		</div>
	</div>
	
	<script>
        function confirmDelete(reservationId) {
            if (window.confirm("Are you sure you want to delete this reservation?")) {
                // If the user confirms, redirect to the delete URL
                window.location.href = "deleteres?Reservaton_id=" + reservationId;
            }
        }
    </script>
</body>
</html>