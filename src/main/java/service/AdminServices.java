package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Booking;
import util.DBConnectionUtil;

public class AdminServices {
	
public List<Booking> getReservations() throws ClassNotFoundException, SQLException  {
		
		Booking r = new Booking();
		Connection con = DBConnectionUtil.getDBConnection();
		String sql = "select * from reservaton where check_in_date >= curdate();";
		
		List<Booking> res = new ArrayList<Booking>();
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				r.setReservaton_id(rs.getInt(1));
				r.setUser_id(rs.getInt(2));
				r.setHotel_id(rs.getInt(3));
				r.setRoom_id(rs.getString(4));
				r.setCheck_in_date(rs.getDate(5));
				r.setCheck_out_date(rs.getDate(6));
				r.setReservation_date(rs.getDate(7));
				r.setNo_of_Gusts(rs.getInt(8));
				r.setAmount(rs.getFloat(9));
				
				res.add(r);
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
		
		return res;
	}
	
	public int reservationCount() throws ClassNotFoundException, SQLException {
		
		Connection con = DBConnectionUtil.getDBConnection();
		String sql = "select count(Reservaton_id) from reservaton";
		
		int rcount = 0;
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				rcount = rs.getInt(1);
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
		
		return rcount;
	}
	
	public int userCount() throws ClassNotFoundException, SQLException {
		Connection con = DBConnectionUtil.getDBConnection();
		String sql = "select count(Email) from users where role = 'user';";
		
		int ucount = 0;
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				ucount = rs.getInt(1);
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
		return ucount;
		
	}

}
