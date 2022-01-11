package com.xyz.xyzhotel;

import com.xyz.xyzhotel.beans.Feedbacks;
import com.xyz.xyzhotel.beans.Rooms;
import com.xyz.xyzhotel.functions.AppDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Admin_FeedbackServlet", value = "/feedback")
public class Admin_FeedbackServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("username") == null) {
            response.sendRedirect("admin");
            return;
        }else {
            AppDao dao = new AppDao();
            List<Feedbacks> feedbacks = dao.adminlistFeedback();
            request.setAttribute("feedbacks", feedbacks);
            request.getRequestDispatcher("admin/feedbacklist.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
