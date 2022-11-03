package test;

public class DeptVo { //~~Vo 데이터베이스의 raw를 담당하는 클래스
	private Long no;
	private String name;
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "DeptVo [no=" + no + ", name=" + name + "]";
	}
}
