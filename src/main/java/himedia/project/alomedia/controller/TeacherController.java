package himedia.project.alomedia.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
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
import himedia.project.alomedia.dto.Member;
import himedia.project.alomedia.dto.Notice;
import himedia.project.alomedia.dto.SubmitList;
import himedia.project.alomedia.service.TeacherService;

@Controller
@RequestMapping("/lms/teacher")
public class TeacherController {

	private final TeacherService service;

	@Autowired
	public TeacherController(TeacherService service) {
		this.service = service;
	}
	
	/** 
	 * 김부경/우종곤
	 */
	@GetMapping("/attendance")
	public String attendance(HttpSession session, Model model) {
		String curriculum = String.valueOf(session.getAttribute("curriculum"));
		List<Member> members = service.findAllMemberByCurriculum(curriculum);
		List<Attendance> attendance = service.findAttendanceByCurriculum(curriculum);
		LocalDate attendanceDate = LocalDate.now();
		Long lectureId = service.findLectureIdByCurriculum(curriculum);
		
		List<AttendanceList> checkTimeList = new ArrayList<AttendanceList>();
	    for (Member member : members) {
	        Long id = member.getId(); 
	        List<AttendanceList> checkTime = service.findAttendanceTime(id, attendanceDate);
	        checkTimeList.addAll(checkTime);
	    } 
	    
	    Optional<Integer> attendanceNum = service.attendanceNumCheck(lectureId, attendanceDate); 
	    if(attendanceNum.isPresent()) {
	    	model.addAttribute("settingNum", attendanceNum.get());
	    	model.addAttribute("disabled", "disabled");
	    }
	    else {
	    	model.addAttribute("settingNum", null);
	    	model.addAttribute("submitBtn", "확인");
	    }
		model.addAttribute("members", members);
		model.addAttribute("attendance", attendance);
		model.addAttribute("checkTime", checkTimeList);

		return "teacher/attendance";
	}
	
	@PostMapping("/attendance/AttendanceCheck")
	public String attendanceNumSubmit(HttpSession session, @RequestParam Long attendanceNum) {
		if (attendanceNum == null) {
			return "redirect:/lms/teacher/attendance";
		}
		
		LocalDate attendanceDate = LocalDate.now();
		Map<String, Object> check = new HashMap<String, Object>();
		String curriculum = String.valueOf(session.getAttribute("curriculum"));
		Long lectureId = service.findLectureIdByCurriculum(curriculum);
		
		check.put("lectureId", lectureId);
		check.put("attendanceDate", attendanceDate);
		check.put("attendanceNum", attendanceNum);
		
		if(service.attendanceNumCheck(lectureId, attendanceDate).isPresent()) 
			service.updateAttendanceNum(check);
		else 
			service.AttendanceCheck(check);

		return "redirect:/lms/teacher/attendance";
	}
	
	/**
	 * 김부경
	 */
	@GetMapping("/notice/search")
	public String searchNotice(Model model, HttpSession session,
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

		
		return "teacher/searchNotice";
	}

	/** 
	 * 우종곤
	 */
	@GetMapping("/notice")
	public String notice(HttpSession session, Model model,
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
		
		return "teacher/notice";
	}

	@GetMapping("/notice/{noticeId}")
	public String viewNotice(@PathVariable Long noticeId, Model model) {
		Optional<Notice> notice = service.findNoticeByNoticeId(noticeId);
		
		if(notice.isPresent()) {
			notice.get().setNoticeContent(notice.get().getNoticeContent().replace("\r\n","<br>").replace(" ", "&nbsp;"));
			notice.get().setNoticeName(notice.get().getNoticeName().replace(" ", "&nbsp;"));
		}
		
		model.addAttribute("notice", notice.get());
		return "teacher/viewNotice";
	}

	@GetMapping("/notice/new")
	public String writeNotice() {
		return "teacher/newNotice";
	}

	@PostMapping("/notice/new")
	public String writeNoticePost(HttpSession session, Notice notice, Model model) {
		String writer = String.valueOf(session.getAttribute("name"));
		notice.setNoticeWriter(writer);

		Long lectureId = service.findLectureIdByName(writer);

		LocalDateTime now = LocalDateTime.now();
		String strNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		Date date = Date.valueOf(strNow);
		notice.setNoticeDate(date);

		service.saveNotice(lectureId, notice);
		return "redirect:/lms/teacher/notice";
	}

	@GetMapping("/notice/{noticeId}/update")
	public String updateNotice(@PathVariable Long noticeId, Model model) {
		Notice notice = service.findNoticeByNoticeId(noticeId).get();
		model.addAttribute("notice", notice);
		return "teacher/updateNotice";
	}
	
	@PostMapping("/notice/{noticeId}")
	public String updateNoticePost(@PathVariable Long noticeId, Notice notice) {
		service.updateNotice(noticeId, notice);
		return "redirect:/lms/teacher/notice/{noticeId}";
	}

	@PostMapping("/notice/{noticeId}/remove")
	public String deleteNotice(@PathVariable Long noticeId) {
		service.deleteNotice(noticeId);
		return "redirect:/lms/teacher/notice";
	}

