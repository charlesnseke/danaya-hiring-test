package ci.youssoufou.danayahiringtest.domain.mapper;

import ci.youssoufou.danayahiringtest.domain.Person;
import ci.youssoufou.danayahiringtest.domain.dto.CreatePersonDto;
import ci.youssoufou.danayahiringtest.domain.dto.GetPersonDto;
import ci.youssoufou.danayahiringtest.domain.dto.PersonDto;
import ci.youssoufou.danayahiringtest.domain.utils.ValidatorUtils;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;

import java.util.List;

@Mapper(uses = ValidatorUtils.class)
public interface PersonMapper {

    @Mapping(target = "birthDate", source = "birthDate", qualifiedByName = "convertDateObjectToString")
    PersonDto toPersonDto(Person person);

    @Mapping(target = "birthDate", source = "birthDate", qualifiedByName = "convertDateObjectToString")
    GetPersonDto toGetPersonDto(Person person);

    @Mappings(value = {
            @Mapping(target = "identity", source = "identity", qualifiedByName = "identityValidator"),
            @Mapping(target = "birthDate", source = "birthDate", qualifiedByName = "convertStringDateToDateObject")
    })
    Person toPerson(final GetPersonDto getPersonDto);

    @Mappings(value = {
            @Mapping(target = "firstName", source = "firstName", qualifiedByName = "firstNameValidator"),
            @Mapping(target = "lastName", source = "lastName", qualifiedByName = "lastNameValidator"),
            @Mapping(target = "birthDate", source = "birthDate", qualifiedByName = "convertStringDateToDateObject")
    })
    Person toPerson(final CreatePersonDto createPersonDto);

    default List<PersonDto> toPersonDtos(List<Person> paginatePersons) {
        return paginatePersons.stream().map(this::toPersonDto).toList();
    }
}
