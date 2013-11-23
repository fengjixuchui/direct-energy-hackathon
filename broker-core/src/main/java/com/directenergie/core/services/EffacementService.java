package com.directenergie.core.services;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import com.directenergie.core.model.Device;
import com.directenergie.core.model.User;
import com.directenergie.core.repository.UserRepository;

@Named
public class EffacementService {
	
	@Inject
	private UserRepository userRepository;
	
	@Inject
	private NotificationService notificationService;
	
	@Inject
	private IDomotiqueService domotiqueService;
	
	private List<User> users;
	
	public void effacer(long watt, int minutes) {
		
		
		this.users = userRepository.findAll();
		
		
		//Envoi d'une notification a tout les utilisateurs pour qui les devices vont 
		// s'eteindre
		for(User user : users ){
			notificationService.sendWarning(user);
		}
		
		
		//Attente de 20Seconde
		try {
			Thread.sleep(20000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		for(User u : users){
			for(Device d : u.getDevices()){
				domotiqueService.stopDevice(d);
			}
		}
	}

	public void cancelOrder(User user) {
		users.remove(user);

		for(Device d : user.getDevices()){
			domotiqueService.stopDevice(d);
		}
	}

}
