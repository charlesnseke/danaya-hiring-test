package ci.youssoufou.danayahiringtest.domain.utils;

import ci.youssoufou.danayahiringtest.domain.exceptions.PersonInputException;
import lombok.experimental.UtilityClass;
import org.mapstruct.Named;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@UtilityClass
public class ValidatorUtils {

    private static final DateTimeFormatter FORMATTER_1 = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    private static final DateTimeFormatter FORMATTER_2 = DateTimeFormatter.ofPattern("dd-MM-yyyy");

    @Named("convertDateObjectToString")
    public static String convertDateObjectToString(LocalDate dateObject) {
        return dateObject.format(FORMATTER_1);
    }

    @Named("convertStringDateToDateObject")
    public static LocalDate convertStringDateToDateObject(String dateStr) {
        try {
            return LocalDate.parse(dateStr, FORMATTER_1);
        } catch (RuntimeException e) {
            try {
                return LocalDate.parse(dateStr, FORMATTER_2);
            } catch (RuntimeException e2) {
                throw new PersonInputException(
                        String.format("wrong date format exception given: %s but expected: dd/MM/YYYY or dd-MM-YYYY", dateStr));
            }
        }
    }

    @Named("identityValidator")
    public static String identityValidator(String value) {
        if (value == null || value.isBlank()) {
            throw new PersonInputException("identity must not blank!");
        }
        return value;
    }

    @Named("firstNameValidator")
    public String firstNameValidator(String value) {
        if (value == null || value.isBlank()) {
            throw new PersonInputException("firstName must not blank!");
        }
        return value;
    }

    @Named("lastNameValidator")
    public String lastNameValidator(String value) {
        if (value == null || value.isBlank()) {
            throw new PersonInputException("lastName must not blank!");
        }
        return value;
    }
}
