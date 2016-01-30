<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="core.*,util.*"%>
<style>
nav, p, ul, ol, li, dl, dt, dd, form, table, th, td, fieldset, input,
	textarea, select, button, h1, h2, h3, h4, h5, h6, pre {
	margin: 0px;
	padding: 0px;
	font-family: "나눔고딕", NanumGothic, nanum, "맑은 고딕", "Malgun Gothic", "돋움",
		Dotum, "굴림", Gulim, Helvetica, applegothic, sans-serif;
	font-size: 14px;
}

nav {
	height: 100%;
}

#wrap {
	width: 100%;
	position: relative;
}

#top-wrap {
	width: 100%;
	height: 100px;
	border-bottom: 1px solid #cfcfcf;
	z-index: 5;
	position: relative;
}

#top {
	width: 980px;
	margin: 0px auto;
}

#top #logo {
	float: left;
	margin: 19px 50px 0px 40px;
}

#top #logo, #top #logo a {
	width: 30px;
	height: 10px;
}

#top #logo, #top #logo a {
	width: 100px;
	height: 10px;
}

a:link {
	color: #666;
	text-decoration: none;
}

a {
	outline: medium none;
}

a {
	color: #666;
	text-decoration: none;
}

#top #tnb {
	float: right;
	margin: 50px 50px 0px 0px;
}

ul, ol {
	list-style: outside none none;
}

#top #tnb li {
	float: left;
	margin-left: 15px;
}

img {
	border: 0px none;
}

fieldset, img {
	border: 0px none;
}

#top #gnb {
	float: left;
	margin: 50px 0px 0px 60px;
}

#top #gnb li {
	float: left;
}

#top #gnb li .menu {
	float: left;
	display: block;
	color: #333;
	font-size: 25px;
	font-weight: 600;
	padding: 0px 120px;
}

#top #gnb li ul {
	position: absolute;
	display: none;
	width: 100%;
	top: 100px;
	left: 0px;
	background: rgb(255, 255, 255) none repeat scroll 0% 0%;
	height: 105px;
	/* border-bottom: 1px solid #E5E5E5; */
	background-color: #f9f9f9;
}

#top #gnb li ul li {
	width: 980px;
	position: absolute;
	left: 50%;
	margin-left: -320px;
	top: 0px;
}

#top #gnb li {
	float: left;
}

#top #gnb li #snb1 li a:first-child {
	width: 200px;
}

#top #gnb li #snb1 li a {
	width: 200px;
	background-position: 130px 46px;
}

#top #gnb li ul li #menu{
	background-image: url("/images/picture_suin.png");
}
/*   top #gnb li ul li a:first-child {
	border-left: 1px solid #E5E5E5;
} 
  #top #gnb li #snb2 li a:first-child {
    width: 0px;
} */
#top #gnb li #snb2 li a {
	width: 200px;
	background-position: 150px 46px;
}

#top #gnb li #snb3 li a {
	width: 200px;
	background-position: 170px 46px;
	margin-left: 230px;
}

#top #gnb li #snb4 li a {
	width: 200px;
	background-position: 200px 46px;
	margin-left: 360px;
}

#top #gnb li ul li a:first-child {
	/* border-left: 1px solid #E5E5E5;
	border-right: 1px solid #E5E5E5; */
	
}

#top #gnb li ul li a {
	display: block;
	float: left;
	/* border-right: 2px solid #E5E5E5; */
	background-repeat: no-repeat;
}

#top #gnb li .menu:hover, #top #gnb li .menu.active {
	color: #4083c2 !important;
}

#top #gnb li .menu {
	float: left;
	display: block;
	color: #333;
	font-size: 15px;
	font-weight: 600;
	padding: 0px 28px;
}

</style>
<script>
	$(document)
			.ready(
					function() {
						$("#gnb > .mn")
								.each(
										function(index) {
											$(this)
													.bind(
															"mouseenter focusin",
															function() {
																$(
																		"#gnb > .mn:not(#gnb > .mn:eq("
																				+ index
																				+ ")) > ul")
																		.slideUp(
																				100);
																$(
																		"#gnb > .mn:eq("
																				+ index
																				+ ") ul:not(:animated)")
																		.slideDown(
																				200);

																$(
																		"#gnb > .mn:not(#gnb > .mn:eq("
																				+ index
																				+ ")) > .menu")
																		.removeClass(
																				"over");
																$(
																		"#gnb > .mn:eq("
																				+ index
																				+ ") .menu")
																		.addClass(
																				"over");
															});
										});

						$("#top-wrap").bind("mouseleave", function() {
							$(".mn > ul").slideUp(100);
							$(".menu").removeClass("over");
							$("#gnb > .menu").removeClass("over");
						});
					});
</script>
<%
	String R78 = request.getContextPath();
	boolean isManager = ManagerService.isCurrentUserLoggedIn(session);
%>


