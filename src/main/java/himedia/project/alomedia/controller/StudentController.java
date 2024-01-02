package himedia.project.alomedia.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import himedia.project.alomedia.dto.Attendance;
import himedia.project.alomedia.dto.AttendanceList;
import himedia.project.alomedia.dto.Exam;
import himedia.project.alomedia.dto.ExamList;
import himedia.project.alomedia.dto.ExamSubmit;
import himedia.project.alomedia.dto.LectureList;
import himedia.project.alomedia.dto.Member;
import himedia.project.alomedia.dto.Notice;
import himedia.project.alomedia.dto.SubmitList;
import himedia.project.alomedia.service.StudentService;

@Controller
@RequestMapping("/lms/student")
public class StudentController {
	
	private final StudentService service;

	@Autowired
	public StudentController(StudentService service) {
		this.service = service;
	}
	
	/** 
	 * 김부경/우종곤
	 */
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
		
		String phone = String.valueOf(session.getAttribute("phone"));
		Long id = service.findMemberIdByPhone(phone);
		Attendance findAttendance = service.findAttendanceById(id);
		
		String curriculum = String.valueOf(session.getAttribute("curriculum"));
		
		Long lectureId = service.findLectureIdByCurriculum(curriculum);
		String teacherName = service.findTeacherNameByCurriculum(curriculum);
		LectureList lecture = service.findLectureByLectureId(lectureId).get();
		LocalDate attendanceDate = LocalDate.now();
		
		boolean isAttendance = service.isAttendance(id, lectureId, attendanceDate) ;
		int totalDate = service.totalAttendance(lecture.getLectureStart(), lecture.getLectureEnd());
		int restDay = totalDate - findAttendance.getTotalAttendance() - findAttendance.getAbsent();
		
		model.addAttribute("totalAttendance", findAttendance.getTotalAttendance());
		model.addAttribute("late", findAttendance.getLate());
		model.addAttribute("leaveEarly", findAttendance.getLeaveEarly());
		model.addAttribute("absent", findAttendance.getAbsent());
		model.addAttribute("teacherName", teacherName);
		model.addAttribute("lectureStart", lecture.getLectureStart());	
		model.addAttribute("lectureEnd", lecture.getLectureEnd());
		model.addAttribute("totalDate", totalDate);
		model.addAttribute("restDay", restDay);
		model.addAttribute("isAttendance", isAttendance);

