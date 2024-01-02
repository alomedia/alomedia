package himedia.project.alomedia.controller;

import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import himedia.project.alomedia.dto.Attendance;
import himedia.project.alomedia.dto.LectureList;
import himedia.project.alomedia.dto.Member;
import himedia.project.alomedia.dto.Notice;
import himedia.project.alomedia.service.AdminService;

@Controller
@RequestMapping("/lms/admin")
public class AdminController {
	private final AdminService service;

	@Autowired
	public AdminController(AdminService service) {
		this.service = service;
	}
	
	/**
	 * 우종곤/김부경/정시운
	 */
	@GetMapping("/members/member/{id}")
	public String membersAttendance(@PathVariable Long id, Model model) {
		Optional<Member> member = service.findMemberById(id);
		LectureList lecture = service.findLectureListByCurriculum(member.get().getCurriculum()).orElse(null);
		Attendance attendance = service.findAttendanceById(member.get().getId()).orElse(null);
		
		int totalDate = service.totalAttendance(lecture.getLectureStart(), lecture.getLectureEnd());
		int restDay = totalDate - attendance.getTotalAttendance() - attendance.getAbsent();
		
		model.addAttribute("member", member.get());
		model.addAttribute("lecture", lecture);
		model.addAttribute("attendance", attendance);
		model.addAttribute("totalDate", totalDate);
		model.addAttribute("restDay", restDay);
		System.out.println("테스트");
		return "admin/Attendance";
	}
	
