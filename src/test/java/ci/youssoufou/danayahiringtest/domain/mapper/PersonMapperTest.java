package ci.youssoufou.danayahiringtest.domain.mapper;

import ci.youssoufou.danayahiringtest.domain.Person;
import ci.youssoufou.danayahiringtest.domain.dto.CreatePersonDto;
import ci.youssoufou.danayahiringtest.domain.dto.PersonDto;
import ci.youssoufou.danayahiringtest.domain.spi.stubs.PersonStub;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;
import org.mapstruct.factory.Mappers;

import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.assertEquals;

class PersonMapperTest {

    PersonMapper personMapper = Mappers.getMapper(PersonMapper.class);

    @Nested
    class TestToCreatePersonDto {
        private static Stream<Arguments> theGoodPersons() {
            return Stream.of(
                    // with this date format dd-MM-YYYY
                    Arguments.of(
                            PersonStub.createPerson("Nseke", "Charles", "01-12-1960"),
                            PersonStub.personDto("Nseke", "Charles", "01-12-1960")
                    ),
                    // with this date format dd/MM/YYYY
                    Arguments.of(
                            PersonStub.createPerson("Youssoufou", "Mohamed", "01/12/1960"),
                            PersonStub.personDto("Youssoufou", "Mohamed", "01/12/1960")
                    )
            );
        }

        @ParameterizedTest
        @MethodSource("theGoodPersons")
        void GivenPerson_WhenCallToPersonDto_ThenReturnCorrectPersonDto(final Person given, final PersonDto expected) {
            var actualPersonDto = personMapper.toPersonDto(given);
            assertEquals(actualPersonDto, expected);
        }
    }

    @Nested
    class TestToPerson {
        private static Stream<Arguments> theGoodPersons() {
            return Stream.of(
                    // with this date format dd-MM-YYYY
                    Arguments.of(
                            PersonStub.createPersonDto("Nseke", "Charles", "01-12-1960"),
                            PersonStub.createPersonWithoutIdentity("Nseke", "Charles", "01-12-1960")
                    ),
                    // with this date format dd/MM/YYYY
                    Arguments.of(
                            PersonStub.createPersonDto("Youssoufou", "Mohamed", "01/12/1960"),
                            PersonStub.createPersonWithoutIdentity("Youssoufou", "Mohamed", "01/12/1960")
                    )
            );
        }

        @ParameterizedTest
        @MethodSource("theGoodPersons")
        void GivenPersonDto_WhenCallToPerson_ThenReturnCorrectPersonData(final CreatePersonDto given, final Person expected) {
            var actualPersonDto = personMapper.toPerson(given);
            // then
            assertEquals(actualPersonDto, expected);
        }

        private String removeSlashAndDash(final String text) {
            return text.replace("-", "").replace("/", "");
        }
    }
}