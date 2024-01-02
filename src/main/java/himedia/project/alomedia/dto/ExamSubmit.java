package himedia.project.alomedia.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
public class ExamSubmit {
	private Long id;
	private Long examId;
	private Long lectureId;
	private Integer questionNum;
	private String ans;
	private Integer examAllotment;
	private String teacherComent;
	private Integer score;
	private String examContent;

	private List<ExamSubmit> ExamSubmits;
}
