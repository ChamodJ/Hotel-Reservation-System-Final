<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>

<link rel="stylesheet" type="text/css" href="../../styles/landingPages.css">
 <script src="../../js/valid.js"></script> 
</head>
<body class="overflow bg-img welcome-bg">
      <header>
    <h2 class="logo">The Scenic Ridge</h2>
    <nav class="nav-bar">
        <a class="current  links" href="Home.jsp">Home</a>
        <a class="links" href="Hotel.jsp">Hotels</a>
        <a class="links" href="Services.jsp">Services</a>
        <a class="links" href="AboutUs.jsp">About Us</a>
        <a class=" links" href="Contact.jsp">Contact</a>
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
    

   
      <div>
        <div class="content page"> 
            <div class="welcome-div">
                <h1 class="welcome-msg">WELCOME TO</h1>
                <h1 class="welcome-msg">HEAVEN ON EARTH</h1>
            </div>
            
            <div class="button-div">
                <button>
                    <a href="Hotel.jsp"><span>Book Now</span></a> 
                </button>
            </div>
        </div>
        </div>



</body>
</html>