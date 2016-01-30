<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, Board.*, core.*, util.*"%>
<style>
table {
	border-collapse: collapse;
	border-bottom-color: #000;
	text-align:center;
}

thead tr {
	color: #000;
	text-align:center;
}

thead {
	background-color: #f4f4f4; /* border-bottom:1px solid #f4f4f4; */
}

tbody tr:hover {
	cursor: pointer;
}

.btn {
	background-color: #f4f4f4;
}

#top-btn {
	text-align: right;
	margin-bottom: 10px;
}

.jb-center {
	text-align: center;
}

.pagination li a {
	border: none;
	cursor: pointer;
}

.pagination>li:first-child>a, .pagination>li:first-child>span {
	margin-left: 0px;
	border-top-left-radius: 0px;
	border-bottom-left-radius: 0px;
}

.pagination>li:last-child>a, .pagination>li:last-child>span {
	border-top-right-radius: 0px;
	border-bottom-right-radius: 0px;
}

.pagination-sm>li>a, .pagination-sm>li>span {
	padding: 5px 10px;
	font-size: 11px;
	line-height: 1.5;
}
</style>
<script>
	$(function() {
		$("tbody tr").click(
				function() {
					location.href = "<%=request.getContextPath()%>/menu/smenu31-view.jsp?id="
							+ $(this).attr("data-id") + "&"
							+ location.search.replace("?", "");
				});
	});
</script>
<%
	String s = request.getParameter("pg");
	int currentPage = (s == null) ? 1 : Integer.parseInt(s);
	int pageSize = 10;
	ArrayList<Board> list = BoardDAO1.selectPage(currentPage, pageSize);
	int recordCount = BoardDAO1.getRecordCount();
	int pageCount = (recordCount + pageSize - 1) / pageSize;
	int basePage = ((currentPage - 1) / 10) * 10;
	
%>

	<script>
	$(function() {
		$("ul.pagination a").click(function() {
			$("input[name=pg]").val($(this).attr("data-page"));
			location.href = "<%=request.getContextPath()%>/menu/smenu31.jsp?pg=" + $(this).attr("data-page");
			
		});
	});
	</script>


<%
	if (ManagerService.isCurrentUserLoggedIn(session)) {
%>
<div id="top-btn">
	<a href="<%=request.getContextPath() %>/menu/smenu31-add.jsp?" class="btn btn-small">글쓰기</a>
</div>
<%
	}
%>

<form>
	<input type="hidden" name="pg" value="1" />

	<table class="table">
		<thead>
			<tr>
				<th style="width: 60px; text-align:center;">번호</th>
				<th style="width: 380px; text-align:center;">제목</th>
				<th style="width: 100px; text-align:center;">작성자</th>
				<th style="width: 120px; text-align:center;">작성일</th>
				<th style="width: 60px; text-align:center;">조회수</th>
			</tr>
		</thead>
		<tbody>
			<% for (Board board : list) { %>
                <tr data-id="<%= board.getId() %>">
                	<td><%= board.getId() %></td>
                    <td style="text-align:left;"><%= board.getTitle() %></td>
                    <td>관리자</td>
                    <td><%= board.getDate() %></td>
                    <td><%= board.getView() %></td>
                </tr>
            <% } %>
		</tbody>
	</table>

	<div class="jb-center">
		<ul class="pagination pagination-sm">
			<%
				if (basePage > 0) {
			%>
			<li><a data-page="<%=basePage%>">Prev</a></li>
			<%
				}
			%>
			<%
				for (int i = 1; i <= 10 && basePage + i <= pageCount; ++i) {
			%>
			<li class='<%=basePage + i == currentPage ? "active" : ""%>'><a
				data-page="<%=basePage + i%>"><%=basePage + i%></a></li>
			<%
				}
			%>
			<%
				if (basePage + 11 <= pageCount) {
			%>
			<li><a data-page="<%=basePage + 11%>">Next</a></li>
			<%
				}
			%>
		</ul>
	</div>

</form>