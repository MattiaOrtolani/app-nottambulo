package com.ortocani.backend.repository;

import com.ortocani.backend.entity.LocaleEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LocaleRepository extends JpaRepository<LocaleEntity, Long> {
}
