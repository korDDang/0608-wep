<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<h2>강사 리스트</h2>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;
int cnt=0;
try{
	String sql="select count(idx) from lecturer0608";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}else{
		cnt=0;
	}
	
}catch(SQLException e){
	e.printStackTrace();
}
%>
<div style="margin: 0 30%;">총 <%=cnt%>명의 강사가 있습니다.</div>
<table border="1" id="tab1">
<tr>
<th>강사코드</th>
<th>강사명</th>
<th>전공</th>
<th>세부전공</th>
<th>관리</th>
</tr>
<%
try{
	String sql="select * from lecturer0608";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String idx=rs.getString(1);
		String name=rs.getString(2);
		String major=rs.getString(3);
		String field=rs.getString(4);
		
	
		
%>
<tr>
<td><%=idx %></td>
<td><%=name %></td>
<td><%=major %></td>
<td><%=field %></td>
<td><a href="lecturerupdate.jsp?idx=<%=idx %>">수정</a>/
<a href="lecturerdelete.jsp?idx=<%=idx %>" onclick="if(!confirm('정말로 삭제하시겠습니까'))return false;">삭제</a>
</td>
</tr>
<% 		
	}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
	}
%>
</table> 
<div style="text-align: center;">
<input type="button" value="작성" onclick="location.href='studinsert.jsp'" style="color:white; background:black;"></div>
</section>
<%@ include file="footer.jsp" %>

</body>
</html>