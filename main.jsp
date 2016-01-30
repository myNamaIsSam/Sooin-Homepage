<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, Board.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/header.jsp"%>
</head>
<style>
.main {
	text-align: center;
}

div#image {
	background-color: #f4f4f4;
}

#element {
	width: 900px;
	text-align: center;
	display: block;
	margin: 0px auto;
}

#element .etitle {
	position: absolute;
	top: 25px;
	left: 20px;
	font-size: 14px;
	color: #4083c2;
	font-weight: 600;
}

.element-container {
	width: 810px;
	margin: 0 auto;
}

#element #e1 {
	width: 240px;
	float: left;
	height: 200px;
	border-right: 1px solid #f4f4f4;
	position: relative;
	left: 40px;
}

#element #e1 .etitle {
	left: 27px;
}

#element #e1 table {
	position: absolute;
	width: 200px;
	top: 65px;
	left: 25px;
	border-bottom: none;
}

table {
	padding: 0px;
	border-spacing: 0px;
	border: 0px none;
	border-collapse: collapse;
}

tbody tr:hover {
	cursor: pointer;
}

tbody tr:hover td {
	color: #4083c2;
}

#element #e1 table td {
	text-align: left;
	color: #4d4d4d;
	font-size: 11px;
	display: block;
}

#element #e2 {
	width: 280px;
	float: left;
	height: 200px;
	border-right: 1px solid #f4f4f4;
	position: relative;
	overflow: hidden;
	left: 40px;
}

#element #e3 {
	float: left;
	height: 200px;
	position: relative;
	width: 210px;
	left: 40px;
}

#element #e3 .e3-1 {
	top: 65px;
	background: transparent url(images/guin4.png) no-repeat scroll 50% 50%;
}

#element #e3 .e3-2 {
	top: 65px;
	left: 120px;
	background: transparent url(images/gugik4.png) no-repeat scroll 0% 0%;
}

#element #e3 a {
	top: 20px;
	position: absolute;
	left: 30px;
	font-weight: bold;
	color: #999;
	text-indent: 54px;
	line-height: 49px;
	padding-right: 7px;
	height: 49px;
	text-decoration: none;
}

/* #element #e3 a {
    position: absolute;
    left: 25px;
    font-weight: bold;
    color: #999;
    padding-right: 7px;
    height: 38px;
    text-indent: 54px;
    line-height: 38px;
    text-decoration: none;
} */
#element #e3 .e3-icon {
	margin: 0 auto;
}

#bottom {
	display: block;
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
		$("div.pagination a").click(function() {
			$("input[name=pg]").val($(this).attr("data-page"));
			$("form").submit();
		});
	});
</script>

<%
	String s = request.getParameter("pg");
	int currentPage = (s == null) ? 1 : Integer.parseInt(s);
	int pageSize = 10;
	ArrayList<Board> list = BoardDAO1.selectPage(currentPage, pageSize);
%>

