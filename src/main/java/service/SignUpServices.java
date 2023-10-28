package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBConnectionUtil;

public class SignUpServices {
public int addUser(String name, String email, String mobile, String address, String pass) throws ClassNotFoundException, SQLException {
		
		System.out.println("Inside Add User");
		String sql = "insert into users (Username, Email, Address, Mobile_no, password,  role)  values ( ?, ?, ?, ?, ?, 'user')";
		int rowcount = 0;
		
		Connection con = DBConnectionUtil.getDBConnection();
		
		try {
			System.out.println("Inside try");
			
			PreparedStatement psr = con.prepareStatement(sql);
			psr.setString(1, name);
			psr.setString(2, email);
			psr.setString(3, address);
			psr.setString(4, mobile);
			psr.setString(5, pass);
			
			rowcount = psr.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return rowcount;
		
	}
	
	//Find if the user already exist
	public boolean findUser(String uemail) throws ClassNotFoundException, SQLException {
		String sql = "select * from users where email=?; ";
		
		Connection con = DBConnectionUtil.getDBConnection();
		try {
			System.out.println("Inside find user try");
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, uemail);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				return true;
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
		return false;
	}

}
