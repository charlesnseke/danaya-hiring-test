package ci.youssoufou.danayahiringtest.domain.dto;

import lombok.*;

import java.util.Objects;

@Builder
@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class PersonWithScoreDto {
    private ScoreField firstNameWithScore;
    private ScoreField lastNameWithScore;
    private ScoreField birthDateWithScore;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PersonWithScoreDto that = (PersonWithScoreDto) o;
        return firstNameWithScore.equals(that.firstNameWithScore) && lastNameWithScore.equals(that.lastNameWithScore);
    }

    @Override
    public int hashCode() {
        return Objects.hash(firstNameWithScore, lastNameWithScore);
    }
}
