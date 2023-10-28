package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.RoomServiceImpelmentation;
import util.DBConnectionUtil;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class DeleteRoomServlet
 */
@WebServlet("/pages/admin/deleter")
public class DeleteRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteRoomServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// Retrieving the Room ID from the request parameter
		String Room_Id = req.getParameter("Room_Id");

		// Creating a RoomDAO object with database connection
		try {
			RoomServiceImpelmentation roomDao = new RoomServiceImpelmentation(DBConnectionUtil.getDBConnection());

			// Deleting the room with the specified ID from the database
			roomDao.deleteroom(Room_Id);

			// Redirecting to previous page after deleting the room
			resp.sendRedirect("Roominfo.jsp");
		} catch (ClassNotFoundException | SQLException | IOException e) {
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
