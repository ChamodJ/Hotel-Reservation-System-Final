<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hotel</title>
<link rel="stylesheet" type="text/css" href="styles/landingPages.css">
 <script src="js/valid.js"></script> 
</head>
<body>
      <header>
    <h2 class="logo">The Scenic Ridge</h2>
    <nav class="nav-bar">
        <a class="links" href="Home.jsp">Home</a>
        <a class="current links" href="Hotel.jsp">Hotels</a>
        <a class="links" href="pages/landingPages/Services.jsp">Services</a>
        <a class="links" href="pages/landingPages/AboutUs.jsp">About Us</a>
        <a class=" links" href="pages/landingPages/Contact.jsp">Contact</a>
        <%
            User user = (User) session.getAttribute("user");
            if (user == null) {
        %>
        <a href="SignIn.jsp"><button class="login-btn">Log In</button></a>
        <a href="SignUp.html"><button class="login-btn">Register</button></a>
        <%
            } else {
        %>
        <div class="user-dropdown">
            <button class="login-btn" onclick="toggleUserDropdown()"> <%= user.getUsername() %>  &#9660;</button>
            <div class="user-dropdown-content" id="userDropdown">
                <a href="overview.jsp">User Profile</a>
                <a href="SignOutServlet">Sign Out</a>
            </div>
        </div>
        <%
            }
        %>
    </nav>
