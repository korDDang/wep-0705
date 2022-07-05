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
<br>
<br>
<h2>상품 목록</h2>
<%
int ma=0;
try{
	String sql="select count(*) from order0705";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		ma=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}


%>
<div style="margin: 0 15%;">총 <%=ma %>개의 상품이 있습니다.</div>
<hr>
<table border="1" id="tab1">
<tr>
<th>상품코드</th>
<th>주문자이름</th>
<th>주문날짜</th>
<th>배달주소</th>
<th>전화번호</th>
<th>결제방법</th>
<th>카드번호</th>
<th>주문상품수</th>
<th>판매가격</th>
<th>총금액</th>
<th>구분</th>
</tr>
<%

try{
	String sql="select p.productId,o.name,to_char(o.orderdate,'YYYY-MM-DD'),o.addr,o.tel,o.pay,o.cardno,o.prodcount,p.unitprice,o.total from order0705 o,product0705 p where o.id=p.productId";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String id=rs.getString(1);
		String name=rs.getString(2);
		String orderdate=rs.getString(3);
		String addr=rs.getString(4);
		String tel=rs.getString(5);
		String pay=rs.getString(6);
		String cardno=rs.getString(7);
		int prodcount=rs.getInt(8);
		int unitprice=rs.getInt(9);
		int total=rs.getInt(10);
		
	
%>
<tr>
<td class="td4"><%=id %></td>
<td class="td4"><%=name %></td>
<td class="td4"><%=orderdate %></td>
<td class="td4"><%=addr %></td>
<td class="td4"><%=tel %></td>
<td class="td4"><%=pay %></td>
<td class="td4"><%=cardno %></td>
<td class="td4"><%=prodcount %></td>
<td class="td4"><%=unitprice %></td>
<td class="td4"><%=total %></td>
<td class="td4"><a href="update.jsp?id=<%=id %>&&name=<%=name%>">수정</a>/
<a href="delete.jsp?id=<%=id %>&&name=<%=name%>">삭제</a>


</td>
</tr>
<%
	}
	}catch(Exception e){
		e.printStackTrace();
	}

%>
</table>
<div style="text-align: center"><input type="button" value="작성" onclick="location.href='insert_order.jsp'"></div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>