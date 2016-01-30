<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Board.*, java.util.*, core.*, util.*"%>
<style>
form>div {
	margin-top: 20px;
}

#content {
	width: 100%;
}

#type {
	text-align: center;
	background-color: #f5f5f5;
}

#value {
	width: 85%;
}

span {
	display: inline-block;
	width: 60px;
	color: #989898;
}

table {
	width: 100%;
	border-collapse: collapse;
}

td {
	border: 1px solid #ededed;
	padding: 5px;
}

input {
	padding: 3px;
	border: none;
	margin-left: 5px;
	border: none;
	border-bottom: 1px solid #d4d4d4;
}

textarea {
	border: none;
	padding: 10px;
    border: 1px solid #b4b4b4;
}

.btn {
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 0px;
	font-size: 14px;
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
	background-color: #F4F4F4;
	color: #666;
}
/* 
form>div:not(.box) {
	margin-top: 20px;
} */
/* 
div.box label {
	display: inline-block;
	margin-right: 20px;
} */
/* 
body table.table {
	width: 400px;
} */

/* body table.table tr:first-child {
	background-color: #eee;
} */

#title {
	width: 90%;
}

#contents {
	width: 100%;
	height: 400px;
}
</style>
<script>
	$(function() {
		$("#cancel").click(function() {
			location.href = viewUrl;
		});
	});
</script>
<%
	String errMsg = null, infoMsg = null;

	RequestParameter param = new RequestParameter(request);
	String title = param.getString("title", "");
	String content = param.getString("contents", "");
	String cmd = param.getString("cmd", "");

	int id = BoardDAO1.getRecordCount() + 1;

	if (request.getMethod().equals("POST")) {
		if ("저장".equals(cmd)) {
			if (title.length() >= 1) {
				BoardDAO1.insert(title, content);
				//infoMsg = "저장되었습니다.";
				response.sendRedirect(request.getContextPath() + "/menu/smenu31.jsp");
			} else
				errMsg = "제목을 입력해 주세요.";
		}
	}
%>
<form method="post">
	<div style="padding-bottom:20px;"><span style="color:#4083C2">글제목</span>
	<input id="title" type="text" name="title" value="<%=title%>" /></div>
	<textarea id="contents" name="contents"><%=content%></textarea>

	<div>
		<button type="submit" class="btn" name="cmd" value="저장">
			<i class="icon-ok"></i> 저장
		</button>
		<a href="<%=request.getContextPath()%>/menu/smenu31.jsp" class="btn">
			<i class="icon-remove"></i> 취소
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