package org.example.dayanatesthenoch.model;

public record CheckPersonExistenceResponse(String id, double firstNameScore, double lastNameScore, double dateOfBirthScore) {
    public CheckPersonExistenceResponse(String id) {
        this(id, 0, 0, 0);
    }
}
