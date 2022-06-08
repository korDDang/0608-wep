<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
request.setCharacterEncoding("utf-8");
PreparedStatement pstmt=null;

try{
	String sql="insert into sub0608 values(?,?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("id"));
	pstmt.setString(2, request.getParameter("subject_name"));
	pstmt.setString(3, request.getParameter("credit"));
	pstmt.setString(4, request.getParameter("lecturer"));
	pstmt.setString(5, request.getParameter("week"));
	pstmt.setString(6, request.getParameter("start_hour"));
	pstmt.setString(7, request.getParameter("end_hour"));
	pstmt.executeUpdate();
	System.out.println("저장성공");
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("저장실패");
}

%>
</body>
</html>