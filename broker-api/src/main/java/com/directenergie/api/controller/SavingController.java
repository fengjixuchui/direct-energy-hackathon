package com.directenergie.api.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.directenergie.core.services.NotificationService;
import com.directenergie.core.services.SavingService;
import com.directenergie.core.threads.SavingsThread;

@Controller
public class SavingController {

	@RequestMapping(value = "v1/savings", method = RequestMethod.GET, produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseStatus(HttpStatus.OK)
	public void alive() {
		SavingsThread thread = new SavingsThread();
		thread.start();
	}
}
