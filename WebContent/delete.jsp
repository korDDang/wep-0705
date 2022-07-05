<%@page import="java.sql.SQLException"%>
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
	String sql="delete from order0705 where id=? and name=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("id"));
	pstmt.setString(2, request.getParameter("name"));
	pstmt.executeUpdate();
	%><script>
	alert("삭제성공");
	location.href="select_order.jsp"
		</script>
	<%
	
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("삭제실패");
}
%>
</body>
</html>