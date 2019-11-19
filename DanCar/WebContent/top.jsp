<%@page import="dao.CarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!--  세션을 이용한 로그인 처리 -->
<%
	String userID = (String)session.getAttribute("userID");
	String userPW = (String)session.getAttribute("userPW");	
 
    //로그인이 되어있지 않다면, 
    if(userID==null && userPW == null){
        userID="GUEST";
    }
%>
    
 <div class="navbar-wrapper">
      <div class="container">
 
        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="index.jsp">DanCar 중고차거래</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li class="active">
                <li><a href="DancarMain.jsp?center=carListView.jsp">상품구경</a></li>
                <li><a href="#about">검색하기</a></li>
                <li><a href="#contact">장바구니</a></li>
                <li><a href="#"><%= userID %>님 반갑습니다.</a></li>
                <%

					if(userID.equals("GUEST")){

				%>

				<li><a href="DancarMain.jsp?center=login.jsp" ><button class="btn btn-primary">로그인</button></a></li>

				<li><a href="DancarMain.jsp?center=member.jsp" ><button class="btn btn-primary">회원가입</button></a></li>

				<%		

					}else{ 

				%>		

				<li><a href="logout.jsp" ><button class="btn btn-danger">로그아웃</button></a></li>						

			   <%			

					}

				%>
 
              </ul>
            </div>
          </div>
        </nav>
 
      </div>
    </div>