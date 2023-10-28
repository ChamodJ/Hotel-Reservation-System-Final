package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.HotelServiceImplementation;
import util.DBConnectionUtil;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class DeleteHotelServlet
 */
@WebServlet("/DeleteHotelServlet")
public class DeleteHotelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteHotelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// Retrieving the Hotel ID from the request parameter
		int hotelId = Integer.parseInt(req.getParameter("Hotel_id"));

		// Creating a HotelDAO object with database connection
		try {
			HotelServiceImplementation hotelDao = new HotelServiceImplementation(DBConnectionUtil.getDBConnection());

			// Deleting the hotel with the specified ID from the database
			hotelDao.deletehotel(hotelId);

			// Redirecting to previous page after deleting the hotel
			resp.sendRedirect("Hotelinfo.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
