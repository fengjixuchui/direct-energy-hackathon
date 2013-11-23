package com.directenergie.core.configuration;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.directenergie.core.configuration.CoreConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { CoreConfiguration.class })
public class CoreConfigurationTest {

	@Test
	public void dummy() {

	}

}