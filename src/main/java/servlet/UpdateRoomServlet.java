package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Room;
import service.RoomServiceImpelmentation;
import util.DBConnectionUtil;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class UpdateRoomServlet
 */
@WebServlet("/pages/admin/updaterooms")
public class UpdateRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRoomServlet() {
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
		String Room_Id = req.getParameter("Room_Id");
		int Hotel_id = Integer.parseInt(req.getParameter("Hotel_id"));
		String Type = req.getParameter("Type");
		float Price = Float.parseFloat(req.getParameter("Price"));
		int bed_count = Integer.parseInt(req.getParameter("bed_count"));
		int Total_rooms = Integer.parseInt(req.getParameter("Total_rooms"));
		int Reserved_room = Integer.parseInt(req.getParameter("Reserved_room"));

		// Printing received data (in console)
		System.out.println(Room_Id);
		System.out.println(Hotel_id);
		System.out.println(Type);
		System.out.println(Price);
		System.out.println(bed_count);
		System.out.println(Total_rooms);
		System.out.println(Reserved_room);

		// Creating a Room object with the received data
		Room room = new Room(Room_Id, Hotel_id, Type, Price, bed_count, Total_rooms, Reserved_room);

		try {
			// Creating a RoomDAO object with database connection
			RoomServiceImpelmentation roomdao = new RoomServiceImpelmentation(DBConnectionUtil.getDBConnection());

			// Updating the room information in the database
			roomdao.updateroom(room);

			// Redirecting to the Previous page after the update
			resp.sendRedirect("Roominfo.jsp");
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
