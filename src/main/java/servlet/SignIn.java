package servlet;




import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


import model.User;
import service.UserServiceImplementation;
import service.Userservices;


/**
 * Servlet implementation class SignIn
 */
@WebServlet("/SignIn")
public class SignIn extends HttpServlet {
	

	private static final long serialVersionUID = 1L;
	
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignIn() {
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		System.out.println("entered servelet");
//		response.setContentType("text/html");
		User user = new User();
		Userservices userservice = new UserServiceImplementation();
		String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean authenticateuser = userservice.authenticateUser( email, password);
         
         System.out.println("came above servelet");
		
		 System.out.println("came servelet");
        
        if (authenticateuser == true) {
            // If authentication is successful, create a session
            HttpSession session = (HttpSession) request.getSession();
            
             user = userservice.selectfullUserbyid(email);
			session.setAttribute("user", user);
			
			String Role= user.getRole();
			if(Role.equals("admin")) {
				request.setAttribute("user", user);
				//response.sendRedirect("../pages/AdminDashboard.jsp");
				
				response.sendRedirect("pages/admin/AdminDashboard.jsp");
	            //dispatcher.forward(request, response);
			}
			//Redirect to Home page
			else if(Role.equals("user")) {
				request.setAttribute("user", user);
				 response.sendRedirect(request.getContextPath() + "/pages/landingPages/Home.jsp");
				
			}
			
		
//            // Redirect to the user's profile page or another destination
//			    RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
//	            dispatcher.forward(request, response);
        } else {
            // If authentication fails, show an error message or redirect to the login page
        	System.out.println("none");
        	 response.sendRedirect(request.getContextPath() + "/SignIn.jsp");
        }
        
        
        
//        User ud = new User();
//		SignInServices sis = new SignInServices();
//		
//		
//    	try {
//			//Get user inputs
//			String email = request.getParameter("email").toString().toLowerCase();
//			String password = request.getParameter("password").toString();
//			boolean loginStatus = sis.userValidation(email , password);
//			
//			
//
//			//User name and password Validation
//			//Valid Login
//			if (loginStatus == true) {
//				//Start a session
//				HttpSession session = request.getSession();
//				
//				
//				
//				//Get User 
//				ud = sis.getUserData(email);
//				
//				session.setAttribute("username", sis.getUserData(email));
//				
//				System.out.println("Ud");
//				System.out.println(ud.getUsername() + "This is name");
//				
//				//Check user type 
//				String uRole = ud.getRole();
//				
//				
//				if(uRole.equals("admin")) {
//					request.setAttribute("adminname", ud.getUsername());
//					response.sendRedirect("AdminDashboard.jsp");
//				}
//				//Redirect to Home page
//				else if(uRole.equals("user")) {
//					request.setAttribute("username", ud.getUsername());
//					response.sendRedirect("Home.jsp");
//					System.out.println("user");
//				}
//			
//			} 
//			
//			//Invalid login
//			else {
//				response.sendRedirect("SignIn.jsp");
//			}
//		} catch (ClassNotFoundException | SQLException | IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
        
        
        
    }
    }
		
	


