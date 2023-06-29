<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- JavaScript Bundle with Popper -->
<!-- <script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script> -->
<!-- CSS only -->
<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script> -->
<!-- 아이콘 -->
<!-- <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"> -->

<meta charset="UTF-8">

<title>Insert title here</title>

<style>
a {
  text-decoration: none;
}

/* ----- 푸터 ----- */
.rowfooter {
	width: 100%;
	height: 100%;
	background-color: rgb(232, 232, 232);
	padding: 20px;
	display: flex;
}

.rowfooter>.footer_menu1 {
	flex-grow: 3;
}

.rowfooter>.footer_menu2 {
	flex-grow: 3;
}

.rowfooter>.footer_menu3 {
	flex-grow: 2;
}

.rowfooter .head {
	font-weight: bold;
	font-size: x-large;
}

.rowfooter .line {
	width: 90%;
	color: rgb(128, 128, 128);
}

.rowfooter i {
	font-size: 30px;
	padding-right: 10px;
	color: grey;
}

@media screen and (max-width:830px) {
	.rowfooter {
		flex-direction: column;
		height: 100%;
	}
}
</style>
</head>

<body>
	<div class="rowfooter">
		<div class="footer_menu1">
			<div class="head">COMPANY INFO</div>
			<div class="line">COMPANY : PERFUME</div>
			<div class="line">OWNER :홍길동</div>
			<div class="line">ADDRESS : 서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩)
				2F, 3F</div>
			<div class="line">CPO : 홍길동(hgd@naver.com)</div>
			<div class="line">BUSINESS LICENSE : 000-00-00000</div>
		</div>
		<div class="footer_menu2">
			<div class="head">CONTECT</div>
			<div class="line">
				TEL : 02-1234-1234<br> MON-FRI AM 9:00 - PM 17:00<br>
				LUNCH TIME PM 12:00 -PM 13:00
			</div>


			<div class="head">BANK ACCOUNT</div>
			<div class="line">
				예금주 홍길동<br> 우리은행 123-4567-8900
			</div>
		</div>
		<div class="footer_menu3">
			<div class="head">SNS</div>
			<a href="#"><i class="fa-brands fa-square-instagram"></i></a> <a
				href="#"> <i class="fa-brands fa-square-facebook"></i></a> <a
				href="#"><i class="fa-brands fa-square-youtube"></i></a>

		</div>
	</div>
</body>
</html>