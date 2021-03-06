package com.directenergie.core.services;

import javax.inject.Inject;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.directenergie.core.configuration.CoreTestConfiguration;
import com.directenergie.core.model.User;
import com.directenergie.core.repository.UserRepository;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { CoreTestConfiguration.class })
public class UserServiceImplTest {

	@Inject
	private UserRepository userRepository;

	@Inject
	private UserService userService;

	@Test
	public void testUser() {

		userService.addUser("abcd123", "123458765432");

		User user = userRepository.findByPdl("abcd123");
		Assert.assertEquals("abcd123", user.getPdl());
		Assert.assertEquals("123458765432", user.getToken());
	}
}
