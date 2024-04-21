package ci.youssoufou.danayahiringtest.domain.services;

import ci.youssoufou.danayahiringtest.domain.Person;
import ci.youssoufou.danayahiringtest.domain.ddd.DomainService;


@DomainService
public class PersonIdentityGeneratorHashcode implements PersonIdentityGenerator {
    public String generateIdFromPropertyValue(Person person) {
        return "ID" + person.hashCode();
    }
}
