package com.course.servlet;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.course.dao.UserDAO;
import com.course.model.User;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String role = request.getParameter("role");

        // ✅ Basic field validation
        if (isEmpty(name) || isEmpty(email) || isEmpty(password) || isEmpty(confirmPassword)) {
            request.setAttribute("errorMessage", "All fields are required!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // ✅ Password match validation
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // ✅ Create User object
        User user = new User();
        user.setName(name.trim());
        user.setEmail(email.trim());
        user.setPassword(password.trim());
        user.setRole((role != null && !role.isEmpty()) ? role : "student");

        // ✅ Register user via DAO
        boolean isRegistered = userDAO.registerUser(user);

        if (isRegistered) {
            // Redirect to login page on success
            response.sendRedirect("login.jsp?success=1");
        } else {
            // Show error on registration failure
            request.setAttribute("errorMessage", "Email already exists or registration failed!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    // ✅ Helper method for cleaner validation
    private boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }
}
