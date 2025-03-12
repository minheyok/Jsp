<%@page import="entity.User4"%>
<%@page import="entity.User3"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="entity.User2"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("uid");

	//데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";

	User4 user4 = null; // 선언
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		String sql = "SELECT * FROM `user4` where `uid`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			user4 = new User4(); // 생성
			user4.setUid(rs.getString(1));
			user4.setName(rs.getString(2));
			user4.setGender(rs.getString(3));
			user4.setAge(rs.getInt(4));
			user4.setHp(rs.getString(5));
			user4.setAddr(rs.getString(6));
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user4::modify</title>
</head>
<body>
	<h3>user4 수정</h3>
	<a href="../1.jdbc.jsp">처음으로</a>
	<a href="./list.jsp">목록이동</a>
	
	<form action="./proc/modify.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" value="<%= user4.getUid() %>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%= user4.getName() %>" placeholder="이름 입력"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<label><input type="radio" name="gender" value="M">남</label>
					<label><input type="radio" name="gender" value="F">여</label>
				</td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" name="age" value="<%= user4.getAge() %>" placeholder="나이 입력"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp" value="<%= user4.getHp() %>" placeholder="휴대폰 입력"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value="<%= user4.getAddr() %>" placeholder="주소 입력"></td>
			</tr>
			<tr>				
				<td colspan="2" align="right">
					<input type="submit" value="수정하기">
				</td>
			</tr>
		</table>
	</form>
	
	
</body>
</html>




