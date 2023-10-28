<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
<title>About Us</title>
       <link rel="stylesheet" type="text/css" href="../../styles/landingPages.css">
         <script src="../../js/valid.js"></script>  
    </head>

    <body class="page overflow bg-img contact-bg">
     <header>
    <h2 class="logo">The Scenic Ridge</h2>
    <nav class="nav-bar">
        <a class="links" href="../../Home.jsp">Home</a>
        <a class="links" href="../../Hotel.jsp">Hotels</a>
        <a class="links" href="Services.jsp">Services</a>
        <a class=" links" href="AboutUs.jsp">About Us</a>
        <a class="current links" href="Contact.jsp">Contact</a>
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
<div class="page contactUs-main">
          <h1>Let Us Help You !</h1>
          <div class="contactus-page">
            <div class="contactForm-div">
              <form class="form">
                <h1>Contact Form</h1>
                <div class="Inputflex">
                    <label>
                        <input required placeholder="" type="text" class="input">
                        <span>first name</span>
                    </label>
            
                    <label>
                        <input required placeholder="" type="text" class="input">
                        <span>last name</span>
                    </label>
                </div>  
                        
                <label>
                    <input required placeholder="" type="email" class="input">
                    <span>email</span>
                </label> 
                    
                <label>
                    <input required type="tel" placeholder="" class="input">
                    <span>contact number</span>
                </label>
                <label>
                    <textarea required rows="3" placeholder="" class="input01"></textarea>
                    <span>message</span>
                </label>
                
                <button class="fancy" >
                  <span class="top-key"></span>
                  <span class="text">submit</span>
                  <span class="bottom-key-1"></span>
                  <span class="bottom-key-2"></span>
                </button>
              </form> 
  
            </div>
  
            <div class="contact-info-div"> 
<!--
              <div class="map-div">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d247.55094285295772!2d79.85080629485013!3d6.912700246811201!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae259c376de9c57%3A0x4da394d216c60719!2sSri%20Lanka%20Institute%20of%20Information%20Technology%20(%20Guarantee%20)%20Limited!5e0!3m2!1sen!2slk!4v1697822873272!5m2!1sen!2slk" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
              </div>
-->
              <div class="contact-info">
                <h1>Corporate Contact</h1>
                <h2>Head Office</h2>
                <p>The Scenic Ridge Limited
                No 02, Somewhere, <br>Something <br> Sri Lanka.<br>
                +94 77 54 84 445<br>
                +94 77 54 84 445</p>
              </div>

              
            </div>
          </div>
          
          
              
        </div>

        


</body>
</html>