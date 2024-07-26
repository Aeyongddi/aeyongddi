package springweb.z01_vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MailEmp {
	private int empno;
	private String mailAddress;
}
