package com.directenergie.core.repository;

import java.util.List;

import javax.inject.Inject;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.directenergie.core.configuration.CoreTestConfiguration;
import com.directenergie.core.model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { CoreTestConfiguration.class })
public class PersistenceTest {

	@Inject
	private UserRepository userRepository;

	@Test
	public void testUser() {
		User user = new User();
		user.setFirstName("Guillaume");
		user.setLastName("LEGALL");
		user = userRepository.save(user);

		List<User> users = userRepository.findByFirstNameLike("Gui%");
		Assert.assertEquals(1, users.size());
		Assert.assertEquals(user.getId(), users.get(0).getId());
	}
}
