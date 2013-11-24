package com.directenergie.core.services;

import java.io.IOException;

import javax.inject.Named;

import org.springframework.core.io.DefaultResourceLoader;

import com.directenergie.core.model.User;
import com.notnoop.apns.APNS;
import com.notnoop.apns.ApnsService;
import com.notnoop.exceptions.InvalidSSLConfig;
import com.notnoop.exceptions.RuntimeIOException;

@Named
public class NotificationServiceImpl implements NotificationService {

	public void sendWarning(User user) throws RuntimeIOException {
		ApnsService service;
		try {
			service = APNS
					.newService()
					.withCert(
							new DefaultResourceLoader().getResource("classpath:APNS.p12").getFile().getAbsolutePath(),
							".de.").withProductionDestination().build();

			String envoi = "Instagrid Info : equilibrage de la demande en energie nécessaire...";

			String payload = APNS.newPayload().alertBody(envoi).build();
			service.push("8ca0d1336c9a15ef2745f1a3bca072628598aee71ccc96a41a186edaacd95f5d", payload);
		} catch (InvalidSSLConfig e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
