package himedia.project.alomedia.repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import himedia.project.alomedia.dto.Attendance;
import himedia.project.alomedia.dto.AttendanceList;
import himedia.project.alomedia.dto.Exam;
import himedia.project.alomedia.dto.ExamList;
import himedia.project.alomedia.dto.ExamSubmit;
import himedia.project.alomedia.dto.LectureList;
import himedia.project.alomedia.dto.Member;
import himedia.project.alomedia.dto.Notice;
import himedia.project.alomedia.dto.SubmitList;

@Mapper
public interface StudentRepository {

	/** 
	 * 김부경
	 */
	Long findAttendanceNum(@Param(value = "check") Map<String, Object> check);
	
	Long findLectureIdByCurriculum(String curriculum);
	
	Long findMemberIdByPhone(String phone);
	
	Attendance findAttendanceById(Long id);
	
	Long attendanceCheck(@Param(value = "check") Map<String, Object> check);
	
	void attendancePlus(Attendance attendance);
	
	void insertAttendanceList(AttendanceList attendanceList);

	@Select("select examName from examList where examId = #{examId}")
	String findExamListNameByExamId(Long examId);
	
	/** 
	 * 우종곤
	 */
	List<Notice> findAllNoticeByCurriculum(String curriculum);
	
	@Select("select * from notice where noticeId = #{noticeId}")
	Optional<Notice> findNoticeByNoticeId(Long noticeId);
	
	@Select("select count(*) from AttendanceList where id = #{id} and attendanceDate = #{attendanceDate}")
	Long duplicationCheck(@Param(value = "id") Long id, @Param(value = "attendanceDate") LocalDate attendanceDate);
	
	@Select("select name from member where curriculum like #{curriculum} and userType like '강사'")
	String findTeacherNameByCurriculum(String curriculum);
	
	@Select("select * from lectureList where lectureId = #{lectureId}")
	Optional<LectureList> findLectureByLectureId(Long lectureId); 

	@Select("select count(*) from attendanceList where id = #{id} and lectureId = #{lectureId} and attendanceDate = #{attendanceDate}")
	int isAttendance(@Param("id") Long id, @Param("lectureId") Long lectureId,@Param("attendanceDate") Object attendanceDate);
	
	@Select("select * from notice where lectureId is null order by noticeId desc limit 2")
	List<Notice> findAdminNotice();
	
	@Select("select * from submitList where id = #{id} order by examId desc")
	List<SubmitList> findSubmitListById(Long id);
	
	@Select("select * from exam where examId = #{examId} order by examId")
	List<Exam> findExamByExamId(Long examId);
	
	@Select("select * from examSubmit where id = #{id} and examId = #{examId} order by questionNum")
	List<ExamSubmit> findExamSubmit(@Param("id") Long id,@Param("examId") Long examId);
	
	@Update("update examList set now = #{now} where lectureId = #{lectureId}")
	int selectTime(@Param("now") String now,@Param("lectureId") Long lectureId);
	
	@Select("select * from examList where lectureId = #{lectureId} and now between examStart and examEnd")
	List<ExamList> findExam(Long lectureId);
	
	int saveSubmitList(@Param("id") Long id,@Param("examId") Long examId, @Param("examName") String examName,@Param("strNow") String strNow,@Param("name") String name);
	
	int saveExamSubmit(@Param("id") Long id,@Param("lectureId") Long lectureId,@Param("examId") Long examId,@Param("examSubmit") ExamSubmit examSubmit);
	
	@Select("select examId from examList where lectureId = #{lectureId} and examEnd < #{strNow}")
	List<Long> findUpdateExam(@Param("lectureId") Long lectureId,@Param("strNow") String strNow);
	
	@Update("update submitList set state = '채점 중' where examId = #{examId}")
	int updateExam(Long examId);
	
	@Select("select count(*) from submitList where id = #{id} and examId = #{examId}")
	int isExam(@Param("id") Long id,@Param("examId") Long examId);
	
	@Select("select count(*) from examList where examId = #{examId} and examEnd < #{strNow}")
	int checkTimeLimit(@Param("examId") Long examId, @Param("strNow") String strNow);
	
	@Select("select * from member where id = #{id}")
	Optional<Member> findMemberByid(Long id);
	
	
	/** 
	 * 정시운
	 */
	void updateMypage(Member member);
	
	@Select("select * from member where phone like #{phone}")
	Member findMemberByPhone(String phone);
	
	List<Notice> searchNotice(@Param(value = "type") String type, @Param(value = "keyword") String keyword, @Param(value = "curriculum") String curriculum);
}
