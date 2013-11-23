package com.directenergie.core.services;

import javax.inject.Inject;
import javax.inject.Named;

import com.directenergie.core.model.User;
import com.directenergie.core.repository.UserRepository;

@Named
public class UserServiceImpl implements UserService {

	@Inject
	private UserRepository userRepository;

	public User addUser(String firstName, String lastName, String token) {
		User user = new User();
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setToken(token);
		userRepository.save(user);
		
		return user;
	}

}
