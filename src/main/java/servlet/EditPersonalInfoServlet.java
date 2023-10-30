package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import service.UserServiceImplementation;
import service.Userservices;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
/**
 * Servlet implementation class PersonalInfoServlet
 */
@WebServlet("/EditPersonalInfoServlet")
public class EditPersonalInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPersonalInfoServlet() {
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
        	
        	Date sqlDate = null;
			try {
				String dateString = request.getParameter("dob");
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				
				 java.util.Date parsedDate = dateFormat.parse(dateString);
				    sqlDate = new Date(parsedDate.getTime());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	//String employeeID = request.getParameter("employeeID");	
    		user.setFirst_Name(request.getParameter("newfirstname"));
    		user.setLast_Name(request.getParameter("newlastname"));
    		user.setEmail(request.getParameter("newEmail"));
    		user.setMobile_No(request.getParameter("newPhoneNumber"));
    		user.setDate_of_birth(sqlDate);
    		user.setNationality(request.getParameter("country"));
    		user.setGender(request.getParameter("gender"));
    		user.setAddress(request.getParameter("address"));
		
    		Userservices userservice = new UserServiceImplementation();
   		     userservice.updateUser(user);
        	
        }
      
        response.sendRedirect(request.getContextPath() + "/pages/user/viewpersonalinfo.jsp");
        
	}

}
