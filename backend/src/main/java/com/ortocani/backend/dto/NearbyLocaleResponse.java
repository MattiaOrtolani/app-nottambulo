package com.ortocani.backend.dto;

import com.ortocani.backend.entity.LocaleType;

public record NearbyLocaleResponse(
        Long id,
        String nome,
        Double latitudine,
        Double longitudine,
        LocaleType tipo,
        Double distanzaKm
) {
}
