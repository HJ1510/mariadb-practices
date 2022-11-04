package com.bitacademy.bookshop.vo;

public class BookVo { //!!!!vo는 꼭 테이블과 맵핑 되는것 아님!!!! join의 결과도 반영 가능하기때문에 테이블 구성과 다를 수 있음!!!! 쿼리의 결과를 담고 파라미터를 반영한다. sql을 객체와 맵핑하는것임

	private Long no;
	private String title;
	private String status;
	private Long authorNo;
	private String authorName; // authorName은 book 테이블에는 없었지만 필요하기때문에 작성됨 private AuthorVo author; 으로 하려면 코드가 길어짐.. 객체지향에 더 맞긴함
	
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Long getAuthorNo() {
		return authorNo;
	}
	public void setAuthorNo(Long authorNo) {
		this.authorNo = authorNo;
	}
		
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	@Override
	public String toString() {
		return "BookVo [no=" + no + ", title=" + title + ", status=" + status + ", authorNo=" + authorNo
				+ ", authorName=" + authorName + "]";
	}

}
