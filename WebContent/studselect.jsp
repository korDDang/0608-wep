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
<h2>학사정보 목록</h2>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;
int cnt=0;
try{
	String sql="select count(studno) from stud0608";
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
<div style="margin: 0 30%;">총 <%=cnt%>명의 학사정보가 있습니다.</div>
<table border="1" id="tab1">
<tr>
<th>학번</th>
<th>성명</th>
<th>학과</th>
<th>학년</th>
<th>주소</th>
<th>연락처</th>
<th>취미</th>
<th>관리</th>
</tr>
<%
try{
	String sql="select * from stud0608";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String studno=rs.getString(1);
		String name=rs.getString(2);
		String dept=rs.getString(3);
		String position=rs.getString(4);
		String address=rs.getString(5);
		String phone=rs.getString(6);
		String hobby=rs.getString(7);
		
		
		
%>
<tr>
<td><%=studno %></td>
<td><%=name %></td>
<td><%=dept %></td>
<td><%=position %></td>
<td><%=address %></td>
<td><%=phone %></td>
<td><%=hobby %></td>
<td><a href="studupdate.jsp?studno=<%=studno %>">수정</a>/
<a href="studdelete.jsp?studno=<%=studno %>" onclick="if(!confirm('정말로 삭제하시겠습니까'))return false;">삭제</a>
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
<input type="button" value="학사 정보 추가" onclick="location.href='studinsert.jsp'" style="color:white; background:black;"></div>
</section>
<%@ include file="footer.jsp" %>

</body>
</html>