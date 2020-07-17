package pl.com.home.controllers;

import org.springframework.web.bind.annotation.RestController
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.http.ResponseEntity
import pl.com.home.model.Simple
import org.springframework.web.bind.annotation.RequestBody

@RestController
class SimpleController {
	@GetMapping("/simple")
	def getBody() {
		return ResponseEntity.ok(new Simple("f1", "f2", "f3"));
	}

	@PostMapping("/simple")
	def void postBody(@RequestBody Simple simple) {
		println(simple.toString())
	}
}