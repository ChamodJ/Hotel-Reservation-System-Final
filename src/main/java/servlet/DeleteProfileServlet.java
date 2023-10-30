package servlet;



import java.io.IOException;

import model.User;
import service.UserServiceImplementation;
import service.Userservices;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/DeleteProfileServlet")
public class DeleteProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
    /**
     * Default constructor. 
     */
    public DeleteProfileServlet() {
        // TODO Auto-generated constructor stub
    	super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            int userId = user.getUser_ID();
            Userservices userservice = new UserServiceImplementation();
            userservice.deleteUser(userId);

            // Invalidate the session to log the user out
            session.invalidate();
            // Redirect to a confirmation page or a sign-in page
            
            response.sendRedirect(request.getContextPath() + "/pages/landingPages/Home.jsp");
            
        }
    }
}


