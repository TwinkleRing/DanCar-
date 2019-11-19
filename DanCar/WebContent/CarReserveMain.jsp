<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@page import="dto.Car" %>
<%@page import="dao.CarDAO" %>


<%@ page import="java.util.Vector" %>
<%@ page import="jdbc.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	CarDAO dao = CarDAO.getInstance();
	Vector <Car> v = dao.getSelectCar(); 
%>
<table width="1000">
	<tr height="240">
 
<%
    for(int i=0; i < v.size(); i++){
        Car bean =v.get(i);
%>
      <td width="333" align="center">
    	<a href="CarReserveInfo.jsp?no=<%=bean.getNo()%>">
          <img alt="" src="img/<%=bean.getImg() %>" width="300" height="200">
          </a><p>
       차량명 : <%=bean.getName() %>
        </td>
       
       <%
    }
%>
    
     </table>
     <hr color="gray" size="3">
     
     <p>
     
     	<div class="row">
	<div class="col-xs-2 col-md-2"></div>
	<div class="col-xs-8 col-md-8 text-center" >
	  
		<form class="form-inline" action="DanCarMain.jsp?center=CartypeList.jsp" method="post">
			<div class="form-group">
				<h4>차량 검색하기 &nbsp;</h4>
			</div>
			<div class="form-group">
				<select name="cartype" class="form-control">
					<option value="1">소형</option>
					<option value="2">준중형</option>
					<option value="3">중형</option>
					<option value="4">중대형</option>
					<option value="5">대형</option>
				</select>
			</div>
			<div class="form-group">
				<input type="submit" value="검색하기" class="btn btn-success">
			</div>
			<div class="form-group">
			    <input type="button" value="전체검색" class="btn btn-danger" onclick="location.href='DanCarMain.jsp?center=CarAllList.jsp'">
			</div>			
		</form>

	  	
	</div>

     	
   
</body>
</html>