package com.directenergie.core.services;

import com.directenergie.core.model.Device;

public interface IDomotiqueService {

	public void stopDevice(Device device);
	
	public void restartDevice(Device device);
	
}