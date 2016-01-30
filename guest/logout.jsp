<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="core.*"%>
<%
	ManagerService.logout(session);
	response.sendRedirect(request.getContextPath() + "/main.jsp");
%>