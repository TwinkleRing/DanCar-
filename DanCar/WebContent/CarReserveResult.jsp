
<%@page import="dto.Car"%>
<%@page import="dao.CarDAO"%> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="rbean" class="dto.CarReserveBean">
    <jsp:setProperty name="rbean" property="*" />
</jsp:useBean> 
 
    
<div class="container marketing" id="marketing2">
   <!-- Three columns of text below the carousel -->
      <div class="row">
<%
     
    String id =(String)session.getAttribute("id");
    if(id==null){
%> 
    <script>
        alert("로그인후 예약이 가능 합니다.");
        location.href="DanCarMain.jsp?center=login.jsp";
    </script>
     

             
<%       
        }
         
         
       
        //아이디 값이 빈클래스에 없기에
        rbean.setId(id);
         
        //데이터 베이스에 빈클래스 저장
        CarDAO dao = CarDAO.getInstance();
        dao.setReserveCar(rbean);  
        //차량 정보 얻어오기
        Car bean = dao.getOneCar(rbean.getNo());
     
        System.out.println("//차량 정보 얻어오기 :" +bean.toString());
        //차량 총 금액
        String totalcar= bean.getPrice();
        System.out.println(bean.getPrice() + " : " +"//차량 총 금액 :" +bean.toString());
       
       
 
%>       
 
      <div class="col-sm-12">     
            <h2></h2>
            <div class="table-responsive">
            <table class="table">
                <caption></caption>
                <thead><tr><td colspan="2" class="text-center"><h2>차량 구매 완료 화면</h2></td></tr></thead>
                <tbody>
                 <tr>
                    <td colspan="2" class="text-right">
                     <img src="img/<%= bean.getImg() %>" class="img-responsive img-rounded" id="resultImg">
                    </td>
                 </tr>             
                 
                 <tr>
                  <th>차량 구매금액</th>
                  <td><%= bean.getPrice() %></td>
                 </tr>
                  
             
             
             </tbody>
            </table>
            </div>
      </div>
 
 
<%
    
%>
       
 </div>
  
</div>
  
  <hr class="divider">