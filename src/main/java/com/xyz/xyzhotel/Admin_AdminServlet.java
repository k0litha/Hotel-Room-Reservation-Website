package com.xyz.xyzhotel;

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

@WebServlet(name = "Admin_AdminServlet", value = "/admin")
public class Admin_AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("username") == null) {
            request.getRequestDispatcher("admin/adminlogin.jsp").forward(request, response);
        } else {

            response.sendRedirect("bookings");

        }
    }

    @Override
    protected void doPost( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AppDao dao=new AppDao();
        try {
            int i = dao.loginAdmin(
                    request.getParameter("username"),
                    request.getParameter("password")
            );

            if (i > 0) {
                HttpSession session = request.getSession();
                session.setAttribute("username",request.getParameter("username") );
                session.setMaxInactiveInterval(20*60);
                response.sendRedirect("bookings");
                return;
            }
            else{
                PrintWriter writer = response.getWriter();
                writer.write("<html><meta http-equiv='refresh' content='3;URL=admin'>");
                writer.write("<p style='color:red; font-size: 150%;'> Username/Password Not Found !</p></html>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
