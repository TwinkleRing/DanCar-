<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no =Integer.parseInt(request.getParameter("no"));
	//수량
	
	//이미지
	String img =request.getParameter("img");
	
  	
%>
		
<div class="container marketing" id="marketing">
   <!-- Three columns of text below the carousel -->
      <div class="row">
		<h2 class="text-center" id="carTitle">옵션 선택</h2>
		<div class="col-xs-1 col-md-1"></div>
    	<div class="col-sm-5">
    		<img src="img/<%= img %>" width="400" height="300" id="infoImg">
    	</div>
    	<a>
    	
    	
    	</a>
    	<div class="col-sm-5">
    		<form action="DanCarMain.jsp" method="post">
    		<table class="table">
    			
    		
    			<tr>
    				<th>보험적용</th>
    				<td>
    					<select name="userin" class="form-control">
    						<option value="1">적용 </option>
    						<option value="2">비적용</option>
    					</select>
    				</td>
    			</tr>
    			
				<tr>
    				<th>Wifi 적용</th>
    				<td>
    					<select name="usewifi" class="form-control">
    						<option value="1">적용 </option>
    						<option value="2">비적용</option>
    					</select>
    				</td>
    			</tr>
    			
    			<tr>
    				<th>네비게이션 적용</th>
    				<td>
    					<select name="usenavi" class="form-control">
    						<option value="1">적용 (무료)</option>
    						<option value="2">비적용</option>
    					</select>
    				</td>
    			</tr>
    			<tr>
    				<th>스마트키  적용</th>
    				<td>
    					<select name="usesmartkey" class="form-control">
    						<option value="1">적용 </option>
    						<option value="2">비적용</option>
    					</select>
    				</td>
    			</tr>
    			
    			<tr>
    				<th>베이비시트 적용</th>
    				<td>
    					<select name="useseat" class="form-control">
    						<option value="1">적용</option>
    						<option value="2">비적용</option>
    					</select>
    				</td>
    			</tr>
    			
    			<tr>
    				<th>차량 에어컨 적용</th>
    				<td>
    					<select name="useaircon" class="form-control">
    						<option value="1">적용</option>
    						<option value="2">비적용</option>
    					</select>
    				</td>
    			</tr>
    	
    			<tr>
    				<td colspan="2" class="text-center">
    				
    				<input type="hidden" value="CarReserveResult.jsp" name="center">
    				<input type="hidden" value="<%= no %>"  name="no" >
    				<input type="submit" value="차량주문하기" class="form-control" style="background-color: #222222; color:#fff">
    				</td>
    			</tr>
    			
    			
    		</table>
    		</form>	
    	</div>
    	<div class="col-xs-1 col-md-1"></div>	
	</div>      
	


</div>