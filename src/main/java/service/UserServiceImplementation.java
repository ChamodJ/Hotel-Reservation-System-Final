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
import model.User;
import util.CommonConstants;
import util.DBConnectionUtil;
import util.QueryUtil;


/**
 * 
 */
public class UserServiceImplementation implements Userservices{

	
	/**
	 * Initialize logger
	 */
	public static final Logger log = Logger.getLogger(Userservices.class.getName());
	
	private static Connection connection;

	
	
	private PreparedStatement preparedStatement;

	
	
	
	
	@Override
	public void insertUser(User user) {
		// TODO Auto-generated method stub
		try {
			connection = DBConnectionUtil.getDBConnection();
			
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_INSERT_USER));
			
			
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, user.getUsername());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, user.getEmail());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, user.getAddress());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, user.getMobile_No());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SIX, user.getPassword());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SEVEN, user.getRole());
			
			// Add user
			preparedStatement.execute();
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
//	public User selectUseremail(String email) {
//		
//		List<User> newuserList = new ArrayList<User>();
//		
//		try {
//			connection = DBConnectionUtil.getDBConnection();
//			/*
//			 * Query is available in EmployeeQuery.xml file and use
//			 * insert_employee key to extract value of it
//			 */
//			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_SELECT_USER_BY_EMAIL));
//		    preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, email);
//			
//			ResultSet rs = preparedStatement.executeQuery();
//			
//			while (rs.next()) {
//			User user = new User();
//			     user.setUser_ID(rs.getInt(CommonConstants.COLUMN_INDEX_ONE));
//			     user.setName(rs.getString(CommonConstants.COLUMN_INDEX_TWO));
//			     user.setEmail(rs.getString(CommonConstants.COLUMN_INDEX_THREE));
//			     user.setAddress(rs.getString(CommonConstants.COLUMN_INDEX_FOUR));
//			     user.setMobile_No(rs.getString(CommonConstants.COLUMN_INDEX_FIVE));
//			     user.setPassword(rs.getString(CommonConstants.COLUMN_INDEX_SIX));
//			     user.setRole(rs.getString(CommonConstants.COLUMN_INDEX_SEVEN));
//			     
//			     newuserList.add(user);
//
//			}
//		} catch (ClassNotFoundException | SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		// TODO Auto-generated method stub
//		return (User) newuserList;
//	}
	
//	public User selectUseremail(String email) {
//		User user = null;
//		
//		
//			try {
//				connection = DBConnectionUtil.getDBConnection();
//				
//				preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_SELECT_USER_BY_EMAIL));
//				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, email);
//     
//				ResultSet rs = preparedStatement.executeQuery();
//				
//				while (rs.next()) {
//					int User_ID =(rs.getInt(CommonConstants.COLUMN_INDEX_ONE));
//					String Name =(rs.getString(CommonConstants.COLUMN_INDEX_TWO));
//					String Email=(rs.getString(CommonConstants.COLUMN_INDEX_THREE));
//					String Address=(rs.getString(CommonConstants.COLUMN_INDEX_FOUR));
//					String Mobile_No=(rs.getString(CommonConstants.COLUMN_INDEX_FIVE));
//					String Password=(rs.getString(CommonConstants.COLUMN_INDEX_SIX));
//					String Role= (rs.getString(CommonConstants.COLUMN_INDEX_SEVEN));
//					
//					user = new User(User_ID,Name,Email,Address,Mobile_No,Password,Role);
//				}
//			} catch (ClassNotFoundException | SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		
//		return user;
//		
//	}
	
	public User selectfullUserbyid(String email ) {
		User user = null;
		
		
			try {
				connection = DBConnectionUtil.getDBConnection();
				
				preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_SELECT_FULL_USER_BY_EMAIL));
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, email);
     
				ResultSet rs = preparedStatement.executeQuery();
				
				while (rs.next()) {
					int userid =(rs.getInt(CommonConstants.COLUMN_INDEX_ONE));
					String Username =(rs.getString(CommonConstants.COLUMN_INDEX_TWO));
					String First_Name=(rs.getString(CommonConstants.COLUMN_INDEX_THREE));
					String Last_Name= (rs.getString(CommonConstants.COLUMN_INDEX_FOUR));
					String Email = (rs.getString(CommonConstants.COLUMN_INDEX_FIVE));
					String Address=(rs.getString(CommonConstants.COLUMN_INDEX_SIX));
					String Mobile_No=(rs.getString(CommonConstants.COLUMN_INDEX_SEVEN));
					Date Date_of_birth=(rs.getDate(CommonConstants.COLUMN_INDEX_EIGHT));
					String Nationality=(rs.getString(CommonConstants.COLUMN_INDEX_NINE));
					String Gender=(rs.getString(CommonConstants.COLUMN_INDEX_TEN));
					String Password=(rs.getString(CommonConstants.COLUMN_INDEX_ELEVEN));
					String Role= (rs.getString(CommonConstants.COLUMN_INDEX_TWELVE));
					
					
					user = new User(userid,Username,First_Name,Last_Name,Email,Address,Mobile_No,Date_of_birth,Nationality,Gender,Password,Role);
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return user;
		
	}
	
