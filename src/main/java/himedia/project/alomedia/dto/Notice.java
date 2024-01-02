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
public class Notice {
	private Long noticeId;
	private Long lectureId;
	private String noticeName;
	private String noticeContent;
	private String noticeWriter;
	private Date noticeDate;
}
