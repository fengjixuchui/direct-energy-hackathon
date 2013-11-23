package com.directenergie.core.services;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import com.directenergie.core.model.Device;
import com.directenergie.core.model.User;
import com.directenergie.core.repository.UserRepository;
import com.notnoop.exceptions.InvalidSSLConfig;
import com.notnoop.exceptions.RuntimeIOException;

public class EffacementService {

	
	@Inject
	private UserRepository userRepository;
	
	@Inject
	private NotificationService notificationService;
	
	private List<User> users;
	
	public void effacer(long watt, int minutes) {
		this.users = userRepository.findAll();
		for(User user : users ){
					notificationService.sendWarning(user);
		}
		
		
		try {
			Thread.sleep(20000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}


	public void cancelOrder(User user) {
		users.remove(user);
		
		for(Device d : user.getDevices()){
			
		}
	}

}
