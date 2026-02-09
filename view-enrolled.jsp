<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.course.model.Course" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Enrolled Courses</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f5f6fa; color: #2f3640; margin: 0; padding: 20px; }
        table { border-collapse: collapse; width: 80%; margin: 30px auto; background: white; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: center; }
        th { background-color: #273c75; color: white; }
        tr:hover { background-color: #f1f2f6; }
        h2 { text-align: center; color: #192a56; }
        a { display: block; text-align: center; margin-top: 20px; text-decoration: none; color: #0097e6; }
    </style>
</head>
<body>
    <h2>My Enrolled Courses</h2>
    <%
        List<Course> enrolledCourses = (List<Course>) request.getAttribute("enrolledCourses");
        if (enrolledCourses == null || enrolledCourses.isEmpty()) {
    %>
        <p style="text-align:center;">You have not enrolled in any courses yet.</p>
    <% } else { %>
        <table>
            <tr>
                <th>Course ID</th>
                <th>Course Name</th>
                <th>Instructor</th>
                <th>Duration</th>
            </tr>
            <% for (Course course : enrolledCourses) { %>
            <tr>
                <td><%= course.getId() %></td>
                <td><%= course.getCourseName() %></td>
                <td><%= course.getInstructor() %></td>
                <td><%= course.getDuration() %></td>
            </tr>
            <% } %>
        </table>
    <% } %>
    <a href="dashboard.jsp">← Back to Dashboard</a>
</body>
</html>
