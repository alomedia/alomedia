package himedia.project.alomedia.repository;

import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import himedia.project.alomedia.dto.Member;

@Mapper
public interface LoginRepository {
	
	Optional<Member> login(@Param(value = "phone") String phone, @Param(value = "password") String password);

}
