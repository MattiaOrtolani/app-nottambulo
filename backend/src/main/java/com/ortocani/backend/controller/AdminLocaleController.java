package com.ortocani.backend.controller;

import com.ortocani.backend.dto.CreateLocaleRequest;
import com.ortocani.backend.dto.LocaleResponse;
import com.ortocani.backend.dto.UpdateLocaleRequest;
import com.ortocani.backend.service.LocaleService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/admin/locali")
public class AdminLocaleController {

    private final LocaleService localeService;

    public AdminLocaleController(LocaleService localeService) {
        this.localeService = localeService;
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public LocaleResponse create(@Valid @RequestBody CreateLocaleRequest request) {
        return localeService.create(request);
    }

    @PutMapping("/{id}")
    public LocaleResponse update(@PathVariable Long id, @Valid @RequestBody UpdateLocaleRequest request) {
        return localeService.update(id, request);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long id) {
        localeService.delete(id);
    }
}
