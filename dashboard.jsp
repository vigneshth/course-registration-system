<%@ page import="com.course.model.User" %>
<%
User user = (User) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Online Course Registration</title>
    <link rel="stylesheet" href="styles.css">

    <style>
        /* === Reset & Base === */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #4f46e5, #3b82f6);
            min-height: 100vh;
            color: #fff;
            display: flex;
            flex-direction: column;
        }

        /* === Header === */
        header {
            background: rgba(0, 0, 0, 0.25);
            backdrop-filter: blur(10px);
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
        }

        header h2 {
            margin: 0;
            font-size: 1.6rem;
            letter-spacing: 0.5px;
        }

        header nav {
            display: flex;
            gap: 20px;
        }

        header nav a {
            color: #fff;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s, transform 0.2s;
        }

        header nav a:hover {
            color: #c7d2fe;
            transform: translateY(-2px);
        }

        /* === Container === */
        .container {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin: 50px auto;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border-radius: 16px;
            padding: 40px;
            width: 90%;
            max-width: 800px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        h3 {
            color: #e0e7ff;
            font-size: 1.6rem;
            margin-bottom: 15px;
        }

        .welcome-message {
            font-size: 1.1rem;
            color: #f1f5f9;
            margin-bottom: 35px;
        }

        /* === Buttons === */
        .btn {
            display: inline-block;
            padding: 12px 25px;
            border: none;
            background: linear-gradient(90deg, #6366f1, #2563eb);
            color: #fff;
            font-weight: 600;
            text-decoration: none;
            border-radius: 8px;
            box-shadow: 0 4px 14px rgba(99, 102, 241, 0.3);
            transition: transform 0.2s, box-shadow 0.2s;
            margin: 10px;
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(99, 102, 241, 0.5);
        }

        .btn-logout {
            background: linear-gradient(90deg, #ef4444, #dc2626);
            box-shadow: 0 4px 14px rgba(239, 68, 68, 0.3);
        }

        .btn-logout:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(239, 68, 68, 0.5);
        }

        /* === Footer === */
        footer {
            text-align: center;
            padding: 15px;
            font-size: 0.9rem;
            color: #dbeafe;
            background: rgba(0, 0, 0, 0.15);
            margin-top: auto;
        }

        /* === Responsive === */
        @media (max-width: 600px) {
            header {
                flex-direction: column;
                gap: 10px;
                text-align: center;
            }

            header nav {
                flex-wrap: wrap;
                justify-content: center;
            }

            .container {
                width: 95%;
                padding: 25px;
            }

            h3 {
                font-size: 1.4rem;
            }
        }
    </style>
</head>

<body>
    <header>
        <h2>Welcome, <%= user.getName() %> 👋</h2>
        <nav>
            <a href="ViewCoursesServlet">View Courses</a>
            <% if ("admin".equalsIgnoreCase(user.getRole())) { %>
                <a href="add-course.jsp">Add Course</a>
            <% } else { %>
                <a href="ViewEnrolledCoursesServlet">My Enrolled Courses</a>
            <% } %>
            <a href="logout">Logout</a>
        </nav>
    </header>

    <div class="container">
        <h3>Your Dashboard</h3>
        <p class="welcome-message">
            Manage your online courses and access learning materials easily.
        </p>

        <% if ("admin".equalsIgnoreCase(user.getRole())) { %>
            <a href="add-course.jsp" class="btn">Add New Course</a>
            <a href="ViewCoursesServlet" class="btn">View All Courses</a>
        <% } else { %>
            <a href="ViewCoursesServlet" class="btn">Browse Available Courses</a>
            <a href="ViewEnrolledCoursesServlet" class="btn">View Enrolled Courses</a>
        <% } %>

        <form action="logout" method="get" style="margin-top: 30px;">
            <button type="submit" class="btn btn-logout">Logout</button>
        </form>
    </div>

    <footer>
        © 2025 Online Course Registration | All Rights Reserved
    </footer>
</body>
</html>
