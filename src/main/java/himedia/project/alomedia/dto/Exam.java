package himedia.project.alomedia.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
public class Exam {
	private Long examId;
	private Long lectureId;
	private Integer questionNum;
	private String examContent;
	private Integer examAllotment;
	
	private List<Exam> exams;
}
