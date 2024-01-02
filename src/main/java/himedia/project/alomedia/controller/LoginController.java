/**
 *  김부경
*/
package himedia.project.alomedia.controller;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import himedia.project.alomedia.dto.Member;
import himedia.project.alomedia.service.LoginService;

@Controller
public class LoginController {

	private final LoginService service;

	@Autowired
	public LoginController(LoginService service) {
		this.service = service;
	}
	
	@PostMapping("/lms/login")
    public String Login(@RequestParam String phone, 
    					@RequestParam String password, 
    					RedirectAttributes redirectAttributes,
    					Model model) throws Exception {
        String path = "";
        
        Optional<Member> result = service.login(phone, password);
        
        if(result.isPresent()) {
        	 model.addAttribute("name", result.get().getName());
             model.addAttribute("userType", result.get().getUserType());
             model.addAttribute("curriculum", result.get().getCurriculum());
             model.addAttribute("phone", result.get().getPhone());
             model.addAttribute("id", result.get().getId());
             path = "/login/login";
        } else {
            redirectAttributes.addFlashAttribute("error", "아이디 또는 비밀번호가 틀렸습니다.");
            path = "redirect:/";
        }
        
        return path;
    }
	
	@GetMapping("/lms/logout")
    public String logout(HttpSession session) {
		session.invalidate();
        return "redirect:/";
    }
	
}
