package com.course.dao;

import java.sql.*;
import java.util.*;
import com.course.model.Enrollment;

public class EnrollmentDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/coursedb";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL Driver not found!", e);
        }
    }

    // Add new enrollment
    public boolean enrollCourse(Enrollment enrollment) {
        String sql = "INSERT INTO enrollment (student_email, course_name) VALUES (?, ?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, enrollment.getStudentEmail());
            ps.setString(2, enrollment.getCourseName());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get all enrollments for a student
    public List<Enrollment> getEnrollmentsByEmail(String email) {
        List<Enrollment> list = new ArrayList<>();
        String sql = "SELECT * FROM enrollment WHERE student_email=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Enrollment e = new Enrollment();
                e.setId(rs.getInt("id"));
                e.setStudentEmail(rs.getString("student_email"));
                e.setCourseName(rs.getString("course_name"));
                e.setEnrollmentDate(rs.getTimestamp("enrollment_date"));
                list.add(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
