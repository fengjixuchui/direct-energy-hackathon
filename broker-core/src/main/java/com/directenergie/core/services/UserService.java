package com.directenergie.core.services;

import com.directenergie.core.model.User;

public interface UserService {

	public User addUser(String firstName, String lastName, String token);
}
