<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Board.*, java.util.*, core.*, util.*"%>
<style>
form>div {
	text-align: center;
}

#aInfo {
	/* text-align: center;
	margin-top: 0px; */
	color: #4C4C4C;
	font-size: 20px;
	font-weight: 600;
	padding-top: 15px;
	height: 60px;
	position: relative;
	z-index: 5;
	text-align: center;
}

input[type="submit"] {
	cursor: pointer;
}

.button {
	background-color: #4083C2;
	color: #FFF;
	height: 23px;
	width: 125px;
	padding: 0px;
	font-size: 12px;
	margin-top: 10px;
}

.button {
	background-color: #4083c2;
	color: white;
	height: 23px;
	width: 80px;
	display: inline-block;
	padding: 0px;
	margin-bottom: 0px;
	font-size: 12px;
	font-weight: 400;
	line-height: 1.42857;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	cursor: pointer;
	-moz-user-select: none;
	background-image: none;
	border: 1px solid transparent;
	border-radius: 4px;
	margin-top: 10px;
}

.btn:hover {
	color: white;
}

.text {
	margin-left: 5px;
}
</style>

<%
	String infoMsg = null, errMsg = null;

	RequestParameter param = new RequestParameter(request);
	int id = param.getInt("id", 0);
	EstBoard board = EstBoardDAO.selectByNum(id);

	String r78 = request.getContextPath();
	String listUrl = r78 + "/menu/smenu41.jsp?";
	String viewUrl = r78 + "/menu/smenu41-view.jsp?id=" + id + "&";
	
	String password = param.getString("password", "");
	String cmd = param.getString("cmd", "");
	if (request.getMethod().equals("POST")) {
		if ("확인".equals(cmd)) {
			if (EstBoardDAO.checkPasswd(id, password)) {
				response.sendRedirect(viewUrl);
			} else {
				errMsg = "비밀번호가 잘못되었습니다.";
			}
		}
	}
%>

<div id="aInfo" data-id="<%=id%>">비밀번호 확인</div>

<form method="post">
	<div>
		비밀번호 <input type='password' name='password' size='10'
			style="margin-left: 10px;">
	</div>
	<div>
	<input type=submit class='button' name='cmd' value="확인"> 
		<a href="<%=listUrl%>" class="button"
			style="background-color: #f4f4f4; color: #666;"> <i
			class="icon-list"></i> 목록으로
		</a>
	</div>
</form>

<% if (errMsg != null) { %>
<div class="alert alert-error"><%= errMsg %></div>
<% } %>
<% if (infoMsg != null) { %>
<div class="alert alert-info"><%= infoMsg %></div>
<% } %>
