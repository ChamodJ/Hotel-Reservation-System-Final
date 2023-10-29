package model;

import java.sql.Date;

public class Booking {
	
	private int Reservaton_id;
	
	private int User_id;
	
	private int  Hotel_id;
	
	private String room_id;
	
	private String hotelName; 
	
    private String roomType;
	
	private Date  check_in_date;
	
	private Date  check_out_date;
	
	private Date reservation_date;
	
	private int No_of_Gusts;
	
	private float Amount;

	public Booking() {
		super();
	}

	public Booking(int reservaton_id, int user_id, int hotel_id, String room_id, Date check_in_date, Date check_out_date,
			Date reservation_date, int no_of_Gusts, float amount) {
		super();
		Reservaton_id = reservaton_id;
		User_id = user_id;
		Hotel_id = hotel_id;
		this.room_id = room_id;
		this.check_in_date = check_in_date;
		this.check_out_date = check_out_date;
		this.reservation_date = reservation_date;
		No_of_Gusts = no_of_Gusts;
		Amount = amount;
	}
//if appear error 
	public Booking(int reservaton_id2, int user_id2, int hotel_id2, String room_id2, String check_in_date2,
			String check_out_date2, int no_of_Gusts2, float amount2) {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the reservaton_id
	 */
	public int getReservaton_id() {
		return Reservaton_id;
	}

	/**
	 * @param reservaton_id the reservaton_id to set
	 */
	public void setReservaton_id(int reservaton_id) {
		Reservaton_id = reservaton_id;
	}

	/**
	 * @return the user_id
	 */
	public int getUser_id() {
		return User_id;
	}

	/**
	 * @param user_id the user_id to set
	 */
	public void setUser_id(int user_id) {
		User_id = user_id;
	}

	/**
	 * @return the hotel_id
	 */
	public int getHotel_id() {
		return Hotel_id;
	}

	/**
	 * @param hotel_id the hotel_id to set
	 */
	public void setHotel_id(int hotel_id) {
		Hotel_id = hotel_id;
	}

	/**
	 * @return the room_id
	 */
	public String getRoom_id() {
		return room_id;
	}

	/**
	 * @param room_id the room_id to set
	 */
	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	/**
	 * @return the check_in_date
	 */
	public Date getCheck_in_date() {
		return check_in_date;
	}

	/**
	 * @param check_in_date the check_in_date to set
	 */
	public void setCheck_in_date(Date check_in_date) {
		this.check_in_date = check_in_date;
	}

	/**
	 * @return the check_out_date
	 */
	public Date getCheck_out_date() {
		return check_out_date;
	}

	/**
	 * @param check_out_date the check_out_date to set
	 */
	public void setCheck_out_date(Date check_out_date) {
		this.check_out_date = check_out_date;
	}

	/**
	 * @return the reservation_date
	 */
	public Date getReservation_date() {
		return reservation_date;
	}

	/**
	 * @param reservation_date the reservation_date to set
	 */
	public void setReservation_date(Date reservation_date) {
		this.reservation_date = reservation_date;
	}

	/**
	 * @return the no_of_Gusts
	 */
	public int getNo_of_Gusts() {
		return No_of_Gusts;
	}

	/**
	 * @param no_of_Gusts the no_of_Gusts to set
	 */
	public void setNo_of_Gusts(int no_of_Gusts) {
		No_of_Gusts = no_of_Gusts;
	}

	/**
	 * @return the amount
	 */
	public float getAmount() {
		return Amount;
	}

	/**
	 * @param amount the amount to set
	 */
	public void setAmount(float amount) {
		Amount = amount;
	}

	@Override
	public String toString() {
		return "Booking [Reservaton_id=" + Reservaton_id + ", User_id=" + User_id + ", Hotel_id=" + Hotel_id
				+ ", room_id=" + room_id + ", hotelName=" + hotelName + ", roomType=" + roomType + ", check_in_date="
				+ check_in_date + ", check_out_date=" + check_out_date + ", reservation_date=" + reservation_date
				+ ", No_of_Gusts=" + No_of_Gusts + ", Amount=" + Amount + "]";
	}

	
	
	
	
	
  
}
