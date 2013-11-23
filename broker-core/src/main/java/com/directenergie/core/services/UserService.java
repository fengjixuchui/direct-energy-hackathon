package com.directenergie.core.services;

import com.directenergie.core.model.User;

public interface UserService {

	public User addUser(String pdl, String token);

	public User getUser(String pdl);
}
