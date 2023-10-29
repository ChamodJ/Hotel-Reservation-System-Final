<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Reguired</title>
<link rel="stylesheet" type="text/css" href="../styles/landingPages.css">
</head>
<body>
        <header>
    <h2 class="logo">The Scenic Ridge</h2>
    <nav class="nav-bar">
        <a class="links" href="../Home.jsp">Home</a>
        <a class="links" href="../Hotel.jsp">Hotels</a>
        <a class="links" href="landingPages/Services.jsp">Services</a>
        <a class="links" href="landingPages/AboutUs.jsp">About Us</a>
        <a class="links" href="landingPages/Contact.jsp">Contact</a>
        <%
            User user = (User) session.getAttribute("user");
            if (user == null) {
        %>
        <a href="../SignIn.jsp"><button class="login-btn">Log In</button></a>
        <a href="../SignUp.html"><button class="login-btn">Register</button></a>
        <%
            } else {
        %>
        <div class="user-dropdown">
            <button class="login-btn" onclick="toggleUserDropdown()"> <%= user.getUsername() %>  &#9660;</button>
            <div class="user-dropdown-content" id="userDropdown">
                <a href="../overview.jsp">User Profile</a>
                <a href="/Hotel-Reservation-System-Final/SignOutServlet">Sign Out</a>
            </div>
        </div>
        <%
            }
        %>
    </nav>
</header>

  <div class="hotel page">
    <h2>You need to have an account to make a booking</h2>
    <h1>Log into your account :</h1><a href="../SignIn.jsp"><button class="login-btn">Log In</button></a>
    <h1>Create an account :</h1><a href="../SignUp.html"><button class="login-btn">Register</button></a>
</div>

</body>
</html>