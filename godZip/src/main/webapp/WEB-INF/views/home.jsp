<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>

  </head>
  <style>
    #wrap {
      height: 100vh;
    }
    #board {
      height: 80%;
    }
  </style>
  <body>
    <div id="wrap">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <script type="script" defer src="${root}/resources/js/main.js"></script>

     <div class="slideshow">
  	<img src="${root}/resources/img/slide/cars.jpg" alt="이미지 1">
  	<img src="${root}/resources/img/slide/bycicles.jpg" alt="이미지 2">
  	<img src="${root}/resources/img/slide/airconditioners.jpg" alt="이미지3">
	</div>


      <div id="board"></div>
      <%-- <%@ include file="/WEB-INF/views/common/Footer.jsp" %> --%>
    </div>
  </body>
</html>
      <link rel="stylesheet" href="${root}/resources/css/main/home.css"></link>
      <script>
      var currentSlide = 0;
      var slides = document.querySelectorAll('.slideshow img');
      slides[currentSlide].classList.add('active'); // 첫 번째 슬라이드에 클래스 추가

      var slideInterval = setInterval(nextSlide, 3000); // 3초마다 슬라이드 변경

      function nextSlide() {
        slides[currentSlide].classList.remove('active'); // 현재 슬라이드의 클래스 제거
        currentSlide = (currentSlide + 1) % slides.length; // 다음 슬라이드의 인덱스 계산
        slides[currentSlide].classList.add('active'); // 다음 슬라이드에 클래스 추가
      }

      </script>
