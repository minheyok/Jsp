<%@page import="entity.User5"%>
<%@page import="entity.User4"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";
	
	List<User5> users = new ArrayList<>();

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery("SELECT * FROM `user5`");
		
		while(rs.next()){
			User5 user5 = new User5();
			user5.setSeq(rs.getInt(1));
			user5.setName(rs.getString(2));
			user5.setGender(rs.getString(3));
			user5.setAge(rs.getInt(4));
			user5.setAddr(rs.getString(5));
			users.add(user5);			
		}
		
		rs.close();
		stmt.close();
		conn.close();		
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user5::list</title>
</head>
<body>
	<h3>user5 목록</h3>
	<a href="../1.jdbc.jsp">처음으로</a>
	<a href="./register.jsp">등록하기</a>
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>성별</th>
			<th>나이</th>
			<th>주소</th>
			<th>관리</th>
		</tr>
		<% for(User5 user5 : users){ %>
		<tr>
			<td><%= user5.getSeq() %></td>
			<td><%= user5.getName() %></td>
			<td><%= user5.getGender() %></td>
			<td><%= user5.getAge() %></td>
			<td><%= user5.getAddr() %></td>
			<td>
				<a href="./modify.jsp?seq=<%= user5.getSeq() %>">수정</a>
				<a href="./proc/delete.jsp?seq=<%= user5.getSeq() %>">삭제</a>
			</td>
		</tr>
		<% } %>		
	</table>	
</body>
</html>




