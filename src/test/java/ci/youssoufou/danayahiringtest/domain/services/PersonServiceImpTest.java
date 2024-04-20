package ci.youssoufou.danayahiringtest.domain.services;

import ci.youssoufou.danayahiringtest.domain.api.PersonService;
import ci.youssoufou.danayahiringtest.domain.dto.CreatePersonDto;
import ci.youssoufou.danayahiringtest.domain.dto.GetPersonDto;
import ci.youssoufou.danayahiringtest.domain.dto.PersonDto;
import ci.youssoufou.danayahiringtest.domain.dto.PersonWithScoreDto;
import ci.youssoufou.danayahiringtest.domain.exceptions.PersonNotFound;
import ci.youssoufou.danayahiringtest.domain.spi.stubs.PersonIdentityGeneratorTest;
import ci.youssoufou.danayahiringtest.domain.spi.stubs.PersonStub;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.CsvSource;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

class PersonServiceImpTest {
    private PersonService personService;

    @BeforeEach
    void init() {
        PersonIdentityGenerator personIdentityGenerator = new PersonIdentityGeneratorTest();
        PersonStub personDataSource = new PersonStub();
        personService = new PersonServiceImp(personDataSource, personIdentityGenerator);
    }

    @Nested
    class TestCreateNewPerson {
        private static Stream<Arguments> theGoodPersonDto() {
            return Stream.of(
                    Arguments.of(
                            PersonStub.createPersonDto("Charles", "Nseke", "01-12-1990"),
                            PersonStub.personDto("Charles", "Nseke", "01-12-1990")
                    ),
                    Arguments.of(
                            PersonStub.createPersonDto("Youssoufou", "Mohamed", "01/12/1960"),
                            PersonStub.personDto("Youssoufou", "Mohamed", "01/12/1960")
                    )
            );
        }

        @ParameterizedTest
        @MethodSource("theGoodPersonDto")
        void givenPerson_whenCreateNewPerson_thenItReturnNewPerson(final CreatePersonDto givenCreatePersonDto, final PersonDto expectedPerson) {
            // when
            var actualPerson = personService.createNewPerson(givenCreatePersonDto);
            // then
            assertEquals(expectedPerson, actualPerson);
        }
    }

    @Nested
    class TestFetchPaginatePersons {
        @ParameterizedTest
        @CsvSource(value = {
                "3:3:3",
                "11:1:10"
        }, delimiter = ':')
        void givenIndexAndSize_whenCallFetchPaginatePersons_thenReturnCorrectData(int pageSize, int pageNumber, long personsExpectedSize) {
            // when
            var actualPersons = personService.fetchPaginatePersons(pageSize, pageNumber);
            // then
            assertEquals(personsExpectedSize, actualPersons.size());
        }
    }

    @Nested
    class TestVerifyPersonExistenceAndCalculateEachFieldScore {
        private static Stream<Arguments> theGoodPersonDto() {
            return Stream.of(
                    Arguments.of(
                            PersonStub.createGetPersonDto("Youssoufou", "Mohamed", "01-10-1960"),
                            PersonStub.createPersonScoreDto(
                                    "Youssoufou", 100.0d,
                                    "Mohamed", 100.0d,
                                    "01-10-1960", 100.0d
                            )
                    )
            );
        }

        private static Stream<Arguments> personNotexist() {
            var person = PersonStub.createGetPersonDto("DIKO", "ABDEL", "01-10-1960");
            return Stream.of(
                    Arguments.of(
                            person
                            ,
                            "this person with this identity " + person.getIdentity() + " does not exist"
                    )
            );
        }

        @ParameterizedTest
        @MethodSource("theGoodPersonDto")
        void givenPersonDto_whenCallVerifyPersonExistenceAndCalculateEachFieldScore_thenReturnPerson(final GetPersonDto createPersonDto, final PersonWithScoreDto expectedPersonWithScoreDto) throws Exception {
            // when
            var actualPersonWithScoreDto = personService.verifyPersonExistenceAndCalculateEachFieldScore(createPersonDto);
            // then
            assertEquals(expectedPersonWithScoreDto, actualPersonWithScoreDto);
        }

        @ParameterizedTest
        @MethodSource("personNotexist")
        void givenPersonDto_whenCallVerifyPersonExistenceAndCalculateEachFieldScore_thenThrowNotPersonNotFoundException(final GetPersonDto createPersonDto, final String exceptedExceptionMessage) throws Exception {
            // when and Then
            var actualException = assertThrows(PersonNotFound.class, () -> personService.verifyPersonExistenceAndCalculateEachFieldScore(createPersonDto));
            assertEquals(exceptedExceptionMessage, actualException.getMessage());
        }
    }
}