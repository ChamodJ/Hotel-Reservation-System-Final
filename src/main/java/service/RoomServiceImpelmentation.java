package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;


import model.Room;
import util.CommonConstants;
import util.DBConnectionUtil;
import util.QueryUtil;

public class RoomServiceImpelmentation implements RoomServices {

	/**
	 * Initialize logger
	 */
	public static final Logger log = Logger.getLogger(RoomServices.class.getName());
	
	private  Connection connection;

	
	
	private PreparedStatement preparedStatement;
	
     public RoomServiceImpelmentation() {
		
	}
	


	public RoomServiceImpelmentation(Connection connection) {
		super();
		this.connection = connection;
	}
	
	// Method to add a room to the database
		public boolean addroom(Room room) {
			boolean f = false;
			try {
				String SQL = "insert into room (Room_Id, Hotel_id, Type, Price, bed_count, Total_rooms, Reserved_room) values(?,?,?,?,?,?,?)";
				PreparedStatement ps = connection.prepareStatement(SQL);
				ps.setString(1, room.getRoom_id());
				ps.setInt(2, room.getHotel_id());
				ps.setString(3, room.getType());
				ps.setFloat(4, room.getPrice());
				ps.setInt(5, room.getBed_count());
				ps.setInt(6, room.getTotal_rooms());
				ps.setInt(7, room.getReserved_room());
				int i = ps.executeUpdate();

				if (i == 1) {
					f = true;
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return f;

		}

		// Method to retrieve a list of all rooms
		public List<Room> getAllRoom() {
			List<Room> listroom = new ArrayList<Room>();
			Room r = null;

			try {
				String sql = "select * from room";
				PreparedStatement ps = connection.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
					r = new Room();
					r.setRoom_id(rs.getString(1));
					r.setHotel_id(rs.getInt(2));
					r.setType(rs.getString(3));
					r.setPrice(rs.getFloat(4));
					r.setBed_count(rs.getInt(5));
					r.setTotal_rooms(rs.getInt(6));
					r.setReserved_room(rs.getInt(7));

					listroom.add(r);

				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			return listroom;
		}

		// Method to get a room by its ID
		public Room getRoomById(String Room_Id) {

			Room h = null;
			try {
				String sql = "select * from room where Room_Id=?";
				PreparedStatement ps = connection.prepareStatement(sql);
				ps.setString(1, Room_Id);
				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
					h = new Room();
					h.setRoom_id(rs.getString(1));
					h.setHotel_id(rs.getInt(2));
					h.setType(rs.getString(3));
					h.setPrice(rs.getFloat(4));
					h.setBed_count(rs.getInt(5));
					h.setTotal_rooms(rs.getInt(6));
					h.setReserved_room(rs.getInt(7));

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return h;

		}

		// Method to update room information
		public boolean updateroom(Room room) {
			boolean f = false;
			try {
				String SQL = "update room set  Hotel_id=?, Type=?, Price=?, bed_count=?, Total_rooms=?, Reserved_room=? where Room_Id=?";
				PreparedStatement ps = connection.prepareStatement(SQL);

				ps.setString(7, room.getRoom_id());
				ps.setInt(1, room.getHotel_id());
				ps.setString(2, room.getType());
				ps.setFloat(3, room.getPrice());
				ps.setInt(4, room.getBed_count());
				ps.setInt(5, room.getTotal_rooms());
				ps.setInt(6, room.getReserved_room());
				int i = ps.executeUpdate();

				if (i < 0) {
					f = true;
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return f;

		}

		// Method to delete a room by its ID
		public boolean deleteroom(String Room_Id) {
			boolean f = false;
			try {
				String sql = "delete from room where Room_Id=?";
				PreparedStatement ps = connection.prepareStatement(sql);
				ps.setString(1, Room_Id);

				int i = ps.executeUpdate();

				if (i == 1) {
					f = true;
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return f;
		}

		// Method to count a rooms
		public int getRoomCount() {
			int count = 0;
			try {

				PreparedStatement stmt = connection.prepareStatement("SELECT SUM(Total_rooms) FROM room");
				ResultSet rs = stmt.executeQuery();
				if (rs.next()) {
					count = rs.getInt(1);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return count;
		}

	//Method to get a rooms to specific hotel
		public List<Room> getAllRoom1() {
			List<Room> listroom = new ArrayList<Room>();
			Room r = null;

			try {
				String sql = "select * from room where Hotel_id=1";
				PreparedStatement ps = connection.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
					r = new Room();
					r.setRoom_id(rs.getString(1));
					r.setHotel_id(rs.getInt(2));
					r.setType(rs.getString(3));
					r.setPrice(rs.getFloat(4));
					r.setBed_count(rs.getInt(5));
					r.setTotal_rooms(rs.getInt(6));
					r.setReserved_room(rs.getInt(7));

					listroom.add(r);

				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			return listroom;
		}

		public List<Room> getAllRoom2() {
			List<Room> listroom = new ArrayList<Room>();
			Room r = null;

			try {
				String sql = "select * from room where Hotel_id=2";
				PreparedStatement ps = connection.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
					r = new Room();
					r.setRoom_id(rs.getString(1));
					r.setHotel_id(rs.getInt(2));
					r.setType(rs.getString(3));
					r.setPrice(rs.getFloat(4));
					r.setBed_count(rs.getInt(5));
					r.setTotal_rooms(rs.getInt(6));
					r.setReserved_room(rs.getInt(7));

					listroom.add(r);

				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			return listroom;
		}

		public List<Room> getAllRoom3() {
			List<Room> listroom = new ArrayList<Room>();
			Room r = null;

			try {
				String sql = "select * from room where Hotel_id=3";
				PreparedStatement ps = connection.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
					r = new Room();
					r.setRoom_id(rs.getString(1));
					r.setHotel_id(rs.getInt(2));
					r.setType(rs.getString(3));
					r.setPrice(rs.getFloat(4));
					r.setBed_count(rs.getInt(5));
					r.setTotal_rooms(rs.getInt(6));
					r.setReserved_room(rs.getInt(7));

					listroom.add(r);

				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			return listroom;
		}

		public List<Room> getAllRoom4() {
			List<Room> listroom = new ArrayList<Room>();
			Room r = null;

			try {
				String sql = "select * from room where Hotel_id=4";
				PreparedStatement ps = connection.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
					r = new Room();
					r.setRoom_id(rs.getString(1));
					r.setHotel_id(rs.getInt(2));
					r.setType(rs.getString(3));
					r.setPrice(rs.getFloat(4));
					r.setBed_count(rs.getInt(5));
					r.setTotal_rooms(rs.getInt(6));
					r.setReserved_room(rs.getInt(7));

					listroom.add(r);

				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			return listroom;
		}
	
	
	
	@Override
	public Room selectRoom(String Room_id) {
		Room room= null;
		
		
		
	
			try {
				connection = DBConnectionUtil.getDBConnection();
				
				preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_SELECT_ROOM_BY_ID));
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, Room_id);
				
				ResultSet rs = preparedStatement.executeQuery();
				
				while (rs.next()) {
					
					
					String Roomid = (rs.getString(CommonConstants.COLUMN_INDEX_ONE));;
					int Hotelid = (rs.getInt(CommonConstants.COLUMN_INDEX_TWO));
					String type = (rs.getString(CommonConstants.COLUMN_INDEX_THREE));;
					float price = (rs.getFloat(CommonConstants.COLUMN_INDEX_FOUR));
					int bedcount = (rs.getInt(CommonConstants.COLUMN_INDEX_FIVE));
					int totalroom = (rs.getInt(CommonConstants.COLUMN_INDEX_SIX));
					int reservedroom = (rs.getInt(CommonConstants.COLUMN_INDEX_SEVEN));
					
					

					
					
					room = new Room(Roomid,Hotelid,type,price,bedcount,totalroom,reservedroom);
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				
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
			
		
		
		
		return room;
	
	}



	@Override
	public Room selectRoomByType(String Type) {
		Room room= null;
		
		
		
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_SELECT_ROOM_BY_ROOM_TYPE));
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, Type);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				
				
				String Roomid = (rs.getString(CommonConstants.COLUMN_INDEX_ONE));;
				int Hotelid = (rs.getInt(CommonConstants.COLUMN_INDEX_TWO));
				String type = (rs.getString(CommonConstants.COLUMN_INDEX_THREE));;
				float price = (rs.getFloat(CommonConstants.COLUMN_INDEX_FOUR));
				int bedcount = (rs.getInt(CommonConstants.COLUMN_INDEX_FIVE));
				int totalroom = (rs.getInt(CommonConstants.COLUMN_INDEX_SIX));
				int reservedroom = (rs.getInt(CommonConstants.COLUMN_INDEX_SEVEN));
				
				

				
				
				room = new Room(Roomid,Hotelid,type,price,bedcount,totalroom,reservedroom);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
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
		
	
	
	
	return room;

	}

	
}
