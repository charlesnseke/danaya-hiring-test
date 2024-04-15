package org.example.dayanatesthenoch.dao;

import org.example.dayanatesthenoch.domain.Person;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

class InMemoryPersonRepositoryTest {
    private InMemoryPersonRepository inMemoryPersonRepository;
    private Person person;

    @BeforeEach
    void setUp() {
        inMemoryPersonRepository = new InMemoryPersonRepository();
        person = new Person();
        person.setId("1");
        inMemoryPersonRepository.save(person);
    }

    @Test
    void findAll() {
        List<Person> persons = inMemoryPersonRepository.findAll();
        assertTrue(persons.contains(person));
        assertEquals(1, persons.size());
    }

    @Test
    void findById() {
        Optional<Person> findById = inMemoryPersonRepository.findById("1");
        assertTrue(findById.isPresent());
        assertEquals(person, findById.get());
    }

    @Test
    void findByIdNotFound() {
        Optional<Person> findById = inMemoryPersonRepository.findById("100");
        assertFalse(findById.isPresent());
    }

    @Test
    void save() {
        Person newPerson = new Person();
        newPerson.setId("2");
        inMemoryPersonRepository.save(newPerson);

        List<Person> persons = inMemoryPersonRepository.findAll();
        assertTrue(persons.contains(newPerson));
        assertEquals(2, persons.size());
    }
}