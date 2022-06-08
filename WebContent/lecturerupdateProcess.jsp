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
	String sql="update lecturer0608 set name=?,major=?,field=? where idx=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(4, request.getParameter("idx"));
	pstmt.setString(1, request.getParameter("name"));
	pstmt.setString(2, request.getParameter("major"));
	pstmt.setString(3, request.getParameter("field"));
	

	pstmt.executeUpdate();
	System.out.println("수정성공");
	%>
	<script>
	alert("수정완료");
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