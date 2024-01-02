package himedia.project.alomedia.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
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
import himedia.project.alomedia.dto.LectureList;
import himedia.project.alomedia.dto.Member;
import himedia.project.alomedia.dto.Notice;
import himedia.project.alomedia.dto.SubmitList;
import himedia.project.alomedia.repository.StudentRepository;

@Service
public class StudentService {
	private final StudentRepository repository;

	@Autowired
	public StudentService(StudentRepository repository) {
		this.repository = repository;
	}
	
	/** 
	 * 김부경
	 */

	public Long findMemberIdByPhone(String phone) {
		return repository.findMemberIdByPhone(phone);
	}

	public Long findLectureIdByCurriculum(String curriculum) {
		return repository.findLectureIdByCurriculum(curriculum);
	}
	
	public String findTeacherNameByCurriculum(String curriculum) {
		return repository.findTeacherNameByCurriculum(curriculum);
	}
	
	public Optional<LectureList> findLectureByLectureId(Long lectureId){
		return repository.findLectureByLectureId(lectureId);
	}

	public void attendancePlus(Attendance attendance) {
		repository.attendancePlus(attendance);
	}
	
	public boolean attendanceCheck(Map<String, Object> check) {
		if(repository.attendanceCheck(check) > 0)
			return true;
		return false;
	}
	
	public String findExamListNameByExamId(Long examId) {
		return repository.findExamListNameByExamId(examId);
	}
	
	/** 
	 * 우종곤
	 */
	public Attendance findAttendanceById(Long id) {
		return repository.findAttendanceById(id);
	}
	
	public Long duplicationCheck(Long id, LocalDate attendanceDate) {
		return repository.duplicationCheck(id, attendanceDate);
	}

	
	public List<Notice> findAllNoticeByCurriculum(String curriculum) {
		return repository.findAllNoticeByCurriculum(curriculum);
	}
	
	public Optional<Notice> findNoticeByNoticeId(Long noticeId) {
		return repository.findNoticeByNoticeId(noticeId);
	}
	
	public void insertAttendanceList(AttendanceList attendanceList) {
		repository.insertAttendanceList(attendanceList);
	}
	
	public boolean isAttendance(Long id, Long lectureId,Object attendanceDate) {
		if(repository.isAttendance(id, lectureId, attendanceDate) == 0)
			return false;
		return true;
	}
	
	public int totalAttendance(Date attendanceStart, Date attendanceEnd) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = null;
		Date endDate = null;
		
		try {
			startDate = dateFormat.parse(dateFormat.format(attendanceStart));
			endDate = dateFormat.parse(dateFormat.format(attendanceEnd));
		} catch (ParseException parseException) {
		}
		
		Calendar startCal = Calendar.getInstance();
		startCal.setTime(startDate);
		Calendar endCal = Calendar.getInstance();
		endCal.setTime(endDate);
		
		int totalAttendance = 0;
		
		while(startCal.before(endCal)) {
			if (Calendar.SATURDAY != startCal.get(Calendar.DAY_OF_WEEK) && Calendar.SUNDAY != startCal.get(Calendar.DAY_OF_WEEK)) 
				totalAttendance++;
			
			startCal.add(Calendar.DATE, 1);
		}
		return totalAttendance;
	};
	
	public List<Notice> findAdminNotice(){
		return repository.findAdminNotice();
	}
	
	public List<SubmitList> findSubmitListById(Long id){
		return repository.findSubmitListById(id);
	};
	
	public List<Exam> findExamByExamId(Long examId){
		return repository.findExamByExamId(examId);
	}
	
	public List<ExamSubmit> findExamSubmit(Long id, Long examId){
		return repository.findExamSubmit(id, examId);
	}
	
	public int selectTime(String now, Long lectureId) {
		return repository.selectTime(now, lectureId); 
	};
	
	public List<ExamList> findExam(Long lectureId){
		return repository.findExam(lectureId);
	}
	
	public int saveExamSubmit(Long id,Long lectureId,Long examId,ExamSubmit examSubmit) {
		return repository.saveExamSubmit(id, lectureId,examId, examSubmit);
	}
	
	public int saveSubmitList(Long id,Long examId,String examName,String strNow, String name) {
		return repository.saveSubmitList(id, examId, examName, strNow, name);
	}

    public List<Long> findUpdateExam(Long lectureId, String strNow) {
        return repository.findUpdateExam(lectureId, strNow);
    };

    public int updateExam(Long examId) {
        return repository.updateExam(examId);
    }
	
    public Optional<Member> findMemberById(Long id){
		return repository.findMemberByid(id);
	}
    
    public boolean checkTimeLimit(Long examId, String strNow) {
		if(repository.checkTimeLimit(examId, strNow) > 0)
			return false;
		return true;
	}
    
    public boolean isExam(Long id, Long examId) {
		if(repository.isExam(id, examId) > 0) {
			return true;
		}
		return false;
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
	
	public List<Notice> searchNotice(String type, String keyword, String curriculum) {
		return repository.searchNotice(type, keyword, curriculum);
	}
	
}

