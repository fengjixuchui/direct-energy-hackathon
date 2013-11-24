package com.directenergie.api.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.directenergie.core.services.IThermostatService;
import com.directenergie.core.services.NotificationService;
import com.directenergie.core.services.SavingService;

@Controller
public class SavingController {


	
	@Inject
	private SavingService savingService;

	@Inject
	private IThermostatService thermostatService;
	
	@Inject
	private NotificationService notificationService;
	
	@RequestMapping(value = "v1/savings", method = RequestMethod.GET, produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseStatus(HttpStatus.OK)
	public void alive() {
	
			notificationService.sendWarning(null);

			try {
				Thread.sleep(15000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			savingService.shutDownDevice("21926");
			thermostatService.baisserTemperature();
			try {
				Thread.sleep(10000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			savingService.powerOnDevice("21926");
			thermostatService.augmenterTemperature();

	}
}
