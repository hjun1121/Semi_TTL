<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" href = "${pageContext.request.contextPath }/css/qna/qnaReply.css">
<title>Insert title here</title>
</head>
<body>

<div style = "height: 100px"></div>

<section id = "section">

	<dl class="write-wrap e-talk">
		<dd class = "text">
			<div id = "editor" class = "text_editor">
				<textarea class = "content" name = "content" onfocus="focusCmtContent(this);"
				style="height:50px;overflow-x:hidden;overflow-y:auto;">댓글을 입력해주세요</textarea>
			</div>
		</dd>
		<dd class = "re-btn">
			<button type = "button" onclick = "go()"></button>
		</dd>
	<div style = "height: 50px"></div>

	<!-- 댓글 -->
	
	<div class = "commentBox" style = "display: block;" id = "commentBox">
	<div class = "cmt_list">
		<dl class = "cmt_item f_line" id = "content_area_dl_479400885">
			<dt>
				<span class = "nameui" title = "writer_id">writer_id</span>
				<i>2017.11.21reg_date</i>
			</dt>
			<dd id = "content_area_479400885" class = "usertxt">
				<span>여기에 내용 들어감</span>
			</dd>
			<dd id = "children_dd_479443346" class = "reples">
				<a href = "#" class = "cmtsum hide">
					답글 <em>0</em>개
				</a>
				<a href = "#" class = "cmt_w">
					답글쓰기
				</a>
						<dd class = "text">
						<div class = "text_editor">
							<textarea class = "content" name = "content" onfocus="focusCmtContent(this);"
							style="height:50px;overflow-x:hidden;overflow-y:auto;">댓글을 입력해주세요</textarea>
						</div>
						</dd>
						<dd class = "re re-btn">
							<button type = "button" onclick = "go()"></button>
						</dd>
<!-- 				<div id = "children_div_479443346" class = "hiddenreple" style = "display: block;"> -->
<!-- 					<iframe title = "답글입력창" id = "cmt_content_479443346" name = "cmt_content_479443346" -->
<!-- 						style = "width: 586px; height: 119px; margin: 0 0 0 0; padding: 0;" -->
<!-- 						frameborder = "0" scrolling = "no" marginwidth = "0" marginheight = "0"> -->
						
						
<!-- 					</iframe> -->
<!-- 				</div> -->
				<!--  답글이 Ajax로 로드되는 영역 -->
				<div class = "hiddenreple" id = "reply_toggle_479443346" style = "display: none;"></div>
				<!--  답글이 Ajax로 로드되는 영역 -->
			</dd>
		</dl>
	</div>
	</div>

	</dl>
</section>

</body>
</html>