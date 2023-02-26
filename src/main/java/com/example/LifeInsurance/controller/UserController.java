package com.example.LifeInsurance.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.LifeInsurance.model.Policy;
import com.example.LifeInsurance.model.User;
import com.example.LifeInsurance.repo.PolicyRepo;
import com.example.LifeInsurance.repo.UserRepo;
import com.example.LifeInsurance.service.PolicyService;
import com.example.LifeInsurance.service.UserService;

@Controller
public class UserController {
	
	String globalEmail = "";
	
	@Autowired
	UserService userService;
	
	@Autowired
	UserRepo userRepository;
	
	@Autowired
	PolicyService policyService;
	
	@Autowired
	PolicyRepo policyRepository;
	
	@RequestMapping("/")
	public String viewHomePage() {
		globalEmail = "";
		return "home";
	}
	
	@RequestMapping("/signUp")
	public String signUp(Model model) {
		model.addAttribute("user", new User());
		return "signUp";
	}
	
	@RequestMapping("/loginPage")
	public String loginPage(Model model) {
		return "loginPage";
	}
	
	@RequestMapping("/verifyLogin")
	public String verifyLogin(@RequestParam("email") String userEmail, @RequestParam("password") String userPassword, Model model) 
	{
		BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
		User client = userRepository.findByClientEmail(userEmail);
		User admin = userRepository.findByAdminEmail(userEmail);
		if (client != null) 
		{
			String pass = client.getUserPassword();
			boolean isPasswordMatches = bcrypt.matches(userPassword, pass);
			if (isPasswordMatches) 
			{
				String name = userEmail;
				User user = userRepository.findByClientEmail(name);
				List<Policy> listPolicies = this.policyRepository.findPoliciesByUser(user.getUserId());
				model.addAttribute("listPolicies", listPolicies);
				globalEmail = userEmail;
				return "/viewClientPolicy";
			}
			else 
			{
				return "/loginPage";
			}
		}
		else if(admin != null) 
		{
			String pass = admin.getUserPassword();
			boolean isPasswordMatches = bcrypt.matches(userPassword, pass);
			
			if (isPasswordMatches)
			{
				List<Policy> listPolicies = policyService.getAllPolicies();
				model.addAttribute("listPolicies", listPolicies);
				globalEmail = userEmail;
				return "/viewAdminPolicy";
			}
			else 
			{
				return "/loginPage";
			}
		}
		return "/loginPage";
	}

	@RequestMapping("/saveUser")
	public String saveUser(@ModelAttribute("user") User user) {
		List<User> users = this.userService.getAllUsers();
		int i = 0;
		int j = 0;
		while(i < users.size()) 
		{
			if(users.get(i).getUserEmail().equals(user.getUserEmail())) 
			{
				j = 1;
			}
			i++;
		}
		if(j != 1) 
		{
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		    String encodedPassword = passwordEncoder.encode(user.getUserPassword());
		    user.setUserPassword(encodedPassword);
			userService.saveUser(user);
			return "redirect:/";
		}
		else 
		{
			return "signUp";
		}
	}
}
