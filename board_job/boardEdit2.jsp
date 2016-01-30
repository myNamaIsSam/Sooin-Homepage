<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Board.*, java.util.*, core.*, util.*"%>
<!-- <style>
form>div {
	margin-top: 20px;
}

#contents {
	width: 100%;
	height: 400px;
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
</style> -->

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
	/* margin-top: 20px; */
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

<%
	String r78 = request.getContextPath();
	String infoMsg = null, errMsg = null;

	RequestParameter param = new RequestParameter(request);
	int id = param.getInt("id", 0);
	EstBoard board = EstBoardDAO.selectByNum(id);

	String listUrl = r78 + "/menu/smenu41.jsp?";
	String viewUrl = r78 + "/menu/smenu41-view.jsp?id=" + id + "&";

	String date = param.getString("date", board.getDate());
	String time = param.getString("time", board.getTime());
	String title = param.getString("title", board.getTitle());
	String content = param.getString("content", board.getContent());
	content = EstBoardDAO.change_Code(content, "<br>", "");
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
		if ("저장".equals(cmd)) {
			if (title.length() >= 1) {
				if (name.length() >= 1) {
					if (phonenum.length() >= 1) {
						char tmpType1 = '0';
						char tmpType2 = '0';
						char tmpType3 = '0';
						
						if (param.getString("type1", "0").equals("1")) {
							tmpType1 = '1';
							System.out.println("시설 체크됨 : "+type);
						}else{
							tmpType1 = '0';
							System.out.println("시설 체크해제됨 : "+type);
						}
						
						if (param.getString("type2", "0").equals("1")) {
							tmpType2 = '1';
							System.out.println("보안 체크됨 : "+type);
						}else{
							tmpType2 = '0';
							System.out.println("보안 체크해제됨 : "+type);
						}
						
						if (param.getString("type3", "0").equals("1")) {
							tmpType3 = '1';
							System.out.println("미화 체크됨 : "+type);
						}else{
							tmpType3 = '0';
							System.out.println("미화 체크해제됨 : "+type);
						}
						type = String.valueOf(tmpType1) + String.valueOf(tmpType2)
						+ String.valueOf(tmpType3);
						EstBoardDAO.updateInfo(id, title, content, name, phonenum, object, type);
						response.sendRedirect(viewUrl);
					} else
						errMsg = "연락처를 입력해 주세요.";
				} else
					errMsg = "의뢰자명 혹은 의뢰기관명을 입력해 주세요.";
			} else
				errMsg = "제목을 입력해 주세요.";
		}

		if ("취소".equals(cmd)) {
			response.sendRedirect(viewUrl);
		}
	}
%>
<form method="post">
	<div>글제목</div>
	<input id="title" type="text" name="title" value="<%=title%>" />

	<div>이름</div>
	<input id="writer" type="text" name="name" value="<%=name%>" />

	<div>연락처</div>
	<input id="phonenum" type="text" name="phonenum" value="<%=phonenum%>" />

	<div>비밀번호</div>
	<input id="password" type="password" name="password"
		value="<%=password%>" />

	<div>분류</div>
	<input id="type1" type="checkbox" name="type1"
		<%=type1.equals("1") ? "checked" : ""%> value="1">시설 <span style="width:20px;"></span><input
		id="type2" type="checkbox" name="type2"
		<%=type2.equals("1") ? "checked" : ""%> value="1">보안 <span style="width:20px;"></span><input
		id="type3" type="checkbox" name="type3"
		<%=type3.equals("1") ? "checked" : ""%> value="1">미화

	<div>의뢰 내용</div>
	<textarea id="contents" name="content"><%=content%></textarea>

	<div>
		<button id="save" type="submit" class="btn" name="cmd" value="저장">
			<i class="icon-ok"></i> 저장
		</button>
		<button id="cancle" type="submit" class="btn" name="cmd" value="취소"
			onclick="return confirm('글 수정을 취소하시겠습니까?');">
			<i class="icon-remove"></i> 취소
		</button>
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