	@GetMapping("/exam")
    public String exam(HttpSession session, Model model) {
        String curriculum = String.valueOf(session.getAttribute("curriculum"));
        Long lectureId = service.findLectureIdByCurriculum(curriculum);
        LocalDateTime now = LocalDateTime.now();
        String strNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd-HH-mm-ss"));
        List<Integer> examinee = new ArrayList<Integer>(); 
        Integer lecturePeople = service.countStudent(curriculum);
        List<ExamList> updateExams = service.findFinishedExam(lectureId);
        
        service.endExam(lectureId, strNow);
        for (int i = 0; i < updateExams.size(); i++) {
        	service.countGrading(updateExams.get(i).getExamId());
        	examinee.add(service.countExaminee(updateExams.get(i).getExamId()));
        }
        
        List<ExamList> standbyExams = service.findStandbyExamList(lectureId);
        List<ExamList> finishedExams = service.findFinishedExam(lectureId);
        for (int i = 0; i < standbyExams.size(); i++) {
            standbyExams.get(i).setExaminee((service.countExaminee(standbyExams.get(i).getExamId())));
        }

        model.addAttribute("standbyExams", standbyExams);
        model.addAttribute("finishedExams", finishedExams);
        model.addAttribute("lecturePeople", lecturePeople);
        model.addAttribute("examinee", examinee);

        return "teacher/exam";
    }
	
	@GetMapping("/exam/new")
	public String writeExam() {
		return "teacher/newExam";
	}

	@PostMapping("/exam/new")
	public String addExam(HttpSession session, String examName, Integer timeLimit, Exam exam) {
		String curriculum = String.valueOf(session.getAttribute("curriculum"));
		Long lectureId = service.findLectureIdByCurriculum(curriculum);
		ExamList examList = new ExamList();
		examList.setExamName(examName);
		examList.setTimeLimit(timeLimit);
		
		service.saveExamList(lectureId, examList);
		
		Long examId = service.findExamList(lectureId, examName).orElse(new ExamList()).getExamId();
		
		int idx = 1;
		for (int i = 0; i < exam.getExams().size(); i++) { 
            if(exam.getExams().get(i).getExamContent() != null)
                service.saveExam(examId, lectureId, idx++ ,exam.getExams().get(i));
        }

		return "redirect:/lms/teacher/exam";
	}

	@PostMapping("/exam/{examId}/remove")
	public String deleteExam(@PathVariable Long examId) {
		service.deleteExamList(examId);
		return "redirect:/lms/teacher/exam";
	}
	
	@GetMapping("/exam/{examId}/examinee")
	public String examinee(@PathVariable Long examId,HttpSession session,Model model) {
		String curriculum = String.valueOf(session.getAttribute("curriculum"));
		List<Member> students = service.findAllMemberByCurriculum(curriculum);
		Optional<ExamList> examList = service.findExamListByExamId(examId);
		
		model.addAttribute("students", students);
		model.addAttribute("examList", examList.orElse(new ExamList()));
		
		return "teacher/examinee";
	}
	
	@PostMapping("/exam/{examId}/start")
	public String startExam(@PathVariable Long examId,HttpSession session) {
		ExamList examList = service.findExamListByExamId(examId).orElse(null);
		service.startExam(examId,examList);
		
		return "redirect:/lms/teacher/exam";
	}

	@GetMapping("/exam/{examId}")
	public String viewExam(@PathVariable Long examId, Model model) {
		ExamList examList = service.findExamListByExamId(examId).orElse(null);
		List<Exam> exams = service.findExamByExamId(examId);
		model.addAttribute("exams", exams);
		model.addAttribute("examList", examList);

		return "teacher/viewExam";
	}

	@GetMapping("/exam/{examId}/student")
	public String gradingList(@PathVariable Long examId, Model model) {
		List<SubmitList> submitLists = service.findSubmitList(examId);
		Optional<ExamList> examList = service.findExamListByExamId(examId);
		
		model.addAttribute("submitLists", submitLists);
		model.addAttribute("examList", examList.orElse(new ExamList()));

		return "teacher/gradingList";
	}

	@GetMapping("/exam/{examId}/student/{id}")
	public String viewGradingExam(@PathVariable Long examId, @PathVariable Long id, Model model) {
		List<ExamSubmit> examSubmits = service.findExamSubmit(examId, id);
		model.addAttribute("examSubmits", examSubmits);

		return "teacher/gradingExam";
	}
	
	@PostMapping("/exam/{examId}/student/{id}")
	public String gradingExam(@PathVariable Long examId, @PathVariable Long id, ExamSubmit examSubmit) {
		Integer totalScore = 0;
		
		for (int i = 0; i < examSubmit.getExamSubmits().size(); i++) {
		  service.gradingExam(id, examId, examSubmit.getExamSubmits().get(i),(i + 1));
		  totalScore += examSubmit.getExamSubmits().get(i).getScore(); 
		 }

		service.updateSubmitList(id, examId, totalScore);

		return "redirect:/lms/teacher/exam/{examId}/student";
	}
	
	/** 
	 * 정시운
	 */
	@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		String phone = String.valueOf(session.getAttribute("phone"));
		Member member = service.findMemberByPhone(phone);
		model.addAttribute("member", member);
		return "teacher/mypage";
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
		return "redirect:/lms/teacher/mypage";
	}
	
}
