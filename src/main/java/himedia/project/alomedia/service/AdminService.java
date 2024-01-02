package himedia.project.alomedia.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import himedia.project.alomedia.dto.Attendance;
import himedia.project.alomedia.dto.LectureList;
import himedia.project.alomedia.dto.Member;
import himedia.project.alomedia.dto.Notice;
import himedia.project.alomedia.repository.AdminRepository;

@Service
public class AdminService {
	private final AdminRepository repository;

	@Autowired
	public AdminService(AdminRepository repository) {
		this.repository = repository;
	}
	
	/** 
	 * 우종곤
	 */
	public List<Member> findAllMember() {
		return repository.findAllMember();
	}

	public void saveMember(Member member) {
		repository.saveMember(member);
	}

	public void deleteMember(Long memberId) {
		repository.deleteMember(memberId);
	}
	
	public void deleteAttendance(Long memberId) {
		repository.deleteAttendance(memberId);
	}
	
	public void resetPassword(Long memberId) {
		repository.resetPassword(memberId);
	}
	
	public void saveLecture(LectureList list) {
		repository.saveLecture(list);
	}

	public List<LectureList> finAllLecture() {
		return repository.findAllLecture();
	}

	public List<Notice> findAllNoticeByCurriculum(String curriculum) {
		return repository.findAllNoticeByCurriculum(curriculum);
	}

	public Optional<Notice> findAllNoticeByNoticeId(Long noticeId) {
		return repository.findAllNoticeByNoticeId(noticeId);
	}

	public int saveNotice(Notice notice) {
		return repository.saveNotice(notice);
	}

	public int updateNotice(Long noticeId, Notice notice) {
		return repository.updateNotice(noticeId, notice);
	}

	public int deleteNotice(Long noticeId) {
		return repository.deleteNotice(noticeId);
	}

	public Long searchId(String name) {
		return repository.searchId(name);
	}

	public void saveAttendance(Long id) {
		repository.saveAttendance(id);
	}
	
	public List<Notice> findAllAdminNotice() {
		return repository.findAllAdminNotice();
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
	
	/** 
	 * 정시운
	 */

	public void updateMypage(Member member) {
		repository.updateMypage(member);
	}

	public Member findMemberByPhone(String phone) {
		return repository.findMemberByPhone(phone);
	}
	
	public List<LectureList> findAllLectureList() {
		return repository.findAllLectureList();
	}
	
	public Optional<LectureList> findLectureByLectureId(Long lectureId) {
		return repository.findLectureByLectureId(lectureId);
	}	
	
	public int updateLecture(Long lectureId, LectureList updateLectureList) {
		return repository.updateLecture(lectureId, updateLectureList);
	}	
	
	public int findByPhone(String phone) {
		return repository.findByPhone(phone);
	}
	
	public Optional<Member> findMemberById(Long id) {
		return repository.findMemberById(id);
	}	
	
	public Optional<LectureList> findLectureListByCurriculum(String curriculum) {
		return repository.findLectureListByCurriculum(curriculum);
	}
	
	public Optional<Attendance> findAttendanceById(Long id) {
		return repository.findAttendanceById(id);
	}
	
	/** 
	 * 김부경
	 */
	
	public List<LectureList> searchLecture(String type, String keyword) {
		return repository.searchLecture(type, keyword);
	}	
	
	public List<Member> searchMembers(String type, String keyword) {
		return repository.searchMembers(type, keyword);
	}	
	
	public List<Notice> searchNotice(String type, String keyword) {
		return repository.searchNotice(type, keyword);
	}
}
