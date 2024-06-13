package a01_diexp.z01_vo;

public class Music {
	private String name;
	private String singer;
	private int year;
	public Music() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Music(String name, String singer, int year) {
		super();
		this.name = name;
		this.singer = singer;
		this.year = year;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	
}
