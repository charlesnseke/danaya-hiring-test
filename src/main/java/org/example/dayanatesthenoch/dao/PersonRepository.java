package org.example.dayanatesthenoch.dao;

import org.example.dayanatesthenoch.domain.Person;

import java.util.List;
import java.util.Optional;

public interface PersonRepository {
    List<Person> findAll();
    Optional<Person> findById(String id);
    void save(Person person);
}
