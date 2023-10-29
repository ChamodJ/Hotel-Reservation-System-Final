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
		System.out.println("came in the change servlet");
		response.setContentType("text/html");
		HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        System.out.println(user.getUsername());
        if (user != null) {
        	System.out.println("came in user check");
        	String oldPwd = request.getParameter("currentpwd");
        	
        	String newPwd = request.getParameter("newpwd");
        
        	String confirmPwd= request.getParameter("confirmpwd");
        	System.out.println(user.getPassword());
        	System.out.println(oldPwd);
        	if (user.getPassword().equals(oldPwd)) {
        		System.out.println("came in check");
        		 if (newPwd.equals(confirmPwd)) {
        			 user.setPassword(newPwd);
        			System.out.println("came in confirm");
        			 Userservices userservice = new UserServiceImplementation();
           		     userservice.updatePassword(user.getUser_ID(), newPwd);
           		    
           		  response.sendRedirect("SignOutServlet"); 		 
        			 
        		 }else
        			 response.sendRedirect(request.getContextPath() + "/pages/manage.jsp");
        }
        	else
        		response.sendRedirect(request.getContextPath() + "SignIn.jsp");
        }
	}

}
