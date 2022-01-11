package com.xyz.xyzhotel;

import com.xyz.xyzhotel.functions.AppDao;
import com.xyz.xyzhotel.beans.Booking;
import com.xyz.xyzhotel.functions.EmailSender;
import com.xyz.xyzhotel.functions.SmsSender;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet(name = "SuccessPaymentServlet", value = "/success")
public class SuccessPaymentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String hotel_location = request.getParameter("hotel_location");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String country = request.getParameter("country");
        String zip = request.getParameter("zip");
        String room_id = request.getParameter("room_id");
        double price = Double.parseDouble(request.getParameter("price"));
        String price_option = request.getParameter("price_option");
        String occupants = request.getParameter("occupants");

        SimpleDateFormat date_id = new SimpleDateFormat("yyddMMHmmss");
        Date date = new Date();
        String booking_id = date_id.format(date);

        SimpleDateFormat sqlFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat userFormat = new SimpleDateFormat("dd/MM/yyyy");
        String check_in = null;
        String check_out= null;
        try {
            check_in = sqlFormat.format(userFormat.parse(request.getParameter("check_in")));
            check_out = sqlFormat.format(userFormat.parse(request.getParameter("check_out")));
        } catch (ParseException e) {

            e.printStackTrace();
        }




        AppDao dao=new AppDao();
        HttpSession session=request.getSession();
        EmailSender sendmail= new EmailSender() ;

        String subject= "sending success";
        String message= "sending success";


        try {

            sendmail.send(email,subject, message);
           int rows= dao.insertBooking(
                   hotel_location,
                   fname,
                   lname,
                   email,
                   phone,
                   address,
                   country,
                   zip,
                   room_id,
                   price,
                   price_option,
                   check_in,
                   check_out,
                   occupants,
                   booking_id
           );

           if (rows>0){

                   session.invalidate();

                   return;

           }

        } catch (SQLException e) {
            e.printStackTrace();
        }


    }
}
