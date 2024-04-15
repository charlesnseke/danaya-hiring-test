package org.example.dayanatesthenoch.service;


import org.example.dayanatesthenoch.model.CheckPersonExistenceRequest;
import org.example.dayanatesthenoch.model.CheckPersonExistenceResponse;
import org.example.dayanatesthenoch.model.CreatePersonRequest;
import org.example.dayanatesthenoch.model.PersonDTO;

import java.util.List;

public interface PersonService {
    PersonDTO createPerson(CreatePersonRequest createPersonRequest);

    List<PersonDTO> getAllPersons();

    CheckPersonExistenceResponse checkPersonExistence(CheckPersonExistenceRequest request);
}
