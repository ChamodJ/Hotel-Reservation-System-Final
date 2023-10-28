package model;

import java.sql.Date;

public class User {
    
    private int User_ID;
	
	private String Username;
	
	private String First_Name;
	
	private String Last_Name;
	  
	private String Email;

	private String Address;
	
	private String Mobile_No;
	
	private Date Date_of_birth;
	
	private String Nationality;
	  
	private String Gender;
	
	private String password;
	
	private String role;

	
	
	public User() {
		super();
	}

	public User(int user_ID, String username, String first_Name, String last_Name, String email, String address,
			String mobile_No, Date date_of_birth, String nationality, String gender, String password,
			String role) {
		super();
		User_ID = user_ID;
		Username = username;
		First_Name = first_Name;
		Last_Name = last_Name;
		Email = email;
		Address = address;
		Mobile_No = mobile_No;
		Date_of_birth = date_of_birth;
		Nationality = nationality;
		Gender = gender;
		this.password = password;
		this.role = role;
	}

	
	public User(int user_ID, String username, String email, String address, String mobile_No, String password, String role) {
		super();
		User_ID = user_ID;
		Username = username;
		Email = email;
		Address = address;
		Mobile_No = mobile_No;
		this.password = password;
		this.role = role;
	}

	/**
	 * @return the user_ID
	 */
	public int getUser_ID() {
		return User_ID;
	}

	/**
	 * @param user_ID the user_ID to set
	 */
	public void setUser_ID(int user_ID) {
		User_ID = user_ID;
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return Username;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		Username = username;
	}

	/**
	 * @return the first_Name
	 */
	public String getFirst_Name() {
		return First_Name;
	}

	/**
	 * @param first_Name the first_Name to set
	 */
	public void setFirst_Name(String first_Name) {
		First_Name = first_Name;
	}

	/**
	 * @return the last_Name
	 */
	public String getLast_Name() {
		return Last_Name;
	}

	/**
	 * @param last_Name the last_Name to set
	 */
	public void setLast_Name(String last_Name) {
		Last_Name = last_Name;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return Email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		Email = email;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return Address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		Address = address;
	}

	/**
	 * @return the mobile_No
	 */
	public String getMobile_No() {
		return Mobile_No;
	}

	/**
	 * @param mobile_No the mobile_No to set
	 */
	public void setMobile_No(String mobile_No) {
		Mobile_No = mobile_No;
	}

	/**
	 * @return the date_of_birth
	 */
	public Date getDate_of_birth() {
		return Date_of_birth;
	}

	/**
	 * @param date_of_birth the date_of_birth to set
	 */
	public void setDate_of_birth(Date date_of_birth) {
		Date_of_birth = date_of_birth;
	}

	/**
	 * @return the nationality
	 */
	public String getNationality() {
		return Nationality;
	}

	/**
	 * @param nationality the nationality to set
	 */
	public void setNationality(String nationality) {
		Nationality = nationality;
	}

	/**
	 * @return the gender
	 */
	public String getGender() {
		return Gender;
	}

	/**
	 * @param gender the gender to set
	 */
	public void setGender(String gender) {
		Gender = gender;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the role
	 */
	public String getRole() {
		return role;
	}

	/**
	 * @param role the role to set
	 */
	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "User [User_ID=" + User_ID + ", Username=" + Username + ", First_Name=" + First_Name + ", Last_Name="
				+ Last_Name + ", Email=" + Email + ", Address=" + Address + ", Mobile_No=" + Mobile_No
				+ ", Date_of_birth=" + Date_of_birth + ", Nationality=" + Nationality + ", Gender=" + Gender
				+ ", password=" + password + ", role=" + role + "]";
	}

	
	
	
	

	
	
	
	
}
