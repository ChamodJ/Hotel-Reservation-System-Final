<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.User"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../styles/navBar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
  </head>
  
  
  <body>    
  
  
  
    <header>

      <div class="left_area">
        <h3>The Scenic Ridge</h3>
      </div>
      <div class="right_area">
        <form action="SignOutServlet" method="GET">
    		<button class="logout_btn" type="submit">Logout</button>
		</form>
      </div>
    </header>
    
    <div class="sidebar">
      <div class="profile_info">
        <img src="../Image/admin-avatar.png" class="profile_image" alt="">
        <h4><%
			try {
			    Object adminName = request.getAttribute("adminname");
			    if (adminName != null) {
			        out.print("Welcome, " + adminName.toString());
			    } else {
			        out.print("Welcome!");
			    }
			} catch (Exception e) {
			    e.printStackTrace();
			    out.print("An error occurred: " + e.getMessage());
			}
			%>
        </h4>
      </div>
      
      <a href="../pages/AdminDashboard.jsp"><i class="fas fa-desktop"></i><span>Dashboard</span></a>
      <a href="../pages/Hotelinfo.jsp"><i class="fas fa-cogs"></i><span>Hotels</span></a>
      <a href="../pages/Roominfo.jsp"><i class="fas fa-table"></i><span>Rooms</span></a>
      <a href="../pages/AdminReservation.jsp"><i class="fas fa-th"></i><span>Reservations</span></a>
      <a href="#"><i class="fas fa-info-circle"></i><span>Users</span></a>
      <a href="#"><i class="fas fa-sliders-h"></i><span>Settings</span></a>
      
    </div>

  </body>
</html>