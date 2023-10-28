package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.AdminServices;

@WebServlet("/pages/admin/deleteu")
public class DeleteuserServle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteuserServle() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int User_ID = Integer.parseInt(req.getParameter("User_ID"));

			AdminServices admin = new AdminServices();
			admin.deleteuser(User_ID);

			resp.sendRedirect("adminUser.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
