package ci.youssoufou.danayahiringtest.domain.dto;

import lombok.Builder;

@Builder
public record ScoreField(String field, Double score) {
}
