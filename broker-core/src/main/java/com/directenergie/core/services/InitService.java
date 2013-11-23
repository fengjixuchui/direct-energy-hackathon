package com.directenergie.core.services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import com.directenergie.core.model.Device;
import com.directenergie.core.model.DeviceDefinition;
import com.directenergie.core.model.DeviceType;
import com.directenergie.core.model.User;

@Named
public class InitService {

	@Inject
	private UserService userService;

	public List<User> createUsers() {
		User user1 = userService.addUser("12345678234234",
				"3eb5f7d44c31dde66c4c8eb1b3bd643c6fa04755be05e96b63088d496abc1e57");
		user1.setDevices(createDevices());
		user1.setLatitude(getPositionRandom());
		user1.setLongitude(getPositionRandom());

		User user2 = userService.addUser("67786546324456",
				"8fa4521f25a03c4de2a94dcf74b937cdc9add69e6e1f045d721926a62ef7eecf");
		user2.setDevices(createDevices());
		user2.setLatitude(getPositionRandom());
		user2.setLongitude(getPositionRandom());

		return Arrays.asList(user1, user2);
	}

	private double getPositionRandom() {
		return Math.random() * 90;
	}

	public List<Device> createDevices() {
		List<Device> devices = new ArrayList<Device>();

		Device result = new Device();
		DeviceDefinition devdef = new DeviceDefinition();
		devdef.setName("mon home cinema");
		devdef.setType(DeviceType.TV);
		result.setDeviceDefinition(devdef);
		result.setInUse(false);
		devices.add(result);

		Device result2 = new Device();
		DeviceDefinition devdef2 = new DeviceDefinition();
		devdef2.setName("ma lampe du salon");
		devdef2.setType(DeviceType.LIGHT);
		result2.setDeviceDefinition(devdef2);
		result2.setInUse(false);

		Device result3 = new Device();
		DeviceDefinition devDef3 = new DeviceDefinition();
		devDef3.setName("Mon chauffe eau");
		devDef3.setType(DeviceType.BOILER);
		result3.setDeviceDefinition(devDef3);
		result3.setInUse(true);

		Device result4 = new Device();
		DeviceDefinition devDef4 = new DeviceDefinition();
		devDef4.setName("mon lave linge");
		devDef4.setType(DeviceType.WASHING_MACHINE);
		result4.setDeviceDefinition(devDef4);
		result4.setInUse(true);

		return devices;
	}
}
