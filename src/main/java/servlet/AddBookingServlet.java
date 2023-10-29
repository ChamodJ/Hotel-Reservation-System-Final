package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Booking;
import model.User;
import service.BookingServiceImplementation;
import service.BookingServices;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class AddBookingServlet
 */
@WebServlet("/AddBookingServlet")
public class AddBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession();
          @SuppressWarnings("unused")
		User user = (User) session.getAttribute("user");
         
		Booking booking = new Booking();
		

		    int userId = 0;
	        int hotelId = 0;
	        int guest=0;
	        float amount=0;
        	Date sqlcheckinDate = null;
        	Date sqlreservationdate= null;
        	Date sqlcheckoutDate = null;
			    
				try {
					String checkin = request.getParameter("checkin");
					String checkout = request.getParameter("checkout");
					String reservationdate = request.getParameter("reservationDate");
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					
					 java.util.Date checkinDate = dateFormat.parse(checkin);
					 java.util.Date checkoutDate = dateFormat.parse(checkout);
					 java.util.Date reservation = dateFormat.parse(reservationdate);
					 
					    sqlcheckinDate = new Date(checkinDate.getTime());
					    sqlcheckoutDate = new Date(checkoutDate.getTime());
					    sqlreservationdate = new Date(reservation.getTime());
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				String userIdParam = request.getParameter("userid");
				String hotelIdParam = request.getParameter("hotelId");
				String guestParam = request.getParameter("guest");
				String amountParam = request.getParameter("amount");
				
				
				if (userIdParam != null && hotelIdParam != null && guestParam != null && amountParam != null) {
				  
				        userId = Integer.parseInt(userIdParam);
				        hotelId = Integer.parseInt(hotelIdParam);
				        guest = Integer.parseInt(guestParam);
				        amount = Float.parseFloat(amountParam);
				}
			
     
		booking.setUser_id(userId);
		booking.setHotel_id(hotelId);
		booking.setRoom_id(request.getParameter("roomId"));
		booking.setCheck_in_date(sqlcheckinDate);
		booking.setCheck_out_date(sqlcheckoutDate);
		booking.setReservation_date(sqlreservationdate);
		booking.setNo_of_Gusts(guest );
		booking.setAmount(amount);
		
		BookingServices bookingservice = new BookingServiceImplementation();
		bookingservice.insertBooking(booking);
       
		request.setAttribute("booking", booking);
		response.sendRedirect("overview.jsp");
	}
	}


