package ci.youssoufou.danayahiringtest.domain.api;

import ci.youssoufou.danayahiringtest.domain.dto.CreatePersonDto;
import ci.youssoufou.danayahiringtest.domain.dto.GetPersonDto;
import ci.youssoufou.danayahiringtest.domain.dto.PersonDto;
import ci.youssoufou.danayahiringtest.domain.dto.PersonWithScoreDto;

import java.util.List;

public interface PersonService {
    PersonDto createNewPerson(final CreatePersonDto person);

    List<PersonDto> fetchPaginatePersons(final int pageNumber, final int pageSize);

    PersonWithScoreDto verifyPersonExistenceAndCalculateEachFieldScore(final GetPersonDto createPersonDto);
}
