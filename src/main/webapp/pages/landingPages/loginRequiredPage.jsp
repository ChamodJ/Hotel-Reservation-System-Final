<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Reguired</title>
<link rel="stylesheet" type="text/css" href="../../styles/landingPages.css">
 <script src="../../js/valid.js"></script> 

<style type="text/css">
    html, body {
        background-image: url("../../Image/loginrequired-bg.jpg");
        background-size: cover;
        background-position: center;
        color: white;
        height: 100%;
        margin: 0;
        padding: 0;
    }

    .hotel.page {
        text-align: center;
        padding: 40px 0;
    }

    .hotel.page .content {
        background: rgba(0, 0, 0, 0.6);
        border-radius: 10px;
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
    }

    .hotel.page h2 {
        font-size: 24px;
        margin-bottom: 20px;
    }

    .hotel.page p {
        font-size: 16px;
        margin-bottom: 30px;
    }

    .action-buttons {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .login-link, .register-link {
        text-decoration: none;
    }

    .login-btn, .register-btn {
        padding: 10px 20px;
        font-size: 18px;
        background-color: #3498db;
        color: white;
        border: none;
        cursor: pointer;
        margin: 10px;
        text-decoration: none;
    }

    .login-btn:hover, .register-btn:hover {
        background-color: #1c87c9;
    }
</style>

 
 

</head>
<body>
      <header>
    <h2 class="logo">The Scenic Ridge</h2>
    <nav class="nav-bar">
        <a class="links" href="Home.jsp">Home</a>
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

  <div class="required page">
    <div class="content">
        <h2>Welcome to The Scenic Ridge</h2>
        <p>To access booking services, please log in or create an account:</p>
        <div class="action-buttons">
            <a href="../../SignIn.jsp" class="login-link">
                <button class="login-btn">Log In</button>
            </a>
            <a href="../../SignUp.html" class="register-link">
                <button class="register-btn">Register</button>
            </a>
        </div>
    </div>
</div>


</body>
</html>