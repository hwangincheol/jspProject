<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ExeQuery.jsp</title>
<style>
    table {
        border-collapse: collapse;
        width: 1000px;
    }

    th, td {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    th {
        background-color: #f2f2f2;
    }
</style>

</head>
<body>
	
	<h2>회원 목록 조회 테스트 (executeQuery()) 사용</h2>
	<%
		JDBConnect jdbc = new JDBConnect();	//기본생성자로 연결
		
		String sql = "select id, pass, name, regidate from member";
		Statement stmt = jdbc.con.createStatement();	//정적 쿼리문 생성
		ResultSet rs = stmt.executeQuery(sql);	//위에서 만든 쿼리문 실행 결과표(Resultset)로 받음
		
		ArrayList<String> id = new ArrayList<>();
		ArrayList<String> pw = new ArrayList<>();
		ArrayList<String> name = new ArrayList<>();
		ArrayList<Date> regidate = new ArrayList<>();
		
		while(rs.next()) {	//ResultSet 표에 행이 없으면 false, 있으면 true
			id.add(rs.getString(1));
			pw.add(rs.getString(2));
			name.add(rs.getString("name"));
			regidate.add(rs.getDate("regidate"));	//4개의 열값을 변수에 저장
		}
		
		jdbc.close();	//연결종료
	
	%>
	<table>
		<th style="text-align: center;">아이디</th>
    	<th style="text-align: center;">비밀번호</th>
    	<th style="text-align: center;">이름</th>
    	<th style="text-align: center;">생성일</th>
		</tr>
		<% for (int i = 0; i < id.size(); i++) { %>
		<tr>
			<td><%= id.get(i) %></td>
			<td><%= pw.get(i) %></td>
			<td><%= name.get(i) %></td>
			<td><%= regidate.get(i) %></td> 
		</tr>
		<% } %>
	</table>
	<br>
	

</body>
</html>