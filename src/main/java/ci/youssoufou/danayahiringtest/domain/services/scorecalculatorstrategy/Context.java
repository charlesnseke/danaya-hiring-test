package ci.youssoufou.danayahiringtest.domain.services.scorecalculatorstrategy;

import ci.youssoufou.danayahiringtest.domain.Person;
import ci.youssoufou.danayahiringtest.domain.dto.PersonWithScoreDto;

public class Context {
    private ScoreCalculatorStrategy scoreCalculatorStrategy;

    public PersonWithScoreDto apply(final Person actualPerson, final Person persistedPerson) throws Exception {
        return scoreCalculatorStrategy.calculateScore(actualPerson, persistedPerson);
    }

    public void setStrategy(ScoreCalculatorStrategy scoreCalculatorStrategy) {
        this.scoreCalculatorStrategy = scoreCalculatorStrategy;
    }
}
