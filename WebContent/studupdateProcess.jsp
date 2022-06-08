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
String hobby[]=request.getParameterValues("hobby");
String hobbysum="";
try{
	String sql="update stud0608 set name=?,dept=?,position=?,address=?,phone=?,hobby=? where studno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(7, request.getParameter("studno"));
	pstmt.setString(1, request.getParameter("name"));
	pstmt.setString(2, request.getParameter("dept"));
	pstmt.setString(3, request.getParameter("position"));
	pstmt.setString(4, request.getParameter("address"));
	pstmt.setString(5, request.getParameter("phone"));
	for(int i=0;i<hobby.length;i++){
		if(i==0){
			hobbysum=hobby[i];
		}else{
			hobbysum+=","+hobby[i];
		}
		pstmt.setString(6, hobbysum);
	}
	
	pstmt.executeUpdate();
	System.out.println("수정성공");
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