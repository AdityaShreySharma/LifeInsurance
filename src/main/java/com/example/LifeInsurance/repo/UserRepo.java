package com.example.LifeInsurance.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.example.LifeInsurance.model.User;

@Repository
public interface UserRepo extends JpaRepository<User, Integer> {
	
	@Query("SELECT u FROM User u WHERE u.userEmail = ?1 and u.userRole = 'Admin'")
	public User findByAdminEmail(String email);
	
	@Query("SELECT u FROM User u WHERE u.userEmail = ?1 and u.userRole = 'Client'")
	public User findByClientEmail(String email);
}