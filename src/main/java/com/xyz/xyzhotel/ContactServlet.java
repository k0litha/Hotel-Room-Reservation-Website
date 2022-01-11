package com.xyz.xyzhotel;

import com.xyz.xyzhotel.functions.AppDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "ContactServlet", value = "/contact")
public class ContactServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/contact.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AppDao dao = new AppDao();
        try {
            int i = dao.insertComments(
                    request.getParameter("fullname"),
                    request.getParameter("email"),
                    request.getParameter("phone"),
                    request.getParameter("country"),
                    request.getParameter("comments")

            );

            if (i > 0) {
                PrintWriter writer = response.getWriter();
                writer.write("<html><meta http-equiv='refresh' content='3;URL=home'>");
                writer.write("<p style='color:green; font-size: 200%;'> THANK YOU FOR YOUR FEEDBACK !</p></html>");
                return;
            } else {
                PrintWriter writer = response.getWriter();
                writer.write("<html><meta http-equiv='refresh' content='3;URL=home'>");
                writer.write("<p style='color:red; font-size: 200%;'>Something went wrong try again!</p></html>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
