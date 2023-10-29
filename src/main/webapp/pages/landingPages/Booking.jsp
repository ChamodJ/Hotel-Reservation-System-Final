<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../styles/landingPages.css">
</head>
<body>
	    <header>
        <h2 class="logo">The Scenic Ridge</h2>
        <nav class="nav-bar">
            <a class="links" href="Home.html">Home</a>
            <a class="current links" href="Hotel.html">Hotels</a>
            <a class="links" href="Serviecs.html">Service</a>
            <a class="links" href="AboutUs.html">About Us</a>
            <a class="links" href="Contact.html">Contact</a>
            <a href=""><button class="login-btn">Log IN</button></a>
            <a href=""><button class="login-btn">Register</button></a>

        </nav>
    </header>

	
	 <div class="page bookNow-main">
        <div class="bookNow-page">
            <div class="contactForm-div">
	
	 			<form action="AddBookingServlet" method="post" class="formbook">
    				<label>Reservation Id</label>
    				<input id="textbox" type="text" name="Reservation_id" /><br /><br />
    
    				<label>User Id</label>
    				<input id="textbox" type="text" name="User_id" /><br /><br />
    
    				<label>Hotel Id</label>
    				<input id="textbox" type="text" name="Hotel_id" /><br /><br />
    
    				<label>Check In Date</label>
    				<input id="textbox" type="date" name="Check_in_date" /><br /><br />
    
    				<label>Check Out Date</label>
    				<input id="textbox" type="date" name="Check_out_date" /><br /><br />
    
    				<label>No. of Guests</label>
    				<input id="textbox" type="text" name="No_of_Gusts" /><br /><br />
    
    				<label>Amount</label>
    				<input id="textbox" type="text" name="Amount" /><br /><br />
    
    				<input type="submit" name="submit" value="CONFIRM" />
			</form>
		</div>
	</div>
</div>

</body>
</html>