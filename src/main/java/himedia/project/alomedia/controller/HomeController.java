package himedia.project.alomedia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	/**
	 * 김부경
	 */
	
	@GetMapping("/")
	public String home() {
		
		return "home";
	}

}
