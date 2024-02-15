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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>MainForm.jsp</title>
<style>
body {
	background-image: url('space.jpg');
	background-size: cover;
	background-position: center;
	margin: 0;
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	font-family: 'Arial', sans-serif;
}

.container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100vh;
}

table {
	border-collapse: collapse;
	width: 800px;
	margin-top: 20px;
	background-color: rgba(255, 255, 255, 0.8); /* 반투명한 흰색 배경 색상 */
	border-radius: 10px; /* 표 둥근 테두리 설정 */
}

th, td {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 12px;
}

th {
	background-color: #6799FF; /* 제목 배경색 변경 */
	color: white; /* 제목 글자색 변경 */
}

h2 {
	color: white; /* 제목 글자색을 하얀색으로 변경 */
	margin-bottom: 20px; /* 제목 아래쪽 간격 추가 */
}

button {
	background-color: #6799FF;
	color: white;
	padding: 10px 20px;
	font-size: 16px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-top: 20px;
}

button:hover {
	background-color: #6770FF;
}
</style>
<script>
        function updatePrompt(id) {
            var newName = prompt('변경할 이름을 입력하세요:');
            if (newName != null && newName.trim() != '') {
                window.location.href = 'UpdateName.jsp?id=' + id + '&newName=' + newName;
            } else {
                alert('변경이 취소되었습니다.');
            }
        }

        function createPrompt() {
            var newId = prompt('새로운 아이디를 입력하세요:');
            var newPassword = prompt('새로운 비밀번호를 입력하세요:');
            var newName = prompt('새로운 이름을 입력하세요:');

            if (newId != null && newPassword != null && newName != null && newId.trim() != '' && newPassword.trim() != '' && newName.trim() != '') {
                $.ajax({
                    url: 'CreateMember.jsp',
                    type: 'POST',
                    data: {
                        id: newId,
                        pass: newPassword,
                        name: newName
                    },
                    success: function() {
                        alert("회원이 등록되었습니다.");
                        location.reload();
                    },
                    error: function(error) {
                        alert('회원 등록이 실패했습니다.');
                    }
                });
            } else {
                alert('회원 등록이 취소되었습니다.');
            }
        }
        
        function deletePrompt() {
        	var id = prompt('삭제할 아이디를 입력하세요:');
			
        	if (id != null && id.trim() != '') {
                $.ajax({
                    url: 'DeleteMember.jsp',
                    type: 'POST',
                    data: {
                        id: id,
                    },
                    success: function(intResult) {
                        location.reload();
                    },
                    error: function(error) {
                        alert('회원 삭제가 실패했습니다.');
                    }
                });
            } else {
                alert('회원 삭제가 취소되었습니다.');
            }
		}
    </script>
</head>
<body>
	<div class="container">
		<h2>회원 목록 조회 (회원 관리)</h2>
		<% 
            JDBConnect jdbc = new JDBConnect();
            String sql = "select id, pass, name, regidate from member";
            Statement stmt = jdbc.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            ArrayList<String> id = new ArrayList<>();
            ArrayList<String> pw = new ArrayList<>();
            ArrayList<String> name = new ArrayList<>();
            ArrayList<Date> regidate = new ArrayList<>();

            while(rs.next()) {
                id.add(rs.getString(1));
                pw.add(rs.getString(2));
                name.add(rs.getString("name"));
                regidate.add(rs.getDate("regidate"));
            }

            jdbc.close();
        %>
		<table>
			<th style="text-align: center;">아이디</th>
			<th style="text-align: center;">비밀번호</th>
			<th style="text-align: center;">이름</th>
			<th style="text-align: center;">생성일</th>
			<% for (int i = 0; i < id.size(); i++) { %>
			<tr>
				<td><%= id.get(i) %></td>
				<td><%= pw.get(i) %></td>
				<td><a href="#" onclick="updatePrompt('<%= id.get(i) %>')"><%= name.get(i) %></a></td>
				<td><%= regidate.get(i) %></td>
			</tr>
			<% } %>
		</table>
		<div>
			<button type="button" onclick="createPrompt()">회원 추가</button>
			<button type="button" onclick="deletePrompt()" style="margin-left: 100px;">회원 삭제</button>
			<button type="button" onclick="location.href='../08Board/List.jsp';" style="margin-left: 100px;">돌아가기</button>
		</div>
	</div>
</body>
</html>