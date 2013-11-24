package com.directenergie.core.services;

import javax.inject.Inject;
import javax.inject.Named;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;

@Named
public class SavingServiceImpl implements SavingService {

	private ObjectMapper mapper = new ObjectMapper();

	@Inject
	private NotificationService notificationService;

	public void shutDownDevice(String id) {
		Client client = Client.create();
		String authToken = "528b8c5613e4e512548647";

		notificationService.sendWarning(null);

		String baseUrl = "https://api.ijenko.net";
		WebResource webResource = client.resource(baseUrl + "/home/device/" + id + "/powerswitch");

		// get all registered devices
		String registeredDevices = webResource.header("Ijenko-session-id", authToken)
				.header("Ijenko-application-id", "hackaton2013").put(String.class, "{\"state\":\"off\"}");

	}

	public void powerOnDevice(String id) {
		Client client = Client.create();
		String authToken = "528b8c5613e4e512548647";

		String baseUrl = "https://api.ijenko.net";
		WebResource webResource = client.resource(baseUrl + "/home/device/" + id + "/powerswitch");

		// get all registered devices
		String registeredDevices = webResource.header("Ijenko-session-id", authToken)
				.header("Ijenko-application-id", "hackaton2013").put(String.class, "{\"state\":\"on\"}");

	}
}
