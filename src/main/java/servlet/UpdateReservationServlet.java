package servlet;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Booking;
import service.ReservationServices;
import util.DBConnectionUtil;

@WebServlet("/pages/admin/updatereservation")
public class UpdateReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateReservationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// Getting data from the form
		int Reservaton_id = Integer.parseInt(req.getParameter("Reservaton_id"));
		int User_id = Integer.parseInt(req.getParameter("User_id"));
		int Hotel_id = Integer.parseInt(req.getParameter("Hotel_id"));
		String room_id = req.getParameter("room_id");
		String check_in_date = req.getParameter("check_in_date");
		String check_out_date = req.getParameter("check_out_date");
		int No_of_Gusts = Integer.parseInt(req.getParameter("No_of_Gusts"));
		float Amount = Float.parseFloat(req.getParameter("Amount"));

		// Creating a Hotel object with the received data
		Booking booking = new Booking(Reservaton_id, User_id, Hotel_id, room_id, check_in_date, check_out_date,
				No_of_Gusts, Amount);

		try {
			// Creating a HotelDAO object with database connection
			ReservationServices rs = new ReservationServices(DBConnectionUtil.getDBConnection());
System.out.println(booking);
			// Updating the hotel information in the database
			rs.updateReservation(booking);

			// Redirecting to the Previous page after the update
			resp.sendRedirect("AdminReservation.jsp");
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
