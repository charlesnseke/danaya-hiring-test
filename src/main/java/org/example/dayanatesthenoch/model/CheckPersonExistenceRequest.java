package org.example.dayanatesthenoch.model;

import jakarta.validation.constraints.NotBlank;

public record CheckPersonExistenceRequest(@NotBlank String id, String firstName, String lastName, String dateOfBirth) {
}