	/**
	 * 김부경
	 */
	@GetMapping("/lectures/search")
	public String searchLecture(
            @RequestParam(name = "type", required = false) String type,
            @RequestParam(name = "keyword", required = false) String keyword,
            @RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "pageSize", defaultValue = "10") int pageSize,
			Model model) {
		
		List<LectureList> lectures = service.searchLecture(type, keyword);
		int totalMembers = lectures.size();
		
		int currentPage = (int) Math.ceil((double) totalMembers / pageSize);
		
	    int fromIndex = (page - 1) * pageSize;
	    int toIndex = Math.min(page * pageSize, totalMembers);
	    List<LectureList> lecturesPage = lectures.subList(fromIndex, toIndex);
		
		model.addAttribute("lectures", lecturesPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", currentPage );
		
        return "admin/searchLectures";
    }
	
	@GetMapping("/members/search")
	public String searchMembers(Model model,
							 @RequestParam(name = "type", required = false) String type,
				             @RequestParam(name = "keyword", required = false) String keyword,
							 @RequestParam(name = "page", defaultValue = "1") int page,
				             @RequestParam(name = "pageSize", defaultValue = "10") int pageSize) {
		List<Member> members = service.searchMembers(type, keyword);
		
	    int totalMembers = members.size();

		int currentPage = (int) Math.ceil((double) totalMembers / pageSize);
		
	    int fromIndex = (page - 1) * pageSize;
	    int toIndex = Math.min(page * pageSize, totalMembers);
	    List<Member> membersPage = members.subList(fromIndex, toIndex);
		
		model.addAttribute("members", membersPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", currentPage );
		
		return "admin/searchMembers";
	}
	
	@GetMapping("/notice/search")
	public String searchNotice(Model model,
						@RequestParam(name = "type", required = false) String type,
			            @RequestParam(name = "keyword", required = false) String keyword,
						@RequestParam(name = "page", defaultValue = "1") int page,
			            @RequestParam(name = "pageSize", defaultValue = "10") int pageSize) {
		List<Notice> notices = service.searchNotice(type, keyword);
		
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
		
		return "admin/searchNotice";
	}
	
	@GetMapping("/lectures/new")
	public String newLectures() {
		return "admin/newLectures";
	}
	
	/**
	 * 우종곤, 김부경
	 */
	@GetMapping("/members")
	public String members(Model model,
							 @RequestParam(name = "page", defaultValue = "1") int page,
				             @RequestParam(name = "pageSize", defaultValue = "10") int pageSize) {
		List<Member> members = service.findAllMember();
	    int totalMembers = members.size();

		int currentPage = (int) Math.ceil((double) totalMembers / pageSize);
		
	    int fromIndex = (page - 1) * pageSize;
	    int toIndex = Math.min(page * pageSize, totalMembers);
	    List<Member> membersPage = members.subList(fromIndex, toIndex);
		
		model.addAttribute("members", membersPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", currentPage );
		
		return "admin/members";
	}
	
	@GetMapping("/notice")
	public String notice(Model model,
						@RequestParam(name = "page", defaultValue = "1") int page,
			            @RequestParam(name = "pageSize", defaultValue = "10") int pageSize) {
		List<Notice> notices = service.findAllAdminNotice();
		
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
		
		return "admin/notice";
	}
	
	/**
	 * 우종곤
	 */
	@PostMapping("/members/new")
	public String saveMembers(Member member) {
		int phone = service.findByPhone(member.getPhone());
		if(phone == 0) {
			service.saveMember(member);
			if (member.getUserType().equals("수강생")) {
				Long id = service.searchId(member.getName());
				service.saveAttendance(id);
			}
		}
		return "redirect:/lms/admin/members";
	}
	
	@PostMapping("/members/{memberId}/remove")
	public String deleteMembers(@PathVariable Long memberId) {
		service.deleteAttendance(memberId);
		service.deleteMember(memberId);
		return "redirect:/lms/admin/members";
	}

	@GetMapping("/members/new")
	public String newMembers(Model model) {
		List<LectureList> lectureLists = service.findAllLectureList();

		model.addAttribute("lectureLists", lectureLists);

		return "admin/newMember";
	}

	@PostMapping("/members/member/{memberId}/reset")
	public String resetPassword(@PathVariable Long memberId) {
		service.resetPassword(memberId);
		return "redirect:/lms/admin/members";
	}
	
	@GetMapping("/notice/{noticeId}")
	public String noticeView(@PathVariable Long noticeId, Model model) {
		Optional<Notice> notice = service.findAllNoticeByNoticeId(noticeId);
		
		if(notice.isPresent()) {
			notice.get().setNoticeContent(notice.get().getNoticeContent().replace("\r\n","<br>").replace(" ", "&nbsp;"));
			notice.get().setNoticeName(notice.get().getNoticeName().replace(" ", "&nbsp;"));
		}
		
		model.addAttribute("notice", notice.get());
		return "admin/viewNotice";
	}

	@GetMapping("/notice/new")
	public String noticeWrite() {
		
		return "admin/newNotice";
	}

	@PostMapping("/notice/new")
	public String insertNotice(HttpSession session, Notice notice, Model model, RedirectAttributes redirectAttributes) {
		String writer = String.valueOf(session.getAttribute("name"));
		notice.setNoticeWriter(writer);

		LocalDateTime now = LocalDateTime.now();
		String strNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		Date date = Date.valueOf(strNow);
		notice.setNoticeDate(date);

		service.saveNotice(notice);
		redirectAttributes.addAttribute("noticeId", notice.getNoticeId());
		return "redirect:/lms/admin/notice/{noticeId}";
	}

	@GetMapping("/notice/{noticeId}/update")
	public String noticeUpdate(@PathVariable Long noticeId, Model model) {
		Notice notice = service.findAllNoticeByNoticeId(noticeId).get();
		model.addAttribute("notice", notice);
		return "admin/updateNotice";
	}

	@PostMapping("/notice/{noticeId}")
	public String updateNoticePost(@PathVariable Long noticeId, Notice notice, RedirectAttributes redirectAttributes) {
		service.updateNotice(noticeId, notice);
		redirectAttributes.addAttribute("noticeId", noticeId);
		return "redirect:/lms/admin/notice/{noticeId}";
	}
	@PostMapping("/notice/{noticeId}/remove")
	public String deleteNotice(@PathVariable Long noticeId) {
		service.deleteNotice(noticeId);
		return "redirect:/lms/admin/notice";
	}
	
	/**
	 * 정시운, 김부경
	 */
	@GetMapping("/lectures")
	public String lectures(Model model,
						   @RequestParam(name = "page", defaultValue = "1") int page,
						   @RequestParam(name = "pageSize", defaultValue = "10") int pageSize) {
		List<LectureList> lectures = service.finAllLecture();
	    int totalMembers = lectures.size();

		int currentPage = (int) Math.ceil((double) totalMembers / pageSize);
		
	    int fromIndex = (page - 1) * pageSize;
	    int toIndex = Math.min(page * pageSize, totalMembers);
	    List<LectureList> lecturesPage = lectures.subList(fromIndex, toIndex);
		
		model.addAttribute("lectures", lecturesPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", currentPage );
		
		return "admin/lectures";
	}

	/**
	 * 정시운, 김부경
	 */
	@PostMapping("/mypage")
	public String postMypage(HttpSession session, @ModelAttribute Member member, @RequestParam String passwordTwo) {
		String phone = String.valueOf(session.getAttribute("phone"));

		if (!member.getPassword().isBlank()) {
			if (member.getPassword().equals(passwordTwo)) {
				member.setId(service.findMemberByPhone(phone).getId());
				service.updateMypage(member);
			}
		}

		return "redirect:/lms/admin/mypage";
	}
	
	/**
	 * 정시운
	 */
	@PostMapping("/lectures/new")
	public String insertLecture(@ModelAttribute LectureList lecture) {
		service.saveLecture(lecture);
		return "redirect:/lms/admin/lectures";
	}
	
	@GetMapping("/lectures/{lectureId}/edit")
	public String editLectures(@PathVariable Long lectureId, Model model) {
		Optional<LectureList> list = service.findLectureByLectureId(lectureId);
		if(list.isPresent())
			model.addAttribute("list", list.get());
		else
			model.addAttribute("list", new LectureList());
		return "admin/editLectures";
	}	
	
	@PostMapping("/lectures/{lectureId}/edit")
	public String postEditLectures(@PathVariable(required = false) Long lectureId, LectureList updateLectureList, RedirectAttributes redirectAttributes) {
		
		service.updateLecture(lectureId, updateLectureList);
		
		redirectAttributes.addAttribute("lectureId", lectureId);
		
		return "redirect:/lms/admin/lectures";
	}	
	
	@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		String phone = String.valueOf(session.getAttribute("phone"));
		Member member = service.findMemberByPhone(phone);
		model.addAttribute("member", member);
		return "admin/mypage";
	}
	
	/**
	 * (개발중)
	 */
	@PostMapping("/members/member/{memberId}")
	public String updateAttendance() {

		return "redirect:/lms/admin/members";
	}
}
