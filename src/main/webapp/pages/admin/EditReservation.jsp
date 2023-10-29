<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ page import="util.CommonConstants"  %>
<%@ page import="util.DBConnectionUtil"  %>
<%@ page import="java.sql.*"%>
<%@page import="java.util.List"%>
  <%@ page import="model.Booking"%>
  <%@ page import="service.ReservationServices"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
<%
	int Reservaton_id = Integer.parseInt(request.getParameter("Reservaton_id"));

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

						<input type="number" name="Reservaton_id" class="input" value="<%=bk.getReservaton_id()%>"> 
						<input type="number" name="User_id" class="input" value="<%=bk.getUser_id()%>"> 
						<input type="number" name="Hotel_id" class="input" value="<%=bk.getHotel_id()%>"> 
						<input type="text" name="room_id" class="input" value="<%=bk.getRoom_id()%>"> 
						<input type="date" name="check_in_date" class="input" value="<%=bk.getCheck_in_date()%>"> 
						<input type="date" name="check_out_date" class="input" value="<%=bk.getCheck_out_date()%>"> 
						<input type="number" name="No_of_Gusts" class="input" value="<%=bk.getNo_of_Gusts()%>"> 
						<input type="number" name="Amount" class="input" value="<%=bk.getAmount()%>"> 
						
					</div>

					<button type="submit">Update Reservation</button>
				</form>
				<a href="AdminReservation.jsp"><button class="back-btn">Back</button></a>
			</div>
		</div>
	</div>
</body>
</html>