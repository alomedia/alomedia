package himedia.project.alomedia.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import himedia.project.alomedia.dto.Attendance;
import himedia.project.alomedia.dto.AttendanceList;
import himedia.project.alomedia.dto.Exam;
import himedia.project.alomedia.dto.ExamList;
import himedia.project.alomedia.dto.ExamSubmit;
import himedia.project.alomedia.dto.Member;
import himedia.project.alomedia.dto.Notice;
import himedia.project.alomedia.dto.SubmitList;
import himedia.project.alomedia.repository.TeacherRepository;

@Service
public class TeacherService {
	private final TeacherRepository repository;

	@Autowired
	public TeacherService(TeacherRepository repository) {
		this.repository = repository;
	}
	
	/** 
	 * 김부경
	 */
	public List<Member> findAllMemberByCurriculum(String curriculum) {
		return repository.findAllMemberByCurriculum(curriculum);
	}

	public List<Attendance> findAttendanceByCurriculum(String curriculum) {
		return repository.findAttendanceByCurriculum(curriculum);
	}

	public void AttendanceCheck(Map<String, Object> check) {
		repository.AttendanceCheck(check);
	}

	public Long findLectureIdByCurriculum(String curriculum) {
		return repository.findLectureIdByCurriculum(curriculum);
	}
	
	public List<AttendanceList> findAttendanceTime(Long id, LocalDate attendanceDate) {
		return repository.findAttendanceTime(id, attendanceDate);
	}
	
	
	public List<Notice> searchNotice(String type, String keyword, String curriculum) {
		return repository.searchNotice(type, keyword, curriculum);
	}
	
	/** 
	 * 우종곤
	 */
	
	public Optional<Integer> attendanceNumCheck(Long lectureId,LocalDate attendanceDate) {
		return repository.attendanceNumCheck(lectureId, attendanceDate);
	}
	
	public List<Notice> findAllNoticeByCurriculum(String curriculum) {
		return repository.findAllNoticeByCurriculum(curriculum);
	}

	public Optional<Notice> findNoticeByNoticeId(Long noticeId) {
		return repository.findNoticeByNoticeId(noticeId);
	}
	
	public List<Notice> findAdminNotice(){
		return repository.findAdminNotice();
	}
	
	public Long findLectureIdByName(String name) {
		return repository.findLectureIdByName(name);
	}

	public int saveNotice(Long lectureId, Notice notice) {
		return repository.saveNotice(lectureId, notice);
	}

	public int updateNotice(Long noticeId, Notice notice) {
		return repository.updateNotice(noticeId, notice);
	}
	
	public int deleteNotice(Long noticeId) {
		return repository.deleteNotice(noticeId);
	}
	
	public void updateAttendanceNum(Map<String, Object> check) {
		repository.updateAttendanceNum(check);
	}
	
	public Optional<Integer> findLecturePeople(Long lectureId){
		return repository.findLecturePeople(lectureId);
	};
	
	public List<ExamList> findStandbyExamList(Long lectureId){
		return repository.findStandbyExam(lectureId);
	}
	
	public List<ExamList> findFinishedExam(Long lectureId){
        return repository.findFinishedExam(lectureId);
    }
	
	public List<SubmitList> findSubmitList(Long examId){
		return repository.findSubmitList(examId);
	}
	
	public int saveExamList(Long lectureId,ExamList examList) {
		return repository.saveExamList(lectureId,examList);
	}
	
	public Optional<ExamList> findExamList(Long lectureId, String examName){
		return repository.findExamList(lectureId, examName);
	}
	
	public Optional<ExamList> findExamListByExamId(Long examId){
		return repository.findExamListByExamId(examId);
	}
	
	public int saveExam(Long examId, Long lectureId, Integer questionNum, Exam exam) {
		return repository.saveExam(examId, lectureId, questionNum, exam);
	}
	
	public List<Exam> findExamByExamId(Long examId) {
		return repository.findExamByExamId(examId);
	}
	
	public int deleteExamList(Long examId) {
		return repository.deleteExamList(examId);
	}
	
	public List<ExamSubmit> findExamSubmit(Long examId, Long id){
		return repository.findExamSubmit(examId, id);
	}
	
	public int gradingExam(Long id, Long examId, ExamSubmit examSubmit, int questionNum) {
		return repository.gradingExam(id,examId,examSubmit,questionNum);
	}
	
	public int updateSubmitList(Long id, Long examId,Integer totalScore) {
		return repository.updateSubmitList(id, examId, totalScore);
	}
	
	
	public void startExam(Long examId,ExamList examList) {
		DateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss"); 
		LocalDateTime now = LocalDateTime.now();
		String strNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd-HH-mm-ss"));
		Date startTime = null;
		
		try {
			startTime = dataFormat.parse(strNow);
		} catch (ParseException parseException) {
		}
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(startTime);
		cal.add(Calendar.MINUTE, examList.getTimeLimit());
		String endTime = dataFormat.format(cal.getTime());
		
		repository.startExam(examId, strNow, dataFormat.format(startTime), endTime);
	}
	
	public int endExam(Long lectureId, String strNow) {
		return repository.endExam(lectureId, strNow);
	};
	
	public int countStudent(String curriculum) {
		return repository.countStudent(curriculum);
	}
	
	public void countGrading(Long examId) {
		if(repository.countGrading(examId) == repository.countExaminee(examId))
			repository.endGrading(examId);
	}
	
	public int countExaminee(Long examId) {
		return repository.countExaminee(examId);
	}

	/** 
	 * 정시운
	 */
	public void updateMypage(Member member) {
		repository.updateMypage(member);
	}

	public Member findMemberByPhone(String phone) {
		return repository.findMemberByPhone(phone);
	}	
	
}
