package org.example.dayanatesthenoch.service;

import org.example.dayanatesthenoch.dao.PersonRepository;
import org.example.dayanatesthenoch.domain.Person;
import org.example.dayanatesthenoch.model.CheckPersonExistenceRequest;
import org.example.dayanatesthenoch.model.CheckPersonExistenceResponse;
import org.example.dayanatesthenoch.model.CreatePersonRequest;
import org.example.dayanatesthenoch.model.PersonDTO;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
class DefaultPersonServiceIntegrationTest {

    @Autowired
    private PersonService personService;

    @Autowired
    private PersonRepository personRepository;

    @BeforeAll
    public void setUp() {
        Person john = new Person("1", "John", "Doe", "2000-01-01");
        Person jane = new Person("2", "Jane", "Doe", "2002-01-01");
        personRepository.save(john);
        personRepository.save(jane);
    }

    @Test
    void createPerson() {
        CreatePersonRequest request = new CreatePersonRequest("10", "Johny", "Doe", "2000-01-01");
        PersonDTO personDTO = personService.createPerson(request);
        assertNotNull(personDTO);
        assertEquals(request.firstName(), personDTO.firstName());
        assertEquals(request.lastName(), personDTO.lastName());
        assertEquals(request.dateOfBirth(), personDTO.dateOfBirth());
    }

    @Test
    void getAllPersons() {
        List<PersonDTO> personDTOS = personService.getAllPersons();
        assertEquals(2, personDTOS.size());
    }

    @Test
    void checkPersonExistence() {
        CheckPersonExistenceRequest request = new CheckPersonExistenceRequest("1", "John", "Doe", "2000-01-01");
        CheckPersonExistenceResponse response = personService.checkPersonExistence(request);
        assertTrue(response.firstNameScore() > 0.8);
    }
}