package com.ortocani.backend.dto;

import com.ortocani.backend.entity.LocaleType;
import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public record CreateLocaleRequest(
        @NotBlank(message = "Il nome e' obbligatorio")
        @Size(max = 120, message = "Il nome non puo' superare 120 caratteri")
        String nome,
        @NotBlank(message = "La descrizione e' obbligatoria")
        @Size(max = 1200, message = "La descrizione non puo' superare 1200 caratteri")
        String descrizione,
        @NotNull(message = "La latitudine e' obbligatoria")
        @DecimalMin(value = "-90.0", message = "Latitudine non valida")
        @DecimalMax(value = "90.0", message = "Latitudine non valida")
        Double latitudine,
        @NotNull(message = "La longitudine e' obbligatoria")
        @DecimalMin(value = "-180.0", message = "Longitudine non valida")
        @DecimalMax(value = "180.0", message = "Longitudine non valida")
        Double longitudine,
        @NotNull(message = "Il tipo e' obbligatorio")
        LocaleType tipo
) {
}
