package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Room;
import service.RoomServiceImpelmentation;
import util.DBConnectionUtil;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class AddRoomServlet
 */
@WebServlet("/AddRoomServlet")
public class AddRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRoomServlet() {
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
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// Retrieving form data
		String Room_Id = req.getParameter("Room_Id");
		int Hotel_id = Integer.parseInt(req.getParameter("Hotel_id"));
		String Type = req.getParameter("Type");
		float Price = Float.parseFloat(req.getParameter("Price"));
		int bed_count = Integer.parseInt(req.getParameter("bed_count"));
		int Total_rooms = Integer.parseInt(req.getParameter("Total_rooms"));
		int Reserved_room = Integer.parseInt(req.getParameter("Reserved_room"));

		// Creating a Room object with the form data
		Room room = new Room(Room_Id, Hotel_id, Type, Price, bed_count, Total_rooms, Reserved_room);

		// Creating a RoomDAO object with database connection
		try {
			RoomServiceImpelmentation roomdao = new RoomServiceImpelmentation(DBConnectionUtil.getDBConnection());

			@SuppressWarnings("unused")
			HttpSession session = req.getSession();

			// Adding the room to the database
			@SuppressWarnings("unused")
			boolean f = roomdao.addroom(room);

			// Redirecting to previous page after adding the room
			resp.sendRedirect("Roominfo.jsp");
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
