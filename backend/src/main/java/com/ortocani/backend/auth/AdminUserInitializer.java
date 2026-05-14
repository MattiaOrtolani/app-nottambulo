package com.ortocani.backend.auth;

import com.ortocani.backend.entity.UserEntity;
import com.ortocani.backend.repository.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class AdminUserInitializer implements CommandLineRunner {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public AdminUserInitializer(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void run(String... args) {
        userRepository.findByUsername("admin").orElseGet(() -> {
            UserEntity user = new UserEntity();
            user.setUsername("admin");
            user.setRole("ADMIN");
            user.setPasswordHash(passwordEncoder.encode("admin"));
            return userRepository.save(user);
        });
    }
}
