package com.directenergie.api.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.directenergie.core.model.Device;
import com.directenergie.core.model.User;
import com.directenergie.core.services.EffacementService;


@Controller
@RequestMapping("v1/savings/order")
public class OrderController {

	@Inject
	private EffacementService effacementService;
	
	@RequestMapping(method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseStatus(HttpStatus.OK)
	public void effacement(long watt , int minutes) {
		effacementService.effacer(watt,minutes);
	}
	
	
	@RequestMapping(method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseStatus(HttpStatus.OK)
	public void cancelOrder(User user){
		effacementService.cancelOrder(user);
	}
}
