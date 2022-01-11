package com.xyz.xyzhotel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;
import java.util.List;
import java.io.IOException;

@WebServlet(name = "BooknowServlet", value = "/booknow")
public class BooknowServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        HttpSession session=request.getSession();
        session.setAttribute("hotel",request.getParameter("HotelID") );
        session.setAttribute("datein",request.getParameter("DateIn") );
        session.setAttribute("dateout",request.getParameter("DateOut") );
        session.setAttribute("adults",request.getParameter("adults") );
        session.setAttribute("children",request.getParameter("children") );

        response.sendRedirect("reservation");
        return;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
