<%@page import="dto.CarViewBean"%>
<%@page import="dto.CarReserveBean"%>
<%@page import="java.util.Vector"%>
<%@page import="dao.CarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id =(String)session.getAttribute("id");	
    if(id==null){
 	
%>
	<script>
	  alert("로그인을 먼저 해주세요");
	  location.href="DanCarMain.jsp?center=login.jsp";
	</script>

<%
	}
    //로그인되어있는 아이디를 가지고 옴
   CarDAO dao = CarDAO.getInstance();
    Vector <CarViewBean> v = dao.getAllReserve(id);
    
    
%>
<div class="container marketing" id="marketing2">
   <!-- Three columns of text below the carousel -->
      <div class="row">
	  <div class="col-sm-12"> 	
			<h2></h2>
			<div class="table-responsive">
			
			<table class="table text-center">
			<caption></caption>
			<thead><tr><td colspan="11" class="text-center" >
					<h2 >차량 주문 완료 화면</h2></td>
				</tr>
			</thead>	
			<tbody >
				<tr>
				 <th >이미지</th>
				 <th class="text-center">이름</th>
				 <th class="text-center">금액</th>
				 <th class="text-center">수량</th>
				 <th class="text-center">보험</th>
				 <th class="text-center">에어컨</th>
				 <th class="text-center">스마트키</th>				 <th class="text-center">wifi</th>
				 <th class="text-center">베이비시트</th>
				 <th class="text-center">네이게이션</th>
				 <th class="text-center">삭제</th>
				</tr>
<%
			for(CarViewBean bean : v){
%>				
			<tr>	
				<td><img src="img/<%=bean.getImg() %>" class="img-responsive img-rounded" width="150" id="resultImg"></td>
				<td><%=bean.getName() %></td>
				<td><%=bean.getPrice() %> 원</td>
				<td><%=bean.getQty() %></td>
				<td><%=bean.getUserin() %></td>
				<td><%=bean.getUseaircon() %></td>
				<td><%=bean.getUsesmartkey() %></td>
				<td><%=bean.getUsewifi() %></td>
				<td><%=bean.getUsenavi() %></td>
				<td><%=bean.getUseseat() %></td>
				<td><button class="btn" onclick="location.href='CarReserveDel.jsp?reserveno=<%= bean.getReserveno() %>'">삭제</button></td>
				
			</tr>
<%
			}
%>

			</tbody>
			</table>
			
			</div>
	  </div>

 </div>
</div>
 
  <hr class="divider">