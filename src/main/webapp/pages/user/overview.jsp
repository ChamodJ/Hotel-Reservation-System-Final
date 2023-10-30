<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="model.User"%>
<%@page import="model.Booking"%>
<%@page import="service.BookingServices"%>
<%@page import="service.BookingServiceImplementation"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>OverView</title>
    
    <style type="text/css">
    
    .welcome-div {
    	text-align: center;
    }
    
    .container {
    	margin: 40px 20px;
    	display: flex;
    	justify-content: space-between;
    }
    
    .card {
		 min-width: 350px;
		 height: 400px;
		 background: white;
		 border-radius: 10px;
		 transition: border-radius 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
	}
	
	.shadow {
	 	box-shadow: inset 0 -3em 3em rgba(0,0,0,0.1),
	             0 0  0 2px rgb(190, 190, 190),
	             0.3em 0.3em 1em rgba(0,0,0,0.3);
	}
	
	.user-profile {
		text-align: center;
		line-height: 2pc;
	}  
    
    .rTable{
    	text-align: center;
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

.current::after {
		    content: '';
		    background: #00b4d8(214, 0, 0); 
		    color: #e44c06;  
		}
    	
    </style>
    <link rel="stylesheet" href="../../styles/user.css">
</head>
<body>

	<%  
	response.setHeader("cache-control","no-cache, no-store, must-revalidate");
	
    User user = (User) session.getAttribute("user");
    if (user == null) {
    	response.sendRedirect("../../SignIn.jsp");
    }
    
    else {
	%>
	
    
    <header>
      <div class="left_area">
        <h3><span>The Scenic Ridge</span></h3>
      </div>
      <div class="right_area">  
    		<a href="/Hotel-Reservation-System-Final/SignOutServlet"><button class="logout_btn" type="button">Logout</button>	</a>
      </div>
      
      
    </header>
    
    <div class="sidebar">
      <div class="profile_info">
        <h4>Welcome!</h4>
      </div >

      <div class="links">
        <div class="links-content">
            <a href="overview.jsp"><i class="fas fa-cogs current"></i><span>Overview</span></a>
            <a href="manage.jsp"><i class="fas fa-table"></i><span>Manage Profile</span></a>
            <a href="viewpersonalinfo.jsp"><i class="fas fa-table"></i><span>Personal Info</span></a>
            <a href="mybooking.jsp"><i class="fas fa-info-circle"></i><span>My Bookings</span></a>
            <a href="../landingPages/Home.jsp"><i class="fas fa-sliders-h"></i><span>Home</span></a>
        </div>
        
      </div>
    </div>

    <div class="content">
		<div class="welcome-div">
				
		
		      <h1>Welcome, <%= user.getUsername() %>!</h1>

		</div>
    
  <div class="container">
  
  	<div class="card shadow">
  		<div class="user-profile" >
	    <h2>User Profile</h2>
	    
	    <p> user id: <%= user.getUser_ID() %> </p>
	    <p> Name: <%= user.getUsername() %> </p>
	    <p> Email:<%= user.getEmail() %> </p>
	    <p> Address: <%= user.getAddress() %> </p>
	    <p> Phone: <%= user.getMobile_No() %> </p>
   </div> 
	</div>

 	
   
   <div class="rTable">
   		<h2>Upcoming Reservations</h2>
		<div class="detailtable">
			
            <table>
                <thead>
                    <tr>
                        <th>Reservation ID</th>
                        <th>Hotel Name</th>
                        <th>Room Type</th>
                        <th>Check In Date</th>
                        <th>Check Out Date</th>
                        <th>Total Price</th>
                    </tr>
                </thead>
                <tbody>
                
                <% 
                BookingServices bookingService = new BookingServiceImplementation();
                List<Booking> currentBookings = bookingService.selectAllCurrentUserBooking(user.getUser_ID());

                for (Booking booking : currentBookings) { 
           %>

             <tr>
                <td><%= booking.getReservaton_id() %></td>
                <td><%= booking.getHotelName() %></td>
                <td><%= booking.getRoomType()    %></td>
                <td><%= booking.getCheck_in_date() %></td>
                <td><%= booking.getCheck_out_date() %></td>
                <td>Rs. <%= booking.getAmount() %></td>
            </tr>
            <%
                }
            %>

                </tbody>
            </table>
        </div>
   </div>
   
 
   
	</div>    
   
</div>
<%} %>
  </body>
</html>
