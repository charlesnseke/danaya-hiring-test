package ci.youssoufou.danayahiringtest.domain.spi.stubs;

import ci.youssoufou.danayahiringtest.domain.Person;
import ci.youssoufou.danayahiringtest.domain.dto.*;
import ci.youssoufou.danayahiringtest.domain.mapper.PersonMapper;
import ci.youssoufou.danayahiringtest.domain.services.PersonIdentityGenerator;
import ci.youssoufou.danayahiringtest.domain.spi.PersonDataSource;
import ci.youssoufou.danayahiringtest.domain.utils.ValidatorUtils;
import ci.youssoufou.danayahiringtest.infrastructure.entities.PersonEntity;
import ci.youssoufou.danayahiringtest.infrastructure.mappers.PersonEntityMapper;
import org.mapstruct.factory.Mappers;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


public class PersonStub implements PersonDataSource {

    private static final PersonIdentityGenerator personIdentityGenerator = new PersonIdentityGeneratorTest();
    private static final PersonEntityMapper personEntityMapper = Mappers.getMapper(PersonEntityMapper.class);

    private static final PersonMapper personMapper = Mappers.getMapper(PersonMapper.class);
    private static List<Person> persons = new ArrayList<>(List.of(
            createPerson("Youssoufou", "Mohamed", "01-10-1960"),
            createPerson("John", "Doe", "01-10-1960"),
            createPerson("Alice", "Smith", "15-05-1975"),
            createPerson("Bob", "Johnson", "25-03-1980"),
            createPerson("Eva", "Brown", "30-11-1990"),
            createPerson("Michael", "Davis", "20-08-1985"),
            createPerson("Emily", "Wilson", "10-04-1978"),
            createPerson("Daniel", "Taylor", "05-09-1995"),
            createPerson("Sophia", "Martinez", "12-06-1987"),
            createPerson("James", "Anderson", "28-02-1970")
    ));

    public static Person createPerson(final String lastName, final String firstName, final String birthDay) {
        LocalDate birthDayObject = ValidatorUtils.convertStringDateToDateObject(birthDay);
        var person = Person.builder().lastName(lastName).firstName(firstName).birthDate(birthDayObject).build();
        person.setIdentity(personIdentityGenerator.generateIdFromPropertyValue(person));
        return person;
    }

    public static Person createPersonWithoutIdentity(final String lastName, final String firstName, final String birthDay) {
        LocalDate birthDayObject = ValidatorUtils.convertStringDateToDateObject(birthDay);
        return Person.builder().lastName(lastName).firstName(firstName).birthDate(birthDayObject).build();
    }

    public static CreatePersonDto createPersonDto(final String lastName, final String firstName, final String birthDay) {
        return CreatePersonDto.builder().lastName(lastName).firstName(firstName).birthDate(birthDay).build();
    }

    public static PersonDto personDto(final String lastName, final String firstName, final String birthDay) {
        return PersonDto.builder().lastName(lastName).firstName(firstName).birthDate(birthDay).build();
    }

    public static PersonDto personDtoWithIdentity(final String lastName, final String firstName, final String birthDay) {
        var dto = createPersonWithoutIdentity(lastName, firstName, birthDay);
        return personMapper.toPersonDto(dto);
    }

    public static PersonEntity createPersonEntity(final String lastName, final String firstName, final String birthDay) {
        var person = Person.builder().lastName(lastName).firstName(firstName).birthDate(ValidatorUtils.convertStringDateToDateObject(birthDay)).build();
        var identity = personIdentityGenerator.generateIdFromPropertyValue(person);
        person.setIdentity(identity);
        return personEntityMapper.toPersonEntity(person);
    }

    public static GetPersonDto createGetPersonDto(final String lastName, final String firstName, final String birthDay) {
        var person = Person.builder().firstName(firstName).lastName(lastName).birthDate(ValidatorUtils.convertStringDateToDateObject(birthDay)).build();
        var identity = personIdentityGenerator.generateIdFromPropertyValue(person);
        return GetPersonDto.builder().identity(identity).lastName(lastName).firstName(firstName).birthDate(birthDay).build();
    }


    public static PersonWithScoreDto createPersonScoreDto(
            final String lastName, final Double givenLastNameScore,
            final String firstName, final Double givenFirstNameScore,
            final String birthDay, final Double givenBirthDayScore
    ) {
        var lastNameScore = ScoreField.builder().field(lastName).score(givenLastNameScore).build();
        var firstNameScore = ScoreField.builder().field(firstName).score(givenFirstNameScore).build();
        var birthDayScore = ScoreField.builder().field(birthDay).score(givenBirthDayScore).build();
        return PersonWithScoreDto.builder()
                .firstNameWithScore(firstNameScore)
                .lastNameWithScore(lastNameScore)
                .birthDateWithScore(birthDayScore)
                .build();
    }

    @Override
    public Person addPerson(Person person) {
        persons.add(person);
        return person;
    }

    @Override
    public List<Person> getPaginatePersons(int pageSize, int pageNumber) {
        return paginate(persons, pageSize, pageNumber);
    }

    @Override
    public List<Person> verifyPersonExistenceAndCalculateEachFieldScore(Person person) {
        return persons.stream().filter(p -> p.getIdentity().equals(person.getIdentity())).toList();
    }

    private List<Person> paginate(final List<Person> persons, long pageSize, long pageNumber) {
        var startIndex = (pageNumber - 1) * pageSize;
        var endIndex = Math.min(startIndex + pageSize, persons.size());
        if (startIndex >= persons.size()) {
            return List.of();
        } else {
            return persons.subList((int) startIndex, (int) endIndex);
        }
    }


}
