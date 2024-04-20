package ci.youssoufou.danayahiringtest.infrastructure.exceptions;

import ci.youssoufou.danayahiringtest.domain.exceptions.ApplicationException;
import ci.youssoufou.danayahiringtest.domain.exceptions.PersonInputException;
import ci.youssoufou.danayahiringtest.domain.exceptions.PersonNotFound;
import org.springframework.http.HttpStatus;
import org.springframework.http.ProblemDetail;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class ApplicationHandlers {

    @ExceptionHandler({PersonInputException.class})
    public ProblemDetail badRequest(PersonInputException exception) {
        return ProblemDetail.forStatusAndDetail(HttpStatus.BAD_REQUEST, exception.getMessage());
    }

    @ExceptionHandler({PersonNotFound.class})
    public ProblemDetail notFoundException(PersonNotFound exception) {
        return ProblemDetail.forStatusAndDetail(HttpStatus.NOT_FOUND, exception.getMessage());
    }

    @ExceptionHandler({ApplicationException.class})
    public ProblemDetail appException(ApplicationException exception) {
        return ProblemDetail.forStatusAndDetail(HttpStatus.BAD_REQUEST, exception.getMessage());
    }
}
