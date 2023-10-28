package service;

import java.util.logging.Logger;


import model.Hotel;

public interface  HotelServices {

	/**
	 * Initialize logger
	 */
	public static final Logger log = Logger.getLogger(HotelServices.class.getName());
	
	public Hotel selectHotel(int Hotel_id);
	
	public Hotel selectHotelByName(String Hotel_name);
}
