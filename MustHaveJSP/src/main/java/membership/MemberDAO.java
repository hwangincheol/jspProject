package membership;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {	//jdbc를 연결하여 crud를 담당한다.
	//extends JDBConnect 

	//생성자 방법1
	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);	//new 객체 생성할때 jdbc 연결용 매개값을 전달받는다.
	} //MemberDAO객체를 생성하면 오라클에 접속이 완료 된다.
	
	//생성자 방법2
//	public MemberDAO(ServletContext application) {
//		super(application);	//new 객체 생성할때 jdbc 연결용 매개값을 전달받는다.
//	} //MemberDAO객체를 생성하면 오라클에 접속이 완료 된다.
	
	
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();	//회원객체 생성(값 없다)
		String query = "SELECT * FROM member WHERE id = ? AND pass = ?";	//쿼리문 템플릿
		
		try {
			pstmt = con.prepareStatement(query);	//동적 쿼리문 준비
			pstmt.setString(1, uid);
			pstmt.setString(2, upass);
			rs = pstmt.executeQuery();	//쿼리문 실행
			
			//결과 처리
			if (rs.next()) {
				//쿼리 결과로 얻은 회원 정보를 DTO 객체에 저장
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
		} catch (Exception e) {
			System.out.println("getMemberDTO()메서드 오류 MemberDAO를 확인하세요");
			e.printStackTrace();
		}
		
		return dto;	//결과 리턴할 객체
	}
	
	
	
	

}
