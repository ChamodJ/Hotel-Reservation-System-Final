package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.BookingServiceImplementation;
import service.BookingServices;

import java.io.IOException;

/**
 * Servlet implementation class CancelBookingServlet
 */
@WebServlet("/CancelBookingServlet")
public class CancelBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelBookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// HttpSession session = request.getSession();
		  String Id = request.getParameter("bookingId");
		  
		 

	        if (Id != null) {
	        	 int bookingId= Integer.parseInt(Id);
	            BookingServices bookingService = new BookingServiceImplementation();
	            bookingService.deleteBooking(bookingId);

	            System.out.println("came");
	            
	            RequestDispatcher dispatcher = request.getRequestDispatcher("mybooking.jsp");
	            dispatcher.forward(request, response);
	           
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	

	}
}
