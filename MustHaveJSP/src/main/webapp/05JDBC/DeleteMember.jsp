<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeleteMember.jsp</title>
</head>
<body>
    <%
    JDBConnect jdbc = null;
    try {
        jdbc = new JDBConnect();
        
        String id = request.getParameter("id");
        
        String checkSql = "select id from member where id = ?";
        PreparedStatement checkStmt = jdbc.con.prepareStatement(checkSql);
        checkStmt.setString(1, id);
        
        ResultSet checkRs = checkStmt.executeQuery();
        if (checkRs.next()) {
            String deleteSql = "delete from member where id = ?";
            PreparedStatement deleteStmt = jdbc.con.prepareStatement(deleteSql);
            deleteStmt.setString(1, id);
            
            int intResult = deleteStmt.executeUpdate();
    %>
            alert('회원이 삭제되었습니다.');
    <%
        } else {
    %>
            alert('알맞는 회원이 존재하지 않습니다.');
    <%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        jdbc.close();
    }
    %>
</body>
</html>
