package springweb.z01_vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MailVo {
	private String title;
	private String receiver;
	private String sender;
	private String content;
}
