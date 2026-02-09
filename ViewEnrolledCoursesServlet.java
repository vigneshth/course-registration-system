package com.course.servlet;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.course.dao.CourseDAO;
import com.course.model.Course;
import com.course.model.User;

@WebServlet("/ViewEnrolledCoursesServlet")
public class ViewEnrolledCoursesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CourseDAO courseDAO;

    @Override
    public void init() {
        courseDAO = new CourseDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        List<Course> enrolledCourses = courseDAO.getEnrolledCoursesByUser(user.getId());

        request.setAttribute("enrolledCourses", enrolledCourses);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view-enrolled.jsp");
        dispatcher.forward(request, response);
    }
}
