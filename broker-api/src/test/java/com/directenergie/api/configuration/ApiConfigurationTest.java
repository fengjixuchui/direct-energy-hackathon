package com.directenergie.api.configuration;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.directenergie.api.configuration.ApiConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ApiConfiguration.class })
public class ApiConfigurationTest {

	@Test
	public void dummy() {

	}

}