		return "student/dashboard";
	}

	@PostMapping("/dashboard/AttendanceCheck")
	public String AttendanceCheck(HttpSession session, @RequestParam Long attendanceNum, Attendance oldAttendance, Model model) {
		AttendanceList attendanceList = new AttendanceList();
		LocalDate attendanceDate = LocalDate.now();
		Map<String, Object> check = new HashMap<String, Object>();
		String curriculum = String.valueOf(session.getAttribute("curriculum"));
		String phone = String.valueOf(session.getAttribute("phone"));
		Long lectureId = service.findLectureIdByCurriculum(curriculum);
		
		check.put("lectureId", lectureId);
		check.put("attendanceDate", attendanceDate);
		check.put("attendanceNum", attendanceNum);
		
		if(service.attendanceCheck(check)) {
			Long id = service.findMemberIdByPhone(phone);
			Attendance attendance = service.findAttendanceById(id);
			service.attendancePlus(attendance);
			LocalTime now = LocalTime.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
			String attendanceTime = now.format(formatter);

			attendanceList.setId(id);
			attendanceList.setLectureId(lectureId);
			attendanceList.setAttendanceTime(attendanceTime);
			attendanceList.setAttendanceDate(attendanceDate);
			
			service.insertAttendanceList(attendanceList);
		}

		return "redirect:/lms/student/dashboard";
	}
	
	@GetMapping("/notice")
	public String notices(HttpSession session, Model model,
						@RequestParam(name = "page", defaultValue = "1") int page,
			            @RequestParam(name = "pageSize", defaultValue = "10") int pageSize) {
		String curriculum = String.valueOf(session.getAttribute("curriculum"));
		List<Notice> notices = service.findAllNoticeByCurriculum(curriculum);
		List<Notice> adminNotices = service.findAdminNotice();
		
		for(Notice notice : notices) {
			notice.setNoticeName(notice.getNoticeName().replace(" ", "&nbsp;"));
		}
		
		int totalnotices = notices.size();

		int currentPage = (int) Math.ceil((double) totalnotices / pageSize);
			
		int fromIndex = (page - 1) * pageSize;
		int toIndex = Math.min(page * pageSize, totalnotices);
		List<Notice> noticesPage = notices.subList(fromIndex, toIndex);
		
		model.addAttribute("notices", noticesPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", currentPage );	
		model.addAttribute("adminNotices", adminNotices);
		return "student/notice";
	}
	
	/** 
	 * 우종곤
	 */
	@GetMapping("/notice/{noticeId}")
	public String viewNotice(@PathVariable Long noticeId,Model model) {
		Optional<Notice> notice = service.findNoticeByNoticeId(noticeId);
		
		if(notice.isPresent()) {
			notice.get().setNoticeContent(notice.get().getNoticeContent().replace("\r\n","<br>").replace(" ", "&nbsp;"));
			notice.get().setNoticeName(notice.get().getNoticeName().replace(" ", "&nbsp;"));
		}
		
		model.addAttribute("notice", notice.get());
		return "student/viewNotice";
	}
	
	@GetMapping("/exam")
    public String examList(HttpSession session,Model model) {
        Long id = Long.parseLong(String.valueOf(session.getAttribute("id")));
        String curriculum = String.valueOf(session.getAttribute("curriculum"));
        Long lectureId = service.findLectureIdByCurriculum(curriculum);
        LocalDateTime now = LocalDateTime.now();
        String strNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd-HH-mm-ss"));
        service.selectTime(strNow, lectureId);
        List<Boolean> isExams = new ArrayList<Boolean>();
        List<Long> updateExamId = service.findUpdateExam(lectureId, strNow);

        List<ExamList> examLists = service.findExam(lectureId);
        List<SubmitList> submitLists = service.findSubmitListById(id);
        for (int i = 0; i < examLists.size();i++)
            isExams.add(service.isExam(id,examLists.get(i).getExamId()));
        for (int i = 0; i < updateExamId.size(); i++) 
            service.updateExam(updateExamId.get(i));

        model.addAttribute("isExams", isExams);
        model.addAttribute("submitLists", submitLists);
        model.addAttribute("examLists", examLists);

        return "student/examList";
    }
	
	@GetMapping("/exam/{examId}")
	public String takeExam(@PathVariable Long examId, Model model) {
		List<Exam> exams = service.findExamByExamId(examId);
		model.addAttribute("exams", exams);
		model.addAttribute("examId", examId);
		
		return "student/exam";
	}
	
	@PostMapping("/exam/{examId}")
	public String addExam(@PathVariable Long examId,ExamSubmit examSubmit,HttpSession session) {
		Long id = Long.parseLong(String.valueOf(session.getAttribute("id")));
		String curriculum = String.valueOf(session.getAttribute("curriculum"));
		Long lectureId = service.findLectureIdByCurriculum(curriculum);
		String name = service.findMemberById(id).get().getName();
		LocalDateTime now = LocalDateTime.now();
		String strNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd-HH-mm-ss"));
		
		if(service.checkTimeLimit(examId, strNow)) {
			for(int i = 0; i < examSubmit.getExamSubmits().size();i++){
				service.saveExamSubmit(id,lectureId,examId, examSubmit.getExamSubmits().get(i));
			}
			service.saveSubmitList(id, examId, service.findExamListNameByExamId(examId), strNow, name);
		}
		
		return "redirect:/lms/student/exam";
	}
	
	@GetMapping("/exam/{examId}/result")
	public String checkResult(@PathVariable Long examId ,HttpSession session,Model model) {
		Long id = Long.parseLong(String.valueOf(session.getAttribute("id")));
		List<Exam> exams = service.findExamByExamId(examId);
		List<ExamSubmit> examSubmits = service.findExamSubmit(id, examId);
		
		model.addAttribute("exams", exams);
		model.addAttribute("examSubmits", examSubmits);
		
		return "student/examResult";
	}
	
	/** 
	 * 정시운
	 */
	@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		String phone = String.valueOf(session.getAttribute("phone"));
		Member member = service.findMemberByPhone(phone);
		model.addAttribute("member", member);
		return "student/mypage";
	}
	
	/** 
	 * 정시운, 김부경
	 */
	@PostMapping("/mypage")
	public String postMypage(HttpSession session, @ModelAttribute Member member, @RequestParam String passwordTwo) {
		String phone = String.valueOf(session.getAttribute("phone"));
		
		if(!member.getPassword().isBlank()) {
			if (member.getPassword().equals(passwordTwo)) {
				member.setId(service.findMemberByPhone(phone).getId());
				service.updateMypage(member);
			} 
		}
		
		return "redirect:/lms/student/mypage";
	}
	
	@GetMapping("/notice/search")
	public String searchNotices(HttpSession session,Model model,
						@RequestParam(name = "type", required = false) String type,
			            @RequestParam(name = "keyword", required = false) String keyword,
						@RequestParam(name = "page", defaultValue = "1") int page,
			            @RequestParam(name = "pageSize", defaultValue = "10") int pageSize) {
		String curriculum = String.valueOf(session.getAttribute("curriculum"));
		List<Notice> notices = service.searchNotice(type, keyword, curriculum);
		List<Notice> adminNotices = service.findAdminNotice();
		
		for(Notice notice : notices) {
			notice.setNoticeName(notice.getNoticeName().replace(" ", "&nbsp;"));
		}
		
		int totalnotices = notices.size();

		int currentPage = (int) Math.ceil((double) totalnotices / pageSize);
			
		int fromIndex = (page - 1) * pageSize;
		int toIndex = Math.min(page * pageSize, totalnotices);
		List<Notice> noticesPage = notices.subList(fromIndex, toIndex);
		
		model.addAttribute("notices", noticesPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", currentPage );	
		model.addAttribute("adminNotices", adminNotices);
		
		return "student/searchNotice";
	}
	
	
}
