<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Room"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@ page import="service.RoomServiceImpelmentation"%>
<%@ page import="util.CommonConstants"  %>
<%@ page import="util.DBConnectionUtil"  %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RoomInfo</title>
<style>
		.btn {
		  padding: 10px 20px;
		  border: none;
		  border-radius: 20px;
		  background-color: #2667ff;
		  color: white;
		  align-items: center;
		}
		
		.btn:hover {
		  background-color: #005ce6;
		  color: white;
		  cursor: pointer;
		}
		
		.A {
			border-radius: 10px;
			text-decoration: none;
		}
		
		.D {
		  background-color: #ff4d6d;
		}
		
		.D:hover {
			background-color: #c9184a;
			color: white;
		}

.click {
    text-align: center;
}

.detailtable {
    display: flex;
    justify-content: center;
}

.detailtable table {
    max-width: 1300px;
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

  </style>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Room Info</title>
 
</head>
<body>

	<%--
	response.setHeader("cache-control","no-cache, no-store, must-revalidate");

	if(session.getAttribute("username") == null) {
		response.sendRedirect("SignIn.jsp");
	}
	--%>
	
	<%@ include file="navBar.jsp" %>
	
	<%
	Connection connection = DBConnectionUtil.getDBConnection();
	//out.print(connection);
	%>

	<div class="content ">
        
        <div class="click">
            <h1>ROOM DETAILS</h1>
            <a href="AddRoom.jsp"><button class="btn">ADD ROOM</button></a>
        </div>

        <div class="detailtable">
            <table>
                <thead>
                    <tr>
                        <th>Room ID</th>
                        <th>Hotel ID</th>
                        <th>Room Type</th>
                        <th>Room Price</th>
                        <th>No Of Beds</th>
                        <th>Total Rooms</th>
                        <th>Reserved Rooms</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                
                <%
                RoomServiceImpelmentation roomdao = new RoomServiceImpelmentation(DBConnectionUtil.getDBConnection());
						List<Room> listroom = roomdao.getAllRoom();

						for (Room r : listroom) {
				%>
                    <tr>
                        <td><%=r.getRoom_id()%></td>
						<td><%=r.getHotel_id()%></td>
						<td><%=r.getType()%></td>
						<td>Rs.<%=r.getPrice()%></td>
						<td><%=r.getBed_count()%></td>
						<td><%=r.getTotal_rooms()%></td>
						<td><%=r.getReserved_room()%></td>

                        <td>
	                        <a href="EditRoom.jsp?Room_Id=<%=r.getRoom_id()%>">
	                                <button class="btn A">Edit</button>
	                        </a> 
	                        <a href="deleter?Room_Id=<%=r.getRoom_id()%>">
	                                <button class="btn A D">Delete</button>
	                        </a>
                        </td>
                    </tr>
                    
                    <%
						}
					%>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>