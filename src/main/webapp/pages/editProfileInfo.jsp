<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@page import="model.User"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>
    <script src="../js/valid.js"></script> 
    
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
    <link rel="stylesheet" href="../user.css">
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
    
   		<%
            User user = (User) session.getAttribute("user");       
        %>
    	<div class="intro">
      	<h1>Edit Profile</h1>

		</div>

    <div class="form-container">
    <table>
    <tr>
        <td>
            <form action="/Hotel-Reservation-System-Final/EditPersonalInfoServlet" method="post">
                <h2>Personal Information</h2>
                <table>
                    <tr>
                        <td>First Name:</td>
                        <td><input type="text" name="newfirstname" value="<%=user.getFirst_Name() %>"></td>
                    </tr>
                    <tr>
                        <td>Last Name:</td>
                        <td><input type="text" name="newlastname"  value="<%=user.getLast_Name() %>"></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type="email" name="newEmail" value="<%=user.getEmail() %>"></td>
                    </tr>
                    <tr>
                        <td>Phone Number:</td>
                        <td><input type="tel" name="newPhoneNumber" value="<%=user.getMobile_No() %>"></td>
                    </tr>
                    <tr>
                        <td>Date of Birth:</td>
                        <td><input type="date" name="dob" value="<%=user.getDate_of_birth() %>"></td>
                    </tr>
                    <tr>
                        <td>Nationality:</td>
                        <td>
                            <select class="form-select" id="country" name="country"  >
                                <option disabled selected ></option>
    <option value="Afghanistan" <%= user.getNationality() != null && user.getNationality().equals("Afghanistan") ? "selected" : "" %>>Afghanistan</option>
    <option value="American Samoa" <%= user.getNationality() != null && user.getNationality().equals("America Samoa") ? "selected" : "" %>>American Samoa</option>
    <option value="Argentina" <%= user.getNationality() != null && user.getNationality().equals("Argentina") ? "selected" : "" %>>Argentina</option>
    <option value="Australia"<%= user.getNationality() != null && user.getNationality().equals("Australia") ? "selected" : "" %>>Australia</option>
    <option value="Austria"<%= user.getNationality() != null && user.getNationality().equals("Austria") ? "selected" : "" %>>Austria</option>
    <option value="Bangladesh" <%= user.getNationality() != null && user.getNationality().equals("Bangladesh") ? "selected" : "" %>>Bangladesh</option>
    <option value="Bermuda"<%= user.getNationality() != null && user.getNationality().equals("Bermuda") ? "selected" : "" %>>Bermuda</option>
    <option value="Brazil"<%= user.getNationality() != null && user.getNationality().equals("Brazil") ? "selected" : "" %>>Brazil</option>
    <option value="Cambodia"<%= user.getNationality() != null && user.getNationality().equals("Cambodia") ? "selected" : "" %>>Cambodia</option>
    <option value="Canada" <%= user.getNationality() != null && user.getNationality().equals("Canada") ? "selected" : "" %>>Canada</option>
    <option value="China" <%= user.getNationality() != null && user.getNationality().equals("China") ? "selected" : "" %>>China</option>
    <option value="Colombia" <%= user.getNationality() != null && user.getNationality().equals("Colombia") ? "selected" : "" %>>Colombia</option>
    <option value="Cyprus"<%= user.getNationality() != null && user.getNationality().equals("Cyprus") ? "selected" : "" %>>Cyprus</option>
    <option value="Denmark" <%= user.getNationality() != null && user.getNationality().equals("Denmark") ? "selected" : "" %>>Denmark</option>
    <option value="Egypt"<%= user.getNationality() != null && user.getNationality().equals("Egypt") ? "selected" : "" %>>Egypt</option>
    <option value="Finland" <%= user.getNationality() != null && user.getNationality().equals("Finland") ? "selected" : "" %>>Finland</option>
    <option value="France"<%= user.getNationality() != null && user.getNationality().equals("France") ? "selected" : "" %>>France</option>
    <option value="Germany" <%= user.getNationality() != null && user.getNationality().equals("Germany") ? "selected" : "" %>>Germany</option>
    <option value="Hong Kong" <%= user.getNationality() != null && user.getNationality().equals("Hong Kong") ? "selected" : "" %>>Hong Kong</option>
    <option value="Iceland"<%= user.getNationality() != null && user.getNationality().equals("Iceland") ? "selected" : "" %>>Iceland</option>
    <option value="India" <%= user.getNationality() != null && user.getNationality().equals("India") ? "selected" : "" %>>India</option>
    <option value="Indonesia" <%= user.getNationality() != null && user.getNationality().equals("Indonesia") ? "selected" : "" %>>Indonesia</option>
    <option value="Iran" <%= user.getNationality() != null && user.getNationality().equals("Iran") ? "selected" : "" %>>Iran</option>
    <option value="Ireland" <%= user.getNationality() != null && user.getNationality().equals("Ireland") ? "selected" : "" %>>Ireland</option>
    <option value="Italy" <%= user.getNationality() != null && user.getNationality().equals("Italy") ? "selected" : "" %>>Italy</option>
    <option value="Jamaica" <%= user.getNationality() != null && user.getNationality().equals("Jamaica") ? "selected" : "" %>>Jamaica</option>
    <option value="Japan" <%= user.getNationality() != null && user.getNationality().equals("Japan") ? "selected" : "" %>>Japan</option>
    <option value="Kenya"<%= user.getNationality() != null && user.getNationality().equals("Kenya") ? "selected" : "" %>>Kenya</option>
    <option value="North Korea"<%= user.getNationality() != null && user.getNationality().equals("North Korea") ? "selected" : "" %>>North Korea</option>
    <option value="South Korea"<%= user.getNationality() != null && user.getNationality().equals("South Korea") ? "selected" : "" %>>South Korea</option>
    <option value="Macao"  <%= user.getNationality() != null && user.getNationality().equals("Macao") ? "selected" : "" %>>Macao</option>
    <option value="Malaysia"<%= user.getNationality() != null && user.getNationality().equals("Malaysia") ? "selected" : "" %>>Malaysia</option>
    <option value="Maldives" <%= user.getNationality() != null && user.getNationality().equals("Maldives") ? "selected" : "" %>>Maldives</option>
    <option value="Netherlands"<%= user.getNationality() != null && user.getNationality().equals("Netherlands") ? "selected" : "" %>>Netherlands</option>
    <option value="New Zealand" <%= user.getNationality() != null && user.getNationality().equals("New Zealand") ? "selected" : "" %>>New Zealand</option>
    <option value="Oman" <%= user.getNationality() != null && user.getNationality().equals("Oman") ? "selected" : "" %>>Oman</option>
    <option value="Pakistan"<%= user.getNationality() != null && user.getNationality().equals("Pakistan") ? "selected" : "" %>>Pakistan</option>
    <option value="Philippines"<%= user.getNationality() != null && user.getNationality().equals("Philippines") ? "selected" : "" %>>Philippines</option>
    <option value="Portugal"<%= user.getNationality() != null && user.getNationality().equals("Portugal") ? "selected" : "" %>>Portugal</option>
    <option value="Qatar" <%= user.getNationality() != null && user.getNationality().equals("Qatar") ? "selected" : "" %>>Qatar</option>
    <option value="Romania" <%= user.getNationality() != null && user.getNationality().equals("Romania") ? "selected" : "" %>>Romania</option>
    <option value="Saudi Arabia"<%= user.getNationality() != null && user.getNationality().equals("Saudi Arabia") ? "selected" : "" %>>Saudi Arabia</option>
    <option value="Singapore"<%= user.getNationality() != null && user.getNationality().equals("Singapore") ? "selected" : "" %>>Singapore</option>
    <option value="South Africa" <%= user.getNationality() != null && user.getNationality().equals("South Africa") ? "selected" : "" %>>South Africa</option>
    <option value="Spain" <%= user.getNationality() != null && user.getNationality().equals("Spain") ? "selected" : "" %>>Spain</option>
    <option value="Sri Lanka"<%= user.getNationality() != null && user.getNationality().equals("Sri Lanka") ? "selected" : "" %>>Sri Lanka</option>
    <option value="Sweden" <%= user.getNationality() != null && user.getNationality().equals("Sweden") ? "selected" : "" %>>Sweden</option>
    <option value="Switzerland" <%= user.getNationality() != null && user.getNationality().equals("Switzerland") ? "selected" : "" %>>Switzerland</option>
    <option value="Thailand"<%= user.getNationality() != null && user.getNationality().equals("Thailand") ? "selected" : "" %>>Thailand</option>
    <option value="Turkey" <%= user.getNationality() != null && user.getNationality().equals("Turkey") ? "selected" : "" %>>Turkey</option>
    <option value="Uganda" <%= user.getNationality() != null && user.getNationality().equals("Uganda") ? "selected" : "" %>>Uganda</option>
    <option value="Ukraine"<%= user.getNationality() != null && user.getNationality().equals("Ukraine") ? "selected" : "" %>>Ukraine</option>
    <option value="United Arab Emirates" <%= user.getNationality() != null && user.getNationality().equals("United Arab Emirates") ? "selected" : "" %>>United Arab Emirates</option>
    <option value="United Kingdom"<%= user.getNationality() != null && user.getNationality().equals("United Kingdom") ? "selected" : "" %>>United Kingdom</option>
    <option value="United States" <%= user.getNationality() != null && user.getNationality().equals("United States") ? "selected" : "" %>>United States</option>
    <option value="Vietnam" <%= user.getNationality() != null && user.getNationality().equals("Vietnam") ? "selected" : "" %>>Vietnam</option>
    <option value="Zimbabwe" <%= user.getNationality() != null && user.getNationality().equals("Zimbabwe") ? "selected" : "" %>>Zimbabwe</option>
 
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Gender:</td>
                        <td>
                            <input type="radio" name="gender" value="Male" <% if (user.getGender() != null && user.getGender().equals("Male")) out.print("checked"); %>> Male
                            <input type="radio" name="gender" value="Female" <% if (user.getGender() != null && user.getGender().equals("Female")) out.print("checked"); %>> Female

                        </td>
                    </tr>
                    <tr>
                        <td>Address:</td>
                        <td>
                            <textarea name="address" cols="30" rows="3" ><%=user.getAddress() %></textarea>
                        </td>
                    </tr>
                </table>
                <br><br><br><br>
                <input type="submit" value="Update" name="updateinfo">
                <input type="reset" value="Reset" name="reset">
            </form>
        </td>
    </tr>
</table>

        </div>
    	
   
	</div>

  </body>
</html>
