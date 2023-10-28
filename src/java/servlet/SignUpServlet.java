package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import service.SignUpServices;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpServlet() {
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
		//Get user inputs
				try {
					User ud = new User();
					ud.setUsername(request.getParameter("user-name"));
					ud.setEmail(request.getParameter("user-email"));
					ud.setMobile_No(request.getParameter("user-mobile"));
					ud.setAddress(request.getParameter("user-address"));
					ud.setPassword(request.getParameter("pass"));
					
					if (ud.getEmail() != null) {
						ud.getEmail().toLowerCase();
					}
					
					SignUpServices sus = new SignUpServices();
					
					boolean uExist = sus.findUser(ud.getEmail());
					
					if (uExist == false) {
						int rawcount = sus.addUser(ud.getUsername(), ud.getEmail(), ud.getMobile_No(), ud.getAddress(), ud.getPassword());
						System.out.println(rawcount);
					    if(rawcount > 0) {
					    	request.setAttribute("status", "Success");
					    	
					    	RequestDispatcher dispatcher = request.getRequestDispatcher("SignIn.jsp");
					        dispatcher.forward(request, response);
					    	//response.sendRedirect("../pages/SignUp.html");
					    	
					    }
					    else {
					    	request.setAttribute("status", "failed");
					    }

					    //request.getRequestDispatcher("SignUp.html").forward(request, response);
					}
					
					else {
						request.setAttribute("UserExist", "true");
						RequestDispatcher dispatcher = request.getRequestDispatcher("SignUp.html");
				        dispatcher.forward(request, response);
						
					}
				} catch (ClassNotFoundException | SQLException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	}

}
