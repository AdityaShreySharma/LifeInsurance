package com.example.LifeInsurance.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.example.LifeInsurance.model.Policy;

@Repository
public interface PolicyRepo extends JpaRepository <Policy, Integer> {
	@Query("from Policy as p where p.user.userId =:userId")
    public List<Policy> findPoliciesByUser(@Param("userId")Integer userId);
}
