package com.ortocani.backend.dto;

import com.ortocani.backend.entity.LocaleType;

public record LocaleResponse(
        Long id,
        String nome,
        String descrizione,
        Double latitudine,
        Double longitudine,
        LocaleType tipo,
        Double distanzaKm
) {
}
