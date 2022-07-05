<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main화면</title>
<script>
function ch(){
	var doc=document.form;
	doc.submit();
}
function check() {
	var doc=document.form;
	if(doc.id.value==""){
		alert("아이디를 입력하세요.");
		doc.id.focus();
	}else if(doc.name.value==""){
		alert("이름을 입력하세요.");
		doc.name.focus();
	}else if(doc.password.value==""){
		alert("비밀번호를 입력하세요.");
		doc.password.focus();
	}else{
		form.action="insert_memberProcess.jsp"
	}
}


</script>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<%@include file="DBConn.jsp" %>
<section id="sec1">
<%
String password=request.getParameter("password");
if(password==null){
	password="";}
String name=request.getParameter("name");
if(name==null){
	name="";}
String gender=request.getParameter("gender");
if(gender==null){
	gender="";}
String birth=request.getParameter("birth");
if(birth==null){
	birth="";}
String mail=request.getParameter("mail");
if(mail==null){
	mail="";}
String phone=request.getParameter("phone");
if(phone==null){
	phone="";}
String address=request.getParameter("address");
if(address==null){
	address="";}
String nickname=request.getParameter("nickname");
if(nickname==null){
	nickname="";}




String id=request.getParameter("id");
if(id==null){
	id="";
}else{
try{
	String sql="select id from member0705 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	if(rs.next()){
		id=rs.getString(1);
		%><script>
			alert("이미 등록된 아이디 입니다");
			</script>
	      <% 
	}
	
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
}

%>
<h2>회원 정보 등록 화면</h2>
<hr>
<form name="form" method="post" action="insert_member.jsp">
<table border="1" id="tab1">
<tr>
<th>아이디</th>
<td class="td2">
	<input type="text" name="id" onchange="ch()" value="<%=id %>">
</td>
</tr>
<tr>
<th>이름</th>
<td class="td2">
 	<input type="text" name="name" value="<%=name %>">
</td>
</tr>
<tr>
<th>비밀번호</th>
<td class="td2">
	<input type="text" name="password" value="<%=password %>">
</td>
</tr>
<tr>
<th>성별</th>
<td class="td2">
	<input type="radio" name="gender" value="남성">남
	<input type="radio" name="gender" value="여성">여
</td>
</tr>

<tr>
<th>생년월일</th>
<td class="td2">
 	<input type="text" name="birth" value="<%=birth %>" >
</td>
</tr>
<tr>
<th>이메일</th>
<td class="td2">
 	<input type="text" name="mail" value="<%=mail%>">@
 	<select name="mail1">
 	<option value="naver.com">naver.com</option>
 	<option value="kor.com">kor.com</option>
 	<option value="hanmail.net">hanmail.net</option>
 	<option value="google.com">google.com</option>
 	</select>
</td>
</tr>
<tr>
<th>핸드폰</th>
<td class="td2">
	<select name="phone" >
	<option value="010">010</option>
	<option value="011">011</option>
	<option value="02">02</option>
	</select>-
 	<input type="text" name="phone1" value="<%=phone%>">-
 	<input type="text" name="phone2" value="<%=phone%>">
</td>
</tr>
<tr>
<th>주소</th>
<td class="td2">
 	<input type="text" name="address" style="width: 300px;" value="<%=address %>">
</td>
</tr>
<tr>
<th>닉네임</th>
<td class="td2">
 	<input type="text" name="nickname" value="<%=nickname %>">
</td>
</tr>
<tr>
<td colspan="2" class="td1"> 
	<input type="submit" value="회원등록" onclick="check()" class="bt1">
	<input type="reset" value="다시작성" class="bt1">
</table>
</form>


</section>
<%@include file="footer.jsp" %>
</body>
</html>