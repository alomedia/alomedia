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
public class ExamList {
	private Long examId;
	private Long lectureId;
	private String examName;
	private String examDate;
	private Integer timeLimit;
	private Integer examinee;
	private Date examStart;
	private Date examEnd;
	private String examState;
	private Date now;
}
