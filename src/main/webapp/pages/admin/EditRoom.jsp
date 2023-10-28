<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="service.RoomServiceImpelmentation"%>
<%@ page import="util.CommonConstants"  %>
<%@ page import="util.DBConnectionUtil"  %>
<%@ page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@ page import="model.Room"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Room</title>
<style>
.addHotel {
	display: flex;
	justify-content: center;
}

.form-box {
	width: 400px;
	min-height: 800px;
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
<link rel="stylesheet" href="Header.css">
</head>
<body >

	<%@ include file="../includes/navBar.jsp"%>

	<%
	String Room_Id = request.getParameter("Room_Id");

	 RoomServiceImpelmentation roomdao = new RoomServiceImpelmentation(DBConnectionUtil.getDBConnection());
	Room room = roomdao.getRoomById(Room_Id);
	%>

	<div class="content ">
		<div class="addHotel">
			<div class="form-box">
				<form class="form" action="updateroom" method="post">
					<span class="title">Edit Room</span>

					<div class="form-container">
						<input type="text" name="Room_Id" class="input" placeholder="Room Id" value="<%=room.getRoom_id()%>"> 
						<input type="number" name="Hotel_id" class="input" placeholder="Hotel Id" value="<%=room.getHotel_id()%>"> 
						<input type="text" name="Type" class="input" placeholder="Room Type" value="<%=room.getType()%>"> 
						<input type="number" name="Price" class="input" placeholder="Room Price" value="<%=room.getPrice()%>"> 
						<input type="text" name="bed_count" class="input" placeholder="No Of Beds" value="<%=room.getBed_count()%>"> 
						<input type="text" name="Total_rooms" class="input" placeholder="Total Rooms" value="<%=room.getTotal_rooms()%>"> 
						<input type="text" name="Reserved_room" class="input" placeholder="Reserved Room" value="<%=room.getReserved_room()%>">
					</div>

					<button type="submit">Update Room</button>
				</form>
				<a href="Roominfo.jsp"><button class="back-btn">Back</button></a>
			</div>
		</div>
	</div>
</body>
</html>