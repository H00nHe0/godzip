<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="root" value="${pageContext.request.contextPath}" scope="page" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="${root}/resources/css/common/header.css" />
    <!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
     <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
<c:if test="${ not empty alertMsg }">
  <script>
    alert("${sessionScope.alertMsg}");
  </script>
</c:if>
<c:remove var="alertMsg" scope="session" />
<c:if test="${ not empty successMsg }">
  <script>
    alert("${sessionScope.successMsg}");
  </script>
</c:if>
<c:remove var="successMsg" scope="session" />
<header>
  <div id="logo-search-area">
    <div id="logoArea">
      <a href="${root}/home">
        <img
          id="logoImg"
          style="width: 120px; height: 120px; margin-left: 20px"
          src="${root}/resources/img/Logo.png"
          alt="로고이미지"
        />
      </a>
    </div>
    <div id="search-area">
      <input
        type="text"
        placeholder="Seach items or categories you want!"
        name="text"
        class="input"
      />
    </div>
    <div id="slogan">
      <h4 class="fst-italic">Share , Check reviews and Choose!</h4>
    </div>
  </div>
  <nav class="navbar navbar-expand-sm bg-warning navbar-dark opacity-65">
    <div class="container-fluid">
      <ul class="navbar-nav nav-underline">
        <li class="nav-item mx-4">
          <div
            class="nav-link"
            data-bs-toggle="offcanvas"
            data-bs-target="#offcanvasWithBothOptions"
            aria-controls="offcanvasWithBothOptions"
          >
            <dt class="text-muted lead fw-bold">리뷰 확인하기</dt>
          </div>
        </li>
        <li class="nav-item mx-4">
          <a class="nav-link" href="${root}/review/write"
            ><dt class="text-muted lead fw-bold">리뷰 작성하기</dt></a
          >
        </li>
        <li class="nav-item mx-4">
          <a class="nav-link" href="#"
            ><dt class="text-muted lead fw-bold">자유게시판</dt></a
          >
        </li>
      </ul>
      <c:if test="${empty mvo}">
        <ul class="navbar-nav navbar-right nav-underline">
          <li class="nav-item mx-2">
            <a class="nav-link" href="${root}/member/loginForm"
              ><dt class="text-muted fs-6 fw-bold">
                로그인<i class="bi bi-door-open"></i></dt
            ></a>
          </li>
          <li class="nav-item mx-2">
            <a class="nav-link" href="${root}/member/joinForm"
              ><dt class="text-muted fs-6 fw-bold">
                회원가입<i class="bi bi-pen"></i></dt
            ></a>
          </li>
          <li class="nav-item mx-2">
            <a class="nav-link" href="${root}/joinForm"
              ><dt class="text-muted fs-6 fw-bold">
                For Businesses<i class="bi bi-briefcase-fill"></i></dt
            ></a>
          </li>
        </ul>
      </c:if>
      <c:if test="${!empty mvo}">
        <ul class="navbar-nav navbar-right nav-underline">
          <c:if test="${mvo.profile eq ''}">
            <li>
              <img
                class="img-circle"
                src="${root}/resources/img/memberImg/defaultProfile.png"
                style="width: 50px; height: 50px"
              />
            </li>
            <div class="nickHolder">
              ${mvo.nick}님 Welcome!
              <div id="sessionTime"></div>
            </div>
          </c:if>
          <c:if test="${empty mvo.profile}">
            <li>
              <img
                class="img-circle"
                src="${root}/resources/img/memberImg/defaultProfile.png"
                style="width: 50px; height: 50px"
              />
            </li>
            <div class="nickHolder">
              ${mvo.nick}님 Welcome!
              <div id="sessionTime"></div>
            </div>
          </c:if>
          <c:if test="${!empty mvo.profile}">
            <li>
              <img
                class="img-circle"
                src="${root}/resources/img/memberImg/${mvo.profile}"
                style="width: 50px; height: 50px"
              />
            </li>
            <div class="nickHolder">
              ${mvo.nick}님 Welcome!
              <div id="sessionTime"></div>
            </div>
          </c:if>
          <li class="nav-item mx-2">
            <a class="nav-link" href="${root}/member/myPagePwdChk"
              ><dt class="text-muted fs-6 fw-bold">마이페이지</dt></a
            >
          </li>
          <li class="nav-item mx-2">
            <a class="nav-link" href="${root}/inquiry/customerService"
              ><dt class="text-muted fs-6 fw-bold">고객문의</dt></a
            >
          </li>
          <li class="nav-item mx-2">
            <a class="nav-link" href="${root}/member/logout"
              ><dt class="text-muted fs-6 fw-bold">로그아웃</dt></a
            >
          </li>
        </ul>
      </c:if>
    </div>
  </nav>
  <!-- 카테고리 div  -->
  <div id="goCategory">
    <div
      class="offcanvas offcanvas-start"
      data-bs-scroll="true"
      tabindex="-1"
      id="offcanvasWithBothOptions"
      aria-labelledby="offcanvasWithBothOptionsLabel"
    >
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">
          Click on the category menu below to write review, or you want to see.
        </h5>
        <button
          type="button"
          class="btn-close"
          data-bs-dismiss="offcanvas"
          aria-label="Close"
        ></button>
      </div>
      <div class="offcanvas-body">

        <c:forEach items="${cList}" var="cl">
        		<label for="label${cl.no}" id="labelForCa">
		        	<div class="sideCaHolder">
               <div class="side-book my-3" id="label${cl.no}">
                  <img alt="" src="${root}/resources/img/category/${cl.caImg}">
                 <div class="side-cover">
                     <p style="font-weight: 600;">${cl.caName}</p> 
                 </div>
                 </div>
			            <div>
							<ul class="side-uL" id="sideCaArea${cl.no}"></ul>
			            </div>
		        	</div>
        		</label>
      	</c:forEach>

      </div>
    </div>
  </div>
  <!-- The Modal -->
  <div class="modal" id="myMsg">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- Modal Header -->
        <div id="messageType" class="modal-header">
          <h4 class="modal-title">${msgType}</h4>
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="modal"
          ></button>
        </div>
        <!-- Modal body -->
        <div class="modal-body">
          <p id="checkMsg">${msg}</p>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">
            Close
          </button>
        </div>
      </div>
    </div>
  </div>
