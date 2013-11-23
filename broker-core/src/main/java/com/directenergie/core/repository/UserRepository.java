package com.directenergie.core.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.directenergie.core.model.Device;
import com.directenergie.core.model.User;

public interface UserRepository extends JpaRepository<User, Long> {

	List<User> findByFirstNameLike(String firstName);

	User findById(Long id);


}
