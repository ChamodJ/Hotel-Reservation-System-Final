<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Personal Info</title>
<title>O</title>
    <script src="../../js/valid.js"></script> 
    
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
		 min-height: 450px;
		 background: white;
		 border-radius: 10px;
		 transition: border-radius 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
		 display: flex;
		 justify-content: space-around;
	}
	
	.card2 {
		display: none;
		position: absolute;
		width : 400px;
		height : 400px;
		top: 130px;
		right: 120px;
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
	
	.aLinks {
		display: flex;
		flex-direction: column;
		justify-content: space-around;
	}
	
	.btn {
  display: inline-block;
  padding: 0.9rem 1.8rem;
  font-size: 16px;
  font-weight: 700;
  color: black;
  border: 3px solid rgb(252, 70, 100);
  cursor: pointer;
  position: relative;
  background-color: transparent;
  text-decoration: none;
  overflow: hidden;
  font-family: inherit;
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
    <link rel="stylesheet" href="../../styles/user.css">
</head>
<body>
	<%  
	response.setHeader("cache-control","no-cache, no-store, must-revalidate");

	if(session.getAttribute("user") == null) {
		response.sendRedirect("../../SignIn.jsp");
	}
	
	else {
	%>
	
      <header>
      <div class="left_area">
        <h3><span>The Scenic Ridge</span></h3>
      </div>
      <div class="right_area">  
    		<a href="SignOutServlet"><button class="logout_btn" type="button">Logout</button>	</a>
      </div>
      
      
    </header>
    
    <div class="sidebar">
      <div class="profile_info">
        <h4>Welcome!</h4>
      </div >
 <div class="links">
        <div class="links-content">
            <a href="overview.jsp"><i class="fas fa-cogs current"></i><span>Overview</span></a>
            <a href="manage.jsp"><i class="fas fa-table"></i><span>Manage Profile</span></a>
            <a href="viewpersonalinfo.jsp"><i class="fas fa-table"></i><span>Personal Info</span></a>
            <a href="mybooking.jsp"><i class="fas fa-info-circle"></i><span>My Bookings</span></a>
            <a href="../landingPages/Home.jsp"><i class="fas fa-sliders-h"></i><span>Home</span></a>
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
	   			<div>
	   				<button class="btn" onclick="location.href='editProfileInfo.jsp'">Edit Profile</button>
	   			</div>
	   			
	   		
	   			</div>
    </div>
    </div>
    
    <%} %>
  </body>
</html>