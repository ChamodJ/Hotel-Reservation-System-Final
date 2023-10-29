<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Services</title>
 <link rel="stylesheet" type="text/css" href="../../styles/landingPages.css">
 <script src="../../js/valid.js"></script> 
</head>
<body >
      <header>
    <h2 class="logo">The Scenic Ridge</h2>
    <nav class="nav-bar">
        <a class="  links" href="Home.jsp">Home</a>
        <a class="links" href="Hotel.jsp">Hotels</a>
        <a class="current links" href="Services.jsp">Services</a>
        <a class="links" href="AboutUs.jsp">About Us</a>
        <a class=" links" href="Contact.jsp">Contact</a>
        <%
            User user = (User) session.getAttribute("user");
            if (user == null) {
        %>
        <a href="../../SignIn.jsp"><button class="login-btn">Log In</button></a>
        <a href="../../SignUp.html"><button class="login-btn">Register</button></a>
        <%
            } else {
        %>
        <div class="user-dropdown">
            <button class="login-btn" onclick="toggleUserDropdown()"> <%= user.getUsername() %>  &#9660;</button>
            <div class="user-dropdown-content" id="userDropdown">
                <a href="../user/overview.jsp">User Profile</a>
                <a href="/Hotel-Reservation-System-Final/SignOutServlet">Sign Out</a>
            </div>
        </div>
        <%
            }
        %>
    </nav>
</header>
  <div class="page bookNow-main">

            <div class="bookNow-page">

             
                    <h2>
                        This five-star hotels provide a variety of amenities and leisure opportunities to allow vacationing families,<br />
                        couples, and business travelers relax and refresh.
                        This consists of a complete fitness center, <br />The Scenic Ridge has a sizable pool with beautiful view,<br />
                        and a number of additional services and amenities to meet your business needs.
                    </h2>
          

                <div class="image-grid">
                    <div class="full-width">
                        <img src="../../Image/Pool.jpg" alt="Pool">
                    </div>
                    <div class="half-width">
                        <img src="../../Image/Business.avif" alt="Business">
                    </div>
                    <div class="half-width">
                        <img src="../../Image/Gym.avif" alt="Gym">
                    </div>
                </div>


                <h2>This five-star hotel offers a variety of on-site <br /> amenities as well as individualized services to suit your every need.</h2><br />
                <div class="columns">
                    <div class="column">
                        <h3>CLEAN STAY</h3>
                        <p>
                            Our Promise To You Is To Deliver The Same Level Of Reliable And Friendly Service You would Expect From Hilton, But With the Added Confidence of Industry-Leading Hygiene Practices Created To Keep You Safe.
                        </p>
                    </div>
                    <div class="column">
                        <h3>CONVENIENCES</h3>
                        <p>Free WIFI<br /> Free Parking<br /> Connecting Rooms</p>
                    </div>
                    <div class="column">
                        <h3>EXPERIENCED STAFF</h3>
                        <p>
                            Provide Quality Service......

                        </p>
                    </div>
                </div>

            </div>
                </div>

        


</body>
</html>