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
PreparedStatement pstmt=null;
try{
	String sql="delete from stud0608 where studno=?";
	pstmt=conn.prepareStatement(sql);
    pstmt.setString(1, request.getParameter("studno"));
    pstmt.executeUpdate();
    System.out.println("삭제성공");
    %>
    <script>
    alert("삭제성공");
    history.back(-1);
    </script>
    <% 
}catch(SQLException e){
	e.printStackTrace();
}

%>
</body>
</html>