<body>
	<%@ include file="/WEB-INF/include/top_menu.jsp"%>

	<%-- <div class="main" id="image">

		<!-- <script Language="JavaScript"> -->
		<script type="text/javascript">
			// 체인징할 이미지 파일 설정 부분
			var img1 = new Image();
			img1.src = "<%=request.getContextPath()%>/images/main_13.png";

			var img2 = new Image();
			img2.src = "<%=request.getContextPath()%>/images/main_23.png";

			var img3 = new Image();
			img3.src = "<%=request.getContextPath()%>/images/main_33.png";

			// 이미지 추가시

			//var img추가숫자 = new Image();
			//img추가숫자.src = "경로/이미지파일.jpg";
			// 아래의 maxLoops의 갯수도 추가한 만큼 수정해줘어야 합니다.
		</script>
		<script type="text/javascript">
			var maxLoops = 3; // 이미지 갯수
			var bInterval = 1; // 다음 그림으로 전환시 간격 ==> 단위는 초

			// 아래는 수정할 필요 없습니다.
			var count = 1;

			function init() {
				blendtrjs.filters.blendTrans.apply();
				document.images.blendtrjs.src = eval("img" + count + ".src");
				blendtrjs.filters.blendTrans.play();
				if (count < maxLoops) {
					count++;
				} else {
					count = 1;
				}
				setTimeout("init()", bInterval * 700 + 2000);
			}

			init();
		</script>

		<!-- duration=2 에서 2는 트랜지션의 변환속도 (낮을수록 빠름, 1 미만도 가능) -->
		<img src="<%=request.getContextPath()%>/images/main_13.png" name="blendtrjs" border="1"
			style="filter: blendTrans(duration = 1)">
	</div> --%>
	
	<div class="main" id="image">
        <img id="img_to_main" src="pic_src" />


        <script type="text/javascript">
            var i = 1;

            function change_pic() {
                i++;
                if (i == 4) {
                    i = 1;
                }

                if (i == 1) {
                    document.getElementById('img_to_main').src = "images/main_13.png";
                } else if (i == 2) {
                    document.getElementById('img_to_main').src = "images/main_23.png";
                } else if (i == 3) {
                    document.getElementById('img_to_main').src = "images/main_33.png";
                }
            }

            var pic_src = setInterval(change_pic, 3000);
        </script>
    </div>
    
	<div class="main" id="element">
		<div class="element-container">
			<div id="e1">
				<h2 class="etitle" style="text-align: left">수인소식</h2>
				<table style="line-height: 1.6em;">
					<tbody>
						<%	
								int count = BoardDAO1.getRecordCount();
								if(count == 0){
									out.println("<tr data-id='-1'><td>공지사항이 없습니다.</td></tr>");
								}else{
									for (int i = 0; i < 5; i++) {
										try{
											list.get(i).getId();
						%>
											<tr data-id="<%=list.get(i).getId()%>">
											<%char[] _title = list.get(i).getTitle().toCharArray();%>
												<td><%out.print("[" + list.get(i).getDate() + "] ");%>
													<%	
														if(_title.length > 10){
															for(int j=0; j<10; j++)
																out.print(_title[j]);
																out.print("...");
														}else{
															out.print(list.get(i).getTitle());
														}
													%>
												</td>
						<%
										}catch(IndexOutOfBoundsException e){
											out.println("<tr><td></td></tr>");
											System.out.println(e.toString());
										}
									}
								}
						%>
					</tbody>
				</table>
			</div>
			<div id="e2">
				<h2 class="etitle" style="text-align: left">사업영역</h2>
				<!-- <img id="img_to_main2" src="pic_src2" width="240px" height="130px"
					style="margin-top: 64px" /> -->


				<script type="text/javascript">
					// 스크롤러의 가로크기
					var sliderwidth = 240
					// 스크롤러의 높이 (이미지의 높이와 맞추어 주세요)
					var sliderheight = 130
					// 스크롤 속도 (클수록 빠릅니다 1-10)
					var slidespeed = 1
					// 배경색상
					slidebgcolor = "#"

					// 이미지들을 설정 하세요
					var leftrightslide = new Array()
					var finalslide = ''
					leftrightslide[1] = "<img id='img_to_main2' style='margin-top: 64px' width='240px' height='130px' src='images/main_13.jpg' alt='배너1' />"
					leftrightslide[2] = "<img id='img_to_main2' style='margin-top: 64px' width='240px' height='130px' src='images/main_23.jpg' alt='배너2' />"
					leftrightslide[3] = "<img id='img_to_main2' style='margin-top: 64px' width='240px' height='130px' src='images/main_33.jpg' alt='배너3' />"

					var copyspeed = slidespeed
					leftrightslide = '<nobr>' + leftrightslide.join(" ")
							+ '</nobr>'
					var iedom = document.all || document.getElementById

					if (iedom)
						document
								.write('<span id="temp" style="visibility:hidden;position:absolute;top:-100;left:-4000px">'
										+ leftrightslide + '</span>')

					var actualwidth = ''
					var cross_slide, ns_slide

					function fillup() {
						if (iedom) {
							cross_slide = document.getElementById ? document
									.getElementById("test2")
									: document.all.test2
							cross_slide2 = document.getElementById ? document
									.getElementById("test3")
									: document.all.test3
							cross_slide.innerHTML = cross_slide2.innerHTML = leftrightslide
							actualwidth = document.all ? cross_slide.offsetWidth
									: document.getElementById("temp").offsetWidth
							cross_slide2.style.left = actualwidth + 5 + "px"
						} else if (document.layers) {
							ns_slide = document.ns_slidemenu.document.ns_slidemenu2
							ns_slide2 = document.ns_slidemenu.document.ns_slidemenu3
							ns_slide.document.write(leftrightslide)
							ns_slide.document.close()
							actualwidth = ns_slide.document.width
							ns_slide2.left = actualwidth + 5 + "px"
							ns_slide2.document.write(leftrightslide)
							ns_slide2.document.close()
						}
						lefttime = setInterval("slideleft()", 30)
					}

					function slideleft() {
						if (iedom) {
							if (parseInt(cross_slide.style.left) > (actualwidth
									* (-1) + 5))
								cross_slide.style.left = parseInt(cross_slide.style.left)
										- copyspeed + "px"
							else
								cross_slide.style.left = parseInt(cross_slide2.style.left)
										+ actualwidth + 5 + "px"

							if (parseInt(cross_slide2.style.left) > (actualwidth
									* (-1) + 5))
								cross_slide2.style.left = parseInt(cross_slide2.style.left)
										- copyspeed + "px"
							else
								cross_slide2.style.left = parseInt(cross_slide.style.left)
										+ actualwidth + 5 + "px"

						} else if (document.layers) {
							if (ns_slide.left > (actualwidth * (-1) + 5))
								ns_slide.left -= copyspeed + "px"
							else
								ns_slide.left = ns_slide2.left + actualwidth
										+ 5 + "px"

							if (ns_slide2.left > (actualwidth * (-1) + 5))
								ns_slide2.left -= copyspeed + "px"
							else
								ns_slide2.left = ns_slide.left + actualwidth
										+ 5 + "px"
						}
					}

					if (iedom || document.layers) {
						with (document) {
							document.write('<div style="padding-top: 3px;">')
							if (iedom) {
								write('<div style="width:'+sliderwidth+'px;height:'+sliderheight+'px;overflow:hidden">')
								write('<div style="padding:5px;position:absolute;width:'+sliderwidth+'px;height:'+sliderheight+'px;background-color:'+slidebgcolor+'" onfocus="copyspeed=0" onblur="copyspeed=slidespeed" onMouseover="copyspeed=0" onMouseout="copyspeed=slidespeed">')
								write('<div id="test2" style="position:absolute;left:0px;top:0px"></div>')
								write('<div id="test3" style="position:absolute;left:-1000px;top:0px"></div>')
								write('</div></div>')
							} else if (document.layers) {
								write('<ilayer width='+sliderwidth+' height='+sliderheight+' name="ns_slidemenu" bgColor='+slidebgcolor+'>')
								write('<layer name="ns_slidemenu2" left="0px" top="0px" onfocus="copyspeed=0" onblur="copyspeed=slidespeed" onMouseover="copyspeed=0" onMouseout="copyspeed=slidespeed"></layer>')
								write('<layer name="ns_slidemenu3" left="0px" top="0px" onfocus="copyspeed=0" onblur="copyspeed=slidespeed" onMouseover="copyspeed=0" onMouseout="copyspeed=slidespeed"></layer>')
								write('</ilayer>')
							}
						}
					}
				</script>
				<script type="text/javascript">
					fillup();
				</SCRIPT>

			</div>
		</div>
		<div id="e3">
			<h2 class="etitle" style="text-align: left">견적의뢰</h2>
			<div style="margin-top: 60px; margin-left: 10px;">
				<div class="e3-icon">
					<img src="images/info.png" width="240px" height="130px" />
					</a>
				</div>
			</div>
		</div>
	</div>

	<%@include file="/WEB-INF/include/footer.jsp"%>

</body>
</html>