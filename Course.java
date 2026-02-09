package com.course.model;

public class Course {
    private int id;
    private String courseName;
    private String instructor;
    private String duration;

    // Default constructor
    public Course() {}

    // Parameterized constructor
    public Course(String courseName, String instructor, String duration) {
        this.courseName = courseName;
        this.instructor = instructor;
        this.duration = duration;
    }

    // Getters and Setters
    public int getId() { 
        return id; 
    }
    public void setId(int id) { 
        this.id = id; 
    }

    public String getCourseName() { 
        return courseName; 
    }
    public void setCourseName(String courseName) { 
        this.courseName = courseName; 
    }

    public String getInstructor() { 
        return instructor; 
    }
    public void setInstructor(String instructor) { 
        this.instructor = instructor; 
    }

    public String getDuration() { 
        return duration; 
    }
    public void setDuration(String duration) { 
        this.duration = duration; 
    }
}
