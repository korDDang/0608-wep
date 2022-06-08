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
	if(doc.idx.value==""){
		alert("강사ID가 입력되지 않았습니다");
		doc.idx.focus();
	}else if(doc.name.value==""){
		alert("강사명이 입력되지 않았습니다");
		doc.name.focus();
	}else if(doc.major.value==""){
		alert("전공이 입력되지 않았습니다");
		doc.major.focus();
	}else if(doc.field.value==""){
		alert("세부전공이 입력되지 않았습니다");
		doc.field.focus();
	}else{
		alert("저장완료");
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
int ma=0;
try{
	String sql="select max(idx) from lecturer0608";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		ma=rs.getInt(1)+1;
	}else{
		ma=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<section id="sec1">
<h2>강사 추가</h2>
<form name=form method="post" action="lecturerinsertProcess.jsp">
<table border="1" id="tab1">
<tr>
<th>강사 ID</th>
<td>
<input type="text" name="idx" value="<%=ma%>"></td>
</tr>
<tr>
<th>강 사 명</th>
<td>
<input type="text" name="name"></td>
</tr>
<tr>
<th>전 공</th>
<td>
<input type="text" name="major"></td>
</tr>
<tr>
<th>세부 전공</th>
<td>
<input type="text" name="field"></td>
</tr>
<tr>
<td colspan="2" style="text-align: center;">
<input type="button" value="목록" onclick="location.href='lecturerselect.jsp'">
<input type="button" value="등록" onclick="check()">
</table>

</form>

</section>
<%@include file="footer.jsp" %>
</body>
</html>