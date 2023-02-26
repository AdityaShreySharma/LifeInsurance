package com.example.LifeInsurance.controller;

import java.math.BigDecimal;
import java.math.MathContext;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.LifeInsurance.model.Policy;
import com.example.LifeInsurance.model.User;
import com.example.LifeInsurance.repo.PolicyRepo;
import com.example.LifeInsurance.repo.UserRepo;
import com.example.LifeInsurance.service.PolicyService;

@Controller
public class PolicyController {
	
	@Autowired
	UserRepo userRepository;
	
	@Autowired
	PolicyRepo policyRepository;
	
	@Autowired
	PolicyService policyService;
	
	@Autowired
	UserController userController;
	
	@RequestMapping("/viewClientPolicy")
	public String clientPolicy(Model model) {
		if(!userController.globalEmail.equals("")) {
			String name = userController.globalEmail;
			User user = userRepository.findByClientEmail(name);
			List<Policy> listPolicies = this.policyRepository.findPoliciesByUser(user.getUserId());
			model.addAttribute("listPolicies", listPolicies);
			return "/viewClientPolicy";
		}
		return "/loginPage";
	}
	
	@RequestMapping("/viewAdminPolicy")
	public String adminPolicy(Model model) {
		if(!userController.globalEmail.equals("")) {
			List<Policy> listPolicies = policyService.getAllPolicies();
			model.addAttribute("listPolicies", listPolicies);
			return "/viewAdminPolicy";
		}
		return "/loginPage";
	}
	
	@RequestMapping("/savePolicy")
	public String saveContact(@RequestParam("policyType") String policyType, 
			@RequestParam("topUp") String topUp, @RequestParam("addedCoverAmount") double addedCoverAmount, 
			@RequestParam("sumInsured") double sumInsured, @RequestParam("paymentTenure") int paymentTenure, 
			@RequestParam("paymentMode") String paymentMode, @RequestParam("consumeTobacco") String consumeTobacco, Policy policy) {
		
		String name = userController.globalEmail;
		User user = this.userRepository.findByClientEmail(name);
		user.getPolicies().add(policy);
		policy.setUser(user);

		double premium = 0; 
		premium = (sumInsured / ((paymentTenure * 12)));
		double topup = 0;
		if(policyType.equals("Term Insurance Policy")) 
		{
			if(topUp.equals("Accidental Death Benefit")) 
			{
				if(addedCoverAmount > 25000) 
				{
					double extraCover = addedCoverAmount - 25000;
					topup = (extraCover / 50000)*10;
					topup = topup + 10;
				}
			}
			else if(topUp.equals("Comprehensive Care")) 
			{
				if(addedCoverAmount > 200000) 
				{
					double extraCover = addedCoverAmount - 200000;
					topup = (extraCover / 300000) * 400;
					topup = topup + 80;
				}
			}
		}
		premium = premium + topup;
			
		double tobaccoPenality = 0;
		if(consumeTobacco.equals("Yes")) 
		{
			tobaccoPenality = 0.1 * premium;
		}
		premium += tobaccoPenality;
		
		double discount = 0;
		if(paymentMode.equals("Monthly"))
		{
			discount = 0;
		}
		else if(paymentMode.equals("Half Yearly")) 
		{
			premium = premium * 6;
			discount = premium * 0.1;
		}
		else if(paymentMode.equals("Annual"))
		{
			premium = premium * 12;
			discount = premium * 0.15;
		}
		premium -= discount;
		BigDecimal bd = new BigDecimal(premium);
		bd = bd.round(new MathContext(3));
		double roundedPremium = bd.doubleValue();
		policy.setPremium(roundedPremium);
			
		policyService.savePolicy(policy);
        return "redirect:/viewClientPolicy";
	}
	
	@RequestMapping("/newPolicy")
	 public String showNewContactForm(Model model) {
	        Policy policy = new Policy();
	        model.addAttribute("policy", policy);
	        return "newPolicy";
	 }
	
	@RequestMapping("/approve/{policyId}")
	public String approvePolicy(@PathVariable(value = "policyId") int policyId) {
		Policy policy = policyService.getPolicyById(policyId);
		if(policy.getStatusOfPolicy().equals("Pending") || policy.getStatusOfPolicy().equals("On Hold") ) {
			policy.setStatusOfPolicy("Approved");
			int randomNumber = (int)(Math.random() * (99999 - 10000 + 1) + 10000);
			policy.setPolicyNumber(randomNumber);
			policyService.savePolicy(policy);
		}
		return "redirect:/viewAdminPolicy";
	}
	
	@RequestMapping("/onHold/{policyId}")
	public String onHoldPolicy(@PathVariable(value = "policyId") int policyId) {
		Policy policy = policyService.getPolicyById(policyId);
		if(policy.getStatusOfPolicy().equals("Pending")) {
			policy.setStatusOfPolicy("On Hold");
			policyService.savePolicy(policy);
		}
		return "redirect:/viewAdminPolicy";
	}
	
	@RequestMapping("/reject/{policyId}")
	public String rejectPolicy(@PathVariable(value = "policyId") int policyId) {
		Policy policy = policyService.getPolicyById(policyId);
		if(policy.getStatusOfPolicy().equals("Pending") || policy.getStatusOfPolicy().equals("On Hold") ) {
			policy.setStatusOfPolicy("Rejected");
			policyService.savePolicy(policy);
		}
		return "redirect:/viewAdminPolicy";
	}
	
	@RequestMapping("/update/{policyId}")
    public String showFormForUpdate(@PathVariable(value = "policyId") int policyId, Model model) {
        Policy policy = policyService.getPolicyById(policyId);
        if(policy.getStatusOfPolicy().equals("Pending") || policy.getStatusOfPolicy().equals("On Hold"))
        {
        	model.addAttribute("policy", policy);
        	return "updatePolicy";
        }
        return "redirect:/viewClientPolicy";
    }

	@RequestMapping("/cancel/{policyId}")
	public String deleteContact(@PathVariable(value = "policyId") int policyId) {
		Policy policy = policyService.getPolicyById(policyId);
		if(policy.getStatusOfPolicy().equals("Pending")) {
			policy.setStatusOfPolicy("Cancelled");
			policyService.savePolicy(policy);
		}
	    return "redirect:/viewClientPolicy";
	}
	
	@RequestMapping("/pay/{policyId}")
	public String payPremium(@PathVariable(value = "policyId") int policyId) {
		Policy policy = policyService.getPolicyById(policyId);
		if(policy.getStatusOfPolicy().equals("Approved")) 
		{
			
			if(policy.getPaymentStatus().equals("Pending")) 
			{
				policy.setPaymentStatus("Paid");
				policyService.savePolicy(policy);
				return "payPremium";
			}
		}
		return "redirect:/viewClientPolicy";
	}
	
	@RequestMapping("/paymentStatus")
	public String paymentStatus() {
		return "redirect:/viewClientPolicy";
	}
}
