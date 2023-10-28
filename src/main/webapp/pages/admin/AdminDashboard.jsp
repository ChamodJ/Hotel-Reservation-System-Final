<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.RoomServiceImpelmentation"%>
<%@ page import="util.CommonConstants"  %>
<%@ page import="util.DBConnectionUtil"  %>
<%@ page import="service.HotelServiceImplementation"%>
 <%@ page import="service.AdminServices" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
	  <style>
	  		.dashboard {
		    display: flex;
		    flex-direction: row;
		    min-height:80vh;
		    justify-content: space-between;
		    align-items: center;
		    
		}
		
		 .btn {
		  
		  padding: 10px 20px;
		  border: none;
		  border-radius: 20px;
		  background-color: #2667ff;
		  color: white;
		  align-items: center;
		}
		
		.btn:hover {
		  background-color: #ff8500;
		  color: #2667ff;
		  cursor: pointer;
		}
		
		.btn:active {
		  background-color: #ff5400;
		}	
		
		  .current {
		    color: rgb(204, 240, 2);
		    font-weight: 700; 
		    position: relative; 
		}
		  
		.card {
		    width: 250px;
		    height: 235px;
		    position: relative;
		    padding: 25px;
		    background: radial-gradient(178.94% 106.41% at 26.42% 106.41%, #FFF7B1 0%, rgba(255, 255, 255, 0) 71.88%) /* warning: gradient uses a rotation that is not supported by CSS and may not behave as expected */, #FFFFFF;
		    box-shadow: 0px 155px 62px rgba(0, 0, 0, 0.01), 0px 87px 52px rgba(0, 0, 0, 0.05), 0px 39px 39px rgba(0, 0, 0, 0.09), 0px 10px 21px rgba(0, 0, 0, 0.1), 0px 0px 0px rgba(0, 0, 0, 0.1);
		    border-radius: 23px;
		    transition: all 0.8s cubic-bezier(0.15, 0.83, 0.66, 1);
		    cursor: pointer;
		
		    text-align: center;
		  }
		  
		  .card:hover {
		    transform: scale(1.05);
		  }
		  
		  .card h1 {
		    font-size: 50px;
		  }
	  		
	  </style>
  
  
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="../../styles/navBar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
  </head>
  
  <body class="overflow">
  
  	<%--  
	response.setHeader("cache-control","no-cache, no-store, must-revalidate");

	if(session.getAttribute("username") == null) {
		response.sendRedirect("SignIn.jsp");
	}
	--%>
  	
  
  	<%@ include file="../../includes/navBar.jsp" %>
  	<%
  		AdminServices as = new AdminServices();
  		int ucount = as.userCount();
  	%>
  	
  	
  	<%
		int hotelCount = 0;
		
  	HotelServiceImplementation hs = new HotelServiceImplementation(DBConnectionUtil.getDBConnection());
		hotelCount = hs.getHotelCount();
	%>

	<%
	int roomCount = 0;
	RoomServiceImpelmentation room = new RoomServiceImpelmentation(DBConnectionUtil.getDBConnection());
	roomCount = room.getRoomCount();
	%>
	
	<%
		int resCount = as.reservationCount();
	%>
  
    <div class="content ">

        <div class="dashboard "> 
            <div class="card">
                <div>
                    <h1><%= ucount %></h1>
                </div>
                <div>
                    <h2>Total Users</h2>
                </div>
                <div>
                    <a ><button class="btn" type="button">Users</button></a>
                </div>
            </div>

            <div class="card">
                <div>
                    <h1><%=hotelCount%></h1>
                </div>
                <div>
                    <h2>Total Hotels</h2>
                </div>
                <div>
                    <a href="AddHotel.jsp"><button class="btn" type="button">Add Hotel</button></a>
                </div>
            </div>
            
            <div class="card">
                <div>
                    <h1><%=roomCount%></h1>
                </div>
                <div>
                    <h2>Total Rooms</h2>
                </div>
                <div>
                    <a href="AddRoom.jsp"><button class="btn" type="button">Add Room</button></a>
                </div>
            </div>

            <div class="card">
                <div>
                    <h1><%= resCount %></h1>
                </div>
                <div>
                    <h2>Total Reservations</h2>
                </div>
                <div>
                    <a href="pages/AdminReservation.jsp"><button class="btn" type="button">Reservations</button></a>
                </div>
            </div>

        </div>
        
    </div>


  </body>
</html>