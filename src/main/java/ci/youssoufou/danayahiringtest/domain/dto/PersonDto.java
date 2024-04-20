package ci.youssoufou.danayahiringtest.domain.dto;

import lombok.*;

import java.util.Objects;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
@Getter
@Setter
public class PersonDto {
    private String identity;
    private String firstName;
    private String lastName;
    private String birthDate;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PersonDto createPersonDto = (PersonDto) o;
        return firstName.equals(createPersonDto.firstName) && lastName.equals(createPersonDto.lastName)
                && birthDate.replace("-", " ").replace("/", " ").equals(createPersonDto.birthDate.replace("-", " ").replace("/", " "));
    }

    @Override
    public int hashCode() {
        return Objects.hash(firstName, lastName);
    }
}
