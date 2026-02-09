package com.course.servlet;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.course.dao.CourseDAO;
import com.course.model.User;

@WebServlet("/EnrollCourseServlet")
public class EnrollCourseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CourseDAO courseDAO;

    @Override
    public void init() throws ServletException {
        courseDAO = new CourseDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        int courseId = Integer.parseInt(request.getParameter("courseId"));

        boolean enrolled = courseDAO.enrollStudentInCourse(user.getId(), courseId);

        if (enrolled) {
            session.setAttribute("message", "Successfully enrolled in the course!");
        } else {
            session.setAttribute("message", "You are already enrolled or an error occurred.");
        }

        response.sendRedirect("ViewCoursesServlet");
    }
}
