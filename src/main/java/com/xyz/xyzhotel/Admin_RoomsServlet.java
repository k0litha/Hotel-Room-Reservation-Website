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
import java.io.PrintStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "Admin_RoomsServlet", value = "/rooms")
public class Admin_RoomsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("username") == null) {
            response.sendRedirect("admin");
            return;
        } else {
            AppDao dao = new AppDao();
            if (request.getParameter("addroom") != null) {
                request.getRequestDispatcher("admin/addroom.jsp").forward(request, response);
                return;

            }
            if (request.getParameter("editroom") != null) {
                request.getRequestDispatcher("admin/editroom.jsp").forward(request, response);
                return;

            }
            if (request.getParameter("deleteroom") != null) {

                try {
                    int i = dao.deleteRooms(
                            request.getParameter("room_id"),
                            request.getParameter("hotel_location")

                    );

                    if (i > 0) {
                        response.sendRedirect("rooms");
                        return;
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }

            } else {

                List<Rooms> rooms = dao.adminlistRooms();
                request.setAttribute("rooms", rooms);
                request.getRequestDispatcher("admin/roomslist.jsp").forward(request, response);
            }

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AppDao dao = new AppDao();
        if (request.getParameter("editroomPost") != null) {
            try {
                int i = dao.updateRooms(
                        request.getParameter("room_name"),
                        request.getParameter("hotel_location"),
                        request.getParameter("room_id"),
                        request.getParameter("max_occupants"),
                        request.getParameter("room_img"),
                        request.getParameter("room_info"),
                        request.getParameter("room_moreinfo"),
                        Double.parseDouble(request.getParameter("bf_price")),
                        Double.parseDouble(request.getParameter("hb_price")),
                        Double.parseDouble(request.getParameter("fb_price")),
                        request.getParameter("Temproom_id"),
                        request.getParameter("Temphotel_id")

                );

                if (i > 0) {
                    response.sendRedirect("rooms");
                    return;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        if (request.getParameter("addroomPost") != null) {
            try {
                int i = dao.insertRooms(
                        request.getParameter("room_name"),
                        request.getParameter("hotel_location"),
                        request.getParameter("room_id"),
                        request.getParameter("max_occupants"),
                        request.getParameter("room_img"),
                        request.getParameter("room_info"),
                        request.getParameter("room_moreinfo"),
                        Double.parseDouble(request.getParameter("bf_price")),
                        Double.parseDouble(request.getParameter("hb_price")),
                        Double.parseDouble(request.getParameter("fb_price"))


                );

                if (i > 0) {
                    response.sendRedirect("rooms");
                    return;
                } else {
                    PrintWriter writer = response.getWriter();
                    writer.write("<html><meta http-equiv='refresh' content='3;URL=rooms?addroom=1'>");
                    writer.write("<p style='color:red; font-size: 150%;'>Room ID already exist in selected Hotel location!</p></html>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }


    }
}
