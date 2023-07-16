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
		  	<button type="button" class="button" style="text-align: center; margin-top: 10px;">
			  <span class="button__text">Refresh</span>
			  <span class="button__icon"><svg class="svg" height="48" viewBox="0 0 48 48" width="48" xmlns="http://www.w3.org/2000/svg"><path d="M35.3 12.7c-2.89-2.9-6.88-4.7-11.3-4.7-8.84 0-15.98 7.16-15.98 16s7.14 16 15.98 16c7.45 0 13.69-5.1 15.46-12h-4.16c-1.65 4.66-6.07 8-11.3 8-6.63 0-12-5.37-12-12s5.37-12 12-12c3.31 0 6.28 1.38 8.45 3.55l-6.45 6.45h14v-14l-4.7 4.7z"></path><path d="M0 0h48v48h-48z" fill="none"></path></svg></span>
			</button>		  
		  </div>


		 <div class="container mt-3">

		  <div class="card mx-4 my-3">
		    <img class="card-img-top" src="${root}/resources/img/memberImg/defaultProfile.png" alt="Card image" style="width:100%; height: 100px;">
		    <div class="card-body" style="height: 200px;">
		      <h4 class="card-title">반복문</h4>
		      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
		      <div style="text-align: center; margin-bottom: 0;">
			      <a href="#" class="btn btn-primary">See Review</a>
		      </div>
		    </div>
		  </div>		  

		  <div class="card mx-4 my-3">
		    <img class="card-img-top" src="${root}/resources/img/memberImg/defaultProfile.png" alt="Card image" style="width:100%; height: 100px;">	  
		    <div class="card-body">
		      <h4 class="card-title">으로</h4>
		      <p class="card-text">Some example text some example text. Jane Doe is an architect and engineer</p>
		      <div style="text-align: center;">
			      <a href="#" class="btn btn-primary">See Review</a>
		      </div>
		    </div>
		  </div>

		  <div class="card mx-4 my-3">
		    <img class="card-img-top" src="${root}/resources/img/memberImg/defaultProfile.png" alt="Card image" style="width:100%; height: 100px;">
		    <div class="card-body">
		      <h4 class="card-title">10개씩</h4>
		      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
		      <div style="text-align: center;">
			      <a href="#" class="btn btn-primary">See Review</a>
		      </div>
		    </div>
		  </div>

		  <div class="card mx-4 my-3">
		    <img class="card-img-top" src="${root}/resources/img/memberImg/defaultProfile.png" alt="Card image" style="width:100%; height: 100px;">	  
		    <div class="card-body">
		      <h4 class="card-title">보여주기</h4>
		      <p class="card-text">Some example text some example text. Jane Doe is an architect and engineer</p>
		      <div style="text-align: center;">
			      <a href="#" class="btn btn-primary">See Review</a>
		      </div>
		    </div>
		  </div>
		  
		  <div class="card mx-4 my-3">
		    <img class="card-img-top" src="${root}/resources/img/memberImg/defaultProfile.png" alt="Card image" style="width:100%; height: 100px;">
		    <div class="card-body">
		      <h4 class="card-title">뭔말</h4>
		      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
		      <div style="text-align: center;">
			      <a href="#" class="btn btn-primary">See Review</a>
		      </div>
		    </div>
		  </div>		  

		  <div class="card mx-4 my-3">
		    <img class="card-img-top" src="${root}/resources/img/memberImg/defaultProfile.png" alt="Card image" style="width:100%; height: 100px;">  
		    <div class="card-body">
		      <h4 class="card-title">인지</h4>
		      <p class="card-text">Some example text some example text. Jane Doe is an architect and engineer</p>
			      <div style="text-align: center;">
			      <a href="#" class="btn btn-primary">See Review</a>
		      </div>
		    </div>
		  </div>

		  <div class="card mx-4 my-3">
		    <img class="card-img-top" src="${root}/resources/img/memberImg/defaultProfile.png" alt="Card image" style="width:100%; height: 100px;">
		    <div class="card-body">
		      <h4 class="card-title">알지</h4>
		      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
		      <div style="text-align: center;">
			      <a href="#" class="btn btn-primary">See Review</a>
		      </div>
		    </div>
		  </div>

		  <div class="card mx-4 my-3">
		    <img class="card-img-top" src="${root}/resources/img/memberImg/defaultProfile.png" alt="Card image" style="width:100%; height: 100px;">
		    <div class="card-body">
		      <h4 class="card-title">화이팅</h4>
		      <p class="card-text">Some example text some example text. Jane Doe is an architect and engineer</p>
		      <div style="text-align: center;">
			      <a href="#" class="btn btn-primary">See Review</a>
		      </div>
		    </div>
		  </div>
		  <div class="card mx-4 my-3">
		    <img class="card-img-top" src="${root}/resources/img/memberImg/defaultProfile.png" alt="Card image" style="width:100%; height: 100px;">
		    <div class="card-body">
		      <h4 class="card-title">나는</h4>
		      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
		      <div style="text-align: center;">
			      <a href="#" class="btn btn-primary">See Review</a>
		      </div>
		    </div>
		  </div>

		  <div class="card mx-4 my-3">
		    <img class="card-img-top" src="${root}/resources/img/memberImg/defaultProfile.png" alt="Card image" style="width:100%; height: 100px;">
		    <div class="card-body">
		      <h4 class="card-title">천재다</h4>
		      <p class="card-text">Some example text some example text. Jane Doe is an architect and engineer</p>
		      <div style="text-align: center;">
			      <a href="#" class="btn btn-primary">See Review</a>
		      </div>
		    </div>
		  </div>		  
		  
		  
		</div>
      </div>
      
      	<h2 class="fw-bold" style="text-align: center; margin-top: 10px;">Category</h2>
      <div id="category-area">
      	<div id="category-div" class="mx-3">
		 	<div class="book my-3">
		    <p>Hello</p>
		    <div class="cover">
		        <p>Hover Me</p>
		    </div>
		   </div>
		    <div class="book">
		    <p>Hello</p>
		    <div class="cover">
		        <p>Hover Me</p>
		    </div>
		   </div>
		    <div class="book">
		    <p>Hello</p>
		    <div class="cover">
		        <p>Hover Me</p>
		    </div>
		   </div>
   		 	<div class="book">
		    <p>Hello</p>
		    <div class="cover">
		        <p>Hover Me</p>
		    </div>
		   </div>
		    <div class="book">
		    <p>Hello</p>
		    <div class="cover">
		        <p>Hover Me</p>
		    </div>
		   </div>
		    <div class="book">
		    <p>Hello</p>
		    <div class="cover">
		        <p>Hover Me</p>
		    </div>
		   </div>
		</div>
	
      </div>
      
      <%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>
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
