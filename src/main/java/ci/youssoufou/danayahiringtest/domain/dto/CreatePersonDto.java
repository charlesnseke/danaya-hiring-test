package ci.youssoufou.danayahiringtest.domain.dto;

import ci.youssoufou.danayahiringtest.domain.exceptions.PersonInputException;
import ci.youssoufou.danayahiringtest.domain.utils.DatesConverterUtils;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Objects;

@Builder
@Getter
@Setter
@NoArgsConstructor
public class CreatePersonDto {
    private String firstName;
    private String lastName;
    private String birthDate;

    public CreatePersonDto(String firstName, String lastName, String birthDate) {
        if (firstName == null) {
            throw new PersonInputException("First name is require");
        }
        if (lastName == null) {
            throw new PersonInputException("Last name is required");
        }
        DatesConverterUtils.convertStringDateToDateObject(birthDate);
        this.lastName = lastName;
        this.firstName = firstName;
        this.birthDate = birthDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CreatePersonDto createPersonDto = (CreatePersonDto) o;
        return firstName.equals(createPersonDto.firstName) && lastName.equals(createPersonDto.lastName)
                && birthDate.replace("-", " ").replace("/", " ").equals(createPersonDto.birthDate.replace("-", " ").replace("/", " "));
    }

    @Override
    public int hashCode() {
        return Objects.hash(firstName, lastName);
    }
}
