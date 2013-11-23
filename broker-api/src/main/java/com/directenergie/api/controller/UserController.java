package com.directenergie.api.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.directenergie.core.services.UserService;


@Controller
@RequestMapping("user")
public class UserController {

@Inject
private UserService userService;

		@RequestMapping(method = RequestMethod.GET, produces = { MediaType.APPLICATION_JSON_VALUE })
		@ResponseStatus(HttpStatus.OK)
		public void create(String firstName , String lastName , String token) {
			userService.addUser(firstName, lastName, token);
		}
}
