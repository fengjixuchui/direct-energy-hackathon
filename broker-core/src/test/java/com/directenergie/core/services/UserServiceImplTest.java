package com.directenergie.core.services;

import java.util.List;

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

		userService.addUser("Guillaume", "LEGALL", "abcd123");

		List<User> users = userRepository.findByFirstNameLike("Gui%");
		Assert.assertEquals(1, users.size());
		Assert.assertEquals("Guillaume", users.get(0).getFirstName());
		Assert.assertEquals("LEGALL", users.get(0).getLastName());
		Assert.assertEquals("abcd123", users.get(0).getToken());
	}
}
