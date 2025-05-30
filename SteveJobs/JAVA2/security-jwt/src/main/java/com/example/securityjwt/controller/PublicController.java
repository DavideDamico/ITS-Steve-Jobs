package com.example.securityjwt.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/public")
public class PublicController {
    @GetMapping("/info")
    public String publicInfo() {
        return "Public information accessible without authentication.";
    }
}