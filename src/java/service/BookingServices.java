package service;

import java.util.List;
import java.util.logging.Logger;

import model.Booking;



public interface BookingServices {

	/**
	 * Initialize logger
	 */
	public static final Logger log = Logger.getLogger(BookingServices.class.getName());
	
	
	/**
	 * @param booking
	 */
	public void insertBooking(Booking booking);
	
	
	/**
	 * @return
	 */
	public List < Booking > selectAllBooking();
	
	public List < Booking > selectAllCurrentUserBooking(int userid);
	
	public List<Booking> selectAllPastUserBooking(int userid);
	
	
	/**
	 * @param Reservaton_id
	 * @return
	 */
	public Booking selectBooking(int Reservaton_id);
	
	/**
	 * @param booking
	 * @return
	 */
	public boolean updateBooking(Booking booking);
	
	/**
	 * @param Reservaton_id
	 * @return
	 */
	public boolean deleteBooking(int  Reservaton_id);
	
	
	
	
}
