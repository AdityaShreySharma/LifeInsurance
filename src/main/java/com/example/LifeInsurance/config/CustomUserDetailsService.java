package com.example.LifeInsurance.config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.example.LifeInsurance.model.User;
import com.example.LifeInsurance.repo.UserRepo;

public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private UserRepo userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user1 = userRepository.findByClientEmail(username);
		User user2 = userRepository.findByAdminEmail(username);
		if (user1 != null) {
			System.out.println(user1+"Client");
			return new CustomUserDetails(user1);
		}
		else if(user2 != null) {
			return new CustomUserDetails(user2);
		}
		throw new UsernameNotFoundException("User not found");
	}
}
