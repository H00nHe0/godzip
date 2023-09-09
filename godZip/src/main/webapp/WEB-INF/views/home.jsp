<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>

  </head>
  <body>
    <div id="wrap">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <script type="script" defer src="${root}/resources/js/main.js"></script>

<!-- Carousel -->
<div id="demo" class="carousel slide" data-bs-ride="carousel">

  <!-- Indicators/dots -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
  </div>
  
  <!-- The slideshow/carousel -->
  <div class="carousel-inner">
    <div class="carousel-item active" style="text-align: center;">
      <img src="${root}/resources/img/slide/cars.jpg" alt="cars" class="d-block" style="width:100%; height: 400px">
      <div class="carousel-caption text-black fw-bold bg-warning bg-opacity-75 lead" style="width:23%; margin: auto;">
        <h3>차 바꿀때 됬는데..</h3>
        <p>차에 대한 리뷰를 찾아보세요!</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="${root}/resources/img/slide/bycicles.jpg" alt="bycicles" class="d-block" style="width:100%; height: 400px">
      <div class="carousel-caption text-black fw-bold bg-warning bg-opacity-75 lead" style="width:23%; margin: auto;">
        <h3>몸도 튼튼 마음도 튼튼!!</h3>
        <p>자전거 용품 리뷰를 찾아보세요!</p>
      </div> 
    </div>
    <div class="carousel-item">
      <img src="${root}/resources/img/slide/airconditioners.jpg" alt="airconditioners" class="d-block" style="width:100%; height: 400px">
      <div class="carousel-caption text-black fw-bold bg-warning bg-opacity-75 lead" style="width:23%; margin: auto;">
        <h3>해외여행보단 방콕이지~!</h3>
        <p>에어컨 관련 리뷰를 찾아보세요!</p>
      </div>  
    </div>
  </div>
  
  <!-- Left and right controls/icons -->
  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>
   	
      <div id="review-area">
		  <div style="display: flex; align-items: center; justify-content: center;">
		  <h2 class="fw-bold mx-4" style="text-align: center; margin-top: 10px;">Recent reviews</h2>
		  	<button type="button" class="button" style="text-align: center; margin-top: 10px;" id="getRecentReview">
			  <span class="button__text">Refresh</span>
			  <span class="button__icon"><svg class="svg" height="48" viewBox="0 0 48 48" width="48" xmlns="http://www.w3.org/2000/svg"><path d="M35.3 12.7c-2.89-2.9-6.88-4.7-11.3-4.7-8.84 0-15.98 7.16-15.98 16s7.14 16 15.98 16c7.45 0 13.69-5.1 15.46-12h-4.16c-1.65 4.66-6.07 8-11.3 8-6.63 0-12-5.37-12-12s5.37-12 12-12c3.31 0 6.28 1.38 8.45 3.55l-6.45 6.45h14v-14l-4.7 4.7z"></path><path d="M0 0h48v48h-48z" fill="none"></path></svg></span>
			</button>		  
		  </div>


		 <div class="recentContainer mt-3">
		<c:forEach items="${rvoList}" var="list">
		  <div class="card mx-4 my-3">
			  <div class="card-body" style="height: 100px;">
				<c:if test="${!empty list.profile}">
					<img class="card-img-top" src="${root}/resources/img/memberImg/${list.profile}" alt="Card image" style="width:80px; height: 80px;">
				</c:if>
				<c:if test="${empty list.profile}">
					<img class="card-img-top" src="${root}/resources/img/memberImg/defaultProfile.png" alt="Card image" style="width:80px; height: 80px;">				
				</c:if>
				<h4 class="card-nick">${list.nick}</h4>
				<div id="star-area">
					<c:if test="${list.score == 1}">
						<img src="${root}/resources/img/stars/1star.png" alt="1star" style="width:100px; height: 30px;">
					</c:if>
					<c:if test="${list.score == 2}">
						<img src="${root}/resources/img/stars/2stars.png" alt="2star" style="width:100px; height: 30px;">
					</c:if>
					<c:if test="${list.score == 3}">
						<img src="${root}/resources/img/stars/3stars.png" alt="3star" style="width:100px; height: 30px;">
					</c:if>
					<c:if test="${list.score == 4}">
						<img src="${root}/resources/img/stars/4stars.png" alt="4star" style="width:100px; height: 30px;">
					</c:if>
					<c:if test="${list.score == 5}">
						<img src="${root}/resources/img/stars/5stars.png" alt="5star" style="width:100px; height: 30px;">
					</c:if>
				</div>
		    </div>
			<div class="card-title">
				<h5 class="card-text">${list.title}(${list.commCount}) &nbsp;${list.attFile}</h5>
			</div>
			<div style="text-align: center; margin-bottom: 10px;">
				<a href="${root}/review/board/detail/${list.no}" class="btn btn-primary" id="review${list.no}" onclick="growCnt(this)">See Review</a>
			</div>
		  </div>		  
		
		</c:forEach>

		  
		</div>
      </div>
      
      	<h2 class="fw-bold" style="text-align: center; margin-top: 10px;">Category</h2>
      <div id="category-area">
      	<div id="category-div" class="mx-3">
      	<c:forEach items="${cList}" var="cl">
		 	<div class="book my-3">
				<ul class="side-uL" id="subListArea${cl.no}"></ul>
		    <div class="cover">
		        <p>${cl.caName}</p>
          </div>
        </div>
      </c:forEach>
		</div>
    
  </div>
  
  <%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>
</div>
</body>
<link rel="stylesheet" href="${root}/resources/css/main/home.css"></link>
</html>
<script>
  $(document).ready(function () {
    var getRecentReview = document.querySelector("#getRecentReview");
    getRecentReview.addEventListener("click", function () {
            window.location.href = "${root}/home";
    
        })
        
        
        function growCnt(element) {
      var reviewNo = element.getAttribute("id").replace("review", "");
      
      $.ajax({
          url: "${root}/review/board/count/" + reviewNo,
          type: "PUT",
          data: { no: reviewNo },
          success: function () {
              console.log("게시물 조회수 증가");
          },
          error: function (error) {
              console.log(error);
          },
      });
  }

  var currentSlide = 0;
  var slides = document.querySelectorAll('.slideshow img');
  slides[currentSlide].classList.add('active'); // 첫 번째 슬라이드에 클래스 추가

  var slideInterval = setInterval(nextSlide, 3000); // 3초마다 슬라이드 변경

  function nextSlide() {
    slides[currentSlide].classList.remove('active'); // 현재 슬라이드의 클래스 제거
    currentSlide = (currentSlide + 1) % slides.length; // 다음 슬라이드의 인덱스 계산
    slides[currentSlide].classList.add('active'); // 다음 슬라이드에 클래스 추가
  }
});
  </script>
  