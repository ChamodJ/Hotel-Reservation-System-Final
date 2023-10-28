package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Booking;
import service.BookingServiceImplementation;
import service.BookingServices;


/**
 * Servlet implementation class EditBookingServlet
 */
@WebServlet("/EditBookingServlet")
public class EditBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditBookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String bookingIdParam = request.getParameter("bookingId");

	        if (bookingIdParam != null) {
	            try {
	                int bookingId = Integer.parseInt(bookingIdParam);

	                BookingServices bookingService = new BookingServiceImplementation();
	                Booking booking = bookingService.selectBooking(bookingId);

	                if (booking != null) {
	                    request.setAttribute("booking", booking);
	                    RequestDispatcher dispatcher = request.getRequestDispatcher("edit-booking.jsp");
	                    dispatcher.forward(request, response);
	                } else {
	                    // Handle the case where the booking with the given ID was not found
	                	RequestDispatcher dispatcher = request.getRequestDispatcher("mybooking.jsp");
	    	            dispatcher.forward(request, response);
	                }
	            } catch (NumberFormatException e) {
	                // Handle invalid booking ID parameter
	            	RequestDispatcher dispatcher = request.getRequestDispatcher("mybooking.jsp");
		            dispatcher.forward(request, response);
	            }
	        } else {
	            // Handle the case where bookingIdParam is not provided
	        	RequestDispatcher dispatcher = request.getRequestDispatcher("mybooking.jsp");
	            dispatcher.forward(request, response);
	        }
	    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		   Booking updatedBooking = new Booking();
	        // Populate the updatedBooking object with the edited values from the form

	        BookingServices bookingService = new BookingServiceImplementation();
	        boolean success = bookingService.updateBooking(updatedBooking);

	        if (success) {
	        	RequestDispatcher dispatcher = request.getRequestDispatcher("mybooking.jsp");
	            dispatcher.forward(request, response);
	        } else {
	            // Handle the case where the update fails
	            //response.sendRedirect("edit-booking.jsp?bookingId=" + updatedBooking.getReservaton_id());
	        }
	}

}
