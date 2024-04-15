package org.example.dayanatesthenoch.service;

import org.example.dayanatesthenoch.dao.PersonRepository;
import org.example.dayanatesthenoch.domain.Person;
import org.example.dayanatesthenoch.model.CheckPersonExistenceRequest;
import org.example.dayanatesthenoch.model.CheckPersonExistenceResponse;
import org.example.dayanatesthenoch.model.CreatePersonRequest;
import org.example.dayanatesthenoch.model.PersonDTO;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

@Service
public class DefaultPersonService implements PersonService {
    private final PersonRepository personRepository;

    public DefaultPersonService(PersonRepository personRepository) {
        this.personRepository = personRepository;
    }

    @Override
    public PersonDTO createPerson(CreatePersonRequest createPersonRequest) {
        Person person = convertToPerson(createPersonRequest);
        verifyIfPersonExists(person.getId());
        personRepository.save(person);
        return convertPersonToPersonDto(person);
    }

    void verifyIfPersonExists(String id) {
        boolean exists = personRepository.findById(id).isPresent();
        if (exists) {
            throw new RuntimeException("A person with the provided ID already exists.");
        }
    }

    @Override
    public List<PersonDTO> getAllPersons() {
        return convertPersonListToPersonDtoList(personRepository.findAll());
    }

    @Override
    public CheckPersonExistenceResponse checkPersonExistence(CheckPersonExistenceRequest request) {
        Optional<Person> personOptional = personRepository.findById(request.id());
        if (personOptional.isEmpty()) {
            return new CheckPersonExistenceResponse(request.id());
        }
        Person person = personOptional.get();
        return new CheckPersonExistenceResponse(request.id(), person.getFirstNameScore(request.firstName()),
                person.getLastNameScore(request.lastName()), person.getDateOfBirthScore(request.dateOfBirth()));
    }

    Person convertToPerson(CreatePersonRequest createPersonRequest) {
        String id = createPersonRequest.id();
        String firstName = createPersonRequest.firstName();
        String lastName = createPersonRequest.lastName();
        String dateOfBirth = createPersonRequest.dateOfBirth();
        return new Person(id, firstName, lastName, dateOfBirth);
    }

    public PersonDTO convertPersonToPersonDto(Person person) {
        String id = person.getId();
        String firstName = person.getFirstName();
        String lastName = person.getLastName();
        LocalDate dateOfBirth = person.getDateOfBirth();

        return new PersonDTO(id, firstName, lastName, dateOfBirth.format(DateTimeFormatter.ISO_LOCAL_DATE));
    }

    public List<PersonDTO> convertPersonListToPersonDtoList(List<Person> persons) {
        return persons.stream().map(this::convertPersonToPersonDto).toList();
    }
}
