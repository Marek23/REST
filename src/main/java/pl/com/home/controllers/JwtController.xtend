package pl.com.home.controllers

import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import pl.com.home.model.AuthenticationRequest
import org.springframework.security.authentication.AuthenticationManager
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.authentication.BadCredentialsException
import pl.com.home.security.MyUserDetailsService
import pl.com.home.util.JwtUtil
import org.springframework.http.ResponseEntity
import pl.com.home.model.AuthenticationResponse
import org.springframework.web.bind.annotation.RestController

@RestController
class JwtController {
	@Autowired
	var AuthenticationManager authenticationManager;

	@Autowired
	var MyUserDetailsService userService;

	@Autowired
	var JwtUtil util;

	@PostMapping("/authenticate")
	def createAuthenticationToken(@RequestBody AuthenticationRequest req) throws Exception {
		val user     = req.getUsername() 
		val password = req.getPassword()

		try {
			authenticationManager.authenticate(
				new UsernamePasswordAuthenticationToken(user, password)
			)			
		} catch (BadCredentialsException e) {
			println("Incorrect user/password")
		}

		// jeśli poprawnie się uwierzytelni dla zalogowane jest tworzony jwt
		val details = userService.loadUserByUsername(user)
		val jwt     = util.generateToken(details)

		return ResponseEntity.ok(new AuthenticationResponse(jwt));
	}
}