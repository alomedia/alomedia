package himedia.project.alomedia.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AttendanceList {
	private Long id;
	private Long lectureId;
	private Object attendanceDate;
	private String attendanceTime;
}
