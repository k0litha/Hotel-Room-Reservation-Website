package com.xyz.xyzhotel;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;
import com.mysql.cj.protocol.Resultset;


public class AppDao {

    public List<Rooms> listRooms( int adults, int children,String datein,String dateout,String hotel){
        Rooms room =null;
        int max_occupants;
        int days;

        // selecting double room even the selected occupants are 1.
        if((adults+children)==1)
            max_occupants =2;
        else
            max_occupants =adults+children;


        // Creating an object of List interface
        // implemented by the ArrayList class
        List<Rooms> rooms = new ArrayList<>();

        try{

            SimpleDateFormat sqlFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat userFormat = new SimpleDateFormat("dd/MM/yyyy");

            //calculate date difference
            datein = sqlFormat.format(userFormat.parse(datein));
            dateout = sqlFormat.format(userFormat.parse(dateout));

            //minimum price is for a night. even check out is in the same day, the price should be same.
            if(getdays(datein,dateout)==0)
                days=1;
            else
                days=getdays(datein,dateout);

            DBcon dBcon=new DBcon();
            Connection con = dBcon.getConnectionDB();
            String sql = "SELECT room_name,room_id,hotel_location,max_occupants,bf_price*"+days+" AS bf_price,fb_price*"+days+" AS fb_price,hb_price*"+days+" AS hb_price " +
                    "FROM rooms WHERE hotel_location='"+hotel+"' and max_occupants='"+max_occupants+"' and room_id not in " +
                    "(SELECT room_id FROM bookings b where('"+datein+"' BETWEEN b.check_in and b.check_out) or ('"+dateout+"' BETWEEN b.check_in and b.check_out))";
            Statement statement = con.createStatement();
            Resultset set= (Resultset) statement.executeQuery(sql);

            while(((ResultSet) set).next())
            {
                room =new Rooms();
                room.setRoomName(((ResultSet) set).getString("room_name"));
                room.setRoomId(((ResultSet) set).getString("room_id"));
                room.setMaxOccupants(((ResultSet) set).getString("max_occupants"));
                room.setbfPrice(((ResultSet) set).getString("bf_price"));
                room.setfbPrice(((ResultSet) set).getString("fb_price"));
                room.sethbPrice(((ResultSet) set).getString("hb_price"));
                rooms.add(room);

            }
             con.close();

        }
        catch(SQLException | ParseException e){
            e.printStackTrace();
        }
        return rooms;

    }


    public int getdays(String checkin,String checkout)  {

            LocalDate start = LocalDate.parse(checkin);
            LocalDate end = LocalDate.parse(checkout);

        Period p = Period.between(start, end);


        return p.getDays();
    }


    public int insertBooking(Booking book) throws SQLException {
        int i=0;

       try {DBcon dBcon=new DBcon();
           Connection con = dBcon.getConnectionDB();
            String sql = "INSERT INTO bookings(fname,lname,email,phone,address,country,zip,hotel_location,room_id,price,price_option,check_in,check_out,occupants) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1,book.getFname());
            statement.setString(2,book.getLname());
            statement.setString(3,book.getEmail());
            statement.setString(4,book.getPhone());
            statement.setString(5,book.getAddress());
            statement.setString(6,book.getCcountry());
            statement.setString(7,book.getZip());
            statement.setString(8,book.getHotellocation());
            statement.setString(9,book.getRoomid());
            statement.setDouble(10,book.getPrice());
            statement.setString(11,book.getPriceOption());
            statement.setString(12,book.getCheckin());
            statement.setString(13,book.getCheckout());
            statement.setString(14,book.getOccupants());

           i = statement.executeUpdate();



            con.close();

        }
        catch(SQLException  e){
            e.printStackTrace();

        }
return i;
    }




}
