<%@ page import="com.course.model.User" %>
<%
User user = (User) session.getAttribute("user");

// Restrict access — only admins can add courses
if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
    response.sendRedirect("dashboard.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Course - Online Course Registration</title>
    <style>
        /* ==============================
           GLOBAL STYLES
        ============================== */
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            margin: 0;
            padding: 0;
            color: #fff;
            min-height: 100vh;
        }

        header {
            background: #1a5dd8;
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.25);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        header h2 { 
            margin: 0; 
            font-size: 1.5rem;
        }

        header nav a {
            color: #fff;
            text-decoration: none;
            margin: 0 10px;
            font-weight: 500;
            transition: 0.3s;
        }

        header nav a:hover {
            text-decoration: underline;
        }

        /* ==============================
           FORM CONTAINER
        ============================== */
        .container {
            width: 90%;
            max-width: 450px;
            margin: 80px auto;
            background: #fff;
            color: #333;
            padding: 40px 35px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            text-align: center;
            animation: fadeIn 0.6s ease;
        }

        h3 {
            color: #1a5dd8;
            margin-bottom: 25px;
            font-size: 1.4rem;
        }

        /* ==============================
           INPUT STYLING
        ============================== */
        form input[type="text"] {
            width: 100%;
            padding: 12px 14px;
            margin: 12px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 1rem;
            outline: none;
            transition: 0.3s;
        }

        form input:focus {
            border-color: #2575fc;
            box-shadow: 0 0 5px rgba(37, 117, 252, 0.5);
        }

        /* ==============================
           BUTTONS
        ============================== */
        button {
            width: 100%;
            padding: 12px;
            background: #2575fc;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
            font-weight: bold;
            box-shadow: 0 4px #1a5dd8;
            margin-top: 20px;
        }

        button:hover {
            background: #1a5dd8;
            box-shadow: 0 2px #114fb3;
            transform: translateY(2px);
        }

        /* ==============================
           SECONDARY BUTTON / LINK
        ============================== */
        .btn {
            display: inline-block;
            padding: 10px 18px;
            background: #ccc;
            color: #333;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
            margin-top: 20px;
        }

        .btn:hover {
            background: #bbb;
        }

        /* ==============================
           MESSAGE AREA
        ============================== */
        .message {
            font-weight: bold;
            margin-bottom: 15px;
            padding: 10px;
            border-radius: 6px;
        }

        /* ==============================
           ANIMATION
        ============================== */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* ==============================
           RESPONSIVE DESIGN
        ============================== */
        @media (max-width: 480px) {
            header {
                flex-direction: column;
                align-items: flex-start;
            }

            header nav {
                margin-top: 10px;
            }

            .container {
                padding: 25px 20px;
                margin: 50px 15px;
            }

            button {
                font-size: 0.95rem;
            }
        }
    </style>
</head>
<body>
<header>
    <h2>Admin: Add New Course</h2>
    <nav>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="ViewCoursesServlet">View Courses</a>
        <a href="logout">Logout</a>
    </nav>
</header>

<div class="container">
    <h3>Enter Course Details</h3>
    <% 
        String sessionMessage = (String) session.getAttribute("message");
        if (sessionMessage != null) {
            session.removeAttribute("message");
            String color = sessionMessage.toLowerCase().contains("error") ? "red" : "#28a745";
    %>
        <p class="message" style="background:<%= color.equals("red") ? "#ffe5e5" : "#e6ffea" %>; color:<%= color %>;">
            <%= sessionMessage %>
        </p>
    <% } %>
    
    <form action="AddCourseServlet" method="post">
        <input type="text" name="courseName" placeholder="Course Name (e.g., Java Programming)" required><br>
        <input type="text" name="instructor" placeholder="Instructor Name (e.g., Dr. Smith)" required><br>
        <input type="text" name="duration" placeholder="Duration (e.g. 6 weeks / 40 hours)" required><br>
        <button type="submit">Add Course</button>
    </form>

    <a href="dashboard.jsp" class="btn">← Back to Dashboard</a>
</div>
</body>
</html>
