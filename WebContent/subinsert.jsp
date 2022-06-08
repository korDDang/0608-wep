<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check() {
	var doc=document.form;
	if(doc.id.value==""){
		alert("교과목코드가 입력되지 않았습니다");
		doc.id.focus();
	}else if(doc.subject_name.value==""){
		alert("교과목명이 입력되지 않았습니다");
		doc.subject_name.focus();
	}else if(doc.credit.value==""){
		alert("학점이 입력되지 않았습니다");
		doc.credit.focus();
	}else if(doc.lecturer.value=="0"){
		alert("강사명이 입력되지 않았습니다");
		doc.lecturer.focus();
	}else if(doc.start_hour.value==""){
		alert("시작시간이 입력되지 않았습니다");
		doc.start_hour.focus();
	}else if(doc.end_hour.value==""){
		alert("종료시간이 입력되지 않았습니다");
		doc.end_hour.focus();
	}else{
		alert("완료되었습니다.");
		doc.submit();
	}
}

</script>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<%@include file="DBConn.jsp" %>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;

%>

<section id="sec1">
<h2>교과목 추가</h2>
<form name=form method="post" action="subinsertProcess.jsp">
<table border="1" id="tab1">
<tr>
<th>교과목 코드</th>
<td>
<input type="text" name="id" ></td>
</tr>
<tr>
<th>과 목 명</th>
<td>
<input type="text" name="subject_name"></td>
</tr>
<tr>
<th>학 점</th>
<td>
<input type="text" name="credit"></td>
</tr>
<tr>
<th>담 당 강 사</th>
<td><select name="lecturer" required>
<option value="0">담당강사 선택</option>
<%
try{
	String sql="select idx,name from lecturer0608";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String idx=rs.getString(1);
		String name=rs.getString(2);
	
%>

<option value="<%=idx %>"><%=name %></option>

<% 
}
}catch(SQLException e){
	e.printStackTrace();
}
%>
</select></td>
</tr>
<tr>
<th>요 일</th>
<td>
<input type="radio" name="week" value="1">월
<input type="radio" name="week" value="2">화
<input type="radio" name="week" value="3">수
<input type="radio" name="week" value="4">목
<input type="radio" name="week" value="5">금
<input type="radio" name="week" value="6">토
</td>
</tr>
<tr>
<th>시작</th>
<td>
<input type="text" name="start_hour"></td>
</tr>
<tr>
<th>종료</th>
<td>
<input type="text" name="end_hour"></td>
</tr>
<tr>
<td colspan="2" style="text-align: center;">
<input type="button" value="목록" onclick="location.href='subselect.jsp'">
<input type="button" value="등록" onclick="check()">
</td>
</tr>

</table>

</form>

</section>
<%@include file="footer.jsp" %>
</body>
</html>