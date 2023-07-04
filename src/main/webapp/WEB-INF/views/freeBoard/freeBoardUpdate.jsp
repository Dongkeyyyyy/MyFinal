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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>자유게시판 수정</title>
<style>
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

h2 {
	text-align: center;
	color: #555555;
}

h2 a {
	text-decoration: none; /* 링크의 밑줄 제거 */
}

.titleArea {
	text-align: center;
	font-size: 30px;
	padding-top: 100px;
	padding-bottom: 50px;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
}

.form-row {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	margin-bottom: 1rem;
}

#category {
	border: none;
	outline: none;
	background-color: transparent;
	border-bottom: 1px solid #dddddd;
	border-bottom: 0;
}

#title {
	border: none;
	outline: none;
	background-color: transparent;
	border-bottom: 1px solid #dddddd;
	border-bottom: 0;
}

.wrContent textarea {
	width: 100%;
}

/* 수정완료, 취소버튼 */
.button {
	display: flex;
	justify-content: flex-end;
}

#btnSave {
	display: inline-block;
	font-size: 16px;
	text-align: center;
	text-decoration: none;
	background-color: #b2a08a;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	height: 38px;
	width: 53px;
}

#btnSave:hover {
	background-color: #525252;
}

#btnCancel {
	margin-left: 10px;
}
</style>
</head>

<body style="font-family: 'Pretendard-Regular', sans-serif;">

	<!-- 게시판 시작  -->
	<div class="header">
		<c:import url="/WEB-INF/views/common/navi.jsp" />
	</div>
	<div class="titleArea">
		<a href="/freeBoard/selectList?cpage=1"><h2>COMMUNITY</h2></a>
	</div>
	<div class="container">
		<form action="/freeBoard/updateBoard" method="post">
			<div class="row form-group">
				<div class="col-2">
					<div class="mb-3">
						<select class="form-select" id="category" name="fr_category">
							<option value="" disabled selected hidden>${conts.fr_category}</option>
							<c:forEach var="c" items="${category }">
								<option value="${c.cate_name }">${c.cate_name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="col-10">
					<div class="title">
						<input type="text" class="form-control" id="title" name="fr_title"
							value="${conts.fr_title }" maxlength="60"
							placeholder="제목을 입력하세요." required /> <input type="hidden"
							name="fr_seq" value="${conts.fr_seq}">
					</div>
				</div>
			</div>

			<!-- 내용 -->
			<div class="mb-3">
				<div class="wrContent">
					<textarea class="form-control" id="content" name="fr_contents"
						required rows="13">${conts.fr_contents}</textarea>
				</div>
			</div>
			<div class="mb-3">
				<div class="imageListContainer">
					<c:forEach items="${imageList}" var="image">
						<span id="image">${image.oriName}</span>
					</c:forEach>
				</div>
<!-- 				<div class="mb-3">
					<div class="fileWrapper">
						<label for="file">이미지 파일 첨부</label> <br> <input type="file"
							id="inputFiles" value="첨부파일" name="files"
							accept="image/png, image/jpeg, image/jpg" multiple><br>
					</div>
				</div> -->
			</div>
			<div class="button">
				<button type="submit" id="btnSave" class="btn btn-primary">등록</button>
				<button type="button" id="btnCancel" class="btn btn-light">취소</button>
			</div>
		</form>
	</div>
	<div class="footer">
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>

	<!-- 게시판 끝 -->

	<script>
		$("#btnCancel").on("click", function() {
			let fr_seq = ${conts.fr_seq}; 
			console.log(fr_seq); 
			location.href= "selectBySeq?fr_seq="+fr_seq; 
		})
		
		$("#btnContentsRemove").on("click",function(){
			alert("미구현 기능입니다."); 
		}); 
		
	
	
	</script>




</body>
</html>