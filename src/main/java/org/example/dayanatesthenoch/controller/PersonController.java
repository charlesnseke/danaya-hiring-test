package org.example.dayanatesthenoch.controller;

import jakarta.validation.Valid;
import org.example.dayanatesthenoch.model.CheckPersonExistenceRequest;
import org.example.dayanatesthenoch.model.CheckPersonExistenceResponse;
import org.example.dayanatesthenoch.model.CreatePersonRequest;
import org.example.dayanatesthenoch.model.PersonDTO;
import org.example.dayanatesthenoch.service.PersonService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/persons")
public class PersonController {

    private final PersonService personService;

    public PersonController(PersonService personService) {
        this.personService = personService;
    }

    @PostMapping
    public PersonDTO createPerson(@RequestBody @Valid CreatePersonRequest request) {
        return personService.createPerson(request);
    }

    @GetMapping
    public List<PersonDTO> getAllPersons() {
        return personService.getAllPersons();
    }

    @PostMapping("/check-existence")
    public CheckPersonExistenceResponse checkPersonExistence(@RequestBody @Valid CheckPersonExistenceRequest request) {
        return personService.checkPersonExistence(request);
    }

}