<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<style>
.addHotel {
	display: flex;
	justify-content: center;
}

.form-box {
	width: 400px;
	min-height: 720px;
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



<meta charset="UTF-8">
<title>Add Hotel</title>
<link rel="stylesheet" href="../../styles/navBar.css">

<!-- Include the JavaScript file for form validation -->
<script defer src="../../js/adminValidation.js"></script>
</head>
<body>

	<!--  Code for Handling Session -->
	<%  
	response.setHeader("cache-control","no-cache, no-store, must-revalidate");

	if(session.getAttribute("username") == null) {
		response.sendRedirect("../../SignIn.jsp");
	}
	%>

	<!-- Include the navigation bar -->
	<%@ include file="../../includes/navBar.jsp"%>

	<div class="content ">

		<div class="addHotel">

			<div class="form-box">
				<form class="form" action="addroom" method="post"
					onsubmit="return AddRoomValidation()">
					<span class="title">Add Room</span> <span class="subtitle">Add
						room to a database.</span>
					<div class="form-container">

						<input id="Room_Id" type="text" name="Room_Id" class="input"
							placeholder="Room Id"> <input id="Hotel_id" type="number"
							name="Hotel_id" class="input" placeholder="Hotel Id"> <input
							id="Type" type="text" name="Type" class="input"
							placeholder="Room Type"> <input id="Price" type="number"
							name="Price" class="input" placeholder="Room Price"> <input
							id="bed_count" type="text" name="bed_count" class="input"
							placeholder="No Of Beds"> <input id="Total_rooms"
							type="text" name="Total_rooms" class="input"
							placeholder="Total Rooms"> <input id="Reserved_room"
							type="text" name="Reserved_room" class="input"
							placeholder="Reserved Room">
					</div>
					<!-- Button for adding a room -->
					<button type="submit">Add Room</button>
				</form>
				<!-- Button for going back to Roominfo.jsp -->
				<a href="Roominfo.jsp"><button class="back-btn">Back</button></a>
			</div>
		</div>
	</div>
</body>
</html>