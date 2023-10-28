/**
 * 
 */
package service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Booking;
import util.CommonConstants;
import util.DBConnectionUtil;
import util.QueryUtil;

/**
 * 
 */
public class BookingServiceImplementation implements BookingServices {
	
	/**
	 * Initialize logger
	 */
	public static final Logger log = Logger.getLogger(BookingServices.class.getName());
	
	private static Connection connection;

	
	
	private PreparedStatement preparedStatement;

	@Override
	public void insertBooking(Booking booking) {
		try {
			connection = DBConnectionUtil.getDBConnection();
			/*
			 * Query is available in EmployeeQuery.xml file and use
			 * insert_employee key to extract value of it
			 */
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_INSERT_BOOKING));
			
			
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ONE, booking.getUser_id());
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_TWO, booking.getHotel_id());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, booking.getRoom_id());
			preparedStatement.setDate(CommonConstants.COLUMN_INDEX_FOUR,booking.getCheck_in_date());
			preparedStatement.setDate(CommonConstants.COLUMN_INDEX_FIVE, booking.getCheck_out_date());
			preparedStatement.setDate(CommonConstants.COLUMN_INDEX_SIX, booking.getReservation_date());
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_SEVEN, booking.getNo_of_Gusts());
			preparedStatement.setFloat(CommonConstants.COLUMN_INDEX_EIGHT, booking.getAmount());
			
			// Add user
			preparedStatement.execute();
			System.out.println("successful execution");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  finally {
			/*
			 * Close prepared statement and database connectivity at the end of
			 * transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
	}

	@Override
	public List<Booking> selectAllCurrentUserBooking(int userid) {
		
		List < Booking > currentbookinglist = new ArrayList < > ();
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_SELECT_ALL_CURRENT_BOOKING_OF_USER_BY_ID));
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ONE, userid);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				Booking booking = new Booking();
				
				booking.setReservaton_id(rs.getInt(CommonConstants.COLUMN_INDEX_ONE));
				booking.setReservation_date(rs.getDate(CommonConstants.COLUMN_INDEX_TWO));
				booking.setHotelName(rs.getString(CommonConstants.COLUMN_INDEX_THREE));
				booking.setRoomType(rs.getString(CommonConstants.COLUMN_INDEX_FOUR));
				booking.setCheck_in_date(rs.getDate(CommonConstants.COLUMN_INDEX_FIVE));
				booking.setCheck_out_date(rs.getDate(CommonConstants.COLUMN_INDEX_SIX));
				booking.setNo_of_Gusts(rs.getInt(CommonConstants.COLUMN_INDEX_SEVEN));
				booking.setAmount(rs.getFloat(CommonConstants.COLUMN_INDEX_EIGHT));
				
			    currentbookinglist.add(booking);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		    
		
		
		return currentbookinglist;
	}
	
public List<Booking> selectAllPastUserBooking(int userid) {
		
		List < Booking > pastbookinglist = new ArrayList < > ();
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_SELECT_ALL_PAST_BOOKING_OF_USER_BY_ID));
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ONE, userid);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				Booking booking = new Booking();
				
				booking.setReservaton_id(rs.getInt(CommonConstants.COLUMN_INDEX_ONE));
				booking.setReservation_date(rs.getDate(CommonConstants.COLUMN_INDEX_TWO));
				booking.setHotelName(rs.getString(CommonConstants.COLUMN_INDEX_THREE));
				booking.setRoomType(rs.getString(CommonConstants.COLUMN_INDEX_FOUR));
				booking.setCheck_in_date(rs.getDate(CommonConstants.COLUMN_INDEX_FIVE));
				booking.setCheck_out_date(rs.getDate(CommonConstants.COLUMN_INDEX_SIX));
				booking.setNo_of_Gusts(rs.getInt(CommonConstants.COLUMN_INDEX_SEVEN));
				booking.setAmount(rs.getFloat(CommonConstants.COLUMN_INDEX_EIGHT));
				
			    pastbookinglist.add(booking);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		    
		
		
		return pastbookinglist;
	}
	

	@Override
	public List<Booking> selectAllBooking() {
		// TODO Auto-generated method stub
		
		List < Booking > bookinglist = new ArrayList < > ();
		
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_SELECT_ALL_BOOKINGS_OF_USER));
			
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				Booking booking = new Booking();
				
				booking.setReservaton_id(rs.getInt(CommonConstants.COLUMN_INDEX_ONE));
				booking.setUser_id(rs.getInt(CommonConstants.COLUMN_INDEX_TWO));
				booking.setHotel_id(rs.getInt(CommonConstants.COLUMN_INDEX_THREE));
				booking.setRoom_id(rs.getString(CommonConstants.COLUMN_INDEX_FOUR));
				booking.setCheck_in_date(rs.getDate(CommonConstants.COLUMN_INDEX_FIVE));
				booking.setCheck_out_date(rs.getDate(CommonConstants.COLUMN_INDEX_SIX));
				booking.setReservation_date(rs.getDate(CommonConstants.COLUMN_INDEX_SEVEN));
				booking.setNo_of_Gusts(rs.getInt(CommonConstants.COLUMN_INDEX_EIGHT));
				booking.setAmount(rs.getFloat(CommonConstants.COLUMN_INDEX_NINE));
				
			    bookinglist.add(booking);
			
			    }
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			/*
			 * Close prepared statement and database connectivity at the end of
			 * transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		
		return bookinglist;
	}
	
	@Override
	public Booking selectBooking(int Reservaton_id)
	{
		Booking booking = null;
		
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_SELECT_BOOKING_OF_USER_BY_ID));
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ONE, Reservaton_id);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				
				int reservationid = (rs.getInt(CommonConstants.COLUMN_INDEX_ONE));
				int userid = (rs.getInt(CommonConstants.COLUMN_INDEX_TWO));;
				int hotelid = (rs.getInt(CommonConstants.COLUMN_INDEX_THREE));
				String roomid = (rs.getString(CommonConstants.COLUMN_INDEX_FOUR));
				Date checkin = (rs.getDate(CommonConstants.COLUMN_INDEX_FIVE));
				Date checkout = (rs.getDate(CommonConstants.COLUMN_INDEX_SIX));
				Date reservationmade = (rs.getDate(CommonConstants.COLUMN_INDEX_SEVEN));
				int noOfGuests = (rs.getInt(CommonConstants.COLUMN_INDEX_EIGHT));
				float amount = (rs.getFloat(CommonConstants.COLUMN_INDEX_NINE));
				
				booking = new Booking(reservationid,userid,hotelid,roomid,checkin,checkout,reservationmade,noOfGuests,amount);
			}
		} catch (ClassNotFoundException | SQLException e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			/*
			 * Close prepared statement and database connectivity at the end of
			 * transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		
		
		return booking;
	}

	
	
	
	@Override
	public boolean updateBooking(Booking booking) {
		// TODO Auto-generated method stub
		boolean rowUpdated = false;
		
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_UPDATE_BOOKING));
			

			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ONE, booking.getUser_id());
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_TWO, booking.getHotel_id());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, booking.getRoom_id());
			preparedStatement.setDate(CommonConstants.COLUMN_INDEX_FOUR,booking.getCheck_in_date());
			preparedStatement.setDate(CommonConstants.COLUMN_INDEX_FIVE, booking.getCheck_out_date());
			preparedStatement.setDate(CommonConstants.COLUMN_INDEX_SIX, booking.getReservation_date());
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_SEVEN, booking.getNo_of_Gusts());
			preparedStatement.setFloat(CommonConstants.COLUMN_INDEX_EIGHT, booking.getAmount());
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_NINE, booking.getReservaton_id());
			
			rowUpdated = preparedStatement.executeUpdate() > 0;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rowUpdated;
	}

	@Override
	public boolean deleteBooking(int Reservaton_id) {
	boolean rowDeleted = false;
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_DELETE_BOOKING));
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ONE, Reservaton_id);
			rowDeleted = preparedStatement.executeUpdate() > 0;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return rowDeleted;
	}




	

}
