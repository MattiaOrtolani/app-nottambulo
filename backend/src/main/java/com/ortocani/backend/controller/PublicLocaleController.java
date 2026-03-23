package com.ortocani.backend.controller;

import com.ortocani.backend.dto.LocaleResponse;
import com.ortocani.backend.dto.NearbyLocaleResponse;
import com.ortocani.backend.service.LocaleService;
import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import java.util.List;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Validated
@RestController
@RequestMapping("/api/locali")
public class PublicLocaleController {

    private final LocaleService localeService;

    public PublicLocaleController(LocaleService localeService) {
        this.localeService = localeService;
    }

    @GetMapping
    public List<LocaleResponse> getAll() {
        return localeService.getAll();
    }

    @GetMapping("/{id}")
    public LocaleResponse getById(@PathVariable Long id) {
        return localeService.getById(id);
    }

    @GetMapping("/nearby")
    public List<NearbyLocaleResponse> getNearby(
            @RequestParam("lat")
            @NotNull(message = "La latitudine e' obbligatoria")
            @DecimalMin(value = "-90.0", message = "Latitudine non valida")
            @DecimalMax(value = "90.0", message = "Latitudine non valida")
            Double latitudine,
            @RequestParam("lon")
            @NotNull(message = "La longitudine e' obbligatoria")
            @DecimalMin(value = "-180.0", message = "Longitudine non valida")
            @DecimalMax(value = "180.0", message = "Longitudine non valida")
            Double longitudine,
            @RequestParam(name = "limit", defaultValue = "10")
            @Min(value = 1, message = "Il limite minimo e' 1")
            @Max(value = 300, message = "Il limite massimo e' 300")
            Integer limit
    ) {
        return localeService.findNearby(latitudine, longitudine, limit);
    }
}
