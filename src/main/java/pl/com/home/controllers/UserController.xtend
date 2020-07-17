package pl.com.home.controllers;

import pl.com.home.model.User

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PathVariable

@RestController
class UserController {
	@GetMapping("/user/{id}/{name}")
	def User greeting(@PathVariable int id, @PathVariable String name) {
		new User(id, name)
	}
}