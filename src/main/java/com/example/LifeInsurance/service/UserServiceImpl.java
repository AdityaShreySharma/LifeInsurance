package com.example.LifeInsurance.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.LifeInsurance.model.User;
import com.example.LifeInsurance.repo.UserRepo;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepo userRepo;
	
	@Override
	public List<User> getAllUsers() {
		return userRepo.findAll();
	}

	@Override
	public void saveUser(User user) {
		userRepo.save(user);
	}

	@Override
	public User getUserById(int id) {
		Optional<User> optional = userRepo.findById(id);
        User user = null;
        if (optional.isPresent()) {
            user = optional.get();
        } 
        else {
            throw new RuntimeException("User Not Found");
        }
        return user;
	}

	@Override
	public void deleteUserById(int id) {
		userRepo.deleteById(id);
	}
}
