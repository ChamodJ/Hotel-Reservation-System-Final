<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@page import="model.User"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>
    <script src="js/valid.js"></script> 
    
    <style type="text/css">
    	.intro h1 {
    		text-align: center;
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
            <a href="../overview.jsp"><i class="fas fa-cogs current"></i><span>Overview</span></a>
            <a href="manage.jsp"><i class="fas fa-table"></i><span>personal Info</span></a>
            <a href="#"><i class="fas fa-info-circle"></i><span>My Bookings</span></a>
            <a href="#"><i class="fas fa-sliders-h"></i><span>Home</span></a>
        </div>
        
      </div>
    </div>

    <div class="content">
    
		
   
	</div>

  </body>
</html>
