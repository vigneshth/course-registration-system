<%@ page import="java.util.*, com.course.model.Course" %>
<%@ page import="com.course.dao.CourseDAO" %>
<%@ page import="com.course.model.User" %>
<%
User user = (User) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}

CourseDAO courseDAO = new CourseDAO();
List<Course> courses = courseDAO.getAllCourses();
String message = (String) session.getAttribute("message");
session.removeAttribute("message");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Courses - Online Course Registration</title>
    <link rel="stylesheet" href="styles.css">

    <style>
        /* === Page Setup === */
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            margin: 0;
            padding: 0;
            color: #fff;
        }

        header {
            background: #1a5dd8;
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        header h2 { margin: 0; }
        header nav a {
            color: #fff;
            text-decoration: none;
            margin-left: 15px;
            font-weight: 500;
            transition: 0.3s;
        }
        header nav a:hover {
            text-decoration: underline;
        }

        /* === Container === */
        .container {
            width: 90%;
            max-width: 1000px;
            margin: 60px auto;
            background: #fff;
            color: #333;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.15);
        }

        h2 {
            color: #1a5dd8;
            text-align: center;
            margin-bottom: 20px;
        }

        /* === Message === */
        .message {
            text-align: center;
            font-weight: bold;
            margin-bottom: 15px;
            color: #28a745;
        }

        /* === Table === */
        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        th {
            background-color: #1a5dd8;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #eef4ff;
        }

        /* === Buttons === */
        .btn {
            text-decoration: none;
            padding: 8px 14px;
            border-radius: 6px;
            color: #fff;
            background: #2575fc;
            transition: 0.3s;
            border: none;
            cursor: pointer;
            font-weight: bold;
        }

        .btn:hover {
            background: #1a5dd8;
            transform: translateY(-1px);
        }

        .delete-btn {
            background: #e74c3c;
        }

        .delete-btn:hover {
            background: #c0392b;
        }

        /* === Responsive === */
        @media (max-width: 700px) {
            .container {
                width: 95%;
                padding: 20px;
            }

            table {
                font-size: 0.9rem;
            }

            th, td {
                padding: 10px;
            }
        }
    </style>
</head>

<body>
<header>
    <h2>Available Courses</h2>
    <nav>
        <a href="dashboard.jsp">Dashboard</a>
        <% if ("admin".equalsIgnoreCase(user.getRole())) { %>
            <a href="add-course.jsp">Add Course</a>
        <% } else { %>
            <a href="ViewEnrolledCoursesServlet">My Courses</a>
        <% } %>
        <a href="logout">Logout</a>
    </nav>
</header>

<div class="container">
    <h2>List of Courses</h2>

    <% if (message != null) { %>
        <div class="message"><%= message %></div>
    <% } %>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Course Name</th>
                <th>Instructor</th>
                <th>Duration</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% for (Course c : courses) { %>
                <tr>
                    <td><%= c.getId() %></td>
                    <td><%= c.getCourseName() %></td>
                    <td><%= c.getInstructor() %></td>
                    <td><%= c.getDuration() %></td>

                    <% if ("admin".equalsIgnoreCase(user.getRole())) { %>
                        <td>
                            <a href="DeleteCourseServlet?id=<%= c.getId() %>"
                               class="btn delete-btn"
                               onclick="return confirm('Are you sure you want to delete this course?');">
                               Delete
                            </a>
                        </td>
                    <% } else { %>
                        <td>
                            <form action="EnrollCourseServlet" method="post" style="margin:0;">
                                <input type="hidden" name="courseId" value="<%= c.getId() %>">
                                <button type="submit" class="btn">Enroll</button>
                            </form>
                        </td>
                    <% } %>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
