package ci.youssoufou.danayahiringtest.domain;

import lombok.*;

import java.time.LocalDate;

@Builder
@Getter
@Setter
@EqualsAndHashCode
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Person {
    private String identity;
    private String lastName;
    private String firstName;
    private LocalDate birthDate;
}
