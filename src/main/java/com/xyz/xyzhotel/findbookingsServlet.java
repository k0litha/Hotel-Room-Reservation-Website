package com.xyz.xyzhotel;

import com.xyz.xyzhotel.functions.AppDao;
import com.xyz.xyzhotel.functions.EmailSender;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "findbookingsServlet", value = "/findbookings")
public class findbookingsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("findreservation.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AppDao dao = new AppDao();

            try {
                int i = dao.cancelBooking(
                        request.getParameter("booking_id"),
                        request.getParameter("email")
                );

                if (i > 0) {
                    EmailSender sendmail= new EmailSender() ;

                    String subject= "Booking Canceled";
                    String message= "<html><p style='color:green;margin:0 auto; font-size: 150%;'> Booking successfully canceled !</p></html>";
                    sendmail.send(request.getParameter("email"),subject, message);
                    PrintWriter writer = response.getWriter();
                    writer.write("<html><meta http-equiv='refresh' content='4;URL=home'>");
                    writer.write("<p style='color:green;margin:0 auto; font-size: 150%;'> Booking successfully canceled !</p></html>");

                    return;
                }else{

                    PrintWriter writer = response.getWriter();
                    writer.write("<html><meta http-equiv='refresh' content='4;URL=findbookings'>");
                    writer.write("<p style='color:red;margin:0 auto; font-size: 150%;'> Please check your Confirmation number/Email address again !</p></html>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }


    }
}
