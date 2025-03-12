<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 데이터 수신
	String uid  = request.getParameter("uid");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String age = request.getParameter("age");
	String hp = request.getParameter("hp");
	String addr  = request.getParameter("addr");
	
	// 데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		String sql = "UPDATE `user4` SET `name`=?, `gender`=?, `age`=?, `hp`=?, `addr`=? WHERE `uid`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setString(2, gender);
		psmt.setString(3, age);
		psmt.setString(4, hp);
		psmt.setString(5, addr);
		psmt.setString(6, uid);
		
		psmt.executeUpdate();

		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 목록이동
	response.sendRedirect("../list.jsp");
%>


