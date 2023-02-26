package com.example.LifeInsurance.config;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.example.LifeInsurance.model.User;

public class CustomUserDetails implements UserDetails {
	private static final long serialVersionUID = 1L;
	private User user;
     
    public CustomUserDetails(User user) {
        this.user = user;
    }
 
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }
 
    @Override
    public String getPassword() {
        return user.getUserPassword();
    }
 
    @Override
    public String getUsername() {
        return user.getUserEmail();
    }
 
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }
 
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }
 
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }
 
    @Override
    public boolean isEnabled() {
        return true;
    }
     
    public String getFirstName() {
        return user.getUserFirstName();
    }
    
    public String getLastName() {
    	return user.getUserLastName();
    }
}