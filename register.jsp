<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register - Online Course Registration</title>
  <link rel="stylesheet" href="styles.css">

  <style>
    /* === Reset === */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #4f46e5, #3b82f6);
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      color: #fff;
    }

    .container {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(12px);
      border-radius: 16px;
      padding: 40px 35px;
      width: 90%;
      max-width: 400px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.25);
      text-align: center;
    }

    h2 {
      font-size: 1.8rem;
      margin-bottom: 20px;
      color: #e0e7ff;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 15px;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
      width: 100%;
      padding: 12px;
      border: none;
      border-radius: 8px;
      outline: none;
      background: rgba(255, 255, 255, 0.9);
      color: #333;
      font-size: 1rem;
      transition: 0.3s;
    }

    input:focus {
      box-shadow: 0 0 8px rgba(99, 102, 241, 0.6);
      transform: scale(1.02);
    }

    button {
      padding: 12px;
      border: none;
      border-radius: 8px;
      background: linear-gradient(90deg, #6366f1, #2563eb);
      color: #fff;
      font-weight: bold;
      font-size: 1rem;
      cursor: pointer;
      transition: 0.3s;
      box-shadow: 0 4px 15px rgba(99, 102, 241, 0.3);
    }

    button:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 20px rgba(99, 102, 241, 0.5);
    }

    p {
      margin-top: 20px;
      font-size: 0.95rem;
    }

    a {
      color: #c7d2fe;
      text-decoration: none;
      font-weight: 500;
    }

    a:hover {
      text-decoration: underline;
    }

    /* === Responsive === */
    @media (max-width: 500px) {
      .container {
        width: 95%;
        padding: 30px 20px;
      }
      h2 {
        font-size: 1.5rem;
      }
    }
  </style>
</head>

<body>
  <div class="container">
    <h2>Create Account</h2>

    <form action="RegisterServlet" method="post">
      <input type="text" name="name" placeholder="Full Name" required>
      <input type="email" name="email" placeholder="Email Address" required> 
      <input type="password" name="password" placeholder="Password" required>
      <input type="password" name="confirmPassword" placeholder="Confirm Password" required>

      <!-- Hidden role field -->
      <input type="hidden" name="role" value="student">

      <button type="submit">Register</button>
    </form>

    <p>Already have an account? <a href="login.jsp">Login</a></p>
  </div>
</body>
</html>
