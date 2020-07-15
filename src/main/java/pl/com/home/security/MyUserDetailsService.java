package pl.com.home.security;

import java.util.ArrayList;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class MyUserDetailsService implements UserDetailsService { 
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		// tutaj implementacja w jaki sposób pobieram użytkownika
		// na podstawie userName zwracam login i hasło
		//sql for db or
		//hardcoded
		return new User("test_user", "test_password", new ArrayList<>());
	}
}
