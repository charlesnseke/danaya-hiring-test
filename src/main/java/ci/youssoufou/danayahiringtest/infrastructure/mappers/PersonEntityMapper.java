package ci.youssoufou.danayahiringtest.infrastructure.mappers;

import ci.youssoufou.danayahiringtest.domain.Person;
import ci.youssoufou.danayahiringtest.infrastructure.entities.PersonEntity;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper
public interface PersonEntityMapper {
    Person toPerson(PersonEntity person);

    PersonEntity toPersonEntity(Person person);

    default List<Person> toPersons(final List<PersonEntity> personEntities) {
        return personEntities.stream().map(this::toPerson).toList();
    }
}
