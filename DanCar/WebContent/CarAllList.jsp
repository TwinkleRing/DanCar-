<%@page import="dto.Car"%>
<%@ page import="java.sql.*"%>
<%@ page import="dao.CarDAO"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@page import="dao.CarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>전체 차 보기</title>
</head>
<body>

		
			<%
				CarDAO dao = CarDAO.getInstance();
				List<Car> v = dao.getAllCar();
%>

<div class="container marketing" id="marketing">
	<h2 class="text-center" id="carTitle">차량 전체 목록</h2>
   <!-- Three columns of text below the carousel -->
      <div class="row">
<%
				int j = 0;
				for (int i = 0; i < v.size(); i++) {
					Car bean = v.get(i);
					if (j % 3 == 0) {
	%>
			


			<%
					}
			%>
				 <div class="col-lg-4">
          <img class="img-circle" src="img/<%=bean.getImg() %>" alt="Generic placeholder image" width="300" height="200" 
             onclick="location.href='DanCarMain.jsp?center=CarReserveInfo.jsp&no=<%= bean.getNo() %>'" >
          <h2><%=bean.getName() %></h2>
          
          <p><a class="btn btn-default" href="DanCarMain.jsp?center=CarReserveInfo.jsp&no=<%= bean.getNo() %>" role="button">상세보기 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->

				<%
					j = j + 1;
					}
				%>
				 </div><!-- /.row -->  
			
		</div>
		<hr class="divider">
		
		
		
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
 
</div>
	
</body>
</html>