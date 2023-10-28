/**
 * 
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 
 */
public class DBConnectionUtil  extends CommonUtil{

	private static Connection connection;

	// This works according to singleton pattern
	private DBConnectionUtil() {
	}

	/**
	 * Create Database connection for the given URL, Username and Password
	 * 
	 * @return Connection this returns SQL connection for MySql Database
	 * 
	 * @throws ClassNotFoundException
	 *             - Thrown when an application tries to load in a class through
	 *             its string name
	 * @throws SQLException
	 *             - An exception that provides information on a database access
	 *             error or other errors
	 */
	public static Connection getDBConnection() throws ClassNotFoundException, SQLException {
		System.out.println("came to connection");
		
		/*
		 * This create new connection objects when connection is closed or it is
		 * null
		 */
		if (connection == null || connection.isClosed()) {
			System.out.println("entered to connection nul");
			Class.forName(properties.getProperty(CommonConstants.DRIVER_NAME));
			connection = DriverManager.getConnection(properties.getProperty(CommonConstants.URL),
					properties.getProperty(CommonConstants.USERNAME), properties.getProperty(CommonConstants.PASSWORD));
			//System.out.println("You got connected");
			System.out.println("Yreturn connection");
			return connection;
		}
		
		System.out.println("blaaYreturn connection");
		return connection;
	}
}
