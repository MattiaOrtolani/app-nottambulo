package com.ortocani.backend.service;

import com.ortocani.backend.dto.CreateLocaleRequest;
import com.ortocani.backend.dto.LocaleResponse;
import com.ortocani.backend.dto.UpdateLocaleRequest;
import com.ortocani.backend.entity.LocaleEntity;
import com.ortocani.backend.exception.ResourceNotFoundException;
import com.ortocani.backend.repository.LocaleRepository;
import java.util.Comparator;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LocaleService {

    private static final double EARTH_RADIUS_KM = 6371.0d;

    private final LocaleRepository localeRepository;

    public LocaleService(LocaleRepository localeRepository) {
        this.localeRepository = localeRepository;
    }

    @Transactional(readOnly = true)
    public List<LocaleResponse> getAll() {
        return localeRepository.findAll().stream()
                .map(entity -> toResponse(entity, null))
                .toList();
    }

    @Transactional(readOnly = true)
    public LocaleResponse getById(Long id) {
        return toResponse(getEntity(id), null);
    }

    public LocaleResponse create(CreateLocaleRequest request) {
        LocaleEntity entity = new LocaleEntity();
        applyRequest(entity, request.nome(), request.descrizione(), request.latitudine(), request.longitudine(), request.tipo());
        return toResponse(localeRepository.save(entity), null);
    }

    public LocaleResponse update(Long id, UpdateLocaleRequest request) {
        LocaleEntity entity = getEntity(id);
        applyRequest(entity, request.nome(), request.descrizione(), request.latitudine(), request.longitudine(), request.tipo());
        return toResponse(localeRepository.save(entity), null);
    }

    public void delete(Long id) {
        LocaleEntity entity = getEntity(id);
        localeRepository.delete(entity);
    }

    @Transactional(readOnly = true)
    public List<LocaleResponse> findNearby(double latitude, double longitude) {
        return localeRepository.findAll().stream()
                .map(entity -> toResponse(entity, haversine(latitude, longitude, entity.getLatitudine(), entity.getLongitudine())))
                .sorted(Comparator.comparing(LocaleResponse::distanzaKm))
                .limit(10)
                .toList();
    }

    private LocaleEntity getEntity(Long id) {
        return localeRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Locale con id " + id + " non trovato"));
    }

    private void applyRequest(LocaleEntity entity, String nome, String descrizione, Double latitudine, Double longitudine,
                              com.ortocani.backend.entity.LocaleType tipo) {
        entity.setNome(nome);
        entity.setDescrizione(descrizione);
        entity.setLatitudine(latitudine);
        entity.setLongitudine(longitudine);
        entity.setTipo(tipo);
    }

    private LocaleResponse toResponse(LocaleEntity entity, Double distanzaKm) {
        return new LocaleResponse(
                entity.getId(),
                entity.getNome(),
                entity.getDescrizione(),
                entity.getLatitudine(),
                entity.getLongitudine(),
                entity.getTipo(),
                distanzaKm == null ? null : Math.round(distanzaKm * 100.0d) / 100.0d
        );
    }

    private double haversine(double lat1, double lon1, double lat2, double lon2) {
        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);
        double originLat = Math.toRadians(lat1);
        double targetLat = Math.toRadians(lat2);

        double a = Math.pow(Math.sin(dLat / 2), 2)
                + Math.cos(originLat) * Math.cos(targetLat) * Math.pow(Math.sin(dLon / 2), 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        return EARTH_RADIUS_KM * c;
    }
}
