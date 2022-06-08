<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check() {
	var doc=document.form;
	var cnt=0;
	var chk=document.getElementsByName("position")
	for(var i=0;i<chk.length;i++){
		if(chk[i].checked==true){
			cnt++
			break;
		}
	}
	if(doc.studno.value==""){
		alert("학번이 입력되지 않았습니다");
		doc.studno.focus();
	}else if(doc.name.value==""){
		alert("성명이 입력되지 않았습니다")
			doc.name.focus();
		}else if(doc.dept.value==""){
			alert("학과가 입력되지 않았습니다");
			doc.dept.focus();
		}else if(cnt==0){
			alert("학년이 입력되지 않았습니다");
				doc.position.focus();
			}else{
				alert("등록이 완료되었습니다");
				doc.submit();
			}
		}
	



</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<%
ResultSet rs=null;
PreparedStatement pstmt=null;
String studno=request.getParameter("studno");
try{
	String sql="Select * from stud0608 where studno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, studno);
	rs=pstmt.executeQuery();
	if(rs.next()){
		studno=rs.getString("studno");
		String name=rs.getString("name");
		String dept=rs.getString("dept");
		String position=rs.getString("position");
		String address=rs.getString("address");
		String phone=rs.getString("phone");
		String hobby=rs.getString("hobby");
		String hobby123[]=hobby.split(",");
	

%>
<h2>학사 정보 수정 화면</h2>
<form name="form" method="post" action="studupdateProcess.jsp">
<table border="1" id="tab1">
<tr>
<th>학번</th>
<td>
<input type="text" name="studno" value="<%=studno %>"></td>
</tr>
<tr>
<th>성명</th>
<td>
<input type="text" name="name" value="<%=name %>"></td>
</tr>
<tr>
<th>학과</th>
<td><select name="dept">
<option value="1" <%=dept.equals("1")?"select":"" %>>컴퓨터공학과</option>
<option value="2" <%=dept.equals("2")?"select":"" %>>기계공학과</option>
<option value="3" <%=dept.equals("3")?"select":"" %>>전자과</option>
<option value="4" <%=dept.equals("4")?"select":"" %>>영문학과</option>
<option value="5" <%=dept.equals("5")?"select":"" %>>일어과</option>
<option value="6" <%=dept.equals("6")?"select":"" %>>경영학과</option>
<option value="7" <%=dept.equals("7")?"select":"" %>>무역학과</option>
<option value="8" <%=dept.equals("8")?"select":"" %>>교육학과</option>
</select></td>
</tr>
<tr>
<th>학년</th>
<td>
<input type="radio" name="position" value="1" <%=position.equals("1")?"checked":""%>>1학년
<input type="radio" name="position" value="2" <%=position.equals("2")?"checked":""%>>2학년
<input type="radio" name="position" value="3" <%=position.equals("3")?"checked":""%>>3학년
<input type="radio" name="position" value="4" <%=position.equals("4")?"checked":""%>>4학년
</td>
</tr>
<tr>
<th>취미</th>
<td>
<input type="checkbox" name="hobby" value="프로그램" <%for(int i=0;i<hobby123.length;i++){if(hobby123[i].equals("프로그램")){%>checked<%}}%>>프로그램
<input type="checkbox" name="hobby" value="독서" <%for(int i=0;i<hobby123.length;i++){if(hobby123[i].equals("독서")){%>checked<%}}%>>독서
<input type="checkbox" name="hobby" value="등산" <%for(int i=0;i<hobby123.length;i++){if(hobby123[i].equals("등산")){%>checked<%}}%>>등산
<input type="checkbox" name="hobby" value="여행" <%for(int i=0;i<hobby123.length;i++){if(hobby123[i].equals("여행")){%>checked<%}}%>>여행
<input type="checkbox" name="hobby" value="낚시" <%for(int i=0;i<hobby123.length;i++){if(hobby123[i].equals("낚시")){%>checked<%}}%>>낚시
<input type="checkbox" name="hobby" value="영화보기" <%for(int i=0;i<hobby123.length;i++){if(hobby123[i].equals("영화보기")){%>checked<%}}%>>영화보기
<input type="checkbox" name="hobby" value="잠자기" <%for(int i=0;i<hobby123.length;i++){if(hobby123[i].equals("잠자기")){%>checked<%}}%>>잠자기
<input type="checkbox" name="hobby" value="멍때리기" <%for(int i=0;i<hobby123.length;i++){if(hobby123[i].equals("멍때리기")){%>checked<%}}%>>멍때리기
</td>
</tr>
<tr>
<th>주소</th>
<td>
<input type="text" name="address" value="<%=address %>">
</td>
</tr>
<tr>
<th>연락처</th>
<td>
<input type="text" name="phone" value="<%=phone %>">
</td>
</tr>
<tr>
<td colspan="2" id="td1">
<input type="button" value="등록" onclick="check()">
<input type="button" value="취소" onclick="location.href='index.jsp'">
</td>
</tr><% 
}
	
}catch(SQLException e){
	e.printStackTrace();
}
%>
</table>
</form>


</section>
<%@ include file="footer.jsp" %>

</body>
</html>