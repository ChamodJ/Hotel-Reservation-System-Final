package service;

import java.util.logging.Logger;


import model.Room;

public interface RoomServices {
	
	/**
	 * Initialize logger
	 */
	public static final Logger log = Logger.getLogger(RoomServices.class.getName());
	
	public Room selectRoom(String Room_id);
	
	public Room selectRoomByType(String Type);

}
