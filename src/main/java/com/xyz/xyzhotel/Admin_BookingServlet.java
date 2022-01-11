package com.xyz.xyzhotel;

import com.xyz.xyzhotel.beans.Booking;
import com.xyz.xyzhotel.beans.Rooms;
import com.xyz.xyzhotel.functions.AppDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "Admin_BookingServlet", value = "/bookings")
public class Admin_BookingServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("username") == null) {
            response.sendRedirect("admin");
            return;
        }else {
            AppDao dao = new AppDao();
            List<Booking> books = dao.adminlistBookings();
            request.setAttribute("books", books);
            request.getRequestDispatcher("admin/bookinglist.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
