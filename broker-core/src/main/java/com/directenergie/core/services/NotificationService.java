package com.directenergie.core.services;

import java.io.IOException;

import com.directenergie.core.model.User;
import com.notnoop.exceptions.InvalidSSLConfig;
import com.notnoop.exceptions.RuntimeIOException;

public interface NotificationService {

	void sendWarning(User user) throws RuntimeIOException;


}
