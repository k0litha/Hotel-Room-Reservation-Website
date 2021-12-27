package com.xyz.xyzhotel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddtoCartServlet", value = "/addtoCart")
public class AddtoCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession();
        if(request.getParameter("price_and_option")!=null || request.getParameter("room_name")!=null || request.getParameter("room_id")!=null ){
            String[] price_and_option = request.getParameter("price_and_option").split("," );

            session.setAttribute("option",price_and_option[0] );
            session.setAttribute("price",price_and_option[1] );
            session.setAttribute("room_id",request.getParameter("room_id") );
            session.setAttribute("room_name",request.getParameter("room_name") );
            session.setAttribute("check_in",session.getAttribute("datein") );
            session.setAttribute("check_out",session.getAttribute("dateout") );



            session.setAttribute("occupants",Integer.parseInt(session.getAttribute("children").toString()) + Integer.parseInt(session.getAttribute("adults").toString()) );


                response.getWriter().print("Hi, "+ session.getAttribute("option")+" price is "+session.getAttribute("price"));
        }
    }
}
