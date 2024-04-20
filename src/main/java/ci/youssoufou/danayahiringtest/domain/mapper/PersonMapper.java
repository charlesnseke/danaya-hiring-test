package ci.youssoufou.danayahiringtest.domain.mapper;

import ci.youssoufou.danayahiringtest.domain.Person;
import ci.youssoufou.danayahiringtest.domain.dto.CreatePersonDto;
import ci.youssoufou.danayahiringtest.domain.dto.GetPersonDto;
import ci.youssoufou.danayahiringtest.domain.dto.PersonDto;
import ci.youssoufou.danayahiringtest.domain.utils.DatesConverterUtils;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;

@Mapper(uses = DatesConverterUtils.class)
public interface PersonMapper {
    @Mapping(target = "birthDate", source = "birthDate", qualifiedByName = "convertDateObjectToString")
    PersonDto toPersonDto(Person person);

    @Mapping(target = "birthDate", source = "birthDate", qualifiedByName = "convertDateObjectToString")
    CreatePersonDto toCreatePersonDto(Person person);

    @Mapping(target = "birthDate", source = "birthDate", qualifiedByName = "convertStringDateToDateObject")
    Person toPerson(final GetPersonDto createPersonDto);

    @Mapping(target = "birthDate", source = "birthDate", qualifiedByName = "convertStringDateToDateObject")
    Person toPerson(final CreatePersonDto createPersonDto);

    default List<PersonDto> toPersonDtos(List<Person> paginatePersons) {
        return paginatePersons.stream().map(this::toPersonDto).toList();
    }
}
