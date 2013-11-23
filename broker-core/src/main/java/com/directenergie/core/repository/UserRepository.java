package com.directenergie.core.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.directenergie.core.model.User;

public interface UserRepository extends JpaRepository<User, Long> {

	public User findByPdl(String pdl);

}
