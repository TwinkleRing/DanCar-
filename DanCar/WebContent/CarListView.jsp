
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.Car"%>
<%@page import="dao.CarDAO"%>
<title>Car</title>
</head>
<body>
<!-- exception & session & cookie jsp -->
<%
	CarDAO dao = CarDAO.getInstance();

    String center = request.getParameter("center");
    
    if(center==null){
        center="center.jsp";
    }
%>

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

	<div class="container">
		<div style="padding-top: 50px">
			<jsp:include page="CarList.jsp?center=<%= center %>"/> 
		</div>
	</div>

</body>
</html>