package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;
import util.DBConnectionUtil;

public class SignInServices {
	
	User ud = new User();
	
	public String findUser(String uemail) throws ClassNotFoundException, SQLException {
		
		String sql = "select * from users where email=?; ";
		String uPassword = "";
		
		Connection con = DBConnectionUtil.getDBConnection();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, uemail);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				uPassword = rs.getString("password");
				ud.setRole(rs.getString("role"));
				ud.setEmail(uemail);				
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}
		}
		return uPassword;
	}
    
    public boolean userValidation(String email, String password) throws ClassNotFoundException, SQLException {
    	
    	String pass = findUser(email.toLowerCase());
    	    	
   
    	//Check details
    	if (pass.equals(password) ) { 		
        	return true;
        } 
        
        else {
        	return false;
        }
    }
    
    public String checkUserType() {
		
    	
    	return null;
    }
      
    public User getUserData(String email) throws ClassNotFoundException, SQLException {
    	
		String sql = "select * from users where email=?; ";
		
		Connection con = DBConnectionUtil.getDBConnection();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				ud.setUsername(sql);
		    	ud.setMobile_No(rs.getString("Mobile_no"));
		    	ud.setAddress(rs.getString("Address"));
		    	ud.setRole(rs.getString("role"));
				
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}
		}
		//printData();
		return ud;
	}
    
    /*
    public void printData() {
    	
    	
    	System.out.println(ud.getName());
    	System.out.println(ud.getEmail());
    	System.out.println(ud.getMobile());
    	System.out.println(ud.getAddress());
    	System.out.println(ud.getRole());
    }*/
    
  
    /*
    public String checkRole() {
		
    	String role = "";
    	
    	if (ud.getRole().equals("admin")) {
    		role = "admin";
    	}
    	
    	else if (ud.getRole().equals("user")) {
    		role = "user";
    	}
    	
    	return role;
    }*/

}
