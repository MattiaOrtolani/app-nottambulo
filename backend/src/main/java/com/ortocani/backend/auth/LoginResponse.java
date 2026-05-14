package com.ortocani.backend.auth;

public record LoginResponse(String token, String username, String role) {
}
