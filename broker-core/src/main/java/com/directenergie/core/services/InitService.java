package com.directenergie.core.services;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import com.directenergie.core.model.Device;
import com.directenergie.core.model.DeviceDefinition;
import com.directenergie.core.model.DeviceType;
import com.directenergie.core.model.User;

public class InitService {

@Inject
private UserService userService;
	
	public void getMocksUsers(){
		User user1  = userService.addUser("Jean", "Bono", null);
		user1.setDevices(getMockDevice());
		
		User user2 = userService.addUser("Germain", "stair", null);
		user2.setDevices(getMockDevice());
		
		
		User user3  = userService.addUser("Raymond", "Tagne", null);
		user3.setDevices(getMockDevice());
	}
	
	
	public List<Device> getMockDevice(){
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
