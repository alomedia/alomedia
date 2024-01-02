package himedia.project.alomedia.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class LectureList {
	private Long lectureId;
	private String lectureName;
	private String lectureDay;
	private String lectureTime;
	private String lectureRoom;
	private Integer lecturePeople;
	private String lectureTeacher;
	private Date lectureStart;
	private Date lectureEnd;
	private String lectureState;
}
