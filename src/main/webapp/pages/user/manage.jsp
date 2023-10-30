<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@page import="model.User"%>
<!DOCTYPE html>
<html>
<head>
    <title>Personal Info</title>
  
    
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
    	}
    	.tabbed-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 20px;
}

/* Style the tabs */
.tabbed-tabs {
    display: flex;
}

.tab {
    padding: 10px 20px;
    cursor: pointer;
    border: none;
    background-color: #f2f2f2;
    transition: background-color 0.3s;
}

.tab:hover {
    background-color: #ddd;
}

.tab.active {
    background-color: #ccc;
}

.tabbed-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 20px;
    background-color: #f2f2f2;
    border-radius: 10px;
    padding: 20px;
  }

  /* Style the tabs */
  .tabbed-tabs {
    display: flex;
  }

  .tab {
    padding: 10px 20px;
    cursor: pointer;
    background-color: #ccc;
    border: 1px solid #aaa;
    border-radius: 5px;
    margin: 5px;
  }

  .tab.active {
    background-color: #3498db;
    color: white;
  }

  /* Style the tabbed-forms */
  .tabbed-forms {
    background-color: white;
    border: 1px solid #ddd;
    border-radius: 10px;
    padding: 20px;
  }

  /* Style the form content */
  .form {
    display: none;
  }

  /* Style the form headings */
  .form h2 {
    font-size: 24px;
    margin: 10px 0;
    color: #3498db;
  }

  /* Style form fields and buttons */
  .form input[type="text"],
  .form input[type="password"],
  .form input[type="number"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 3px;
    box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
    font-size: 16px;
  }

  .form button {
    background-color: #3498db;
    color: #fff;
    border: none;
    border-radius: 3px;
    padding: 10px 15px;
    font-size: 16px;
    cursor: pointer;
  }

  .form button:hover {
    background-color: #1c87c9;
  }

  /* Style the error message */
  .error {
    color: red;
    margin-top: 10px;
    font-size: 14px;
  }
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
    		<a href="/Hotel-Reservation-System-Final/SignOutServlet"><button class="logout_btn" type="button">Logout</button>	</a>
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
    	<div class="tabbed-container">
        <div class="tabbed-tabs">
            <button class="tab active" onclick="openForm('form1', event)">Profile Information</button>
            <button class="tab" onclick="openForm('form2', event)">Profile Settings</button>
            <button class="tab" onclick="openForm('form3', event)">Change Password</button>
            <button class="tab" onclick="openForm('form4', event)">Delete Account</button>
            
        </div>
         <div class="tabbed-forms"> 
                     <div id="form1" class="form">
                <div class="container">
                    <div class="user-profile">
                        <!-- Display User Profile Information Here -->
                        <h2>Profile Information</h2>
                        <p>Username:<%= user.getUsername() %> </p>
                        <p> Email:<%= user.getEmail() %> </p>
			            <p> Phone Number: <%= user.getMobile_No() %> </p>
                    </div>
                </div>
            </div>
            
                 <div id="form2" class="form">
                <div id="profile-form" >
  		<div class="user-profile" >
                
                        <form method="post" action="/Hotel-Reservation-System-Final/UpdateProfileServlet">
                            <h2>Profile Settings</h2>
                            <table>
                                <tr>
                                    <td>Username</td>
                                    <td><input required="" type="text" name="Username" value="<%= user.getUsername() %>" required /></td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td><input required="" type="text" name="Email" value="<%= user.getEmail() %>" required /></td>
                                </tr>
                                <tr>
                                    <td> Phone Number</td>
                                    <td><input required="" type="text" name="PhoneNumber" value="<%= user.getMobile_No() %>" required /></td>
                                </tr>
                            </table>
                            <button type="reset">Reset</button>
                            <button type="submit">Update</button> <br><br>
                        </form>
               </div>
               </div>  
            </div>
         
           <div id="form3" class="form">
                
               
                    <div id="change-password-form" >
            
            <form action="/Hotel-Reservation-System-Final/ChangePasswordServlet" method="post">
            <h2>Change Password </h2>
          Current Password : 
          <input type="password" id="oldPassword" name="currentpwd" required><br>
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
    
      
     <div id="form4" class="form">
    <h2>Delete Account</h2>
    <p>Are you sure you want to delete your account?</p>
    <button id="confirmDeleteButton" type="button" onclick="showDeleteConfirmation()">Yes</button>
    <button id="cancelDeleteButton" type="button" onclick="cancelDelete()">No</button>

    <form method="post" action="/Hotel-Reservation-System-Final/DeleteProfileServlet" id="deleteForm" style="display: none;" onsubmit="return confirmDelete();">
        <button type="submit" name="deleteAccount">Confirm Delete</button>
    </form>
</div>

         
</div>
</div>
         </div>
    	 <script>
        function openForm(formName, event) {
            // Get all form elements
            var forms = document.getElementsByClassName("form");
            // Hide all forms
            for (var i = 0; i < forms.length; i++) {
                forms[i].style.display = "none";
            }
            // Deactivate all tabs
            var tabs = document.getElementsByClassName("tab");
            for (var i = 0; i < tabs.length; i++) {
                tabs[i].classList.remove("active");
            }
            // Display the selected form
            document.getElementById(formName).style.display = "block";
            // Activate the clicked tab
            event.currentTarget.classList.add("active");
        }

        // Initially show the first form
        openForm("form1", event);
    </script>
    <script>
    function showDeleteConfirmation() {
        document.getElementById("confirmDeleteButton").style.display = "none";
        document.getElementById("cancelDeleteButton").style.display = "none";
        document.getElementById("deleteForm").style.display = "block";
    }

    function cancelDelete() {
        document.getElementById("confirmDeleteButton").style.display = "inline-block";
        document.getElementById("cancelDeleteButton").style.display = "inline-block";
        document.getElementById("deleteForm").style.display = "none";
    }
</script>
		
  <script src="../../js/valid.js"></script> 
  
  <%} %>
  </body>
</html>
