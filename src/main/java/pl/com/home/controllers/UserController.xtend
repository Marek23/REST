package pl.com.home.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PathVariable
import pl.com.home.logic.User

@RestController
class UserController {
	@GetMapping("/user/{id}/{name}")
	def User greeting(@PathVariable int id, @PathVariable String name) {
		new User(id, name)
	}
}