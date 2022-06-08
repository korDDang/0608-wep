
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
<h2>교과목 목록</h2>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;
int cnt=0;
try{
	String sql="select count(id) from sub0608";
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
<div style="margin: 0 30%;">총 <%=cnt%>개의 교과목이 있습니다.</div>
<hr>
<table border="1" id="tab1">
<tr>
<th>no</th>
<th>강사코드</th>
<th>담당강사</th>
<th>과목코드</th>
<th>과목명</th>
<th>학점</th>
<th>요일</th>
<th>시작시간</th>
<th>종료시간</th>
</tr>
<%
int no=0;
try{
	String sql="select l.idx,l.name,s.id,s.subject_name,s.credit,s.week,s.start_hour,s.end_hour from sub0608 s,lecturer0608 l where s.lecturer=l.idx order by l.idx";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String idx=rs.getString(1);
		String name=rs.getString(2);
		String id=rs.getString(3);
		String subject_name=rs.getString(4);
		String credit=rs.getString(5);
		String week=rs.getString(6);
		String start_hour=rs.getString(7);
		String end_hour=rs.getString(8);
		no++;
	
		
%>
<tr>
<td><%=no%></td>
<td><%=idx %></td>
<td><%=name %></td>
<td><%=id %></td>
<td><%=subject_name%></td>
<td><%=start_hour %></td>
<td><%=week %></td>
<td><%=start_hour %></td>
<td><%=end_hour %></td>
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
<input type="button" value="작성" onclick="location.href='subinsert.jsp'" style="color:white; background:black;"></div>
</section>
<%@ include file="footer.jsp" %>

</body>
</html>