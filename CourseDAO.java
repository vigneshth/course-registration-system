package com.course.dao;

import java.sql.*;
import java.util.*;
import com.course.model.Course;

public class CourseDAO {

    private static final String URL = "jdbc:mysql://localhost:3306/coursedb";
    private static final String USER = "root";
    private static final String PASSWORD = ""; // Change if needed

    // ✅ Get database connection
    public Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL Driver not found!");
            throw new SQLException("MySQL Driver not found!", e);
        }
    }

    // ✅ Add a new course
    public boolean addCourse(Course c) {
        String sql = "INSERT INTO course (course_name, instructor, duration) VALUES (?, ?, ?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, c.getCourseName());
            ps.setString(2, c.getInstructor());
            ps.setString(3, c.getDuration());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ✅ Retrieve all courses
    public List<Course> getAllCourses() {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT * FROM course";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Course c = new Course();
                c.setId(rs.getInt("id"));
                c.setCourseName(rs.getString("course_name"));
                c.setInstructor(rs.getString("instructor"));
                c.setDuration(rs.getString("duration"));
                list.add(c);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // ✅ Enroll a student in a course
    public boolean enrollStudentInCourse(int userId, int courseId) {
        String sql = "INSERT INTO enrollment (user_id, course_id) VALUES (?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.setInt(2, courseId);
            ps.executeUpdate();
            return true;

        } catch (SQLIntegrityConstraintViolationException e) {
            System.out.println("User already enrolled in this course.");
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // ✅ Fetch all courses a student has enrolled in
    public List<Course> getEnrolledCoursesByUser(int userId) {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT c.id, c.course_name, c.instructor, c.duration " +
                     "FROM enrollment e " +
                     "JOIN course c ON e.course_id = c.id " +
                     "WHERE e.user_id = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Course c = new Course();
                    c.setId(rs.getInt("id"));
                    c.setCourseName(rs.getString("course_name"));
                    c.setInstructor(rs.getString("instructor"));
                    c.setDuration(rs.getString("duration"));
                    list.add(c);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
 // ✅ Delete course by ID
    public boolean deleteCourse(int courseId) {
        String sql = "DELETE FROM course WHERE id = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, courseId);
            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
