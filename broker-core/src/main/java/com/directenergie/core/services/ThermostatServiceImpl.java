package com.directenergie.core.services;

import javax.inject.Named;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;


@Named
public class ThermostatServiceImpl implements IThermostatService{

	@Override
	public void augmenterTemperature() {
		Client client = Client.create();
		String authToken = "528b8c5613e4e512548647";

		String baseUrl = "https://api.ijenko.net";
		WebResource webResource = client.resource(baseUrl + "/home/mode");

		
		// get all registered devices
		String registeredDevices = webResource.header("Ijenko-session-id", authToken)
				.header("Ijenko-application-id", "hackaton2013").put(String.class, "{\"value\":\"D\"}");

		
//		// get all registered devices
//		String registeredDevices = webResource.header("Ijenko-session-id", authToken)
//				.header("Ijenko-application-id", "hackaton2013").put(String.class, "{\"state\":\"off\"}");

	}

	@Override
	public void baisserTemperature() {
		Client client = Client.create();
		String authToken = "528b8c5613e4e512548647";

		String baseUrl = "https://api.ijenko.net";
		WebResource webResource = client.resource(baseUrl + "/home/mode");

		
		// get all registered devices
		String registeredDevices = webResource.header("Ijenko-session-id", authToken)
				.header("Ijenko-application-id", "hackaton2013").put(String.class, "{\"value\":\"A\"}");
	
	}

}
