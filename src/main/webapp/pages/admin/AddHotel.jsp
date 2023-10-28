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



<meta charset="UTF-8">
<title>Add Hotel</title>

<link rel="stylesheet" href="../../styles/navBar.css">
<script defer src="js/adminValidation.js"></script>
</head>

<body class="overflow">

		<%@ include file="../../includes/navBar.jsp" %>

	<div class="content ">

		<div class="addHotel">
			<!--<c:if test="${not empty sussmsg }">
				<p style="" color:black;">${sussmsg}</p>
				<c:remove var="sussmsg"/>
			</c:if>
			
			<c:if test="${not empty erorrmsg }">
				<p>${sussmsg}</p>
				<c:remove var="erorrmsg"/>
			</c:if>-->

			<div class="form-box">
				<form onsubmit="return AddHotelValidation();" class="form" action="addhotel" method="post">
					<span class="title">Add Hotel</span> <span class="subtitle">Add
						hotel to a database.</span>
					<div class="form-container">

						<input type="text" id="Hotel_id" name="Hotel_id" class="input" placeholder="Hotel Id"> 
						<input type="text" id="Location" name="Location" class="input" placeholder="Location">
						<input type="text" id="Contact_info" name="Contact_info" class="input" placeholder="Contact_info">
					</div>

					<button type="submit">Add Hotel</button>
				</form>
				<a href="Hotelinfo.jsp"><button class="back-btn">Back</button></a>
			</div>

		</div>
	</div>
	
	
	
</body>
</html>