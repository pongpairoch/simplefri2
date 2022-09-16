package sit.int202.simplefri.repositories;

import sit.int202.simplefri.entities.Subject;

import java.util.ArrayList;
import java.util.List;

public class SubjectRepository {
    private static List<Subject> subjects;

    public List<Subject> findAll() {
        return subjects;
    }

    public Subject findById(String id) {
        return subjects.stream().filter(subject -> id.equals(subject.getId())).findFirst().orElse(null);
    }

    public SubjectRepository() {
        initialize();
    }

    private void initialize() {
        subjects = new ArrayList<>(20);
        subjects.add(new Subject("INT 100", "IT Fundamentals", 3));
        subjects.add(new Subject("INT 101", "Programming Fundamentals", 3));
        subjects.add(new Subject("INT 102", "Web Technology", 1));
        subjects.add(new Subject("INT 114", "Discrete Mathematics", 3));
        subjects.add(new Subject("GEN 101", "Physical Education", 1));
        subjects.add(new Subject("GEN 111", "Man and Ethics of Living", 3));
        subjects.add(new Subject("LNG 120", "General English", 3));
        subjects.add(new Subject("LNG 220", "Academic English", 3));
        subjects.add(new Subject("INT 103", "Advanced Programming", 3));
        subjects.add(new Subject("INT 104", "User Experience Design", 3));
        subjects.add(new Subject("INT 105", "Basic SQL", 1));
        subjects.add(new Subject("INT 107", "Computing Platforms Technology", 3));
        subjects.add(new Subject("INT 200", "Data Structures and Algorithms", 1));
        subjects.add(new Subject("INT 201", "Client-Side Programming I",2));
        subjects.add(new Subject("INT 202", "Server-Side Programming I",2));
        subjects.add(new Subject("INT 205", "Database Management System",3));
        subjects.add(new Subject("INT 207", "Network I",3));
    }
}
