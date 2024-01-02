package himedia.project.alomedia.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import himedia.project.alomedia.dto.Member;
import himedia.project.alomedia.repository.LoginRepository;

@Service
public class LoginService {
	private final LoginRepository repository;

	@Autowired
	public LoginService(LoginRepository repository) {
		this.repository = repository;
	}
    
	public Optional<Member> login(String phone, String password) throws Exception {
		return repository.login(phone, password);
	}
	

}
