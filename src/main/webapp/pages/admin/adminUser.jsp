<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="service.AdminServices"%>
<%@ page import="model.Booking"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Users Info</title>
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


	<%--
	response.setHeader("cache-control","no-cache, no-store, must-revalidate");

	if(session.getAttribute("username") == null) {
		response.sendRedirect("SignIn.jsp");
	}
	--%>

	<!-- Include Navigation Bar -->
	<%@ include file="../../includes/navBar.jsp"%>

	<div class="content ">

		<div class="click">
			<h1>Users</h1>
			<!--<a href="AddRoom.jsp"><button class="btn">Manage Reservations</button></a>-->
		</div>

		<!-- Table to Display User Info -->
		<div class="detailtable">
			<table>
				<thead>
					<tr>
						<th>User ID</th>
						<th>User Name</th>
						<th>Email</th>
						<th>Address</th>
						<th>Mobile No</th>
						<th>Date od Birth</th>
						<th>Password</th>
						<th>Role</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>


					<!-- Loop through the list of users -->
					<%
					AdminServices as = new AdminServices();
					List<User> user = as.getAllUsers();
					for (User r : user) {
					%>

					<tr>
						<td><%=r.getUser_ID()%></td>
						<td><%=r.getUsername()%></td>
						<td><%=r.getEmail()%></td>
						<td><%=r.getAddress()%></td>
						<td><%=r.getMobile_No()%></td>
						<td><%=r.getDate_of_birth()%></td>
						<td><%=r.getPassword()%></td>
						<td><%=r.getRole()%></td>


						<td><a href="deleteu?User_id=<%=r.getUser_ID()%>">
								<button class="btn A D">Delete</button>
						</a></td>
					</tr>

					<%
					}
					%>

				</tbody>
			</table>
		</div>
	</div>
</body>
</html>