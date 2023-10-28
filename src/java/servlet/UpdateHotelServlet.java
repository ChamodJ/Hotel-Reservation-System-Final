package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Hotel;
import service.HotelServiceImplementation;
import util.DBConnectionUtil;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class UpdateHotelServlet
 */
@WebServlet("/UpdateHotelServlet")
public class UpdateHotelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateHotelServlet() {
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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// Getting data from the form
		int Hotel_id = Integer.parseInt(req.getParameter("Hotel_id"));
		String Location = req.getParameter("Location");
		String Contact_info = req.getParameter("Contact_info");

		// Printing received data (in console)
		System.out.println(Hotel_id);
		System.out.println(Location);
		System.out.println(Contact_info);

		// Creating a Hotel object with the received data
		Hotel hotel = new Hotel(Hotel_id, Location, Contact_info);

		try {
			// Creating a HotelDAO object with database connection
			HotelServiceImplementation hoteldao = new HotelServiceImplementation(DBConnectionUtil.getDBConnection());

			// Updating the hotel information in the database
			hoteldao.updatehotel(hotel);

			// Redirecting to the Previous page after the update
			resp.sendRedirect("Hotelinfo.jsp");
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
