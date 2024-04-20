package ci.youssoufou.danayahiringtest.domain.dto;


import ci.youssoufou.danayahiringtest.domain.exceptions.PersonInputException;
import ci.youssoufou.danayahiringtest.domain.utils.DatesConverterUtils;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Objects;

@Builder
@Getter
@Setter
@ToString
public class GetPersonDto {
    private String identity;
    private String firstName;
    private String lastName;
    private String birthDate;

    public GetPersonDto(String identity, String firstName, String lastName, String birthDate) throws PersonInputException {
        if (identity == null) {
            throw new PersonInputException("Identity name must not be empty");
        }
        DatesConverterUtils.convertStringDateToDateObject(birthDate);
        this.identity = identity;
        this.lastName = lastName;
        this.firstName = firstName;
        this.birthDate = birthDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        GetPersonDto createPersonDto = (GetPersonDto) o;
        return identity.equals(createPersonDto.identity) && firstName.equals(createPersonDto.firstName) && lastName.equals(createPersonDto.lastName)
                && birthDate.replace("-", " ").replace("/", " ").equals(createPersonDto.birthDate.replace("-", " ").replace("/", " "));
    }

    @Override
    public int hashCode() {
        return Objects.hash(identity, firstName, lastName);
    }
}
