package com.directenergie.api.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.directenergie.core.model.Device;
import com.directenergie.core.model.User;
import com.directenergie.core.repository.DeviceRepository;
import com.directenergie.core.repository.UserRepository;

@Controller
@RequestMapping("v1/devices")
public class DeviceController {

	private static final Logger LOGGER = LoggerFactory.getLogger(DeviceController.class);

	@Inject
	private DeviceRepository deviceRepository;

	@Inject
	private UserRepository userRepository;

	@RequestMapping(method = RequestMethod.GET, produces = { MediaType.APPLICATION_JSON_VALUE })
	public List<Device> getAll() {
		LOGGER.debug("Fetching Device catalog");
		return deviceRepository.findAll();
	}

	@RequestMapping(method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_VALUE })
	public void addDevice(Device device, User user) {
		User userResult = userRepository.findOne(user.getId());
		userResult.getDevices().add(device);
	}

	@RequestMapping(method = RequestMethod.DELETE, produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseStatus(HttpStatus.OK)
	public void deleteDevice(Device device) {
		deviceRepository.delete(device.getId());
	}

}