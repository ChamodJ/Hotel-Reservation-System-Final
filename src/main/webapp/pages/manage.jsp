 <%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage profile</title>
<link rel="stylesheet" type="text/css" href="../styles/style.css">
<link rel="stylesheet" type="text/css" href="../styles/landingPages.css">
  <script src="../js/valid.js"></script>  

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
<div class="intro">
      <h1>Manage Account</h1>

</div>


      
    <nav  class="mainnav">
        <ul>
            <li><a href="../overview.jsp" >Overview</a></li>
            <li><a href="manage.jsp" class="active" >Manage Account</a></li>
            <li><a href="../viewpersonalinfo.jsp">Personal Info</a></li>
            <li><a href="../mybooking.jsp">My Bookings</a></li>
        </ul>
    </nav>
  
  <nav class="sidebar">
        <ul>
            <li><a  onclick="showProfileForm() ">Profile Settings</a></li>
            <li><a  onclick="showChangePasswordForm()">Change Password</a></li>
        </ul>
    </nav>
 <!-- Content Area (Initially Empty) -->
  
    <!-- Content Area (Initially Empty) -->
    <div class="form-container">
        <!-- Profile Form (Initially Hidden) -->
        <div id="profile-form" style="display: none;">
            
            <form method="post" action="/Hotel-Reservation-System-Final/UpdateProfileServlet" >
            
            <h2>Profile Settings</h2>
            <table>
            <tr>
				<td>Username</td>
				<td><input type="text" name="Username" value="<%=user.getUsername() %>"  required /></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="Email" value="<%=user.getEmail() %>"  required /></td>
			</tr>
			<tr>
				<td> Phone Number</td>
				<td><input type="text" name="PhoneNumber"
					value="<%= user.getMobile_No() %>" required /></td>
			</tr>
            
            
            
            </table>
                 
            <button type="reset">Reset</button>
        <button type="submit">Update</button> <br><br>
        </form>
      
    
  
    
   <form method="post" action="DeleteProfileServlet">
    <button type="submit" name="deleteAccount">Delete Account</button>
</form>
  
           
        </div>

        <!-- Change Password Form (Initially Hidden) -->
        <div id="change-password-form" style="display: none;">
            
            <form action="/Hotel-Reservation-System-Final/ChangePasswordServlet" method="post">
            <h2>Change Password </h2>
          Current Password : 
          <input type="password" id="oldPassword" name="currentpwd" required>
          <a href="" >Forgot password? </a> <br> <br>
          
         New Password : 
          <input type="password" id= "newPassword" name="newpwd" required> <br> <br>
          
          Confirm New Password : 
          <input type="password" id="confirmPassword" name="confirmpwd" required oninput="checkPasswordMatch()"> <br> <br>
          
	       <span id="passwordMatch" class="error"></span> <br> <br>
	
                <button type="submit" id="submitButton" disabled>Change Password</button>
            </form>
        </div>
    </div>





   
</body>
</html>







    
    
    
    
    
    
  