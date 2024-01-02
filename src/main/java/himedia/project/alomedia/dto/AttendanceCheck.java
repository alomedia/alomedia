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
public class AttendanceCheck {
	private Long lectureId;
	private Date attendanceDate;
	private Integer attendanceNum;
}
