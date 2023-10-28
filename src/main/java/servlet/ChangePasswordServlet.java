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
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
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
		
		response.setContentType("text/html");
		HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user != null) {
        	String oldPwd = request.getParameter("currentpwd");
        	
        	String newPwd = request.getParameter("newpwd");
        
        	String confirmPwd= request.getParameter("confirmpwd");
        	
        	if (user.getPassword().equals(oldPwd)) {
        		 if (newPwd.equals(confirmPwd)) {
        			 user.setPassword(newPwd);
        			
        			 Userservices userservice = new UserServiceImplementation();
           		     userservice.updatePassword(user.getUser_ID(), newPwd);
           		    
           		     
           		  RequestDispatcher dispatcher = request.getRequestDispatcher("SignOutServlet");
                  dispatcher.forward(request, response);
        			 
        		 }
        }
        }
	}

}
