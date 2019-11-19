<%@page import="dto.Car"%>
<%@page import="java.util.Vector"%>
<%@page import="dao.CarDAO"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
<jsp:include page="header.jsp" />
  </head>
 <body>
  <!-- top 메뉴 -->
<jsp:include page="top2.jsp" />

<%
	String center =request.getParameter("center");
	
	if(center==null){
		center="center.jsp";
	}
%>

<jsp:include page="<%= center %>" />
 
<body>
<%
	if(request.getParameter("center")==null){
		
	
	CarDAO dao = CarDAO.getInstance();
    //벡터를 이용하여 자동차를 저장
    List<Car> v = dao.getAllCar();
%>


<div class="container marketing" id="marketing">
	<h2 class="text-center" id="carTitle"></h2>
   <!-- Three columns of text below the carousel -->
      <div class="row">

	<%
		for(int i=0; i <v.size(); i++){
			Car c =v.get(i);
	%>
        <div class="col-lg-4">
          <img class="img-circle" src="img/<%=c.getImg() %>"  width="300" height="200" 
             onclick="location.href='DanCarMain.jsp?center=CarReserveInfo.jsp&no=<%= c.getNo() %>'" >
          <h2><%=c.getName() %></h2>
          <h8><%=c.getName() %> 자동차입니다.</h8>
          
          <p><a class="btn btn-default" href="DanCarMain.jsp?center=CarReserveInfo.jsp&no=<%= c.getNo() %>" role="button">상세보기 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->

    <% } %>
   
      </div><!-- /.row -->  
      
</div>    
 
<% } %>
 
 </body>
<!--  Bottom -->
 <jsp:include page="bottom.jsp"/>
 
 