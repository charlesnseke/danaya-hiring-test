package ci.youssoufou.danayahiringtest.domain.exceptions;

public class PersonInputException extends RuntimeException {
    public PersonInputException(final String message) {
        super(message);
    }
}
