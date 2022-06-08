
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
<th>과목코드</th>
<th>과목명</th>
<th>학점</th>
<th>담당강사</th>
<th>요일</th>
<th>시작시간</th>
<th>종료시간</th>
<th>관리</th>
</tr>
<%
try{
	String sql="select * from sub0608";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String id=rs.getString(1);
		String subject_name=rs.getString(2);
		String credit=rs.getString(3);
		String lecturer=rs.getString(4);
		switch(lecturer){
		case "1":
			    lecturer="김교수";
			    break;
		case "2":
		    lecturer="이교수";
		    break;
		case "3":
		    lecturer="박교수";
		    break;
		case "4":
		    lecturer="우교수";
		    break;
		case "5":
		    lecturer="최교수";
		    break;
		case "6":
		    lecturer="강교수";
		    break;
		case "7":
		    lecturer="황교수";
		    break;
		}
		String week=rs.getString(5);
		
		 switch(week){
case "1":
	    week="월";
	    break;
case "2":
	week="화";
    break;
case "3":
	week="수";
    break;
case "4":
	week="목";
    break;
case "5":
	week="금";
    break;
case "6":
	week="토";
    break;
		 }
		String start_hour=rs.getString(6);
		String end_hour=rs.getString(7);
		
	
		
%>
<tr>
<td><%=id%></td>
<td><%=subject_name %></td>
<td><%=credit %></td>
<td><%=lecturer %></td>
<td><%=week%></td>
<td><%=start_hour %></td>
<td><%=end_hour %></td>
<td><a href="subupdate.jsp?id=<%=id %>">수정</a>/
<a href="subdelete.jsp?id=<%=id %>" onclick="if(!confirm('정말로 삭제하시겠습니까'))return false;">삭제</a>
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
<input type="button" value="작성" onclick="location.href='subinsert.jsp'" style="color:white; background:black;"></div>
</section>
<%@ include file="footer.jsp" %>

</body>
</html>