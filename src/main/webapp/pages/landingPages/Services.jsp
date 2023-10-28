<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Services</title>
  <link rel="stylesheet" type="text/css" href="../../styles/landingPages.css">
         <script src="../../js/valid.js"></script>  
    </head>

    <body class="overflow">
              <header>
    <h2 class="logo">The Scenic Ridge</h2>
    <nav class="nav-bar">
        <a class="links" href="../../Home.jsp">Home</a>
        <a class="links" href="../../Hotel.jsp">Hotels</a>
        <a class="current links" href="Services.jsp">Services</a>
        <a class=" links" href="AboutUs.jsp">About Us</a>
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
                <a href="../../overview.jsp">User Profile</a>
                <a href="/OHRS/SignOutServlet">Sign Out</a>
            </div>
        </div>
        <%
            }
        %>
    </nav>
</header>
  <div class="content">
            <h1>dd</h1>
        </div>

        


</body>
</html>