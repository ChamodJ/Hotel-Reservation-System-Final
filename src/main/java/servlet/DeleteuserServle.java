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

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int User_ID = Integer.parseInt(req.getParameter("User_id"));

            AdminServices admin = new AdminServices();
            boolean deleted = admin.deleteuser(User_ID);

            if (deleted) {
                resp.sendRedirect("adminUser.jsp"); // Redirect to a page displaying user information
            } else {
                resp.getWriter().println("Failed to delete user.");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}