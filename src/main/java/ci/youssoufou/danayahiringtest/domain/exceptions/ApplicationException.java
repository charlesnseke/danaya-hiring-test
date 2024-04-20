package ci.youssoufou.danayahiringtest.domain.exceptions;

public class ApplicationException extends RuntimeException {
    public ApplicationException(final String message) {
        super(message);
    }
}
