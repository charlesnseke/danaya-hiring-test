package ci.youssoufou.danayahiringtest.domain.services.scorecalculatorstrategy;

import ci.youssoufou.danayahiringtest.domain.Person;
import ci.youssoufou.danayahiringtest.domain.dto.PersonWithScoreDto;

public interface ScoreCalculatorStrategy {
    PersonWithScoreDto calculateScore(final Person person, final Person persistedPerson) throws Exception;
}
