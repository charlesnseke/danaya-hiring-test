package ci.youssoufou.danayahiringtest.domain.spi.stubs;

import ci.youssoufou.danayahiringtest.domain.Person;
import ci.youssoufou.danayahiringtest.domain.services.PersonIdentityGenerator;

public class PersonIdentityGeneratorTest implements PersonIdentityGenerator {
    @Override
    public String generateIdFromPropertyValue(Person person) {
        return person.getFirstName() + person.getLastName() + person.getBirthDate();
    }
}
