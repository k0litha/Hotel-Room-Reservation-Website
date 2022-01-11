package com.xyz.xyzhotel.functions;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;
import com.mysql.cj.protocol.Resultset;
import com.xyz.xyzhotel.beans.Booking;
import com.xyz.xyzhotel.beans.Feedbacks;
import com.xyz.xyzhotel.beans.Rooms;


public class AppDao {

    public List<Rooms> listRooms(int adults, int children, String datein, String dateout, String hotel){
        synchronized(AppDao.class) {
            Rooms room = null;
            int max_occupants;
            int days;

            // selecting double room even the selected occupants are 1.
            if ((adults + children) == 1)
                max_occupants = 2;
            else
                max_occupants = adults + children;


            // Creating an object of List interface
            // implemented by the ArrayList class
            List<Rooms> rooms = new ArrayList<>();

            try {

                SimpleDateFormat sqlFormat = new SimpleDateFormat("yyyy-MM-dd");
                SimpleDateFormat userFormat = new SimpleDateFormat("dd/MM/yyyy");

                //calculate date difference
                datein = sqlFormat.format(userFormat.parse(datein));
                dateout = sqlFormat.format(userFormat.parse(dateout));

                //minimum price is for a night. even check out is in the same day, the price should be same.
                if (getdays(datein, dateout) == 0)
                    days = 1;
                else
                    days = getdays(datein, dateout);

                DBcon dBcon = new DBcon();
                Connection con = dBcon.getConnectionDB();
                String sql = "SELECT room_name,room_info,room_moreinfo,room_img,room_id,hotel_location,max_occupants,bf_price*" + days + " AS bf_price,fb_price*" + days + " AS fb_price,hb_price*" + days + " AS hb_price " +
                        "FROM rooms WHERE hotel_location='" + hotel + "' and max_occupants='" + max_occupants + "' and room_id not in " +
                        "(SELECT room_id FROM bookings b where b.status='Payed' and ('" + datein + "' BETWEEN b.check_in and b.check_out) or ('" + dateout + "' BETWEEN b.check_in and b.check_out))";
                Statement statement = con.createStatement();
                Resultset set = (Resultset) statement.executeQuery(sql);

                while (((ResultSet) set).next()) {
                    room = new Rooms();
                    room.setRoomName(((ResultSet) set).getString("room_name"));
                    room.setRoomId(((ResultSet) set).getString("room_id"));
                    room.setMaxOccupants(((ResultSet) set).getString("max_occupants"));
                    room.setbfPrice(((ResultSet) set).getString("bf_price"));
                    room.setfbPrice(((ResultSet) set).getString("fb_price"));
                    room.sethbPrice(((ResultSet) set).getString("hb_price"));
                    room.setRoomImg(((ResultSet) set).getString("room_img"));
                    room.setRoommoreInfo(((ResultSet) set).getString("room_moreinfo"));
                    room.setRoomInfo(((ResultSet) set).getString("room_info"));
                    rooms.add(room);

                }
                con.close();

            } catch (SQLException | ParseException e) {
                e.printStackTrace();
            }
            return rooms;
        }

    }

    public List<Rooms> adminlistRooms(){
        synchronized(AppDao.class) {
            Rooms room = null;

            List<Rooms> rooms = new ArrayList<>();

            try {

                DBcon dBcon = new DBcon();
                Connection con = dBcon.getConnectionDB();
                String sql = "SELECT * FROM rooms ORDER BY hotel_location";
                Statement statement = con.createStatement();
                Resultset set = (Resultset) statement.executeQuery(sql);

                while (((ResultSet) set).next()) {
                    room = new Rooms();
                    room.setHotelId(((ResultSet) set).getString("hotel_location"));
                    room.setRoomName(((ResultSet) set).getString("room_name"));
                    room.setRoomId(((ResultSet) set).getString("room_id"));
                    room.setMaxOccupants(((ResultSet) set).getString("max_occupants"));
                    room.setbfPrice(((ResultSet) set).getString("bf_price"));
                    room.setfbPrice(((ResultSet) set).getString("fb_price"));
                    room.sethbPrice(((ResultSet) set).getString("hb_price"));
                    room.setRoomImg(((ResultSet) set).getString("room_img"));
                    room.setRoommoreInfo(((ResultSet) set).getString("room_moreinfo"));
                    room.setRoomInfo(((ResultSet) set).getString("room_info"));
                    rooms.add(room);

                }
                con.close();

            } catch (SQLException e) {
                e.printStackTrace();
            }
            return rooms;
        }

    }


    public int getdays(String checkin,String checkout) {
        synchronized(AppDao.class) {

            LocalDate start = LocalDate.parse(checkin);
            LocalDate end = LocalDate.parse(checkout);

            Period p = Period.between(start, end);


            return p.getDays();
        }
    }


