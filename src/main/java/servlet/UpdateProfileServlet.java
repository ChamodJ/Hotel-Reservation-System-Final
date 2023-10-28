package servlet;






import java.io.IOException;



import model.User;
import service.UserServiceImplementation;
import service.Userservices;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;




/**
 * Servlet implementation class ProfileUser
 */
@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileServlet() {
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
		System.out.println("came inside update");
		response.setContentType("text/html");
		HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        
        if (user != null) {
        	//String employeeID = request.getParameter("employeeID");	
    		user.setUsername(request.getParameter("Username"));
    		user.setEmail(request.getParameter("Email"));
    		user.setMobile_No(request.getParameter("PhoneNumber"));
		
    		Userservices userservice = new UserServiceImplementation();
   		     userservice.updateUser(user);
        	
        }
    	RequestDispatcher dispatcher = request.getRequestDispatcher("overview.jsp");
        dispatcher.forward(request, response);
        
		 
		
	}

}
