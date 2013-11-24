package com.directenergie.core.threads;

import javax.inject.Inject;

import com.directenergie.core.services.NotificationService;
import com.directenergie.core.services.SavingService;

public class SavingsThread extends Thread {

	
	@Inject
	private SavingService savingService;

	
	@Inject
	private NotificationService notificationService;
	
	
	@Override
	public void run() {
		super.run();
		notificationService.sendWarning(null);

		try {
			Thread.sleep(15000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		savingService.shutDownDevice("21926");

		try {
			Thread.sleep(10000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		savingService.powerOnDevice("21926");
	}

}
