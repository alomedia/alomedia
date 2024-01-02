package himedia.project.alomedia.repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import himedia.project.alomedia.dto.Attendance;
import himedia.project.alomedia.dto.AttendanceList;
import himedia.project.alomedia.dto.Exam;
import himedia.project.alomedia.dto.ExamList;
import himedia.project.alomedia.dto.ExamSubmit;
import himedia.project.alomedia.dto.Member;
import himedia.project.alomedia.dto.Notice;
import himedia.project.alomedia.dto.SubmitList;

@Mapper
public interface TeacherRepository {
	
	/** 
	 * 김부경
	 */
	@Select("select * from member where curriculum like #{curriculum} and userType like '수강생'")
	List<Member> findAllMemberByCurriculum(String curriculum);
	
	List<Attendance> findAttendanceByCurriculum(String curriculum);
	
	void AttendanceCheck(@Param("check") Map<String, Object> check);
	
	@Select("select * from lectureList where lectureName like #{curriculum}")
	Long findLectureIdByCurriculum(String curriculum);

	List<AttendanceList> findAttendanceTime(@Param(value="id") Long id,@Param(value="attendanceDate") LocalDate attendanceDate);
	
	List<Notice> searchNotice(@Param(value = "type") String type, @Param(value = "keyword") String keyword, @Param(value = "curriculum") String curriculum);
	
	/** 
	 * 우종곤
	 */
	@Select("select attendanceNum from attendanceCheck where lectureId = #{lectureId} and attendanceDate like #{attendanceDate}")
	Optional<Integer> attendanceNumCheck(@Param("lectureId") Long lectureId,@Param("attendanceDate") LocalDate AttendanceDate);
	
	List<Notice> findAllNoticeByCurriculum(String curriculum);
	
	@Select("select * from notice where noticeId = #{noticeId}")
	Optional<Notice> findNoticeByNoticeId(Long noticeId);
	
	@Select("select * from notice where lectureId is null order by noticeId desc limit 2")
	List<Notice> findAdminNotice();
	
	Long findLectureIdByName(String name);
	
	int saveNotice(@Param(value = "lectureId") Long lectureId, @Param(value = "notice") Notice notice);
	
	@Update("update notice set noticeName = #{notice.noticeName}, noticeContent = #{notice.noticeContent} where noticeId = #{noticeId}")
	int updateNotice(@Param(value = "noticeId") Long noticeId ,@Param(value = "notice") Notice notice);
	
	@Delete("delete from notice where noticeId = #{noticeId}")
	int deleteNotice(Long noticeId);
	
	@Update("update attendanceCheck set attendanceNum = #{check.attendanceNum} where lectureId = #{check.lectureId} and attendanceDate like #{check.attendanceDate}")
	void updateAttendanceNum(@Param("check") Map<String, Object> check);
	
	@Select("select lecturePeople from lectureList where lectureId = #{lectureId}")
	Optional<Integer> findLecturePeople(Long lectureId);
	
	@Select("select * from examList where lectureId = #{lectureId} and examState in ('대기 중', '시험 중')")
	List<ExamList> findStandbyExam(Long lectureId);
	
	@Select("select * from examList where examState not in('대기 중', '시험 중') and lectureId = #{lectureId} order by examId desc")
	List<ExamList> findFinishedExam(Long lectureId);
	
	@Select("select * from submitList where examId = #{examId}")
	List<SubmitList> findSubmitList(Long examId);
	
	int saveExamList(@Param("lectureId") Long lectureId,@Param("examList") ExamList examList);
	
	@Select("select * from examList where lectureId = #{lectureId} and examName like #{examName} limit 1")
	Optional<ExamList> findExamList(@Param("lectureId") Long lectureId,@Param("examName") String examName);
	
	@Select("select * from examList where examId = #{examId}")
	Optional<ExamList> findExamListByExamId(Long examId);
	
	int saveExam(@Param("examId") Long examId, @Param("lectureId") Long lectureId, @Param("questionNum") Integer questionNum, @Param("exam") Exam exam);
	
	@Select("select * from exam where examId = #{examId}")
	List<Exam> findExamByExamId(Long ExamId);
	
	@Delete("delete from examList where examId = #{examId}")
	int deleteExamList(Long examId);
	
	@Select("select * from examSubmit where examId = #{examId} and id = #{id}")
	List<ExamSubmit> findExamSubmit(@Param("examId") Long examId, @Param("id") Long id);
	
	@Update("update examSubmit set score = #{examSubmit.score}, teacherComent = #{examSubmit.teacherComent} where id = #{id} and examId = #{examId} and questionNum = #{questionNum}")
	int gradingExam(@Param("id") Long id,@Param("examId") Long examId,@Param("examSubmit") ExamSubmit examSubmit, @Param("questionNum") int questionNum);
	
	@Update("update submitList set state = '완료',totalScore = #{totalScore} where id = #{id} and examId= #{examId}")
	int updateSubmitList(@Param("id") Long id,@Param("examId") Long examId,@Param("totalScore") Integer totalScore);

	@Update("update examList set examState = '시험 중', examDate = #{strNow}, examStart = #{startTime}, examEnd = #{endTime} where examId = #{examId}")
	int startExam(@Param("examId") Long examId, @Param("strNow") String strNow,@Param("startTime") String startTime, @Param("endTime") String endTime);
	
	@Select("select count(*) from member where curriculum like #{curriculum} and userType = '수강생'")
	int countStudent(String curriculum);
	
	@Select("select count(*) from submitList where examId = #{examId} and totalScore is not null")
	int countGrading(Long examId);
	
	@Update("update examList set examState = '완료' where examId = #{examId} and examState = '채점 중'")
	int endGrading(Long examId);
	
	@Select("select count(*) from submitList where examId = #{examId}")
	int countExaminee(Long examId);
	
	@Update("update examList set examState = '채점 중' where lectureId = #{lectureId} and examEnd < #{strNow} and examState = '시험 중'")
	int endExam(@Param("lectureId") Long lectureId,@Param("strNow") String strNow);

	/** 
	 * 정시운
	 */
	
	void updateMypage(Member member);
	
	@Select("select * from member where phone like #{phone}")
	Member findMemberByPhone(String phone);
	
}

