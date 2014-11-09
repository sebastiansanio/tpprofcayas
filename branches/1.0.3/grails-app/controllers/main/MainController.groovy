package main

import login.User

import org.apache.shiro.SecurityUtils

class MainController {

	
	def index () { 
		
		User user = User.findByUsername(SecurityUtils.getSubject().getPrincipal())
		
		[user:user]
	}
}
