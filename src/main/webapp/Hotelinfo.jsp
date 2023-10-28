<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="model.Hotel"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@ page import="service.HotelServiceImplementation"%>
<%@ page import="util.CommonConstants"  %>
<%@ page import="util.DBConnectionUtil"  %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <style>
        .btn-div {
            text-align: center;
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

        .hotel-info {
            display: flex;
            justify-content: center;
        }

        .hotel-info table {
            width: 900px;
            text-align: center;
            padding: 20px;
        }

        .hotel-info table tr {
            height: 40px;
            
        }

        .hotel-info table .hId{
            width: 10%;
        }

        .hotel-info table .Hlc{
            width: 30%;
        }

        .hotel-info table .hCi{
            width: 30%;
        }

        .hotel-info table .hA{
            width: 30%;
        }

        .hotel-info thead tr {
          background-color: rgb(90, 90, 117);
          color: #ffff;
          text-align: center;
        }

        .hotel-info thead th {
          padding: 12px;
        }

        .hotel-info td {
          padding: 12px 15px;
          text-align: center;
        }

        .hotel-info tbody tr {
          border-bottom: 1px solid #e74242;
        }

        .hotel-info tbody tr:nth-of-type(even) {
          background-color: rgb(122, 151, 151);
        }

        .hotel-info tbody tr:last-of-type {
          border-bottom: 2px solid black;
        }

        
    </style>



    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Header.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
  </head>
  <body >
  
  <%--
	response.setHeader("cache-control","no-cache, no-store, must-revalidate");

	if(session.getAttribute("username") == null) {
		response.sendRedirect("SignIn.jsp");
	}
	--%>
  
   <%@ include file="navBar.jsp" %>
   
    <div class="content ">

        <div class="btn-div">
            <h1>HOTEL DETAILS</h1>
            <a href="AddHotel.jsp"><button class="btn">ADD HOTEL</button></a>
        </div>

        <div class="hotel-info">
            <table>
                <thead>
                    <tr>
                        <th class="hId">Hotel ID</th>
                        <th class="Hlc">Location</th>
                        <th class="hCi">Contact Info</th>
                        <th class="hA">Action</th>
                    </tr>
                </thead>

                <tbody>
                
                <%
                	HotelServiceImplementation hs = new HotelServiceImplementation();
						
						List<Hotel> listhotel = hs.getAllHotel();
		
						for (Hotel h : listhotel) {
					%>
					
	                <tr>
	                    <td><%=h.getHotel_id()%></td>
						<td><%=h.getLocation()%></td>
						<td><%=h.getContact_info()%></td>
						<td>
                        <a href="EditHotel.jsp?Hotel_id=<%=h.getHotel_id()%>">
                          <button class="btn A">Edit</button>
                        </a> 
                        <a href="deleteh?Hotel_id=<%=h.getHotel_id()%>">
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