/**
 * 
 */
package service;

 import java.util.List;

import java.util.logging.Logger;
import model.User;

/**
 * 
 */
public interface Userservices {

	
	/**
	 * Initialize logger
	 */
	public static final Logger log = Logger.getLogger(Userservices.class.getName());
	

	/**
	 * Add users for user table
	 * @param user
	 */
	public void insertUser(User user);
	
	/**
	 * Get a particular user
	 * 
	 * @param User_ID
	 * @return User
	 */
	//public User selectUserbyid(int User_ID);
	
	/**
	 *  Get all list of users
	 * 
	 * @return List<User>
	 */
	public List < User > selectAllUsers(); //admin purposes
	
	/**
	 * Update existing user 
	 * 
	 * @param user
	 * @return boolean (of success of row updated)
	 */
	public boolean updateUser(User user);
	
	
	/**
	 * Delete existing user.
	 * 
	 * @param User_ID
	 * @return boolean(of success of row deleted)
	 */
	public boolean deleteUser(int  User_ID);
	
	
	public boolean authenticateUser(String email, String password);
	
	public boolean updatePassword(int  User_ID, String password);
	
	public User selectfullUserbyid(String email );
	
	//public User selectUseremail(String email);
	
}