//	public User selectUser(int User_ID) {
//		
//		
//		return actionOnUser(User_ID).get(0);
//	}
	
	@Override
	public List<User> selectAllUsers() {
		// TODO Auto-generated method stub
		return actionOnUser(-1);
	}

	private List<User> actionOnUser(int user_ID) {
		// TODO Auto-generated method stub
		
		List<User> userList = new ArrayList<User>();
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			/*
			 * Before fetching employee it checks whether employee ID is
			 * available
			 */
			
			
			if (user_ID != -1) {
				/*
				 * Get employee by ID query will be retrieved from
				 * EmployeeQuery.xml
				 */
				preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_SELECT_FULL_USER_BY_EMAIL));
				preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ONE, user_ID);

			} /*
			 * If employee ID is not provided for get employee option it display
			 * all employees
			 */
			else {
				preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_SELECT_ALL_USERS));
			}
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				User user = new User();
				user.setUser_ID(rs.getInt(CommonConstants.COLUMN_INDEX_ONE));
				user.setUsername(rs.getString(CommonConstants.COLUMN_INDEX_TWO));
				user.setFirst_Name(rs.getString(CommonConstants.COLUMN_INDEX_THREE));
				user.setLast_Name(rs.getString(CommonConstants.COLUMN_INDEX_FOUR));
				user.setEmail(rs.getString(CommonConstants.COLUMN_INDEX_FIVE));
				user.setAddress(rs.getString(CommonConstants.COLUMN_INDEX_SIX));
				user.setMobile_No(rs.getString(CommonConstants.COLUMN_INDEX_SEVEN));
				user.setDate_of_birth(rs.getDate(CommonConstants.COLUMN_INDEX_EIGHT));
				user.setNationality(rs.getString(CommonConstants.COLUMN_INDEX_NINE));
				user.setGender(rs.getString(CommonConstants.COLUMN_INDEX_TEN));
				user.setPassword(rs.getString(CommonConstants.COLUMN_INDEX_ELEVEN));
				user.setRole(rs.getString(CommonConstants.COLUMN_INDEX_TWELVE));
				
				userList.add(user);
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
		return userList;

	}

	

	@Override
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		boolean rowUpdated = false;
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_UPDATE_USER));
			
			//likely error with column		
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, user.getUsername());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, user.getFirst_Name());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, user.getLast_Name());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, user.getEmail());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, user.getAddress());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SIX, user.getMobile_No());
			preparedStatement.setDate(CommonConstants.COLUMN_INDEX_SEVEN, user.getDate_of_birth());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_EIGHT, user.getNationality());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_NINE, user.getGender());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TEN, user.getPassword());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ELEVEN, user.getRole());
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_TWELVE,user.getUser_ID());
			
			rowUpdated = preparedStatement.executeUpdate() > 0;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return rowUpdated;
	}

	@Override
	public boolean deleteUser(int User_ID) {
		// TODO Auto-generated method stub
		boolean rowDeleted = false;
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_DELETE_USER));
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ONE, User_ID);
			rowDeleted = preparedStatement.executeUpdate() > 0;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return rowDeleted;
	}
	
	public boolean authenticateUser(String email, String password)
	{    
		boolean authentic = false;
		System.out.println("entered authenticate");
		
		try {
			
			connection = DBConnectionUtil.getDBConnection();
			System.out.println("got back from connection");
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_AUTHENTICATE_USER));
			System.out.println("checking query connection");
			
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE,email);
			
			ResultSet rs = preparedStatement.executeQuery();
			System.out.println("rs none");
			
			if (rs.next()) {
			    // Retrieve the stored password from the database
			    String storedPassword = rs.getString("password");
                  System.out.println("checkpass");
			    // Compare the stored password with the provided password
			    if (storedPassword.equals(password)) { // In this example, passwords are stored in plaintext
			        authentic = true; // Authentication successful
			    }
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return authentic;
	} 

	
	public boolean updatePassword(int  User_ID, String password)
	{   boolean pwdUpdated = false;
	
		try {
			connection = DBConnectionUtil.getDBConnection();
			System.out.println("got connection");
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_UPDATE_PASSWORD));
			System.out.println("coner");
			
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, password);
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_TWO,User_ID);

			pwdUpdated = preparedStatement.executeUpdate() > 0;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return pwdUpdated;
	}

	}
	
	



