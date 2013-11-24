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

			String envoi = "Instagrid Info : equilibrage de la demande en energie nécessaire";

			String payload = APNS.newPayload().alertBody(envoi).build();
			service.push("8fa4521f25a03c4de2a94dcf74b937cdc9add69e6e1f045d721926a62ef7eecf", payload);
		} catch (InvalidSSLConfig e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
