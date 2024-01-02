package himedia.project.alomedia.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter 
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SubmitList {
	private Long id;
	private Long examId;
	private String examName;
	private String name;
	private String submitTime;
	private String state;
	private Integer totalScore;
}
