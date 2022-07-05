<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%



try{
	String sql="insert into order0705 values(?,?,?,?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("productId"));
	pstmt.setString(2, request.getParameter("name"));
	pstmt.setString(3, request.getParameter("orderdate"));
	pstmt.setString(4, request.getParameter("addr"));
	pstmt.setString(5, request.getParameter("tel"));
	pstmt.setString(6, request.getParameter("pay"));
	pstmt.setString(7, request.getParameter("cardno"));
	pstmt.setString(8, request.getParameter("prodcount"));
	pstmt.setString(9, request.getParameter("total"));
	pstmt.executeUpdate();
	%>	<script>
	alert("등록성공");
	location.href="index.jsp";
	</script>
<% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록실패");
}



%>
</body>
</html>