<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="dto.Member"%>
<%@ page import="dao.MemberDAO"%>
<%@ page import="dao.NotFoundException"%> 
<%@ page import="jdbc.ConnectionProvider"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.sql.*"%>
<%
	String id = request.getParameter("userID");
	String pw = request.getParameter("userPW");

	String save = request.getParameter("save");
	if (save != null && save.equals("on")) { // the latest user ID & PW
		Cookie cookieID = new Cookie("userID", id);
		response.addCookie(cookieID);
		Cookie cookiePW = new Cookie("userPW", pw);
		response.addCookie(cookiePW);
		//out.println("Cookie Creation Successful~");
	}
	
	Connection conn = null;
	try {
		conn = ConnectionProvider.getConnection();
		MemberDAO dao = MemberDAO.getInstance();
	
		Member member = dao.select(conn, id, pw);
		if (member == null) {
			throw new NotFoundException("Member Not Found with id=" + id);
		}
		session.setMaxInactiveInterval(10 * 60); // 10 minute
		session.setAttribute("userID", id);
		session.setAttribute("userPW", pw);
		System.out.println("Session Successful~");
		response.sendRedirect("index.jsp");
	} catch (NotFoundException e) {
		out.println("Member NotFoundException");
		response.sendRedirect("DancarMain.jsp?center=login.jsp?status=failed");
	} catch (SQLException e) {
		out.println("Member db access error ");
		response.sendRedirect("DancarMain.jsp?center=login.jsp?status=failed");
	} finally {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.getMessage();
			}
		}
	}
%>
