package com.ortocani.backend.dto;

import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotNull;

public record NearbySearchRequest(
        @NotNull(message = "La latitudine e' obbligatoria")
        @DecimalMin(value = "-90.0", message = "Latitudine non valida")
        @DecimalMax(value = "90.0", message = "Latitudine non valida")
        Double latitudine,
        @NotNull(message = "La longitudine e' obbligatoria")
        @DecimalMin(value = "-180.0", message = "Longitudine non valida")
        @DecimalMax(value = "180.0", message = "Longitudine non valida")
        Double longitudine
) {
}
