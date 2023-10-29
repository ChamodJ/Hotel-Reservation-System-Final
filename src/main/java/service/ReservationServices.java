package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Booking;

public class ReservationServices {
private  Connection connection;

	
	
	private PreparedStatement preparedStatement;
	
     public ReservationServices() {
		
	}
	


	public ReservationServices(Connection connection) {
		super();
		this.connection = connection;
	}

	
	
	public Booking getResrvationById(int Reservaton_id) {

		Booking h = null;
		try {
			String sql = "select * from reservaton where Reservaton_id=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, Reservaton_id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				h = new Booking();
				h.setReservaton_id(rs.getInt(1));
				h.setUser_id(rs.getInt(2));
				h.setHotel_id(rs.getInt(3));
				h.setRoom_id(rs.getString(4));
				h.setCheck_in_date(rs.getDate(5));
				h.setCheck_out_date(rs.getDate(6));
				h.setNo_of_Gusts(rs.getInt(8));
				h.setAmount(rs.getFloat(9));
				

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return h;

	}

	// Method to update room information
	public boolean updateReservation(Booking booking) {
		System.out.println(booking.getUser_id());
        boolean f = false;
        try {
            String SQL = "UPDATE reservaton SET User_id=?, Hotel_id=?, room_id=?, check_in_date=?, check_out_date=?, No_of_Gusts=?, Amount=? WHERE Reservaton_id=?";
            PreparedStatement ps = connection.prepareStatement(SQL);

            ps.setInt(1, booking.getUser_id());
            ps.setInt(2, booking.getHotel_id());
            ps.setString(3, booking.getRoom_id());
            ps.setDate(4, booking.getCheck_in_date());
            ps.setDate(5, booking.getCheck_out_date());
            ps.setInt(6, booking.getNo_of_Gusts());
            ps.setFloat(7, booking.getAmount());
            ps.setInt(8, booking.getReservaton_id());

            int i = ps.executeUpdate();

            if (i > 0) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }


	// Method to delete a room by its ID
	public boolean deletereservaton(int Reservaton_id) {
		boolean f = false;
		try {
			String sql = "delete from reservaton where Reservaton_id=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, Reservaton_id);

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
