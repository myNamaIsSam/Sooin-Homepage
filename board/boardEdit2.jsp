<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Board.*, java.util.*, core.*, util.*"%>
<style>
form>div {
	margin-top: 20px;
}

form>div:FIRST-CHILD {
	margin-top: 30px;
}

#content {
	width: 100%;
}

#sub-right #content{
	margin-top: 20px;
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


#title {
	width: 90%;
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


	String infoMsg = null;
	RequestParameter param = new RequestParameter(request);
	int id = param.getInt("id", 0);
	Board board = BoardDAO1.selectByNum(id);

	String listUrl = request.getContextPath()+"/menu/smenu31.jsp?";
	String viewUrl = request.getContextPath()+"/menu/smenu31-view.jsp?id=" + id;
	
	String title = param.getString("title", board.getTitle());
	String content = param.getString("content", board.getContent());
	content = BoardDAO1.change_Code(content, "<br>", "");
			
	
	String cmd = param.getString("cmd", "");

	if (request.getMethod().equals("POST")) {
		if ("저장".equals(cmd)) {
			BoardDAO1.updateInfo(id, title, content);
			infoMsg = "저장되었습니다";
			response.sendRedirect(viewUrl);
		
		}else if("취소".endsWith(cmd)){
			response.sendRedirect(viewUrl);
		}
	}

%>

<form method="post">

	<div>
		<span style="color:#4083C2">글제목</span> 
		<input id="title" type="text" name="title" value="<%=title%>" />
	</div>

	<textarea id="content" name="content"><%=content%></textarea>

	<div>
		<button id="save" type="submit" class="btn" name="cmd" value="저장">
			<i class="icon-ok"></i> 저장
		</button>
		<button id="cancle" type="submit" class="btn" name="cmd" value="취소"
			onclick="return confirm('글 수정을 취소하시겠습니까?');">
			<i class="icon-remove"></i> 취소
		</button>
		<a href="<%=listUrl%>" class="btn"> <i class="icon-list"></i>
			목록으로
		</a>
	</div>
</form>

<%
	if (infoMsg != null) {
%>
<div class="alert alert-info"><%=infoMsg%></div>
<%
	}
%>
