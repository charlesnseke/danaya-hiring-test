package ci.youssoufou.danayahiringtest.infrastructure.repositories;

import ci.youssoufou.danayahiringtest.domain.Person;
import ci.youssoufou.danayahiringtest.domain.spi.PersonDataSource;
import ci.youssoufou.danayahiringtest.infrastructure.mappers.PersonEntityMapper;
import lombok.AllArgsConstructor;
import org.mapstruct.factory.Mappers;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;

import java.util.List;

@AllArgsConstructor
@Component
public class PersonDataSourceAdapter implements PersonDataSource {

    private final PersonRepository personRepository;

    private final PersonEntityMapper mapper = Mappers.getMapper(PersonEntityMapper.class);

    @Override
    public Person addPerson(final Person person) {
        return mapper.toPerson(personRepository.save(mapper.toPersonEntity(person)));
    }

    @Override
    public List<Person> getPaginatePersons(final int pageNumber, final int pageSize) {
        var paginateRequest = PageRequest.of(pageNumber, pageSize, Sort.by("id").ascending());
        var pageOfPersons = personRepository.findAll(paginateRequest);
        return mapper.toPersons(pageOfPersons.stream().toList());
    }

    @Override
    public List<Person> verifyPersonExistenceAndCalculateEachFieldScore(Person person) {
        return mapper.toPersons(personRepository.findByIdentity(person.getIdentity()));
    }
}
