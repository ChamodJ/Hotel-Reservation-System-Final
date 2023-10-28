package model;

public class Room {
	
	
		private String Room_id;
		
	    private int Hotel_id;
	    
		private String Type;
		
		private float Price;
		
	    private int	 bed_count;
	    
	    private int	  Total_rooms;
	    
	    private int  Reserved_room;

		/**
		 * 
		 */
		public Room() {
			super();
		}

		/**
		 * @param room_id
		 * @param hotel_id
		 * @param type
		 * @param price
		 * @param bed_count
		 * @param total_rooms
		 * @param reserved_room
		 */
		public Room(String room_id, int hotel_id, String type, float price, int bed_count, int total_rooms,
				int reserved_room) {
			super();
			Room_id = room_id;
			Hotel_id = hotel_id;
			Type = type;
			Price = price;
			this.bed_count = bed_count;
			Total_rooms = total_rooms;
			Reserved_room = reserved_room;
		}

		/**
		 * @return the room_id
		 */
		public String getRoom_id() {
			return Room_id;
		}

		/**
		 * @param room_id the room_id to set
		 */
		public void setRoom_id(String room_id) {
			Room_id = room_id;
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
		 * @return the type
		 */
		public String getType() {
			return Type;
		}

		/**
		 * @param type the type to set
		 */
		public void setType(String type) {
			Type = type;
		}

		/**
		 * @return the price
		 */
		public float getPrice() {
			return Price;
		}

		/**
		 * @param price the price to set
		 */
		public void setPrice(float price) {
			Price = price;
		}

		/**
		 * @return the bed_count
		 */
		public int getBed_count() {
			return bed_count;
		}

		/**
		 * @param bed_count the bed_count to set
		 */
		public void setBed_count(int bed_count) {
			this.bed_count = bed_count;
		}

		/**
		 * @return the total_rooms
		 */
		public int getTotal_rooms() {
			return Total_rooms;
		}

		/**
		 * @param total_rooms the total_rooms to set
		 */
		public void setTotal_rooms(int total_rooms) {
			Total_rooms = total_rooms;
		}

		/**
		 * @return the reserved_room
		 */
		public int getReserved_room() {
			return Reserved_room;
		}

		/**
		 * @param reserved_room the reserved_room to set
		 */
		public void setReserved_room(int reserved_room) {
			Reserved_room = reserved_room;
		}

		@Override
		public String toString() {
			return "Room [Room_id=" + Room_id + ", Hotel_id=" + Hotel_id + ", Type=" + Type + ", Price=" + Price
					+ ", bed_count=" + bed_count + ", Total_rooms=" + Total_rooms + ", Reserved_room=" + Reserved_room
					+ "]";
		}
	    
	    
	    
	

}
