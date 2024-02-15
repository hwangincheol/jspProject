package model1;

import java.sql.Date;

public class BoardDTO {	//BoardDTO는 데이터베이스 필드값과 동일한 객체를 만든다.
	
	//멤버 변수 선언
	private String num;		//번호
	private String title;	//제목
	private String content;	//내용
	private String id;		//작성자 id
	private Date postdate;	//작성일
	private String visitcount;	//조회수
	private String name;	//fk를 활용한 MemberDTO의 이름
	
	//기본생성자
	public BoardDTO() {
		super();
	}
	
	//게터 세터
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getPostdate() {
		return postdate;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	public String getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}


}
