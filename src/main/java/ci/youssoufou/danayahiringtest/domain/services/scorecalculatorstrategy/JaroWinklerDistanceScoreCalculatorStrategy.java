package ci.youssoufou.danayahiringtest.domain.services.scorecalculatorstrategy;

import ci.youssoufou.danayahiringtest.domain.Person;
import ci.youssoufou.danayahiringtest.domain.dto.PersonWithScoreDto;
import ci.youssoufou.danayahiringtest.domain.mapper.PersonMapper;
import ci.youssoufou.danayahiringtest.domain.utils.ScoreCalculatorStrategyUtils;
import org.apache.commons.text.similarity.JaroWinklerDistance;
import org.mapstruct.factory.Mappers;

import java.util.function.BiFunction;

public class JaroWinklerDistanceScoreCalculatorStrategy implements ScoreCalculatorStrategy {
    private final PersonMapper mapper = Mappers.getMapper(PersonMapper.class);

    @Override
    public PersonWithScoreDto calculateScore(final Person givenPerson, final Person persistedPerson) {
        var givenPersonDto = mapper.toCreatePersonDto(givenPerson);
        var persistedPersonDto = mapper.toCreatePersonDto(persistedPerson);
        return ScoreCalculatorStrategyUtils.performPersonScoreDto(givenPersonDto, persistedPersonDto, checkSimilarity());
    }

    private BiFunction<String, String, Double> checkSimilarity() {
        return (givenPersonFieldValue, persistedPersonFieldValue) -> new JaroWinklerDistance().apply(givenPersonFieldValue, persistedPersonFieldValue);
    }
}