</header>

<script>
  // 페이지가 로드될 때 세션 시간을 업데이트하고 1초마다 업데이트함

  $(document).ready(function () {
    var nickHolderValue = document.querySelector(".nickHolder");
    var sessionDuration = 900; // 세션 지속 시간 (15분)
    var sessionEndTime = Math.floor(Date.now() / 1000) + sessionDuration;
    sessionStorage.setItem("sessionTime", sessionEndTime);
    if (nickHolderValue) {
      updateSessionTime();
      setInterval(updateSessionTime, 1000);
    }
   
    
	  $.ajax({
    	  url:" ${root}/product/subDivision",
    	  type: "GET",
  		  datatype: "JSON",
  	      success: function (result) {
  	            var subList = result;
                for (let i = 0; i < subList.length; i++) {
                  var caNo = subList[i].caNo;
                  var subCaNo = subList[i].no;
                  var subCategory = subList[i].subCategory;
                  
                  var subListArea = $("#subListArea" + caNo);
                  var sideCaArea = $("#sideCaArea" + caNo);
                  let listItem = "<li><a href='/app/review/board/" + subCaNo + "'><dt class ='text-muted fw-bold'>" + subCategory + "</dt></a></li>";
                  subListArea.append(listItem);
                  sideCaArea.append(listItem);
              }
  	        },
  	        error: function (response) {
  	          console.log(response);
  	        }, 
      })

  });


  function updateSessionTime() {
    var sessionEndTime = parseInt(sessionStorage.getItem("sessionTime"));
    if (sessionEndTime) {
      var currentTime = Math.floor(Date.now() / 1000);
      var remainingTime = sessionEndTime - currentTime;

      if (remainingTime <= 0) {
        alert("로그인 세션기간 만료로 로그아웃됩니다.");
        sessionStorage.removeItem("sessionTime");
        window.location.href = "${root}/member/logout";
      } else {
        var minutes = Math.floor(remainingTime / 60);
        var seconds = remainingTime % 60;
        document.querySelector("#sessionTime").innerHTML =
          "접속유지 시간: " + minutes + "분 " + seconds + "초";
      }
    }
  }

</script>
