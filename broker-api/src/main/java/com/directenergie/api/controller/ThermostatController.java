package com.directenergie.api.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.directenergie.core.services.IThermostatService;

@Controller
public class ThermostatController {

	@Inject
	private IThermostatService thermostatService;
		
	@RequestMapping(value = "v1/thermostat/up", method = RequestMethod.GET, produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseStatus(HttpStatus.OK)
	public void thermostatUp() {
		thermostatService.augmenterTemperature();
	}
	
	@RequestMapping(value = "v1/thermostat/down", method = RequestMethod.GET, produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseStatus(HttpStatus.OK)
	public void thermostatDown() {
		thermostatService.baisserTemperature();
	}
	
}
