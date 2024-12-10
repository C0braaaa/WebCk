<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    // Invalidate the current session to log the user out
    request.getSession().invalidate();
    
    // Redirect to the homepage after logging out
    response.sendRedirect("home.jsp");
%>
