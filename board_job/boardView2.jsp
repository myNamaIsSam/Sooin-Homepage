<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Board.*, java.util.*, core.*, util.*"%>
<style>
form>div {
	margin-top: 20px;
}

#aInfo {
	text-align: right;
	margin-top: 0px;
}

#text-title {
	background-color: #f4f4f4;
	font-weight: 700;
	margin-bottom: 10px;
	padding: 13px;
	border-bottom: 2px solid #d4d4d4;
}

span {
	color: #848484;
}

.btn {
	background-color: #f4f4f4;
}

#top-btn {
	text-align: right;
	margin-bottom: 10px;
}

#delete-btn {
	color: #666;
}

#delete-btn:hover {
	color: #333;
}
</style>
<%
	String r78 = request.getContextPath();
	String infoMsg = null, errMsg = null;

	RequestParameter param = new RequestParameter(request);
	int id = param.getInt("id", 0);
	EstBoard board = EstBoardDAO.selectByNum(id);

	String listUrl = r78 + "/menu/smenu41.jsp?";
	String editUrl = r78 + "/menu/smenu41-edit.jsp?id=" + id + "&";

	String date = param.getString("date", board.getDate());
	String time = param.getString("time", board.getTime());
	String title = param.getString("title", board.getTitle());
	String content = param.getString("content", board.getContent());
	String name = param.getString("name", board.getName());
	String phonenum = param.getString("phonenum", board.getPhonenum());
	String object = param.getString("object", "");
	String type = param.getString("type", board.getType());
	String type1 = param.getString("type1", String.valueOf(type.charAt(0)));
	String type2 = param.getString("type2", String.valueOf(type.charAt(1)));
	String type3 = param.getString("type3", String.valueOf(type.charAt(2)));
	String password = param.getString("password", "");
	String cmd = param.getString("cmd", "");

	if (request.getMethod().equals("POST")) {
		if ("삭제".equals(cmd)) {
			EstBoardDAO.delete(id);
			infoMsg = "삭제되었습니다";
			response.sendRedirect(listUrl);
		}
	}
%>

<form method="post">


	<h3 id="text-title"><%=title%></h3>
	<div id="aInfo" data-id="<%=id%>">
		글번호 : <span><%=id%></span> 작성일 : <span><%=date%> <%=time%></span>
	</div>

	<div>
		이름 : <span><%=name%></span>
	</div>

	<div>
		연락처 : <span><%=phonenum%></span>
	</div>

	<div>
		의뢰영역 : <span
			<%=type1.equals("1") ? "style='color:#0e0e0e'" : "style='color:#d2d2d2'"%>>시설</span>
		<span
			<%=type2.equals("1") ? "style='color:#0e0e0e'" : "style='color:#d2d2d2'"%>>보안</span>
		<span
			<%=type3.equals("1") ? "style='color:#0e0e0e'" : "style='color:#d2d2d2'"%>>미화</span>
	</div>


	<hr style="margin: 10px 0px; border-width: 1px; border-color: #d4d4d4;" />
	
	<div style="padding: 20px; line-height: 1.8em;"><%=content%></div>
	
	<hr style="margin: 10px 0px; border-width: 1px; border-color: #d4d4d4;" />


	<div id="top-btn">

		<%
			if (!ManagerService.isCurrentUserLoggedIn(session)) {
		%>
		<a href="<%=editUrl%>" class="btn"> <i class="icon-remove"></i> 수정
		</a>
		<button type="submit" class="btn" id="delete-btn" name="cmd"
			value="삭제" onclick="return confirm('삭제하시겠습니까?');">
			<i class="icon-remove"></i> 삭제
		</button>
		<%
			}
		%>

		<a href="<%=listUrl%>" class="btn"> <i class="icon-list"></i> 목록으로
		</a>
	</div>

</form>

<%
	if (errMsg != null) {
%>
<div class="alert alert-error"><%=errMsg%></div>
<%
	}
%>
<%
	if (infoMsg != null) {
%>
<div class="alert alert-info"><%=infoMsg%></div>
<%
	}
%>
