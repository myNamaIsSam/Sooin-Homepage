<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="core.*,util.*" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/header.jsp" %>
<style>
    form > div { margin-top: 20px; }
</style>
</head>
<%
    String errMsg = null, infoMsg = null;
    RequestParameter param = new RequestParameter(request);
    String loginId = param.getString("loginId", "");
    String name = param.getString("name", "");
    String passwd = param.getString("passwd", "");
    String email = param.getString("email", "");

    if (request.getMethod().equals("POST")) {
        if (loginId.length() >= 5) {
            if (UserDAO.selectByLoginId(loginId) == null) {
                if (passwd.length() >= 5) {
                    if (passwd.equals(request.getParameter("passwd1"))) {
                        if (name.length() >= 2) {
                            UserDAO.insert(loginId, UserService.encryptPasswd(passwd), name, email);
                            infoMsg = "저장되었습니다";
                        }
                        else errMsg = "이름이 너무 짧습니다";
                    }
                    else errMsg = "비밀번호가 일치하지 않습니다";
                }
                else errMsg = "비밀번호가 너무 짧습니다";
            }
            else errMsg = "로그인 아이디가 중복됩니다";
        }
        else errMsg = "로그인 아이디가 너무 짧습니다";
    }
%>
<body>
<%@ include file="/WEB-INF/include/menu.jsp" %>

<div class="container main">

    <h1>회원가입</h1>
    <hr />

    <form method="post">
        <div>아이디</div>
        <input name="loginId" type="text" value="<%= loginId %>" />

        <div>비밀번호</div>
        <input name="passwd" type="password" />

        <div>비밀번호 확인</div>
        <input name="passwd1" type="password" />

        <div>이름</div>
        <input name="name" type="text" value="<%= name %>" />

        <div>이메일</div>
        <input name="email" type="text" value="<%= email %>" />

        <div>
            <button type="submit" class="btn btn-primary">
                <i class="icon-user icon-white"></i> 회원가입
            </button>
        </div>
    </form>

    <% if (errMsg != null) { %>
        <div class="alert alert-error"><%= errMsg %></div>
    <% } %>
    <% if (infoMsg != null) { %>
        <div class="alert alert-info"><%= infoMsg %></div>
    <% } %>

</div>

<%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>