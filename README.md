# Online Course Registration System

The Online Course Registration System is a Java-based web application designed to simplify course enrollment and management for both students and administrators. It replaces the traditional manual registration process with a secure, centralized, and user-friendly online platform.

This project is developed using Java Servlets, JSP, and JDBC with MySQL for backend operations and follows the Model–View–Controller (MVC) architecture to ensure a structured, scalable and maintainable design.

## Features

### Student Module
- User registration and login
- View available courses
- Enroll in courses
- View enrolled courses
- Session-based authentication for secure access

### Admin Module
- Add new courses
- Update existing course details
- Delete courses
- Manage course information efficiently

## Architecture

The application follows the MVC (Model–View–Controller) architecture:

- Model: Java data classes and DAO (Data Access Object) classes for database operations  
- View: JSP pages for the user interface  
- Controller: Java Servlets for handling requests and application logic  

This separation of concerns improves code readability, maintainability, and scalability.

## Technologies Used

- Backend: Java Servlets, JSP  
- Frontend: HTML, CSS, JavaScript  
- Database: MySQL  
- Database Connectivity: JDBC  
- Architecture Pattern: MVC (Model–View–Controller)  
- Session Management: HTTP Sessions  

## Database Design

The MySQL database stores:
- User details
- Course information
- Enrollment records  

DAO classes are used to handle database interactions securely and efficiently using JDBC.

## Key Highlights

- Secure login and session management  
- Clean and user-friendly interface  
- Efficient database operations using DAO pattern  
- Structured and maintainable MVC architecture  
- Scalable design suitable for real-world applications  

## Conclusion

This project demonstrates how Java web technologies can be used to build a reliable and scalable online course registration system. By automating the registration process, it reduces manual effort, saves time, and improves the overall user experience for both students and administrators.

## Author

Madhu Vignesh R
