package com.course.servlet;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.course.dao.CourseDAO;
import com.course.model.Course;

@WebServlet("/AddCourseServlet")
public class AddCourseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CourseDAO courseDAO;

    @Override
    public void init() throws ServletException {
        courseDAO = new CourseDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        String courseName = request.getParameter("courseName");
        String instructor = request.getParameter("instructor");
        String duration = request.getParameter("duration");

        // ✅ Validate inputs
        if (courseName == null || courseName.isEmpty() ||
            instructor == null || instructor.isEmpty() ||
            duration == null || duration.isEmpty()) {

            request.getSession().setAttribute("message", "❌ Error: All fields are required.");
            response.sendRedirect("add-course.jsp");
            return;
        }

        // ✅ Create a new course object
        Course newCourse = new Course(courseName, instructor, duration);

        // ✅ Add course to database using DAO
        boolean success = courseDAO.addCourse(newCourse);

        // ✅ Redirect based on result
        if (success) {
            request.getSession().setAttribute("message", "✅ Course added successfully!");
            response.sendRedirect("ViewCoursesServlet");
        } else {
            request.getSession().setAttribute("message", "❌ Error: Failed to add course to database.");
            response.sendRedirect("add-course.jsp");
        }
    }
}
