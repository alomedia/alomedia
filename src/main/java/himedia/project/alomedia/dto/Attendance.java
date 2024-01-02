package himedia.project.alomedia.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Attendance {
	private Long id;
	private Integer totalAttendance;
	private Integer late;
	private Integer leaveEarly;
	private Integer absent;
}
