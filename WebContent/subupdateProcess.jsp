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
	String sql="update sub0608 set subject_name=?,credit=?,lecturer=?,week=?,start_hour=?,end_hour=? where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(7, request.getParameter("id"));
	pstmt.setString(1, request.getParameter("subject_name"));
	pstmt.setString(2, request.getParameter("credit"));
	pstmt.setString(3, request.getParameter("lecturer"));
	pstmt.setString(4, request.getParameter("week"));
	pstmt.setString(5, request.getParameter("start_hour"));
	pstmt.setString(6, request.getParameter("end_hour"));
	pstmt.executeUpdate();
	System.out.println("수정성공");


;
	%>
	<script>
	alert("수정성공");
	history.back(-1);
	
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정실패");
}

%>
</body>
</html>