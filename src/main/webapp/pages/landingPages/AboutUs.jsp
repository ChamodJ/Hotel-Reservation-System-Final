<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

    <title>About Us</title>
       <link rel="stylesheet" type="text/css" href="../../styles/landingPages.css">
         <script src="../../js/valid.js"></script>  
    </head>

     <body class="overflow">
              <header>
    <h2 class="logo">The Scenic Ridge</h2>
    <nav class="nav-bar">
        <a class="links" href="../../Home.jsp">Home</a>
        <a class="links" href="../../Hotel.jsp">Hotels</a>
        <a class="links" href="Services.jsp">Services</a>
        <a class="current links" href="AboutUs.jsp">About Us</a>
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
                <a href="../../overview.jsp">User Profile</a>
                <a href="/Hotel-Reservation-System-Final/SignOutServlet">Sign Out</a>
            </div>
        </div>
        <%
            }
        %>
    </nav>
</header>

    <div class="aboutus-card">
            <div class="bg">
                <div class="aboutUs-Text">
                    <h1>Welcome to The Scenic Ridge Hotel Chain</h1>

                    <p>At "The Scenic Ridge," we take pride in offering you a unique and unforgettable hospitality 
                        experience at each of our four stunning island-wide locations. Our passion for providing exceptional 
                        service and creating lasting memories is reflected in every aspect of our hotels.</p>

                    <p>No matter which of our locations you choose, you can expect impeccable service, comfortable accommodations, 
                        and a range of amenities designed to make your stay truly exceptional. We're dedicated to preserving the 
                        environment and giving back to the local communities that host our hotels.</p>

                    <p>We invite you to explore each of our unique locations and discover the magic of 
                        "The Scenic Ridge." Whichever destination you choose, we promise an experience that 
                        will stay with you long after you've left.</p>

                    <p>Book your stay today and embark on a journey of relaxation, adventure, and unforgettable memories 
                        with <br> <span>"The Scenic Ridge."</span></p>
                </div>
            </div>
            
            <div class="blob"></div>
        </div>
          


</body>
</html>