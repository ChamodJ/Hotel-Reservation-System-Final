<%@page import="model.User"%>
<%@page import="model.Booking"%>
<%@page import="service.BookingServices"%>
<%@page import="service.BookingServiceImplementation"%>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Bookings</title>
<link rel="stylesheet" type="text/css" href="styles/style.css">
<link rel="stylesheet" type="text/css" href="styles/landingPages.css">
 <script src="js/valid.js"></script> 
</head>
<body>
      <header>
    <h2 class="logo">The Scenic Ridge</h2>
    <nav class="nav-bar">
        <a class="links" href="Home.jsp">Home</a>
        <a class="links" href="Hotel.jsp">Hotels</a>
        <a class="links" href="pages/landingPages/Services.jsp">Services</a>
        <a class="links" href="pages/landingPages/AboutUs.jsp">About Us</a>
        <a class=" links" href="pages/landingPages/Contact.jsp">Contact</a>
        <%
            User user = (User) session.getAttribute("user");
            if (user == null) {
        %>
        <a href="SignIn.jsp"><button class="login-btn">Log In</button></a>
        <a href="SignUp.html"><button class="login-btn">Register</button></a>
        <%
            } else {
        %>
        <div class="user-dropdown">
            <button class="login-btn" onclick="toggleUserDropdown()"> <%= user.getUsername() %>  &#9660;</button>
            <div class="user-dropdown-content" id="userDropdown">
                <a href="overview.jsp">User Profile</a>
                <a href="SignOutServlet">Sign Out</a>
            </div>
        </div>
        <%
            }
        %>
    </nav>
</header>
<div class="intro">


      <h1>Welcome, <%= user.getUsername() %>!</h1>

</div>
    
    
    <nav class="mainnav">
        <ul>
            <li><a href="overview.jsp" >Overview</a></li>
            <li><a href="pages/manage.jsp" >Manage Account</a></li>
            <li><a href="viewpersonalinfo.jsp">Personal Info</a></li>
            <li><a href="mybooking.jsp" class="active">My Bookings</a></li>
        </ul>
    </nav>
    
    
    
    <h2>Current Bookings</h2>
  
<table>
      <thead>
          <tr>
                                <th>Reservation ID</th>
                                <th>Reservation Date</th>
                                <th>Hotel Name</th>
                                <th>Room Type</th>
                                <th>Check In Date</th>
                                <th>Check Out Date</th>
                                <th>Number of Guests</th>
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
                <td><%= booking.getReservation_date() %></td>
                <td><%= booking.getHotelName() %></td>
                <td><%= booking.getRoomType()    %></td>
                <td><%= booking.getCheck_in_date() %></td>
                <td><%= booking.getCheck_out_date() %></td>
                <td><%= booking.getNo_of_Gusts() %></td>
                <td><%= booking.getAmount() %></td>
                 <td>
                <a href="edit-booking.jsp?bookingId=<%= booking.getReservaton_id() %>" class="edit-button">Edit</a>
                <a href="CancelBookingServlet?bookingId=<%= booking.getReservaton_id() %>" class="cancel-button">Cancel</a>
            </td>
            </tr>
            <%
                }
            %>
        </tbody>
        </table>
        
    
 
</body>
</html>