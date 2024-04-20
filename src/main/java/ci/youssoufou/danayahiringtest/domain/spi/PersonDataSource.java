package ci.youssoufou.danayahiringtest.domain.spi;

import ci.youssoufou.danayahiringtest.domain.Person;

import java.util.List;

public interface PersonDataSource {

    Person addPerson(final Person person);

    List<Person> getPaginatePersons(final int pageNumber, final int pageSize);

    List<Person> verifyPersonExistenceAndCalculateEachFieldScore(final Person person);
}
