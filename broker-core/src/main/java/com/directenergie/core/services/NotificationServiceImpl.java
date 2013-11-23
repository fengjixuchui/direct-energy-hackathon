package com.directenergie.core.services;

import java.io.IOException;
import java.util.List;

import javax.inject.Named;

import org.springframework.core.io.DefaultResourceLoader;

import com.directenergie.core.model.Device;
import com.directenergie.core.model.User;
import com.notnoop.apns.APNS;
import com.notnoop.apns.ApnsService;
import com.notnoop.exceptions.InvalidSSLConfig;
import com.notnoop.exceptions.RuntimeIOException;

@Named
public class NotificationServiceImpl implements NotificationService {

	public void sendWarning(User user) throws RuntimeIOException{
		ApnsService service;
		try {
			service = APNS
					.newService()
					.withCert(new DefaultResourceLoader().getResource("classpath:APNS.p12").getFile().getAbsolutePath(),
							".de.").withProductionDestination().build();
			
			String envoi = "Nous allons procéder a l'extinction de ";
			for(Device d : user.getDevices()){
				if(envoi.length() > 100) break;
				envoi += d.getDeviceDefinition().getName()+", ";
			}
			envoi = envoi.substring(0, envoi.length()-2)+".";
			
			String payload = APNS.newPayload().alertBody(envoi).build();
			service.push(user.getToken(), payload);
		} catch (InvalidSSLConfig e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
