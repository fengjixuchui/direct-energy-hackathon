package com.directenergie.core.services;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.directenergie.core.configuration.CoreTestConfiguration;
import com.directenergie.core.model.User;
import com.notnoop.exceptions.InvalidSSLConfig;
import com.notnoop.exceptions.RuntimeIOException;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { CoreTestConfiguration.class })
public class NotificationServiceImplTest {

	@Inject
	private UserService userService;

	@Inject
	private InitService initService;

	@Test
	public void testSendWarning() throws RuntimeIOException, InvalidSSLConfig, IOException {
		List<User> users = initService.createUsers();
		new NotificationServiceImpl().sendWarning(users.get(1));
	}
}
