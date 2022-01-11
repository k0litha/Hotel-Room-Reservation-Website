package com.xyz.xyzhotel;


import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;
import java.util.List;
import java.io.IOException;;

@WebServlet(name = "ReservationServlet", value = "/reservation")
public class ReservationServlet extends HttpServlet {


    public void init() {



    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        HttpSession session=request.getSession();
        if( session.getAttribute("hotel")==null){
            response.sendRedirect("home");
            return;

        }else{
            request.getRequestDispatcher("/reservation.jsp").forward(request, response);
            return;
        }

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      //Ajax values setters on reqests post
        HttpSession session=request.getSession();
        if(request.getParameter("new_datein")!=null && request.getParameter("new_dateout")!=null){

            session.setAttribute("datein",request.getParameter("new_datein") );
            session.setAttribute("dateout",request.getParameter("new_dateout") );

         //   response.getWriter().print("Hi, "+ session.getAttribute("datein") +session.getAttribute("dateout")+"");
        }
        if(request.getParameter("new_adults")!=null ){
            session.setAttribute("adults",request.getParameter("new_adults") );
            session.setAttribute("children",request.getParameter("new_children") );

            //   response.getWriter().print("Hi, "+ session.getAttribute("datein") +session.getAttribute("dateout")+"");
        }


    }


    public void destroy() {
    }
}