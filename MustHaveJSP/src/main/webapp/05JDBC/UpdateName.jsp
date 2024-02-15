<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdateName.jsp</title>
</head>
<body>

	<%
	JDBConnect jdbc = null;
	try {
		jdbc = new JDBConnect();
		
		String newName = request.getParameter("newName");
		String id = request.getParameter("id");
		
		String sql = "update member set name = ? where id = ?";
		
		PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
		pstmt.setString(1, newName);
		pstmt.setString(2, id);
		
		int intResult = pstmt.executeUpdate();	//쿼리문 실행 후 결과를 int로 받는다.
		out.println(intResult + "행이 입력 되었습니다.");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		jdbc.close();
		response.sendRedirect("MainForm.jsp");
	}
	
	%>

</body>
</html>