    public int insertBooking(
         String  hotel_location,
         String  fname,
         String  lname,
         String  email,
         String  phone,
         String address,
         String  country,
         String  zip,
         String  room_id,
         double  price,
         String  price_option,
         String  check_in,
         String  check_out,
         String  occupants,
         String  booking_id
    ) throws SQLException {
        synchronized(AppDao.class) {
            int i = 0;

            try {
                DBcon dBcon = new DBcon();
                Connection con = dBcon.getConnectionDB();
                String sql = "INSERT INTO bookings(fname,lname,email,phone,address,country,zip,hotel_location,room_id,price,price_option,check_in,check_out,occupants,booking_id,status) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'Payed')";
                PreparedStatement statement = con.prepareStatement(sql);
                statement.setString(1, fname);
                statement.setString(2, lname);
                statement.setString(3, email);
                statement.setString(4, phone);
                statement.setString(5, address);
                statement.setString(6, country);
                statement.setString(7, zip);
                statement.setString(8, hotel_location);
                statement.setString(9, room_id);
                statement.setDouble(10, price);
                statement.setString(11, price_option);
                statement.setString(12, check_in);
                statement.setString(13, check_out);
                statement.setString(14, occupants);
                statement.setString(15, booking_id);


                i = statement.executeUpdate();

                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return i;
        }
    }


    public int updateRooms(String room_name,
                           String hotel_location,
                           String room_id,
                           String max_occupants,
                           String room_img,
                           String room_info,
                           String room_moreinfo,
                           double bf_price,
                           double hb_price,
                           double fb_price,
                           String Temproom_id,
                           String Temhotel_id


    ) throws SQLException {
        synchronized(AppDao.class) {
            int i = 0;

            try {

                DBcon dBcon = new DBcon();
                Connection con = dBcon.getConnectionDB();
                String sql = "UPDATE rooms SET room_name=?,max_occupants=?,room_img=?,room_info=?,room_moreinfo=?,bf_price=?,hb_price=?,fb_price=? WHERE room_id=? and hotel_location=?";
                PreparedStatement statement = con.prepareStatement(sql);
                statement.setString(1, room_name);
                statement.setString(2, max_occupants);
                statement.setString(3, room_img);
                statement.setString(4, room_info);
                statement.setString(5, room_moreinfo);
                statement.setDouble(6, bf_price);
                statement.setDouble(7, hb_price);
                statement.setDouble(8, fb_price);
                statement.setString(9, Temproom_id);
                statement.setString(10, Temhotel_id);

                i = statement.executeUpdate();

                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return i;
        }
    }

    public int deleteRooms(String Temproom_id,String Temhotel_id) throws SQLException {
        synchronized(AppDao.class) {
            int i = 0;

            try {
                DBcon dBcon = new DBcon();
                Connection con = dBcon.getConnectionDB();
                String sql = "DELETE FROM rooms  WHERE room_id=? and hotel_location=?";
                PreparedStatement statement = con.prepareStatement(sql);
                statement.setString(1, Temproom_id);
                statement.setString(2, Temhotel_id);

                i = statement.executeUpdate();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return i;
        }
    }

    public int insertRooms(String room_name,
                           String hotel_location,
                           String room_id,
                           String max_occupants,
                           String room_img,
                           String room_info,
                           String room_moreinfo,
                           double bf_price,
                           double hb_price,
                           double fb_price
    ) throws SQLException {
        synchronized(AppDao.class){
        int i = 0;
        try {
            DBcon dBcon = new DBcon();
            Connection con = dBcon.getConnectionDB();

            String sql = "SELECT * FROM rooms where hotel_location='" + hotel_location + "' AND room_id='" + room_id + "'";
            Statement statement = con.createStatement();
            Resultset set = (Resultset) statement.executeQuery(sql);
            ((ResultSet) set).next();
            if (((ResultSet) set).next() == false) {

                String sql2 = "INSERT INTO rooms(room_name,hotel_location,room_id,max_occupants,room_img,room_info,room_moreinfo,bf_price,hb_price,fb_price)VALUES(?,?,?,?,?,?,?,?,?,?) ";
                PreparedStatement statement2 = con.prepareStatement(sql2);
                statement2.setString(1, room_name);
                statement2.setString(2, hotel_location);
                statement2.setString(3, room_id);
                statement2.setString(4, max_occupants);
                statement2.setString(5, room_img);
                statement2.setString(6, room_info);
                statement2.setString(7, room_moreinfo);
                statement2.setDouble(8, bf_price);
                statement2.setDouble(9, hb_price);
                statement2.setDouble(10, fb_price);

                i = statement2.executeUpdate();
                con.close();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }
    }



    public int loginAdmin(String username, String password) throws SQLException {
        synchronized(AppDao.class) {
            int i = 0;
            try {
                DBcon dBcon = new DBcon();
                Connection con = dBcon.getConnectionDB();

                String sql = "SELECT * FROM users where username='" + username + "' AND password='" + password + "'";
                Statement statement = con.createStatement();
                Resultset set = (Resultset) statement.executeQuery(sql);
                if (((ResultSet) set).next() == true) {
                    i = 1;
                }
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return i;
        }
    }



    public List<Booking> adminlistBookings(){
        synchronized(AppDao.class) {
            Booking book = null;

            List<Booking> books = new ArrayList<>();

            try {

                DBcon dBcon = new DBcon();
                Connection con = dBcon.getConnectionDB();
                String sql = "SELECT * FROM bookings ORDER BY id DESC";
                Statement statement = con.createStatement();
                Resultset set = (Resultset) statement.executeQuery(sql);

                while (((ResultSet) set).next()) {
                    book = new Booking();
                    book.setHotellocation(((ResultSet) set).getString("hotel_location"));
                    book.setRoomid(((ResultSet) set).getString("room_id"));
                    book.setCheckin(((ResultSet) set).getString("check_in"));
                    book.setCheckout(((ResultSet) set).getString("check_out"));
                    book.setFname(((ResultSet) set).getString("fname"));
                    book.setLname(((ResultSet) set).getString("lname"));
                    book.setEmail(((ResultSet) set).getString("email"));
                    book.setPhone(((ResultSet) set).getString("phone"));
                    book.setAddress(((ResultSet) set).getString("address"));
                    book.setCountry(((ResultSet) set).getString("country"));
                    book.setZip(((ResultSet) set).getString("zip"));
                    book.setPriceOption(((ResultSet) set).getString("price_option"));
                    book.setPrice(((ResultSet) set).getDouble("price"));
                    book.setOccupants(((ResultSet) set).getString("occupants"));
                    book.setBookingId(((ResultSet) set).getString("booking_id"));
                    book.setStatus(((ResultSet) set).getString("status"));
                    books.add(book);

                }
                con.close();

            } catch (SQLException e) {
                e.printStackTrace();
            }
            return books;
        }
    }

    public int cancelBooking(String booking_id,
                             String email

    ) throws SQLException {
        synchronized(AppDao.class) {
            int i = 0;

            try {

                DBcon dBcon = new DBcon();
                Connection con = dBcon.getConnectionDB();
                String sql = "UPDATE bookings SET status='Canceled' WHERE booking_id=? and email=? and status='Payed' and (check_in >= CURDATE())";
                PreparedStatement statement = con.prepareStatement(sql);
                statement.setString(1, booking_id);
                statement.setString(2, email);
                i = statement.executeUpdate();

                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return i;
        }
    }




    public int insertComments(String fullname, String email, String phone, String country, String comments) throws SQLException {
        synchronized(AppDao.class) {
            int i = 0;
            try {
                DBcon dBcon = new DBcon();
                Connection con = dBcon.getConnectionDB();


                String sql = "INSERT INTO feedbacks(fullname,email,phone,country,comments)VALUES(?,?,?,?,?) ";
                PreparedStatement statement = con.prepareStatement(sql);
                statement.setString(1, fullname);
                statement.setString(2, email);
                statement.setString(3, phone);
                statement.setString(4, country);
                statement.setString(5, comments);
                i = statement.executeUpdate();
                con.close();


            } catch (SQLException e) {
                e.printStackTrace();
            }
            return i;
        }
    }



    public List<Feedbacks> adminlistFeedback(){
        synchronized(AppDao.class) {
            Feedbacks feedback = null;

            List<Feedbacks> feedbacks = new ArrayList<>();

            try {

                DBcon dBcon = new DBcon();
                Connection con = dBcon.getConnectionDB();
                String sql = "SELECT * FROM feedbacks ORDER BY id DESC ";
                Statement statement = con.createStatement();
                Resultset set = (Resultset) statement.executeQuery(sql);

                while (((ResultSet) set).next()) {
                    feedback = new Feedbacks();
                    feedback.setFullname(((ResultSet) set).getString("fullname"));
                    feedback.setEmail(((ResultSet) set).getString("email"));
                    feedback.setPhone(((ResultSet) set).getString("phone"));
                    feedback.setCountry(((ResultSet) set).getString("country"));
                    feedback.setComments(((ResultSet) set).getString("comments"));

                    feedbacks.add(feedback);

                }
                con.close();

            } catch (SQLException e) {
                e.printStackTrace();
            }
            return feedbacks;
        }
    }





}
