<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@page import="model.User"%>
<!DOCTYPE html>
<html>
<head>
    <title>O</title>
    <script src="js/valid.js"></script> 
    
    <style type="text/css">
    
    .welcome-div {
    	text-align: center;
    	
    }
    
    .container {
    	display: flex;
    	justify-content: space-between;
    }
    
    .card {
		 min-width: 350px;
		 min-height: 400px;
		 background: white;
		 border-radius: 10px;
		 transition: border-radius 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
		 display: flex;
		 justify-content: space-around;
	}
	
	.card2 {
		display: absolute;
	}
	
	.shadow {
	 	box-shadow: inset 0 -3em 3em rgba(0,0,0,0.1),
	             0 0  0 2px rgb(190, 190, 190),
	             0.3em 0.3em 1em rgba(0,0,0,0.3);
	}
	
	.user-profile {
		text-align: center;
		line-height: 2pc;
	}  
    
    .rTable{
    	text-align: center;
    }
    
    .detailtable {
    display: flex;
    justify-content: center;
}

.detailtable table {
    max-width: 1100px;
    text-align: center;
    padding: 20px;
}

.detailtable thead tr {
	background-color: rgb(90, 90, 117);
	color: #ffff;
	text-align: center;
}

.detailtable thead th {
	padding: 12px;
}

.detailtable td {
	padding: 12px 15px;
	text-align: center;
}

.detailtable tbody tr {
	border-bottom: 1px solid #e74242;
}

.detailtable tbody tr:nth-of-type(even) {
	background-color: rgb(122, 151, 151);
}

.detailtable tbody tr:last-of-type {
	border-bottom: 2px solid black;
}

.form-container {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f9f9f9;
    border: 1px solid #ddd;
    border-radius: 5px;
}

/* Form fields */
.form-container label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
}

.form-container input[type="text"],
.form-container input[type="password"],
.form-container input[type="number"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 3px;
    box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
    font-size: 16px;
}

/* Button */
.form-container button {
    background-color: #3498db;
    color: #fff;
    border: none;
    border-radius: 3px;
    padding: 10px 15px;
    font-size: 16px;
    cursor: pointer;
}

.form-container button:hover {
    background-color: #1c87c9;
}

/* Form validation message */
.validation-message {
    color: red;
    margin-top: 10px;
    font-size: 14px;
    	
    </style>
    <link rel="stylesheet" href="user.css">
</head>
<body>
    
    <header>
      <div class="left_area">
        <h3><span>The Scenic Ridge</span></h3>
      </div>
      <div class="right_area">
        <form action="signout">
          <button class="logout_btn" type="submit">Logout</button>
        </form>
      </div>
      
      
    </header>
    
    <div class="sidebar">
      <div class="profile_info">
        <h4>Welcome!</h4>
      </div >

      <div class="links">
        <div class="links-content">
            <a href="overview.jsp"><i class="fas fa-cogs current"></i><span>Overview</span></a>
            <a href="#"><i class="fas fa-table"></i><span>Manage Account</span></a>
            <a href="#"><i class="fas fa-th"></i><span>Personal Info</span></a>
            <a href="#"><i class="fas fa-info-circle"></i><span>My Bookings</span></a>
            <a href="#"><i class="fas fa-sliders-h"></i><span>Home</span></a>
        </div>
        
      </div>
    </div>

    <div class="content">
    	<%
    		User user = (User) session.getAttribute("user");
    	%>
    	<h2>User Profile</h2>
    	<div class="card shadow">
    		
	  		<div class="user-profile" >
			    <h2>Profile Information</h2>
    
			    <p> First Name: <%= user.getFirst_Name() %> </p>
			    <p> Last Name: <%= user.getLast_Name() %> </p>
			    <p> Email:<%= user.getEmail() %> </p>
			    <p> Phone Number: <%= user.getMobile_No() %> </p>
			    <p> Date of Birth: <%= user.getDate_of_birth() %> </p>
			    <p> Nationality: <%= user.getNationality() %> </p>
			    <p> Gender: <%= user.getGender() %> </p>
			    <p> Address: <%= user.getAddress() %> </p>
       
    			
	   		</div> 
	   		
	   		<div class="aLinks">
	   		 <button onclick="location.href='pages/editProfileInfo.jsp'">Edit Profile</button>
	   		 
	   		 <button onclick="showProfileForm()">Profile Settings</button>
	   		 
	   		 <button onclick="showChangePasswordForm()">Change Password</button>

	   		</div>
	   		
	   		
		</div>
		
		<div class="card card2 shadow">
  		<div class="user-profile" >
	    <h2>User Profile</h2>
	    
	    <p> user id: <%= user.getUser_ID() %> </p>
	    <p> Name: <%= user.getUsername() %> </p>
	    <p> Email:<%= user.getEmail() %> </p>
	    <p> Address: <%= user.getAddress() %> </p>
	    <p> Phone: <%= user.getMobile_No() %> </p>
   </div> 
	</div>   
		
		
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
