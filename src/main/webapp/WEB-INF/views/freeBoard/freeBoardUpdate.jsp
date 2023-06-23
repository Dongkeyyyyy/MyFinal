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
<title>FreeBoardContent</title>
<style>
@font-face {
	font-family: "Dovemayo_gothic";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.1/Dovemayo_gothic.woff2")
		format("woff2");
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: "Dovemayo_gothic";
}

h2 {
	text-align: center;
	color: #555555;
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

/* .title {
        border-bottom: 1px solid #000;
      } */
.wrContent textarea {
	width: 100%;
}

/* 수정완료, 취소버튼 */
#btnSave {
	display: inline-block;
	padding: 10px 20px;
	font-size: 16px;
	font-weight: bold;
	text-align: center;
	text-decoration: none;
	background-color: #8fd4e9;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

#btnSave:hover {
	background-color: #0a75c7;
}
</style>
</head>

<body>

	<!-- 게시판 시작  -->
	<div class="container">
		<form action="/freeBoard/updateBoard" method="post">

			<div class="titleArea">
				<h2>게시판</h2>
			</div>
			<!-- 말머리랑 제목 -->
			<div class="row form-group">
				<div class="col-2">
					<div class="mb-3">
						<select class="form-select" id="category" name="fr_category"
							required>
							<option value="" disabled selected hidden>말머리</option>
							<c:forEach var="c" items="${category }">
								<option value="${c.cate_name }">${c.cate_name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="col-10">
					<div class="title">
						<input type="text" class="form-control" id="title" name="fr_title"
							value="${conts.fr_title }" placeholder="제목을 입력하세요." required />
						<input type="hidden" name="fr_seq" value="${conts.fr_seq}">
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
						<button id="btnContentsRemove">삭제</button>
					</c:forEach>
				</div>
				<div class="fileWrapper">
					<fieldset>
						<legend>이미지 파일 첨부 </legend>
						<input style = "display:none" type="file" id="inputFiles" value="첨부파일" name="files"
							accept="image/png, image/jpeg, image/jpg" multiple><br>
					</fieldset>
				</div>
			</div>
			<div class="button">
				<button type="submit" id="btnSave" class="btn btn-primary">수정완료</button>
				<button type="button" id="backToList" class="btn btn-light">취소</button>
			</div>


		</form>
	</div>

	<!-- 게시판 끝 -->

	<script>
		$("#backToList").on("click", function() {
			history.back();
		})
		
		
		// 이미지 수정하기 
		const r = $("#btnContentsRemove");
		console.log(r); 
		r.on("click", () => {
			const f = $("#inputFiles")[0]; 
			console.log(f.value);
			
			if(f.value && f.value !== ""){
				// 파일 있는지 확인 
				// 파일 첨부 요소의 값이 비어있지 않고, 비어있지 않은 문자열이라면(파일이 선택된 경우)
				f.value = ""; //파일 비워준다 -> 선택된 파일 초기화 
				$("#image").html(""); // 파일 이름 넣어준걸 비워줌
				r.html("파일첨부"); 
			}else {
				// 파일 첨부 요소 값이 비어있을 경우 
				// 파일 첨부 요소 클릭하여 파일 상자 엶 
				f.click(); 
			}
		});
		
	
	</script>




</body>
</html>