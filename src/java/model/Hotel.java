package model;

public class Hotel {
	
		private int	 Hotel_id;
		private String	 Hotel_name ;
		private String	Location;
		private String	Contact_info;
		
		
		
		public Hotel() {
			super();
		}



		/**
		 * @param hotel_id
		 * @param location
		 * @param contact_info
		 */
		public Hotel(int hotel_id, String location, String contact_info) {
			super();
			Hotel_id = hotel_id;
			Location = location;
			Contact_info = contact_info;
		}



		/**
		 * @param hotel_id
		 * @param hotel_name
		 * @param location
		 * @param contact_info
		 */
		public Hotel(int hotel_id, String hotel_name, String location, String contact_info) {
			super();
			Hotel_id = hotel_id;
			Hotel_name = hotel_name;
			Location = location;
			Contact_info = contact_info;
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
		 * @return the hotel_name
		 */
		public String getHotel_name() {
			return Hotel_name;
		}



		/**
		 * @param hotel_name the hotel_name to set
		 */
		public void setHotel_name(String hotel_name) {
			Hotel_name = hotel_name;
		}



		/**
		 * @return the location
		 */
		public String getLocation() {
			return Location;
		}



		/**
		 * @param location the location to set
		 */
		public void setLocation(String location) {
			Location = location;
		}



		/**
		 * @return the contact_info
		 */
		public String getContact_info() {
			return Contact_info;
		}



		/**
		 * @param contact_info the contact_info to set
		 */
		public void setContact_info(String contact_info) {
			Contact_info = contact_info;
		}



		@Override
		public String toString() {
			return "Hotel [Hotel_id=" + Hotel_id + ", Hotel_name=" + Hotel_name + ", Location=" + Location
					+ ", Contact_info=" + Contact_info + "]";
		}
		
		
		
		
		
		
}
