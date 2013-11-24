package com.directenergie.core.services;

import java.io.IOException;

import javax.inject.Inject;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.directenergie.core.configuration.CoreTestConfiguration;
import com.notnoop.exceptions.InvalidSSLConfig;
import com.notnoop.exceptions.RuntimeIOException;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { CoreTestConfiguration.class })
public class SavingServiceImplTest {

	@Inject
	private SavingService savingService;

	@Ignore
	@Test
	public void test() throws RuntimeIOException, InvalidSSLConfig, IOException {
		savingService.shutDownDevice("21926");

	}
}
