package ci.youssoufou.danayahiringtest.infrastructure.repositories;

import ci.youssoufou.danayahiringtest.infrastructure.entities.PersonEntity;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import java.time.LocalDate;
import java.util.List;


@DataJpaTest
class PersonRepositoryTest {

    @Autowired
    private PersonRepository personRepository;

    @BeforeEach
    void setUp() {
        personRepository.saveAll(List.of(
                PersonEntity.builder().id(1L).identity("1").firstName("ADOBO").lastName("MICHAEL").birthDate(LocalDate.now()).build(),
                PersonEntity.builder().id(2L).identity("2").firstName("DIJA").lastName("BISMAL").birthDate(LocalDate.now()).build(),
                PersonEntity.builder().id(3L).identity("3").firstName("FIL").lastName("DESIRE").birthDate(LocalDate.now()).build(),
                PersonEntity.builder().id(4L).identity("4").firstName("YORO").lastName("KAMAL").birthDate(LocalDate.now()).build()
        ));
    }

    @ParameterizedTest
    @CsvSource(value = {
            "1:1",
            "2:2"
    }, delimiter = ':')
    void givenIdentity_whenFindByIdentity_returnPersonEntity(String identity, String personFindIdentity) {
        // when
        var actualPerson = personRepository.findByIdentity(identity);
        // then
        Assertions.assertEquals(actualPerson.get(0).getIdentity(), personFindIdentity);
    }

    @BeforeEach
    void tearDown() {
        personRepository.deleteAll();
    }
}