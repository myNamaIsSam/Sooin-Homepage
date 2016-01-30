<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, Board.*, core.*, util.*"%>
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
	if(id == -1){
		response.sendRedirect(r78 + "/menu/smenu31.jsp");
		return;
	}
	Board board = BoardDAO1.selectByNum(id);
	BoardDAO1.updateViewCount(id);

	String listUrl = r78 + "/menu/smenu31.jsp?";
	String editUrl = r78 + "/menu/smenu31-edit.jsp?id=" + id + "&";
	
	String date = param.getString("date", board.getDate());
	String time = param.getString("time", board.getTime());
	String title = param.getString("title", board.getTitle());
	String content = param.getString("content", board.getContent());
	String password = param.getString("password", "");
	String cmd = param.getString("cmd", "");

	if (request.getMethod().equals("POST")) {
		if ("삭제".equals(cmd)) {
			BoardDAO1.delete(id);
			infoMsg = "삭제되었습니다";
			response.sendRedirect(r78 + "/menu/smenu31.jsp");
		}
	}

%>

<script>
	$(function() {
		$("ul.pagination a").click(function() {
			$("input[name=pg]").val($(this).attr("data-page"));
			location.href = "<%=request.getContextPath()%>
	/menu/smenu31.jsp?pg="
									+ $(this).attr("data-page");

						});
	});
</script>


<%
	if (ManagerService.isCurrentUserLoggedIn(session)) {
%>
<div id="top-btn">
	<a href="<%=request.getContextPath()%>/menu/smenu31-add.jsp?"
		class="btn btn-small">글쓰기</a>
</div>
<%
	}
%>

<form method="post">


	<h3 id="text-title"><%=title%></h3>
	<div id="aInfo" data-id="<%=id%>">
		글번호 : <span><%=id%></span> 작성일 : <span><%=date%> <%=time%></span>
	</div>

	<div style="padding: 20px; line-height: 1.8em;"><%=content%></div>

	<hr style="margin: 10px 0px; border-width: 1px; border-color: #d4d4d4;" />


	<div id="top-btn">

		<%
			if (ManagerService.isCurrentUserLoggedIn(session)) {
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