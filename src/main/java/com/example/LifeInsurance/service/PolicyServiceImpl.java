package com.example.LifeInsurance.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.LifeInsurance.model.Policy;
import com.example.LifeInsurance.repo.PolicyRepo;

@Service
public class PolicyServiceImpl implements PolicyService {
	
	
	@Autowired
	PolicyRepo policyRepository;
	
	@Override
	public List<Policy> getAllPolicies() {
		return policyRepository.findAll();
	}

	@Override
	public void savePolicy(Policy policy) {
		policyRepository.save(policy);
	}

	@Override
	public Policy getPolicyById(int id) {
		Optional<Policy> optional = policyRepository.findById(id);
        Policy policy = null;
        if (optional.isPresent()) {
        	policy = optional.get();
        } else {
            throw new RuntimeException("Policy Not Found");
        }
        return policy;
	}
	
	@Override
	public void deletePolicyById(int id) {
		policyRepository.deleteById(id);
	}
}
