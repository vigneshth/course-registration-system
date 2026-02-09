package com.course.servlet;

import com.course.dao.CourseDAO;
import com.course.model.Course;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ViewCoursesServlet")
public class ViewCoursesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check login session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("index.html");
            return;
        }

        // Fetch course list
        CourseDAO dao = new CourseDAO();
        List<Course> list = dao.getAllCourses();

        // Send to JSP
        request.setAttribute("courses", list);
        RequestDispatcher rd = request.getRequestDispatcher("view-courses.jsp");
        rd.forward(request, response);
    }
}
