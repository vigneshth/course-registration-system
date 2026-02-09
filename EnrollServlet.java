package com.course.servlet;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.course.dao.CourseDAO;
import com.course.model.User;

@WebServlet("/EnrollServlet")
public class EnrollServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CourseDAO courseDAO;

    @Override
    public void init() {
        courseDAO = new CourseDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getId();
        int courseId = Integer.parseInt(request.getParameter("courseId"));

        boolean enrolled = courseDAO.enrollStudentInCourse(userId, courseId);

        if (enrolled) {
            request.setAttribute("message", "✅ Enrollment successful!");
        } else {
            request.setAttribute("message", "⚠️ You are already enrolled or an error occurred.");
        }

        RequestDispatcher rd = request.getRequestDispatcher("courses.jsp");
        rd.forward(request, response);
    }
}
