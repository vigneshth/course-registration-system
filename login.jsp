<%-- This JSP handles displaying error messages after failed login/registration --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login - Online Course Registration</title>
  <style>
    /* ===========================
       Global Styles
    ============================ */
    body {
      font-family: 'Inter', sans-serif;
      background: linear-gradient(135deg, #6a11cb, #2575fc);
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      color: #333;
    }

    /* ===========================
       Login Container
    ============================ */
    .container {
      background: #fff;
      padding: 40px 35px;
      border-radius: 12px;
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
      width: 100%;
      max-width: 400px;
      text-align: center;
      animation: fadeIn 0.6s ease;
    }

    .container h2 {
      margin-bottom: 25px;
      color: #1a5dd8;
    }

    /* ===========================
       Input Fields
    ============================ */
    input[type="email"],
    input[type="password"] {
      width: 100%;
      padding: 12px;
      margin: 10px 0 18px 0;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 1rem;
      outline: none;
      transition: border-color 0.3s;
    }

    input:focus {
      border-color: #2575fc;
      box-shadow: 0 0 5px rgba(37, 117, 252, 0.5);
    }

    /* ===========================
       Button Styles
    ============================ */
    button {
      width: 100%;
      padding: 12px;
      background-color: #2575fc;
      border: none;
      border-radius: 8px;
      color: #fff;
      font-size: 1rem;
      font-weight: bold;
      cursor: pointer;
      transition: all 0.3s ease;
      box-shadow: 0 4px #1a5dd8;
    }

    button:hover {
      background-color: #1a5dd8;
      box-shadow: 0 2px #0f47b3;
      transform: translateY(2px);
    }

    /* ===========================
       Links and Error Message
    ============================ */
    p {
      margin-top: 15px;
      color: #333;
      font-size: 0.95rem;
    }

    a {
      color: #2575fc;
      text-decoration: none;
      font-weight: 600;
    }

    a:hover {
      text-decoration: underline;
    }

    p[style*="color: red"] {
      font-weight: 600;
      background: #ffe5e5;
      padding: 8px;
      border-radius: 6px;
    }

    /* ===========================
       Animation
    ============================ */
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(-10px); }
      to { opacity: 1; transform: translateY(0); }
    }

    /* ===========================
       Responsive Design
    ============================ */
    @media (max-width: 480px) {
      .container {
        padding: 25px 20px;
        width: 90%;
      }
      h2 {
        font-size: 1.4rem;
      }
    }
  </style>
</head>
<body>
<div class="container">
  <h2>Login to Course Portal</h2>

  <% 
    String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null) {
  %>
    <p style="color: red; margin-bottom: 15px;"><%= errorMessage %></p>
  <% } %>

  <form action="LoginServlet" method="post">
    <input type="email" name="email" placeholder="Email" required><br> 
    <input type="password" name="password" placeholder="Password" required><br>
    <button type="submit">Login</button>
  </form>

  <p>Don't have an account? <a href="register.jsp">register Here</a></p>
</div>
</body>
</html>
