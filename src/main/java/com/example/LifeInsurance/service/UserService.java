package com.example.LifeInsurance.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.example.LifeInsurance.model.User;

@Service
public interface UserService {
	List <User> getAllUsers();
    void saveUser(User user);
    User getUserById(int id);
    void deleteUserById(int id);
}