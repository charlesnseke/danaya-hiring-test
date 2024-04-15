package org.example.dayanatesthenoch.domain;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

class PersonTest {
    private Person person;

    @BeforeEach
    void setUp() {
        person = new Person("1", "John", "Doe", "2000-01-01");
    }

    @Test
    void getFirstNameScore() {
        double score = person.getFirstNameScore("John");
        assertEquals(100, score);
        score = person.getFirstNameScore("Joh");
        assertTrue(score > 0 && score < 100);
    }

    @Test
    void getLastNameScore() {
        double score = person.getLastNameScore("Doe");
        assertEquals(100, score);
        score = person.getLastNameScore("Do");
        assertTrue(score > 0 && score < 100);
    }

    @Test
    void getDateOfBirthScore() {
        double score = person.getDateOfBirthScore("2000-01-01");
        assertEquals(100, score);
        score = person.getDateOfBirthScore("2000-01-02");
        assertTrue(score > 0 && score < 100);
    }
}