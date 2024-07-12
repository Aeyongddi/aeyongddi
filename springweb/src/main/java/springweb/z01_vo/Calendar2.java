package springweb.z01_vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Calendar2 {
	private int id;
	private String title;
	private String writer;
	private String start;
	private String end;
	private String content;
	private String backgroundColor;
	private String textColor;
	private boolean allDay;
	private String urlLink;
}
