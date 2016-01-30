<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Board.*, java.util.*, core.*, util.*"%>
<style>
form>div:not(.box) {
	margin-top: 20px;
}

div.box label {
	display: inline-block;
	margin-right: 20px;
}

body table.table {
	width: 400px;
}

body table.table tr:first-child {
	background-color: #eee;
}

#title {
	width: 100%;
}

#contents {
	width: 100%;
	height: 400px;
	margin-top: 20px;
}

form>div {
	margin-top: 20px;
}

#content {
	width: 100%;
	/* height: 400px; */
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
	int id = param.getInt("id", 0);
	String title = param.getString("title", "");
	String contents = param.getString("contents", "");
	String name = param.getString("name", "");
	String phonenum = param.getString("phonenum", "");
	String object = param.getString("object", "");
	String type = "000";
	String type1 = param.getString("type1", "");
	String type2 = param.getString("type2", "");
	String type3 = param.getString("type3", "");
	String password = param.getString("password", "");
	String cmd = param.getString("cmd", "");

	if (request.getMethod().equals("POST")) {
		if ("저장".equals(cmd)) {
			if (title.length() >= 1) {
				if (name.length() >= 1) {
					if (phonenum.length() >= 1) {
						if (password.length() >= 1) {
							if (type1.equals("1")) {
								char[] typechar = type.toCharArray();
								typechar[0] = '1';
								type = String.valueOf(typechar[0]) + String.valueOf(typechar[1])
										+ String.valueOf(typechar[2]);
							}
							if (type2.equals("1")) {
								char[] typechar = type.toCharArray();
								typechar[1] = '1';
								type = String.valueOf(typechar[0]) + String.valueOf(typechar[1])
										+ String.valueOf(typechar[2]);
							}
							if (type3.equals("1")) {
								char[] typechar = type.toCharArray();
								typechar[2] = '1';
								type = String.valueOf(typechar[0]) + String.valueOf(typechar[1])
										+ String.valueOf(typechar[2]);
							}
							EstBoardDAO.insert(title, contents, name, phonenum, object, type, password);
							response.sendRedirect(request.getContextPath() + "/menu/smenu41.jsp");
						} else
							errMsg = "글 비밀번호를 입력해 주세요.";
					} else
						errMsg = "연락처를 입력해 주세요.";
				} else
					errMsg = "의뢰자명 혹은 의뢰기관명을 입력해 주세요.";
			} else
				errMsg = "제목을 입력해 주세요.";
		}
	}

%>
<form method="post">

	<div>글제목</div>
	<input id="title" type="text" name="title" value="<%=title%>" />

	<div>이름</div>
	<input id="writer" type="text" name="name" value="<%=name%>" />

	<div>연락처</div>
	<input id="telephone" type="text" name="phonenum" value="<%=phonenum%>" />

	<div>비밀번호</div>
	<input id="password" type="password" name="password"
		value="<%=password%>" />

	<div>분류</div>
	<input id="type1" type="checkbox" name="type1" value="1">시설<span style="width:20px;"></span><input
		id="type2" type="checkbox" name="type2" value="1">보안<span style="width:20px;"></span><input
		id="type3" type="checkbox" name="type3" value="1">미화

	<textarea id="contents" name="contents"><%=contents%></textarea>

	<div>
		<button type="submit" class="btn" name="cmd" value="저장">
			<i class="icon-ok"></i> 저장
		</button>
		<a href="<%=request.getContextPath()%>/menu/smenu41.jsp" class="btn">
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

