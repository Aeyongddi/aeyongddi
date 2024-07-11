package hahaha.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Board {
	private int inquiry_id;
	private String customer_id; 
	private String Content;
	private String response;
	private String status;
	private String title;
}
