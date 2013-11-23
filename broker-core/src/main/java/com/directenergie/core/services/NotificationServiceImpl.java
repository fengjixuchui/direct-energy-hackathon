package com.directenergie.core.services;

import java.io.IOException;

import org.springframework.core.io.DefaultResourceLoader;

import com.directenergie.core.model.User;
import com.notnoop.apns.APNS;
import com.notnoop.apns.ApnsService;
import com.notnoop.exceptions.InvalidSSLConfig;
import com.notnoop.exceptions.RuntimeIOException;

public class NotificationServiceImpl implements NotificationService {

	public void sendWarning(User user) throws RuntimeIOException, InvalidSSLConfig, IOException {
		ApnsService service = APNS
				.newService()
				.withCert(new DefaultResourceLoader().getResource("classpath:APNS.p12").getFile().getAbsolutePath(),
						".de.").withProductionDestination().build();
		String payload = APNS.newPayload().alertBody("Youhhououoo!").build();
		service.push(user.getToken(), payload);
	}

}
