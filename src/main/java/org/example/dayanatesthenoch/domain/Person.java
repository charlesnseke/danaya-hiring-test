package org.example.dayanatesthenoch.domain;

import org.apache.commons.lang3.StringUtils;

import java.time.LocalDate;


public class Person {
    private String id;
    private String firstName;
    private String lastName;
    private LocalDate dateOfBirth;

    public Person() {
    }

    public Person(String id, String firstName, String lastName, String dateOfBirth) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.dateOfBirth = LocalDate.parse(dateOfBirth);
    }

    public double getFirstNameScore(String firstName) {
        return calculateDistance(this.firstName, firstName);
    }

    public double getLastNameScore(String lastName) {
        return calculateDistance(this.lastName, lastName);
    }

    public double getDateOfBirthScore(String dateOfBirth) {
        return calculateDistance(this.dateOfBirth.toString(), dateOfBirth);
    }

    private double calculateDistance(String first, String second) {
//        return StringUtils.getJaroWinklerDistance(first, second);
        return StringUtils.getJaroWinklerDistance(first, second)*100;

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
}

