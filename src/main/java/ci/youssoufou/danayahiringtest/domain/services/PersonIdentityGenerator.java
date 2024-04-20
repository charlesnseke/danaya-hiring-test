package ci.youssoufou.danayahiringtest.domain.services;

import ci.youssoufou.danayahiringtest.domain.Person;


public interface PersonIdentityGenerator {
    String generateIdFromPropertyValue(Person person);
}
