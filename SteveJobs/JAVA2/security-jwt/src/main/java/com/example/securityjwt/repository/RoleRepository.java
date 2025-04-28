package com.example.securityjwt.repository;

import com.example.securityjwt.model.ERole;
import com.example.securityjwt.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Optional<Role> findByName(ERole name);
}