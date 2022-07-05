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
function check1(){
	var doc=document.form;
	var chk=document.getElementsByName("pay");
	for(var i=0;i<chk.length;i++){
		if(chk[i].checked==true){
			if(chk[i].value=="현금"){
				doc.cardno.disabled=true;
			}else if(chk[i].value=="카드"){
			  	alert("카드번호를 입력해주세요");
			  	doc.cardno.disabled=false;
			}
		}
	}
}
function check() {
	var doc=document.form;
	if(doc.productId.value==""){
		alert("상품코드를 입력하세요");
		doc.productId.focus();
	}else if(doc.name.value==""){
		alert("상품명을 입력하세요");
		doc.name.focus();
	}else{
	    alert("완료되었습니다");
		form.action="insert_orderProcess.jsp";
	}
}

</script>
</head>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">

<%
int pro=0;
int total=0;
String orderdate=request.getParameter("orderdate");
if(orderdate==null){
	orderdate="";}	
String tel=request.getParameter("tel");
if(tel==null){
	tel="";}	
String addr=request.getParameter("addr");
if(addr==null){
	addr="";}	
String prodcount=request.getParameter("prodcount");
if(prodcount==null){
  prodcount="0";}else{pro=Integer.parseInt(prodcount);}
String cardno=request.getParameter("cardno");
if(cardno==null){
	cardno="";}	

	String name=request.getParameter("name");
	if(name==null){
		name="";}	
		
int unitprice=0;
String productId=request.getParameter("productId");
if(productId==null){
productId="";		
}else{
try{
	String sql="select unitprice from product0705 where productId=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs=pstmt.executeQuery();
	if(rs.next()){
		unitprice=rs.getInt(1);
		total=unitprice*pro;
		
	}else{
		%> <script>
		  alert("등록되지 않은 코드입니다");
		  </script>
		  <%
	
	}
}catch(SQLException e){
	e.printStackTrace();
}
}
	
%>
<h2>주문정보 등록 화면</h2>
<hr>
<form name="form" method="post" action="insert_order.jsp">
<table border="1" class="tab1">
<tr>
<th>상품코드</th>
<td>
	<input type="text" name="productId" onchange="ch()" value="<%=productId%>"></td>
<th>주문자 이름</th>
<td>
	<input type="text" name="name" value="<%=name%>">
</td>
</tr>
<tr>
<th>주문 날짜</th>
<td>
<input type="text" name="orderdate" value="<%=orderdate%>">
</td>
<th>전화번호</th>
<td>
	<input type="text" name="tel" value="<%=tel%>">
</td>
</tr>
<tr>
<th>배달주소</th>
<td colspan="3">
<input type="text" name="addr" value="<%=addr%>">
</td>
</tr>
<tr>
<th>결제방법</th>
<td>
<input type="radio" name="pay" value="현금" onclick="check1()">현금
<input type="radio" name="pay" value="카드" onclick="check1()">카드
</td>
<th>카드번호</th>
<td>
<input type="text" name="cardno" value="<%=cardno%>">
</td>
</tr>
<tr>
<th>주문상품수</th>
<td>
<input type="text" name="prodcount" onchange="ch()" value="<%=prodcount%>">
</td>
<th>주문금액</th>
<td>
<input type="text" name="total" value="<%=total%>">
</td>
</tr>

<tr>
<td colspan="4" class="td1">
<input type="button" value="목록" onclick="location.href='select_order.jsp'">
<input type="submit" value="저장" onclick="check()">
</td>
</tr>
</table>
</form>
</section>
<%@include file="footer.jsp" %>  
</body>
</html>