<%@page import="common.DBConnPool"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ConnectionTest.jsp</title>
</head>
<body>

	<h2>JDBC 테스트 1 : 기본생성자 활용</h2>
	<%
		JDBConnect jdbc1 = new JDBConnect();	//기본생성자 객체 생성
		jdbc1.close();
	%>
	
	<h2>JDBC 테스트 2</h2>
	<%
		String driver = application.getInitParameter("OracleDriver");
		String url = application.getInitParameter("OracleURL");
		String id = application.getInitParameter("OracleId");
		String pwd = application.getInitParameter("OraclePwd");
		//톰켓이 관장하는 web.xml 파일에 4가지 항목을 기록해 두고 필요할 때 꺼내 사용함
		JDBConnect jdbc2 = new JDBConnect(driver, url, id, pwd);	//기본생성자 객체 생성
		jdbc2.close();
	%>
	
	<h2>JDBC 테스트 3</h2>
	<%
		JDBConnect jdbc3 = new JDBConnect(application);	//기본생성자 객체 생성
		jdbc3.close();
	%>
	
	<h2>커넥션 풀 테스트</h2>
	<%
		DBConnPool pool = new DBConnPool();
		pool.close();
	%>
	
	

</body>
</html>