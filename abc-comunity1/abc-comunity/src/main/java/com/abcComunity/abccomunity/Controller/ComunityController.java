package com.abcComunity.abccomunity.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.abc.dto.abcBeans;
import com.abc.dto.emailBeans;
import com.abc.dto.jobPostBeans;
import com.abc.service.userService;
import com.abcComunity.security.ApplicationUserDetail;

@ComponentScan(basePackages = {"com.abc.service"})
@Controller
public class ComunityController {
	
	@Autowired
    userService userService;
    List<abcBeans> AllDataUser = new ArrayList<abcBeans>();
	
//landing page    
@GetMapping(value={"/", "/index" })
	public String index(HttpSession session) {
		session.removeAttribute("user_id");
		session.removeAttribute("user_role");
		return "index";	
	}

//login page
@GetMapping(value="/login")
public String login(Model model, String error, String logout) {
	if(error !=null) {
		System.out.println(error);
		model.addAttribute("msg", "Your email or password are incorrect");
	}
	if(logout !=null) {
		model.addAttribute("msg", "You have been logout");
	}
	return "login";	
}

//login before using security framework
//@PostMapping(value="/login")
//public String userLogin(@RequestParam Map<String, Object> param, RedirectAttributes redirect, HttpSession session) {
//	String email = param.get("email").toString();
//    String password = param.get("password").toString();
//
//    abcBeans data = userService.login(email, password);
//    if(data==null) {
//    	redirect.addFlashAttribute("error", "sorry your account not exist");
//    	return "redirect:/login";
//    }
//    else {
//    	if(data.getRole().equals("USER")) {
//    		session.setAttribute("header1", "headerUser.jsp");
//    		session.setAttribute("user_id", data.getId_user());
//    		System.out.println(data.getRole());
//    		return "redirect:/home";
//    	}
//    	session.setAttribute("header1", "header.jsp");
//    	session.setAttribute("user_id", data.getId_user());
//    	System.out.println(data.getRole());
//    	return "redirect:/home";
//    }
//}


//register page
@GetMapping(value="/register")
public String register(@ModelAttribute("data") abcBeans user) {
	return "register";	
}
//confirm register page after register function
@PostMapping(value="/confirmation")
public String registered (@ModelAttribute("data") abcBeans user )
{
userService.addUser(user);
System.out.println(user);
return "confirmation";
}

//thankyou page
@GetMapping(value="/thankyou")
public String thankyou() {
	return "thankyou";	
}

//emailConfirmation page
@GetMapping(value="/emailConfirm")
public String emailConfirm() {
	return "emailConfirmation";
}

//confirmReset page
@PostMapping(value="/confirm2")
public String confirm2(@RequestParam("email") String email, HttpSession resetPass) {
	resetPass.setAttribute("resetPassConfirm", email);
	return "confirmReset";
}

//forgot password page
@GetMapping(value="/forgotPassword")
public ModelAndView forgotPassword(HttpSession resetPass) {
	String user = (String) resetPass.getAttribute("resetPassConfirm");
	abcBeans userData = userService.emailConfirm(user); 
	return new ModelAndView("forgotPassword","formForgotPassword", userData);	
}

//reset passwordFunction
@PostMapping(value="/resetPassword")
public String resetPassword(@RequestParam int uid,
	@RequestParam("username") String username,
	@RequestParam("password") String password,
	@RequestParam("firstname") String firstname,
	@RequestParam("lastname") String lastname,
	@RequestParam("Address") String address,
	@RequestParam("Email") String email,
	@RequestParam("Phone") String phone,
	@RequestParam("Role") String role)
	
{
	System.out.println(uid+" "+ firstname);
	abcBeans u= new abcBeans(uid, username, password, firstname, lastname, address, email, phone, role );
	userService.addUser(u);
	
	return "redirect:/login";
}

//confirm register page
@GetMapping(value="/confirmation")
public String confirmation() {
	return "confirmation";
}

//profile page
@GetMapping(value="/profile")
public String profile() {
	return "profile";
}
//profile page for list user
@GetMapping(value="/profile2")
public String viewProfile() {
	return "viewProfile";	
}
//update page for admin
@GetMapping(value="/update/{id_user}")
public ModelAndView update (@PathVariable("id_user")Integer id) {
	abcBeans u=userService.SearchUser(id);
	System.out.println(id);
	return new ModelAndView("viewProfile", "viewProfile", u);
}
//update function for admin
@GetMapping(value="/update/update")
public String updateData(@RequestParam int uid,
	@RequestParam("username") String username,
	@RequestParam("password") String password,
	@RequestParam("firstname") String firstname,
	@RequestParam("lastname") String lastname,
	@RequestParam("Address") String address,
	@RequestParam("Email") String email,
	@RequestParam("Phone") String phone,
	@RequestParam("Role") String role)
	
{
	
	System.out.println(uid+" "+ firstname);
	abcBeans u= new abcBeans(uid, username, password, firstname, lastname, address, email, phone, role );
	userService.encode(u);
	
	return "redirect:/view";
}

//profile for user
@GetMapping(value="/profileUser/{id_user}")
public ModelAndView profileUser (@PathVariable("id_user")Integer id) {
	abcBeans u=userService.SearchUser(id);
	return new ModelAndView("profileUser", "viewProfile", u);
}
//update profile for user
@GetMapping(value="/profileUser/update")
public String updateUser(@RequestParam int uid,
	@RequestParam("username") String username,
	@RequestParam("password") String password,
	@RequestParam("firstname") String firstname,
	@RequestParam("lastname") String lastname,
	@RequestParam("Address") String address,
	@RequestParam("Email") String email,
	@RequestParam("Phone") String phone,
	@RequestParam("Role") String role)
	
{
	
	System.out.println(uid+" "+ firstname);
	abcBeans u= new abcBeans(uid, username, password, firstname, lastname, address, email, phone, role );
	userService.encode(u);
	
	return "redirect:/profileUser/" + uid;
}

//homepage for user&admin session
@GetMapping(value="/home")
public String homePage(@AuthenticationPrincipal ApplicationUserDetail apkUserDetail, HttpSession session) {
	String email = apkUserDetail.getUsername();
	abcBeans user = userService.login(email);
	session.setAttribute("user_id", user.getId_user());
	session.setAttribute("user_role", user.getRole());
	return "homePage";
}

//list user for admin
@GetMapping(value="/view")
public ModelAndView view() {	
        List<abcBeans> view = userService.showAllUser();
        System.out.println(view);

        return new ModelAndView("view", "showView", view);	
}
//search funtion
@PostMapping(value="/search")
public ModelAndView search(@RequestParam String search) {
	System.out.println(search);
	List<abcBeans> dataUser= userService.search(search);
	//return new ModelAndView("view", "showView", dataUser);	
	return new ModelAndView("profile", "showView", dataUser);	
}


//delete user for admin
@GetMapping (value="/deleteuser")
public String deletepage(@RequestParam("pid")Integer user_id) {
	userService.deleteData(user_id);
	return "redirect:/view";
}

//@GetMapping (value="/logout")
//public String logout(HttpSession session) {
//	session.setAttribute("header1", null);
//	session.setAttribute("user_id", null);
//	return "redirect:/index";
//}

//job posting jsp
@GetMapping(value="/jobPost")
public String jobPost(@ModelAttribute("postJob") jobPostBeans jobPost) {
	return "JobPosting";
}

//job posting function
@PostMapping(value= "/jobPost")
public String postJob(@ModelAttribute("postJob") jobPostBeans jobPost) {
	jobPostBeans jobPosting = userService.postJOb(jobPost);
	System.out.println(jobPosting);
	return "redirect:/jobPost";
}

//list Job
@GetMapping(value="/listJob")
public ModelAndView jobList() {
	List<jobPostBeans> jobList = userService.showAllJob();
    System.out.println(jobList);

    return new ModelAndView("listJob", "jobListing", jobList);
}

//bulk Email
@GetMapping(value="/formEmail")
public String bulkEmail(@ModelAttribute("sendEmail") emailBeans sendEmail) {
	return "bulkEmail";
}

//email sender
@PostMapping(value="/sendEmail")
public String sendEmail(@ModelAttribute("sendEmail") emailBeans sendEmail) {
	userService.addEmail(sendEmail);
	userService.sendEmail(sendEmail.getReceiver(), sendEmail.getSubject(), sendEmail.getMessage());
	return "redirect:/formEmail";
}

}