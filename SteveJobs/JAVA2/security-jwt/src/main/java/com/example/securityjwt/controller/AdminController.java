package com.example.securityjwt.controller;

import com.example.securityjwt.model.ERole;
import com.example.securityjwt.model.Role;
import com.example.securityjwt.model.User;
import com.example.securityjwt.repository.RoleRepository;
import com.example.securityjwt.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import java.util.*;

@RestController
@RequestMapping("/api/admin")
public class AdminController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/hello")
    public String helloAdmin() {
        return "Hello ADMIN only!";
    }
    @PostMapping("/register")
    public Map<String, Object> registerUser(@RequestBody Map<String, String> request) {
        String username = request.get("username");
        String password = request.get("password");
        String roleStr = request.getOrDefault("role", "ROLE_USER");
        if (userRepository.existsByUsername(username)) {
            return Map.of("error", "Username already exists");
        }
        User newUser = new User(username, passwordEncoder.encode(password));
        Optional<Role> role = roleRepository.findByName(ERole.valueOf(roleStr));
        if (role.isPresent()) {
            newUser.setRoles(Set.of(role.get()));
            userRepository.save(newUser);
            return Map.of("message", "User registered successfully");
        } else {
            return Map.of("error", "Role not found");
        }
    }
}