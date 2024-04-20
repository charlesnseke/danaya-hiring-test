package ci.youssoufou.danayahiringtest.domain.utils;


import ci.youssoufou.danayahiringtest.domain.dto.CreatePersonDto;
import ci.youssoufou.danayahiringtest.domain.dto.PersonWithScoreDto;
import ci.youssoufou.danayahiringtest.domain.dto.ScoreField;
import lombok.experimental.UtilityClass;
import org.apache.commons.text.WordUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import java.util.function.Predicate;

@UtilityClass
public class ScoreCalculatorStrategyUtils {

    private Logger logger = LoggerFactory.getLogger(ScoreCalculatorStrategyUtils.class);

    public PersonWithScoreDto performPersonScoreDto(final CreatePersonDto givenCreatePersonDto, final CreatePersonDto persistedCreatePersonDto, final BiFunction<String, String, Double> calculatorAlgorithm) {
        var personWithScoreDto = new PersonWithScoreDto();
        var personFields = getObjectFields(givenCreatePersonDto);
        Arrays.stream(personFields)
                .filter(notIncludeIdentity())
                .forEach(ScoreCalculatorStrategyUtils.evaluateAndFillPersonScoreDto(personWithScoreDto, givenCreatePersonDto, persistedCreatePersonDto, calculatorAlgorithm));
        return personWithScoreDto;
    }

    private Consumer<Field> evaluateAndFillPersonScoreDto(final PersonWithScoreDto personWithScoreDto, final CreatePersonDto givenCreatePersonDto, final CreatePersonDto persistedCreatePersonDto, final BiFunction<String, String, Double> calculatorAlgorithm) {
        return currentField -> {
            try {
                fillPersonWithScoreFields(currentField, givenCreatePersonDto, persistedCreatePersonDto, personWithScoreDto, calculatorAlgorithm);
            } catch (Exception e) {
                logger.info("given {} and {} when evaluateAndFillPersonScoreDto: thrown {} ", givenCreatePersonDto, persistedCreatePersonDto, e.getMessage());
            }
        };
    }

    private void fillPersonWithScoreFields(final Field field, final CreatePersonDto givenCreatePersonDto, final CreatePersonDto persistedCreatePersonDto, final PersonWithScoreDto personWithScoreDto, final BiFunction<String, String, Double> calculatorAlgorithm) throws Exception {
        var setterName = "set" + WordUtils.capitalize(field.getName()) + "WithScore";
        var setterPersonWithScoreDto = personWithScoreDto.getClass().getMethod(setterName, ScoreField.class);
        var givenPersonValue = getPersonFieldValueByFieldName(givenCreatePersonDto, field.getName());
        var persistedPersonValue = getPersonFieldValueByFieldName(persistedCreatePersonDto, field.getName());
        var scoreFieldValue = roundToPercentage(calculatorAlgorithm.apply(givenPersonValue, persistedPersonValue));
        var scoreField = buildFieldScoreAndSetValue(getPersonFieldValueByFieldName(givenCreatePersonDto, field.getName()), scoreFieldValue);
        setterPersonWithScoreDto.invoke(personWithScoreDto, scoreField);

    }

    private Double roundToPercentage(final Double score) {
        return Math.round(score * 100_000) / 1000.0;
    }

    private Field[] getObjectFields(final Object object) {
        return object.getClass().getDeclaredFields();
    }


    private static Predicate<Field> notIncludeIdentity() {
        return currentField -> !currentField.getName().equals("identity");
    }

    private String getPersonFieldValueByFieldName(final CreatePersonDto person, String fieldName) throws NoSuchFieldException, IllegalAccessException {
        var field = person.getClass().getDeclaredField(fieldName);
        field.setAccessible(true);
        return (String) field.get(person);
    }

    private ScoreField buildFieldScoreAndSetValue(final String fieldValue, final Double fieldScore) {
        return ScoreField.builder().field(fieldValue).score(fieldScore).build();
    }
}
