<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/header.jsp"%>
<style>
/* sub-left style */
div#sub-left {
	padding-top: 70px;
}

div#sub-right {
	padding-top: 70px;
}

#sub-left h2 {
	height: 43px;
	border-bottom: 1px solid #f4f4f4;
	text-indent: 11px;
	color: #4083c2;
	font-weight: 100;
	font-size: 25px;
}

ul, ol {
	list-style: outside none none;
}

#sub-left .smenu:hover, #sub-left .smenu.active {
	/* color: #4458a6; */
	color: #fff;
	background-color: #4083c2;
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

#sub-left .smenu {
	display: block;
	height: 40px;
	line-height: 40px;
	text-indent: 12px;
	font-size: 15px;
	border-bottom: 1px solid #f4f4f4;
}

#sub-left {
	width: 200px;
	float: left;
	padding-top: 63px;
}

#sub {
	width: 980px;
	margin: 0px auto;
	background: transparent url("/images/sub-bg.gif") repeat-y scroll 200px
		0px;
	position: relative;
	z-index: 1;
}

/* sub-right style */
#sub-right {
	width: 750px;
	float: right;
	padding: 60px 0px;
	position: relative;
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

#sub-right .svisual {
	position: absolute;
	z-index: 10;
	display: block;
	height: 190px;
	right: 0px;
	top: 99px;
	width: 50px;
}

#sub {
	width: 980px;
	margin: 0px auto;
	background: transparent url("/images/sub-bg.gif") repeat-y scroll 200px
		0px;
	position: relative;
	z-index: 1;
}

img {
	border: 0px none;
}

fieldset, img {
	border: 0px none;
}

#sub-right #navi {
	color: #A6A6A6;
	font-size: 11px;
}

body, p, ul, ol, li, dl, dt, dd, form, table, th, td, fieldset, input,
	textarea, select, button, h1, h2, h3, h4, h5, h6, pre {
	margin: 0px;
	padding: 0px;
	font-family: 나눔고딕, NanumGothic, nanum, "맑은 고딕", "Malgun Gothic", 돋움,
		Dotum, 굴림, Gulim, Helvetica, applegothic, sans-serif;
	font-size: 12px;
}

#sub-right #navi span {
	color: #4C4C4C;
}

#sub-right #sub-title {
	color: #4C4C4C;
	font-size: 40px;
	font-weight: 600;
	padding-top: 15px;
	border-bottom: 1px solid #EDEDED;
	height: 60px;
	position: relative;
	z-index: 5;
}

#sub-right #sub-title span {
	display: block;
	width: 158px;
	height: 12px;
	background: transparent url("/images/sub-title-txt.gif") no-repeat
		scroll 0% 0%;
	text-indent: -9999px;
	position: absolute;
	left: 0px;
	bottom: -3px;
}

#sub-right #content {
	padding-top: 30px;
	min-height: 400px;
}

.business-top {
	height: 290px;
	width: 100%;
}

.business-top-left {
	width: 205px;
	height: 270px;
	float: left;
	color: #F9F9F9;
	padding: 10px 10px 10px 30px;
	font-size: 14px;
	font-weight: 700;
	background-color: #ba7adf;
}

.vspace20 {
	height: 20px;
	width: 0px;
	overflow: hidden;
}

.business-top-left {
	color: #F9F9F9;
	font-size: 14px;
	font-weight: 700;
}

.vspace5 {
	height: 5px;
	width: 0px;
	overflow: hidden;
}

.business-top-right {
	float: right;
	width: 544.009px;
	height: 50px;
}

.clearfix::after {
	display: block;
	visibility: hidden;
	clear: both;
	content: "";
}

.business-mid {
	clear: both;
	width: 100%;
}

/* sub-right-content style */
#para1 {
	text-align: left;
	color: gray;
	font-family: HY강B;
	font-size: 35px;
	display: inline;
	margin-top: "10pt";
	font-weight: 900;
	margin-top: auto;
}

#para2 {
	text-align: left;
	color: gray;
	font-family: HY강B;
	font-size: 25px;
	font-weight: bold;
	display: inline;
}

#para4 {
	text-align: left;
	color: lightgray;
	font-family: verdana;
	font-size: 25px;
	font-weight: bold;
	display: inline
}

#para3 {
	text-align: left;
	color: lightgray;
	font-family: verdana;
	font-size: 20px;
	font-weight: bold;
	display: inline;
}

#para5 {
	text-align: left;
	color: orange;
	font-family: HY강B;
	font-size: 30px;
	font-weight: bold;
	display: inline;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/include/top_menu.jsp"%>


	<div id="sub">
		<div id="sub-left">
			<h2 style="color:">ABOUT SUIN</h2>
			<ul>
				<li><a class="smenu active" href="<%=R78%>/menu/smenu11.jsp">경영이념</a></li>
				<li><a class="smenu" href="<%=R78%>/menu/smenu12.jsp">찾아오시는
						길</a></li>
			</ul>
		</div>

		<div id="sub-right">
			<span class="svisual"> <img alt="서브아이콘"
				src="<%=R78%>/images/smenu11-icon.png" width="50" height="50"></img>
			</span>
			<p id="navi">
				Home > 회사소개 > 경영이념 <span></span>
			</p>
			<h3 id="sub-title" class="crbold">


				경영이념과 핵심가치 <span> 믿을수있는 수인 </span>
			</h3>
			<p></p>

			<div id="content">

				<div class="business-mid">

					<img id="img1" src="<%=R78%>/image/management_philosophy.png"
						width="750" height="750" alt="이미지">


				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>