</header>
    
   
                        <div class="hotel page">
            <div class="hotel-div">
                <h1>The Scenic Ridge Colombo</h1>
                <div class="hRooms">

                    <div class="card">
                        <div class="card__img"><img src="Image/family-room.webp"></div>
                        
                        <div class="card__title">Family Room</div>
                        <div class="card__subtitle">20000.00/= PerNight</div>
                        <div class="card__wrapper">
                        <a href="pages/makeBooking.jsp?hotelID=3&roomID=CFM&amount=20000.00" class="card__btn">Book Now</a>
                        
                        </div>
                    </div>

                    <div class="card">
                        <div class="card__img"><img src="Image/Presidential-Suite.webp"></div>
                        
                        <div class="card__title">Presidential Suite</div>
                        <div class="card__subtitle">230000.00/= PerNight</div>
                        <div class="card__wrapper">
                        <a href="pages/makeBooking.jsp?hotelID=3&roomID=CPS&amount=230000.00" class="card__btn">Book Now</a>
                        
                        </div>
                    </div>

                    <div class="card">
                        <div class="card__img"><img src="Image/Honeymoon-Suite.jpg"></div>
                        
                        <div class="card__title">Honeymoon Suite</div>
                        <div class="card__subtitle">200000.00/= PerNight</div>
                        <div class="card__wrapper">
                        <a href="pages/makeBooking.jsp?hotelID=3&roomID=CHS&amount=200000.00" class="card__btn">Book Now</a>
                        
                        </div>
                    </div>

                    <div class="card">
                        <div class="card__img"><img src="Image/Deluxe-Room.jpg"></div>
                        
                        <div class="card__title">Deluxe Rooms</div>
                        <div class="card__subtitle">30000.00/= PerNight</div>
                        <div class="card__wrapper">
                         <a href="pages/makeBooking.jsp?hotelID=3&roomID=CDR&amount=30000.00" class="card__btn">Book Now</a>
                        
                        </div>
                    </div>
                
                </div>
            </div>

            <div class="hotel-div">
                <h1>The Scenic Ridge Bentota</h1>
                <div class="hRooms">

                    <div class="card">
                        <div class="card__img"><img src="Image/family-room.webp"></div>
                        
                        <div class="card__title">Family Room</div>
                        <div class="card__subtitle">16000.00/= PerNight</div>
                        <div class="card__wrapper">
                        <a href="pages/makeBooking.jsp?hotelID=2&roomID=BFM&amount=16000.00" class="card__btn">Book Now</a>
                        
                        </div>
                    </div>

                    <div class="card">
                        <div class="card__img"><img src="Image/Villa-Suite.jpg"></div>
                        
                        <div class="card__title">Villa Suite</div>
                        <div class="card__subtitle">100000.00/= PerNight</div>
                        <div class="card__wrapper">
                        <a href="pages/makeBooking.jsp?hotelID=2&roomID=BVS&amount=100000.00" class="card__btn">Book Now</a>
                        
                        </div>
                    </div>

                    <div class="card">
                        <div class="card__img"><img src="Image/Honeymoon-Suite.jpg"></div>
                        
                        <div class="card__title">Honeymoon Suite</div>
                        <div class="card__subtitle">160000.00/= PerNight</div>
                        <div class="card__wrapper">
                        <a href="pages/makeBooking.jsp?hotelID=2&roomID=BHS&amount=160000.00" class="card__btn">Book Now</a>
                        
                        </div>
                    </div>

                    <div class="card">
                        <div class="card__img"><img src="Image/Deluxe-Room.jpg"></div>
                        
                        <div class="card__title">Deluxe Rooms</div>
                        <div class="card__subtitle">25000.00/= PerNight</div>
                        <div class="card__wrapper">
                        <a href="pages/makeBooking.jsp?hotelID=2&roomID=BDR&amount=25000.00" class="card__btn">Book Now</a>
                        
                        </div>
                    </div>
                
                </div>
            </div>

            <div class="hotel-div">
                <h1>The Scenic Ridge Galle</h1>
                <div class="hRooms">

                    <div class="card">
                        <div class="card__img"><img src="Image/family-room.webp"></div>
                        
                        <div class="card__title">Family Room</div>
                        <div class="card__subtitle">16000.00/= PerNight</div>
                        <div class="card__wrapper">
                        <button class="card__btn">Book Now</button>
                        
                        </div>
                    </div>

                    <div class="card">
                        <div class="card__img"><img src="Image/Presidential-Suite.webp"></div>
                        
                        <div class="card__title">Presidential Suite</div>
                        <div class="card__subtitle">200000.00/= PerNight</div>
                        <div class="card__wrapper">
                        <button class="card__btn">Book Now</button>
                        
                        </div>
                    </div>

                    <div class="card">
                        <div class="card__img"><img src="Image/Honeymoon-Suite.jpg"></div>
                        
                        <div class="card__title">Honeymoon Suite</div>
                        <div class="card__subtitle">160000.00/= PerNight</div>
                        <div class="card__wrapper">
                        <button class="card__btn">Book Now</button>
                        
                        </div>
                    </div>

                    <div class="card">
                        <div class="card__img"><img src="Image/Deluxe-Room.jpg"></div>
                        
                        <div class="card__title">Deluxe Rooms</div>
                        <div class="card__subtitle">25000.00/= PerNight</div>
                        <div class="card__wrapper">
                        <button class="card__btn">Book Now</button>
                        
                        </div>
                    </div>
                
                </div>
            </div>

            <div class="hotel-div">
                <h1>The Scenic Ridge Jaffna</h1>
                <div class="hRooms">

                    <div class="card">
                        <div class="card__img"><img src="Image/family-room.webp"></div>
                        
                        <div class="card__title">Family Room</div>
                        <div class="card__subtitle">12000.00/= PerNight</div>
                        <div class="card__wrapper">
                        <button class="card__btn">Book Now</button>
                        
                        </div>
                    </div>

                    <div class="card">
                        <div class="card__img"><img src="Image/Presidential-Suite.webp"></div>
                        
                        <div class="card__title">Presidential Suite</div>
                        <div class="card__subtitle">120000.00/= PerNight</div>
                        <div class="card__wrapper">
                        <button class="card__btn">Book Now</button>
                        
                        </div>
                    </div>

                    <div class="card">
                        <div class="card__img"><img src="Image/Honeymoon-Suite.jpg"></div>
                        
                        <div class="card__title">Honeymoon Suite</div>
                        <div class="card__subtitle">120000.00/= PerNight</div>
                        <div class="card__wrapper">
                        <button class="card__btn">Book Now</button>
                        
                        </div>
                    </div>

                    <div class="card">
                        <div class="card__img"><img src="Image/Deluxe-Room.jpg"></div>
                        
                        <div class="card__title">Deluxe Rooms</div>
                        <div class="card__subtitle">18000.00/= PerNight</div>
                        <div class="card__wrapper">
                        <button class="card__btn">Book Now</button>
                        
                        </div>
                    </div>
                
                </div>
            </div>
        </div>
                       

</body>
</html>