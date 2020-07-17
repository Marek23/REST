package pl.com.home.security.filter

import org.springframework.web.filter.OncePerRequestFilter
import javax.servlet.ServletException
import javax.servlet.FilterChain
import javax.servlet.http.HttpServletResponse
import javax.servlet.http.HttpServletRequest
import java.io.IOException
import org.springframework.beans.factory.annotation.Autowired
import pl.com.home.security.MyUserDetailsService
import pl.com.home.util.JwtUtil
import org.springframework.stereotype.Component
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource

@Component // do dependency injection - informuję spring'a o klasie
class JwtRequestFilter extends OncePerRequestFilter{
	@Autowired
	var MyUserDetailsService userService

	@Autowired
	var JwtUtil util

	override doFilterInternal(
		HttpServletRequest req,
		HttpServletResponse res,
		FilterChain chain
	) throws ServletException, IOException {
		val auth = req.getHeader("Authorization")

		var String jwt  = null
		var String username = null
		if (auth !== null && auth.startsWith("Bearer ")) {
			jwt = auth.substring(7)
			username = util.extractUsername(jwt)
		}

		// drugi warunek, operacja wykonywana, gdy użytkownik nie został jeszcze uwierzytelniony
		// getContext czyli tylko dla konkretnego wątku
		if (username !== null && SecurityContextHolder.getContext().getAuthentication() === null) {
			val details = userService.loadUserByUsername(username)

			if (util.validateToken(jwt, details))
			{
                var usernamePasswordAuthenticationToken =
                	new UsernamePasswordAuthenticationToken(details, null, details.getAuthorities())

                usernamePasswordAuthenticationToken.setDetails(
                	new WebAuthenticationDetailsSource().buildDetails(req)
                )

                SecurityContextHolder.getContext().setAuthentication(
                	usernamePasswordAuthenticationToken
                )
			}
		}

		chain.doFilter(req, res)
	}
}