<%@page import="model.User"%>
 <%@page import="model.Hotel"%>
 <%@page import="model.Room"%>
 <%@page import="service.RoomServices"%>
 <%@page import="service.RoomServiceImpelmentation"%>
 <%@page import="service.HotelServices"%>
 <%@page import="service.HotelServiceImplementation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Make Reservation</title>
<link rel="stylesheet" type="text/css" href="../../styles/landingPages.css">


</head>
<body class="bookNow-bg bg-img">
    <header>
    <h2 class="logo">The Scenic Ridge</h2>
    <nav class="nav-bar">
        <a class="links" href="Home.jsp">Home</a>
        <a class="links" href="Hotel.jsp">Hotels</a>
        <a class="links" href="Services.jsp">Services</a>
        <a class="links" href="AboutUs.jsp">About Us</a>
        <a class="links" href="Contact.jsp">Contact</a>
        <%
            User user = (User) session.getAttribute("user");
            if (user == null) {
        %>
        <a href="../../SignIn.jsp"><button class="login-btn">Log In</button></a>
        <a href="../../SignUp.html"><button class="login-btn">Register</button></a>
        <%
            } else {
        %>
        <div class="user-dropdown">
            <button class="login-btn" onclick="toggleUserDropdown()"> <%= user.getUsername() %>  &#9660;</button>
            <div class="user-dropdown-content" id="userDropdown">
                <a href="../user/overview.jsp">User Profile</a>
                <a href="/Hotel-Reservation-System-Final/SignOutServlet">Sign Out</a>
            </div>
        </div>
        <%
            }
        %>
    </nav>
</header>

<%
    
    if (user == null) {
        response.sendRedirect("loginRequiredPage.jsp"); // Redirect to the login required page
    } else {
%>
<div class="page bookNow-main">
        <div class="bookNow-page">
            <div class="contactForm-div">
	
	 <form class="formbook"  action="/Hotel-Reservation-System-Final/AddBookingServlet" method="post">

    
	     <%
	            String hotelIDParam = request.getParameter("hotelID");
	            int hotelId = Integer.parseInt(hotelIDParam );
	         	String roomId= request.getParameter("roomID");
	         	String amountParam = request.getParameter("amount");
	
	         	HotelServices hotelservice = new HotelServiceImplementation();
	         	Hotel hotel = hotelservice.selectHotel(hotelId);
	
	         	RoomServices roomService = new RoomServiceImpelmentation(); // Initialize your service
	         	Room room = roomService.selectRoom(roomId);
	
	         	// Get the IDs of the hotel and room (since that's what your schema expects).
	         	String hotelName = hotel.getHotel_name();
	         	String roomName = room.getType();
	
	         	// Continue with the form, and populate the form fields as needed.
	         %>
	         
	       <br><br>
	       
	   <label>User ID</label>
	     <input type="text" name="userid" value="<%=user.getUser_ID() %>" readonly>
	    
	
	        <label>Hotel</label>
	    <input type="text" name="hotelName"  value="<%= hotelName %>" readonly> <!-- Display the hotel name -->
	    <input type="hidden" name="hotelId" value="<%= hotelId %>"> <!-- Hidden field to store the hotel ID -->
	    
	    <label>Room Type</label>
	<input type="text" name="roomType" id="room" value="<%= roomName %>" readonly><!-- Display the room type -->
	    <input type="hidden" name="roomId" id="room"  value="<%= roomId %>"> <!-- Hidden field to store the room ID -->
	   
	    
	   <label>Check In Date</label>
	<input type="date" name="checkin" id="checkin" oninput="validateCheckinDate()" required >
	 <span id="checkinerror" class="error"></span> 
	
	<label>Check Out Date</label>
	<input type="date" name="checkout" id="checkout" oninput="validateCheckoutDate()" required>
	<span id="checkouterror" class="error"></span> 
	     
	      <label>Reservation Date</label>
	    <input type="text" name="reservationDate" id="reservationDate" readonly>
	    
	    <label>No. of Guests</label>
	    <select name="guest" id="guest">
	       
	        
	        <!-- This will be populated dynamically based on the selected room type -->
	    </select>
	    
	        <label>Amount</label>
	 <input type="text" name="amount" value="<%= amountParam %>" readonly>
	
	
	
	
	  <input type="submit" id="submitButton" value="Submit">
	     
	
	
	
	    
	</form>
</div>
</div>
</div>

<%
    }
%>
        
<script>
    window.onload = function() {
        setCurrentDate();
    };

    
</script>

 <script src="../../js/valid.js"></script>  
</body>
</html>