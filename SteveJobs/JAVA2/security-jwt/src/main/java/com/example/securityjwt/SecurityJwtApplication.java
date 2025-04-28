package com.example.securityjwt;

import com.example.securityjwt.model.ERole;
import com.example.securityjwt.model.Role;
import com.example.securityjwt.model.User;
import com.example.securityjwt.repository.RoleRepository;
import com.example.securityjwt.repository.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import java.util.HashSet;

@SpringBootApplication
public class SecurityJwtApplication {
    public static void main(String[] args) {
        SpringApplication.run(SecurityJwtApplication.class, args);
    }

    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    CommandLineRunner run(UserRepository userRepository, RoleRepository roleRepository,
    PasswordEncoder passwordEncoder) {
        return args -> {
            if (roleRepository.findAll().isEmpty()) {
                roleRepository.save(new Role(ERole.ROLE_USER));
                roleRepository.save(new Role(ERole.ROLE_ADMIN));
            }

            if (userRepository.findByUsername("admin").isEmpty()) {
                var admin = new User("admin", passwordEncoder.encode("admin123"));
                var adminRoles = new HashSet<Role>();
                adminRoles.add(roleRepository.findByName(ERole.ROLE_ADMIN).get());
                admin.setRoles(adminRoles);
                userRepository.save(admin);
            }

            if (userRepository.findByUsername("user").isEmpty()) {
                var user = new User("user", passwordEncoder.encode("user123"));
                var userRoles = new HashSet<Role>();
                userRoles.add(roleRepository.findByName(ERole.ROLE_USER).get());
                user.setRoles(userRoles);
                userRepository.save(user);
            }
        };
    }
}