<nav id="mbody">

	<form action="" target="" method="post" name="f">
		<input type="hidden" value="" name="reqPKey"></input>
	</form>
	<div id="wrap">
		<div class="notipop"></div>
		<div class="moviewrap"></div>
		<div id="top-wrap">

			<div id="top">
				<h1 id="logo">
					<a href="<%=R78%>/main.jsp"> <img title="메인" alt="메인"
						src="<%=R78%>/images/logo_final.png" width="120px" height="80px"></img></a>
				</h1>
				<ul id="tnb">
					<li><a href="<%=R78%>/main.jsp"> <img title="HOME"
							alt="HOME" src="<%=R78%>/images/home2.png" width="25px"
							height="25px"></img>
					</a></li>
					<%
						if (!isManager) {
					%>
					<li><a href="<%=R78%>/guest/login.jsp"> <img title="로그인"
							alt="로그인" src="<%=R78%>/images/login.png" width="25px"
							height="25px"></img>
					</a></li>
					<%
						} else {
					%>
					<li><a href="<%=R78%>/guest/logout.jsp"> <img title="로그아웃"
							alt="로그아웃" src="<%=R78%>/images/login-ok.png"
							onclick="return confirm('로그아웃 하시겠습니까?');" width="25px"
							height="25px"></img>
					</a></li>
					<%
						}
					%>

				</ul>
				<ul id="gnb">
					<li class="mn"><a class="menu"
						href="<%=R78%>/menu/smenu11.jsp?"> 회사소개 </a>
						<ul id="snb1">
							<li><a id="<%=R78%>/menu/smenu11"
								href="<%=R78%>/menu/smenu11.jsp?"> <img title="경영이념"
									alt="경영이념" src="<%=R78%>/images/smenu11-top.jpg" name="smenu11"
									onmouseover="smenu11.src='<%=R78%>/images/smenu11-top-hover.jpg'"
									onmouseout="smenu11.src='<%=R78%>/images/smenu11-top.jpg'"
									width="200px" height="105px"></img>

							</a> <a id="<%=R78%>/menu/smenu12" href="<%=R78%>/menu/smenu12.jsp?">
									<img title="찾아오시는 길" alt="찾아오시는 길"
									src="<%=R78%>/images/smenu12-top.jpg" name="smenu12"
									onmouseover="smenu12.src='<%=R78%>/images/smenu12-top-hover.jpg'"
									onmouseout="smenu12.src='<%=R78%>/images/smenu12-top.jpg'"
									width="200px" height="105px"></img>

							</a></li>
						</ul></li>
					<li class="mn"><a class="menu"
						href="<%=R78%>/menu/smenu21.jsp?"> 사업영역 </a>
						<ul id="snb2">
							<li><a id="menu/smenu21" href="<%=R78%>/menu/smenu21.jsp?">
									<img title="시설영역" alt="시설영역"
									src="<%=R78%>/images/smenu21-top.jpg" name="smenu21"
									onmouseover="smenu21.src='<%=R78%>/images/smenu21-top-hover.jpg'"
									onmouseout="smenu21.src='<%=R78%>/images/smenu21-top.jpg'"
									width="200px" height="105px"></img>
							</a> <a id="menu/smenu22" href="<%=R78%>/menu/smenu22.jsp?"> <img
									title="보안영역" alt="보안영역" src="<%=R78%>/images/smenu22-top.jpg"
									name="smenu22"
									onmouseover="smenu22.src='<%=R78%>/images/smenu22-top-hover.jpg'"
									onmouseout="smenu22.src='<%=R78%>/images/smenu22-top.jpg'"
									width="200px" height="105px"></img>
							</a> <a id="menu/smenu23" href="<%=R78%>/menu/smenu23.jsp?"> <img
									title="미화영역" alt="미화영역" src="<%=R78%>/images/smenu23-top.jpg"
									name="smenu23"
									onmouseover="smenu23.src='<%=R78%>/images/smenu23-top-hover.jpg'"
									onmouseout="smenu23.src='<%=R78%>/images/smenu23-top.jpg'"
									width="200px" height="105px"></img>
							</a></li>
						</ul></li>
					<li class="mn"><a class="menu"
						href="<%=R78%>/menu/smenu31.jsp?"> 수인광장 </a>
						<ul id="snb3">
							<li><a id="menu/smenu31" href="<%=R78%>/menu/smenu31.jsp?">
									<img title="수인소식" alt="수인소식"
									src="<%=R78%>/images/smenu31-top.jpg" name="smenu31"
									onmouseover="smenu31.src='<%=R78%>/images/smenu31-top-hover.jpg'"
									onmouseout="smenu31.src='<%=R78%>/images/smenu31-top.jpg'"
									width="200px" height="105px"></img>
							</a></li>
						</ul></li>

					<li class="mn"><a class="menu"
						href="<%=R78%>/menu/smenu41.jsp?"> 견적의뢰 </a>
						<ul id="snb4">
							<li><a id="menu/smenu41" href="<%=R78%>/menu/smenu41.jsp?">
									<img title="견적의뢰" alt="견적의뢰"
									src="<%=R78%>/images/smenu41-top.jpg" name="smenu41"
									onmouseover="smenu41.src='<%=R78%>/images/smenu41-top-hover.jpg'"
									onmouseout="smenu41.src='<%=R78%>/images/smenu41-top.jpg'"
									width="200px" height="105px"></img>
							</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
</nav>