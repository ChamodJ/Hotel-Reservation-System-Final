package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Hotel;
import service.HotelServiceImplementation;
import util.DBConnectionUtil;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class AddHotelServlet
 */
@WebServlet("/registerhotel")
public class AddHotelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddHotelServlet() {
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
		// TODO Auto-generated method stub
		// Retrieving form data
		int Hotel_id = Integer.parseInt(request.getParameter("Hotel_id"));
		String Location = request.getParameter("Location");
		String Contact_info = request.getParameter("Contact_info");

		// Creating a Hotel object with the form data
		Hotel hotel = new Hotel(Hotel_id, Location, Contact_info);

		// Creating a HotelDAO object with database connection
		try {
			HotelServiceImplementation hoteldao = new HotelServiceImplementation(DBConnectionUtil.getDBConnection());

			@SuppressWarnings("unused")
			HttpSession session = request.getSession();

			// Adding the hotel to the database
			@SuppressWarnings("unused")
			boolean f = hoteldao.addhotel(hotel);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// Redirecting to previous page after adding the hotel
		try {
			
			  RequestDispatcher dispatcher = request.getRequestDispatcher("AddRoom.jsp");
	            dispatcher.forward(request, response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

//		if (f) {
//
//			session.setAttribute("sussmsg", "Suceesfully Added!");
//			resp.sendRedirect("AddHotel.jsp");
//			// System.out.println("Hotell adda:");
//
//		} else {
//
//			session.setAttribute("erorrmsg", "Not Added!");
//			resp.sendRedirect("AddHotel.jsp");
//			// System.out.println("Hotell not adda:");
//		} // System.out.println(hotel);

	}
	}


