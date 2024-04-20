package ci.youssoufou.danayahiringtest.domain.services;

import ci.youssoufou.danayahiringtest.domain.api.PersonService;
import ci.youssoufou.danayahiringtest.domain.ddd.DomainService;
import ci.youssoufou.danayahiringtest.domain.dto.CreatePersonDto;
import ci.youssoufou.danayahiringtest.domain.dto.GetPersonDto;
import ci.youssoufou.danayahiringtest.domain.dto.PersonDto;
import ci.youssoufou.danayahiringtest.domain.dto.PersonWithScoreDto;
import ci.youssoufou.danayahiringtest.domain.exceptions.ApplicationException;
import ci.youssoufou.danayahiringtest.domain.exceptions.PersonNotFound;
import ci.youssoufou.danayahiringtest.domain.mapper.PersonMapper;
import ci.youssoufou.danayahiringtest.domain.services.scorecalculatorstrategy.Context;
import ci.youssoufou.danayahiringtest.domain.services.scorecalculatorstrategy.JaroWinklerDistanceScoreCalculatorStrategy;
import ci.youssoufou.danayahiringtest.domain.spi.PersonDataSource;
import lombok.RequiredArgsConstructor;
import org.mapstruct.factory.Mappers;

import java.util.List;

@DomainService
@RequiredArgsConstructor
public class PersonServiceImp implements PersonService {
    private final PersonDataSource personDataSource;
    private final PersonMapper personMapper = Mappers.getMapper(PersonMapper.class);
    private final PersonIdentityGenerator personIdentityGenerator;

    @Override
    public PersonDto createNewPerson(final CreatePersonDto createPersonDto) {
        var person = personMapper.toPerson(createPersonDto);
        person.setIdentity(personIdentityGenerator.generateIdFromPropertyValue(person));
        var createdPerson = personDataSource.addPerson(person);
        return personMapper.toPersonDto(createdPerson);
    }

    @Override
    public List<PersonDto> fetchPaginatePersons(final int pageNumber, final int pageSize) {
        return personMapper.toPersonDtos(personDataSource.getPaginatePersons(pageNumber, pageSize));
    }

    @Override
    public PersonWithScoreDto verifyPersonExistenceAndCalculateEachFieldScore(final GetPersonDto personDto) {
        var personGiven = personMapper.toPerson(personDto);
        var personFounds = personDataSource
                .verifyPersonExistenceAndCalculateEachFieldScore(personGiven);
        if (personFounds.isEmpty()) {
            throw new PersonNotFound("this person with this identity " + personDto.getIdentity() + " does not exist");
        }
        var context = new Context();
        try {
            context.setStrategy(new JaroWinklerDistanceScoreCalculatorStrategy());
            return context.apply(personGiven, personFounds.get(0));
        } catch (Exception e) {
            throw new ApplicationException("an error occurred, try again later");
        }
    }
}
