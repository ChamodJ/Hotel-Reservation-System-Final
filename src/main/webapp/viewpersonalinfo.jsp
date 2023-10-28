<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="styles/style.css">
<link rel="stylesheet" type="text/css" href="styles/landingPages.css">
 <script src="js/valid.js"></script> 
</head>
<body>
      <header>
    <h2 class="logo">The Scenic Ridge</h2>
    <nav class="nav-bar">
        <a class="links" href="Home.jsp">Home</a>
        <a class=" links" href="Hotel.jsp">Hotels</a>
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

      <h1>Welcome, <%= request.getAttribute("username") %>!</h1>

</div>
    
    
    <nav class="mainnav">
        <ul>
            <li><a href="overview.jsp" >Overview</a></li>
            <li><a href="pages/manage.jsp" >Manage Account</a></li>
            <li><a href="viewpersonalinfo.jsp" class="active">Personal Info</a></li>
            <li><a href="mybooking.jsp">My Bookings</a></li>
        </ul>
    </nav>
    
        <h2>Profile Information</h2>
    
    <p> First Name: <%= user.getFirst_Name() %> </p>
    <p> Last Name: <%= user.getLast_Name() %> </p>
    <p> Email:<%= user.getEmail() %> </p>
    <p> Phone Number: <%= user.getMobile_No() %> </p>
    <p> Date of Birth: <%= user.getDate_of_birth() %> </p>
     <p> Nationality: <%= user.getNationality() %> </p>
      <p> Gender: <%= user.getGender() %> </p>
       <p> Address: <%= user.getAddress() %> </p>
       
       <button onclick="location.href='pages/editProfileInfo.jsp'">Edit Profile</button>
       

</body>
</html>