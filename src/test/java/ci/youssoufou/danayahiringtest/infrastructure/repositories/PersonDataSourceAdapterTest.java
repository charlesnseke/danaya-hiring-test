package ci.youssoufou.danayahiringtest.infrastructure.repositories;

import ci.youssoufou.danayahiringtest.domain.Person;
import ci.youssoufou.danayahiringtest.domain.spi.stubs.PersonStub;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

@DataJpaTest
class PersonDataSourceAdapterTest {

    @Autowired
    private PersonRepository personRepository;
    private PersonDataSourceAdapter personDataSourceAdapter;

    @BeforeEach
    void init() {
        personDataSourceAdapter = new PersonDataSourceAdapter(personRepository);
    }

    @Test
    void givenPerson_whenAddPerson_thenItCreatedNewPerson() {
        // given
        final Person givenPerson = PersonStub.createPerson("Youssoufou", "Mohamed", "01-01-1975");
        final Person expectedPerson = PersonStub.createPerson("Youssoufou", "Mohamed", "01-01-1975");
        // when
        var actualPerson = personDataSourceAdapter.addPerson(givenPerson);
        //then
        assertNotNull(actualPerson.getIdentity());
        assertEquals(expectedPerson, actualPerson);
    }

    @ParameterizedTest
    @CsvSource(value = {
            "3:3:0"
    }, delimiter = ':')
    void givenSizeAndPag_whenGetPaginatePersons_thenReturnPersons(int pageSize, int pageNumber, long personsExpectedSize) {
        personDataSourceAdapter.getPaginatePersons(pageSize, pageNumber);
        // when
        var actualPersons = personDataSourceAdapter.getPaginatePersons(pageSize, pageNumber);
        // then
        assertEquals(personsExpectedSize, actualPersons.size());
    }
}