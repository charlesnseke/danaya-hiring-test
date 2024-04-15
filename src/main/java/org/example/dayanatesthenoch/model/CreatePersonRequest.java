package org.example.dayanatesthenoch.model;

import jakarta.validation.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

public record CreatePersonRequest(@NotBlank String id,
        @NotBlank String firstName, @NotBlank String lastName, @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) String dateOfBirth) {
}
