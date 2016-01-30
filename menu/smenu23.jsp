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

#sub-right .svisual {
	position: absolute;
	z-index: 10;
	display: block;
	height: 190px;
	right: 0px;
	top: 99px;
	width: 50px;
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
	margin-top: 30px;
	min-height: 400px;
}

.business-top {
	height: 290px;
	width: 100%;
}

.business-top-left {
	width: 206px;
	height: 270px;
	float: left;
	color: #fff;
	padding: 10px 10px 10px 30px;
	font-size: 14px;
	font-weight: 700;
	/* background-color: #ba7adf; */
	background-color: #3AB0D7;
}

.vspace20 {
	height: 20px;
	width: 0px;
	overflow: hidden;
}

.vspace5 {
	height: 5px;
	width: 0px;
	overflow: hidden;
}

.business-top-right {
	float: right;
	width: 544px;
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
</style>
</head>
<body>

	<%@ include file="/WEB-INF/include/top_menu.jsp"%>

	<div id="sub">
		<div id="sub-left">
            <h2>BUSINESS</h2>
			<ul>
				<li><a class="smenu" href="<%=R78 %>/menu/smenu21.jsp">시설영역</a></li>
				<li><a class="smenu" href="<%=R78 %>/menu/smenu22.jsp">보안영역</a></li>
				<li><a class="smenu active" href="<%=R78 %>/menu/smenu23.jsp">미화영역</a></li>
			</ul>
		</div>
		<div id="sub-right">
			<span class="svisual"> <img alt="서브아이콘"
				src="<%=R78 %>/images/smenu23-icon.png" width="50" height="50"></img>
			</span>
			<p id="navi">
				Home > 사업영역 > 미화영역 <span></span>
			</p>
			<h3 id="sub-title" class="crbold">


				미화영역 <span> 믿을수있는 수인 </span>
			</h3>
			<p></p>
			<div id="content">
				<div class="business-top clearfix">
					<div class="business-top-left">
						<div class="vspace20"></div>
						<div class="vspace20"></div>
						<div class="vspace20"></div>
						<span style="font-size: 30px; font-weight: 600; width: 100%;">
							미화영역 </span>
						<div class="vspace20"></div>
						만족스러운 서비스
						<div class="vspace5"></div>
						"Integrity"
						<div class="vspace5"></div>
						[명사] 직업성, 진실성
					</div>

					<div class="business-top-right">
                        <img alt="내용" src="<%=R78 %>/images/edit1.jpg" height=300px width=395px></img>
                    </div>


					<div class="business-mid">

						<img alt="내용" src="<%=R78 %>/images/building_text.jpg" width=600px
							height=188.8px></img>

					</div>
				</div>
			</div>
		</div>
	</div>
	
    <%@include file="/WEB-INF/include/footer.jsp" %>

</body>
</html>