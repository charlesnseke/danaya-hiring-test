package org.example.dayanatesthenoch.dao;

import org.example.dayanatesthenoch.domain.Person;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
public class InMemoryPersonRepository implements PersonRepository {
    private final List<Person> database = new ArrayList<>();

    @Override
    public List<Person> findAll() {
        return database;
    }

    @Override
    public Optional<Person> findById(String id) {
        return database.stream().filter(person -> person.getId().equals(id)).findFirst();
    }

    @Override
    public void save(Person person) {
        database.add(person);
    }
}
