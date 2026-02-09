package com.course.model;

import java.sql.Timestamp;

public class Enrollment {
    private int id;
    private String studentEmail;
    private String courseName;
    private Timestamp enrollmentDate;

    public Enrollment() {}

    public Enrollment(String studentEmail, String courseName) {
        this.studentEmail = studentEmail;
        this.courseName = courseName;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getStudentEmail() { return studentEmail; }
    public void setStudentEmail(String studentEmail) { this.studentEmail = studentEmail; }

    public String getCourseName() { return courseName; }
    public void setCourseName(String courseName) { this.courseName = courseName; }

    public Timestamp getEnrollmentDate() { return enrollmentDate; }
    public void setEnrollmentDate(Timestamp enrollmentDate) { this.enrollmentDate = enrollmentDate; }
}
