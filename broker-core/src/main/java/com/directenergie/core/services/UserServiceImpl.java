package com.directenergie.core.services;

import javax.inject.Inject;
import javax.inject.Named;

import com.directenergie.core.model.User;
import com.directenergie.core.repository.UserRepository;

@Named
public class UserServiceImpl implements UserService {

	@Inject
	private UserRepository userRepository;

	public User addUser(String pdl, String token) {
		User user = new User();
		user.setToken(token);
		user.setPdl(pdl);
		userRepository.save(user);
		return user;
	}

	public User getUser(String pdl) {
		return userRepository.findByPdl(pdl);
	}

}
