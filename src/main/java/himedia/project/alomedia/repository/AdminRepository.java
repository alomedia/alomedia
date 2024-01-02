package himedia.project.alomedia.repository;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import himedia.project.alomedia.dto.Attendance;
import himedia.project.alomedia.dto.LectureList;
import himedia.project.alomedia.dto.Member;
import himedia.project.alomedia.dto.Notice;

@Mapper
public interface AdminRepository {
	
	/** 
	 * 우종곤
	 */
	@Select("select * from member")
	List<Member> findAllMember();

	void saveMember(Member member);
	
	@Delete("delete from member where id = #{memberId}")
	void deleteMember(Long memberId);
	
	@Delete("delete from attendance where id = #{memberId}")
	void deleteAttendance(Long memberId);

	@Update("update member set password = '1111' where id = #{memberId}")
	void resetPassword(Long memberId);

	void saveLecture(LectureList list);

	@Select("select * from lectureList")
	List<LectureList> findAllLecture();

	@Select("select * from notice where lectureId is null")
	List<Notice> findAllNoticeByCurriculum(String curriculum);

	@Select("select * from notice where noticeId = #{noticeId}")
	Optional<Notice> findAllNoticeByNoticeId(Long noticeId);
	
	int saveNotice(Notice notice);

	@Update("update notice set noticeName = #{notice.noticeName}, noticeContent = #{notice.noticeContent} where noticeId = #{noticeId}")
	int updateNotice(@Param(value = "noticeId") Long noticeId, @Param(value = "notice") Notice notice);

	@Delete("delete from notice where noticeId = #{noticeId}")
	int deleteNotice(Long noticeId);

	@Select("select * from member where name like #{name}")
	Long searchId(String name);

	@Insert("insert into attendance(id) values (#{id})")
	void saveAttendance(Long id);
	
	@Select("select * from notice where lectureId is null order by noticeId desc")
	List<Notice> findAllAdminNotice();

	/** 
	 * 정시운
	 */
	
	void updateMypage(Member member);

	@Select("select * from member where phone like #{phone}")
	Member findMemberByPhone(String phone);

	@Select("select * from lectureList")
	List<LectureList> findAllLectureList();
	
	@Select("select * from lectureList where lectureId = #{lectureId}")
	Optional<LectureList> findLectureByLectureId(Long lectureId);
	
	@Select("select count(*) from member where phone = #{phone}")
	int findByPhone(String phone);
	
	@Select("select * from member where id = #{id}")
	Optional<Member> findMemberById(Long id);
	
	@Select("select * from lectureList where lectureName like #{curriculum}")
	Optional<LectureList> findLectureListByCurriculum(String curriculum);
		
	@Select("select * from attendance where id = #{id}")
	Optional<Attendance> findAttendanceById(Long id);
	
	int updateLecture(@Param("lectureId") Long lectureId, @Param("updateLectureList") LectureList updateLectureList);

	/** 
	 * 김부경
	 */
	
	List<LectureList> searchLecture(@Param(value = "type") String type, @Param(value = "keyword") String keyword);

	List<Member> searchMembers(@Param(value = "type") String type, @Param(value = "keyword") String keyword);
	
	List<Notice> searchNotice(@Param(value = "type") String type, @Param(value = "keyword") String keyword);
	
}
