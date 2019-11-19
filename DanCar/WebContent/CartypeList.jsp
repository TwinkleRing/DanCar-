<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="dto.Car" %>
<%@page import="dao.CarDAO" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	

	int cartype = Integer.parseInt(request.getParameter("cartype"));

	CarDAO dao = CarDAO.getInstance();
	List<Car> t = dao.CartypeList(cartype);
		

		String temp="";
		if(cartype==1)temp="소형";
		else if(cartype==2)temp="준중형";
		else if(cartype==3)temp="중형";
		else if(cartype==4)temp="중대형";
		else if(cartype==5)temp="대형";

%>
<div class="container marketing" id="marketing">
		<h2 class="text-center" id="carTitle"><%=temp%> 자동차</h2>
   <!-- Three columns of text below the carousel -->
      <div class="row">

	<%
		for(int i=0; i <t.size(); i++){
			Car bean = t.get(i);
	%> 
        <div class="col-lg-4">
          <img class="img-circle" src="img/<%=bean.getImg() %>" alt="Generic placeholder image" width="300" height="200" 
             onclick="location.href='DanCarMain.jsp?center=CarReserveInfo.jsp&no=<%= bean.getCarnumber() %>'" >
          <h2><%=bean.getName() %></h2>
          
          <p><a class="btn btn-default" href="DanCarMain.jsp?center=CarReserveInfo.jsp&no=<%=bean.getCarnumber() %>" role="button">상세보기 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->

 
   <% }  %>
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
			    <input type="button" value="전체검색" class="btn btn-danger" onclick="location.href='DanCarMain.jsp?center=CarList.jsp'">
			</div>			
		</form>

	  	
	</div>

</div>

</body>
</html>