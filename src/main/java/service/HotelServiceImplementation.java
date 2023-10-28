package service;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import model.Hotel;
import util.CommonConstants;
import util.DBConnectionUtil;
import util.QueryUtil;

public class HotelServiceImplementation implements HotelServices {
	
	/**
	 * Initialize logger
	 */
	public static final Logger log = Logger.getLogger(HotelServices.class.getName());
	
	private Connection connection;

	
	
	private PreparedStatement preparedStatement;
	

	
	public HotelServiceImplementation() {
		
	}
	
	public HotelServiceImplementation(Connection connection) {
		super();
		this.connection = connection;
	}
	
	// Method to add a hotel to the database
		public boolean addhotel(Hotel hotel) {
			boolean f = false;
			try {
				String SQL = "insert into hotel (Hotel_id, Location, Contact_info) values(?,?,?)";
				PreparedStatement ps = connection.prepareStatement(SQL);
				ps.setInt(1, hotel.getHotel_id());
				ps.setString(2, hotel.getLocation());
				ps.setString(3, hotel.getContact_info());
				int i = ps.executeUpdate();

				if (i == 1) {
					f = true;
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return f;

		}

		// Method to get a list of all hotels
		public List<Hotel> getAllHotel() throws ClassNotFoundException, SQLException {
			List<Hotel> listhotel = new ArrayList<Hotel>();
			Hotel r = null;
			
			Connection con = DBConnectionUtil.getDBConnection();

			try {
				String sql = "select * from hotel";
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
					r = new Hotel();
					r.setHotel_id(rs.getInt(1));
					r.setLocation(rs.getString(3));
					r.setContact_info(rs.getString(4));

					listhotel.add(r);

				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			return listhotel;
		}

		// Method to get a hotel by its ID
		public Hotel getHotelById(int Hotel_id) {

			Hotel h = null;
			try {
				String sql = "select * from hotel where Hotel_id=?";
				PreparedStatement ps = connection.prepareStatement(sql);
				ps.setInt(1, Hotel_id);
				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
					h = new Hotel();
					h.setHotel_id(rs.getInt(1));
					h.setLocation(rs.getString(3));
					h.setContact_info(rs.getString(4));

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return h;

		}

		// Method to update hotel information
		public boolean updatehotel(Hotel hotel) {
			boolean f = false;
			try {
				String SQL = "update hotel set Location=?, Contact_info=? where Hotel_id=?;";
				PreparedStatement ps = connection.prepareStatement(SQL);

				ps.setString(1, hotel.getLocation());
				ps.setString(2, hotel.getContact_info());
				ps.setInt(3, hotel.getHotel_id());

				System.out.println(ps);
				System.out.println(hotel.getHotel_id());
				System.out.println(hotel.getLocation());
				System.out.println(hotel.getContact_info());
				int i = ps.executeUpdate();
				System.out.println(i);

				if (i < 0) {

					f = true;
					System.out.println(f);
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return f;

		}

		// Method to delete a hotel by its ID
		public boolean deletehotel(int Hotel_id) {
			boolean f = false;
			try {
				String sql = "delete from hotel where Hotel_id=?";
				PreparedStatement ps = connection.prepareStatement(sql);
				ps.setInt(1, Hotel_id);

				int i = ps.executeUpdate();

				if (i == 1) {
					f = true;
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return f;
		}
		
		
		//get hotel count
		public int getHotelCount() {
			int count = 0;
			try {

				PreparedStatement stmt = connection.prepareStatement("SELECT COUNT(*) FROM hotel");
				ResultSet rs = stmt.executeQuery();
				if (rs.next()) {
					count = rs.getInt(1);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return count;
		}



	@Override
	public Hotel selectHotel(int Hotel_id) {
          Hotel hotel = null;
		
		
		
			try {
				connection = DBConnectionUtil.getDBConnection();
				
				preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_SELECT_HOTEL_BY_ID));
				preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ONE, Hotel_id);
				
				ResultSet rs = preparedStatement.executeQuery();
				
				while (rs.next()) {
					
					int Hotelid = (rs.getInt(CommonConstants.COLUMN_INDEX_ONE));
					String Hotelname = (rs.getString(CommonConstants.COLUMN_INDEX_TWO));;
					String Location = (rs.getString(CommonConstants.COLUMN_INDEX_THREE));
					String Contactinfo = (rs.getString(CommonConstants.COLUMN_INDEX_FOUR));
					
					
					hotel = new Hotel(Hotelid,Hotelname,Location,Contactinfo);
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
			
		
		
		
		return hotel;
	}


	@Override
	public Hotel selectHotelByName(String Hotel_name) {
		Hotel hotel = null;
		
		
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_SELECT_HOTEL_BY_NAME));
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE,Hotel_name);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				
				int Hotelid = (rs.getInt(CommonConstants.COLUMN_INDEX_ONE));
				String Hotelname = (rs.getString(CommonConstants.COLUMN_INDEX_TWO));;
				String Location = (rs.getString(CommonConstants.COLUMN_INDEX_THREE));
				String Contactinfo = (rs.getString(CommonConstants.COLUMN_INDEX_FOUR));
				
				
				hotel = new Hotel(Hotelid,Hotelname,Location,Contactinfo);
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
		
	
	
	
	return hotel;
	}
	
	

}
