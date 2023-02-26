package com.example.LifeInsurance.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.example.LifeInsurance.model.Policy;

@Service
public interface PolicyService {
	List <Policy> getAllPolicies();
    void savePolicy(Policy policy);
    Policy getPolicyById(int id);
    void deletePolicyById(int id);
}
