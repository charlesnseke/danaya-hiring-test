package ci.youssoufou.danayahiringtest.infrastructure.controllers;

import ci.youssoufou.danayahiringtest.domain.api.PersonService;
import ci.youssoufou.danayahiringtest.domain.dto.CreatePersonDto;
import ci.youssoufou.danayahiringtest.domain.dto.GetPersonDto;
import ci.youssoufou.danayahiringtest.domain.dto.PersonDto;
import ci.youssoufou.danayahiringtest.domain.dto.PersonWithScoreDto;
import ci.youssoufou.danayahiringtest.domain.exceptions.ApplicationException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/persons")
@RequiredArgsConstructor
@CrossOrigin("*")
public class PersonController {
    private final PersonService personService;

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<PersonDto> createNewPerson(@RequestBody final CreatePersonDto person) {
        return ResponseEntity.status(HttpStatus.CREATED).body(personService.createNewPerson(person));
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public List<PersonDto> getPersons(final @RequestParam("pageNumber") int pageNumber, final @RequestParam("pageSize") int pageSize) {
        return personService.fetchPaginatePersons(pageNumber, pageSize);
    }

    @GetMapping(value = "/getScore", produces = MediaType.APPLICATION_JSON_VALUE)
    public PersonWithScoreDto getPersonWithEachFieldScore(final GetPersonDto createPersonDto) throws ApplicationException {
        return personService.verifyPersonExistenceAndCalculateEachFieldScore(createPersonDto);
    }
}
