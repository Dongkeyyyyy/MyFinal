<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<meta charset="UTF-8">
<title>QnA</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<style>
.borderName {
	font-size: 35px;
	padding-top: 100px;
}

a {
	text-decoration: none;
	color: #b2a08a;
}
a:hover {
color: #b2a08a;
font-weight: bold;
}

input[type="text"] {
	border: none;
	outline: none;
	background-color: transparent;
	border-bottom: 1px solid #dddddd;
}

#title {
	width: 100%;
	margin-top: 20px;
	font-size: 20px;
}

#content {
	width: 100%;
	height: 600px;
	margin-top: 20px;
	font-size: 15px;
	padding: 15px;
	resize: none;
	border-color: #dddddd;
}

#content:focus {
	outline: none;
}

/* 버튼 */
.btn {
	border: 1px solid #b2a08a;
	background-color: white;
	margin: 70px 10px;
	width: 180px;
}

#complete {
	background-color: #b2a08a;
	color: white;
	border-radius: 0px;
}

#toList {
	border: 1px solid #b2a08a;
	border-radius: 0px;
}

#toList:hover, #complete:hover {
	background-color: #525252;
	color: white;
	font-weight: bold;
	border: none;
}

/* 파일 업로드 버튼 스타일 */
.filebox {
	padding-top: 10px;
	width: 100%;
}

.filebox .upload-name {
	display: inline-block;
	height: 40px;
	padding: 0 20px;
	vertical-align: middle;
	border: 1px solid #dddddd;
	width: 78%;
	color: #999999;
}

.filebox label {
	display: inline-block;
	padding: 10px 20px;
	color: #fff;
	vertical-align: middle;
	background-color: #b2a08a;
	cursor: pointer;
	height: 40px;
	width: 20%;
	margin-left: 1%;
}

.filebox label:hover {
	background-color: #525252;
	font-weight: bold;
}

.filebox input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

@media ( max-width : 800px) {
	.filebox .upload-name {
		width: 70%;
	}
	.filebox label {
		width: 27%;
	}
}
	
  @font-face {
   font-family: 'Pretendard-Regular';
   src:
      url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
      format('woff');
   font-weight: 400;
   font-style: normal;
}
	
  </style>
</head>
 <body style="font-family: 'Pretendard-Regular', sans-serif;">
	<div class="rowheader">
		<c:import url="/WEB-INF/views/common/navi.jsp" />
	</div>

	<form action="/qnaBoard/insertPost" method="post"
		enctype="multipart/form-data">
		<div class="container">
			<div class="rowbody">
				<div class="borderName" align="center">
					<a href="/qnaBoard/boardList?cpage=1">Q & A</a>
				</div>
				<hr>
				<div>
					<input type="text" id="title" placeholder="  글 제목을 입력하세요"
						name="qa_title" maxlength="60">
				</div>

				<div>
					<textarea id="content" placeholder="글 내용을 입력하세요."
						name="qa_contents" maxlength="1000"></textarea>
				</div>

		<!-- 		<div class="filebox">
					<input class="upload-name" value="첨부파일" placeholder="첨부파일">
					<label for="file" align="center">파일찾기</label> <input type="file"
						id="file" name="files" multiple>
				</div>
 -->
				<div align="center">
					<a href="selectAll"> <a href="/qnaBoard/boardList?cpage=1"><input
							type="button" id="toList" class="btn" value="취소"></a> <input
						type="submit" id="complete" class="btn" value="등록">
				</div>
			</div>
	</form>
	</div>

	<div class="footer">
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>

	<script>
	
	// 글자수 제한 
	const title = document.getElementById("title");

	title.addEventListener("input", function() {
	  const maxLength = parseInt(this.getAttribute("maxlength"));
	  const currentLength = this.value.length;

	  if (currentLength > maxLength) {
	    alert("60자까지 작성 가능 합니다.");
	  }
	});
	
	
	const textarea = document.getElementById("content");

	textarea.addEventListener("input", function() {
	  const maxLength = parseInt(this.getAttribute("maxlength"));
	  const currentLength = this.value.length;

	  if (currentLength > maxLength) {
	    alert("1000자까지 작성 가능 합니다.");
	  }
	});
	
		// 등록버튼
		$("#complete").on("click", function() {
			let title = document.getElementById("title").value;
			let content = document.getElementById("content").value;

			if (title == "") {
				alert("제목을 입력하세요.");
				return false;
			} else if (content == "") {
				alert("내용을 입력하세요.");
				return false;
			}
		});

		// 파일명 출력
		$("#file").on('change', function() {
			var fileName = $("#file").val();
			$(".upload-name").val(fileName);
		});
	</script>
</body>

</html>