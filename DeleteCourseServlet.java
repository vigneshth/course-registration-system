package com.course.servlet;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.course.dao.CourseDAO;

@WebServlet("/DeleteCourseServlet")
public class DeleteCourseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CourseDAO courseDAO;

    @Override
    public void init() {
        courseDAO = new CourseDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String courseIdStr = request.getParameter("id");

        if (courseIdStr != null) {
            int courseId = Integer.parseInt(courseIdStr);
            boolean deleted = courseDAO.deleteCourse(courseId);

            if (deleted) {
                session.setAttribute("message", "✅ Course deleted successfully!");
            } else {
                session.setAttribute("message", "❌ Error deleting course.");
            }
        } else {
            session.setAttribute("message", "⚠ Invalid course ID.");
        }

        response.sendRedirect("ViewCoursesServlet");
    }
}
