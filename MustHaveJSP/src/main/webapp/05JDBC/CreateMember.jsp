<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.security.interfaces.RSAKey"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CreateMember.jsp</title>
</head>
<body>
	
	<%
	JDBConnect jdbc = null;
	try {
		jdbc = new JDBConnect();
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		
		String sql = "insert into member values(?, ?, ?, sysdate)";
		PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		pstmt.setString(3, name);	//쿼리문 완성
		
		int intResult = pstmt.executeUpdate();	//쿼리문 실행 후 결과를 int로 받는다.
		out.println(intResult + "행이 입력 되었습니다.");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		jdbc.close();
	}
	
	%>

</body>
</html>