<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="root" value="${pageContext.request.contextPath}" scope="page" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"
/>
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
/>
<link rel="stylesheet" href="${root}/resources/css/common/header.css" />

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
          <a class="nav-link" href="#"
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
        <div class="radio-inputs">
        <c:forEach items="${cList}" var="cl">
          <label  id="${cl.caName}" onclick="showDetail(${cl.no})" style="display: flex;">
            <input class="radio-input" type="radio" name="caName"/>
            <span class="radio-tile">
              <span class="radio-icon">
                <svg
                  stroke="currentColor"
                  xml:space="preserve"
                  viewBox="0 0 493.407 493.407"
                  xmlns:xlink="http://www.w3.org/1999/xlink"
                  xmlns="http://www.w3.org/2000/svg"
                  id="Capa_1"
                  version="1.1"
                  width="200px"
                  height="200px"
                  fill="none"
                >
                  <g stroke-width="0" id="SVGRepo_bgCarrier"></g>
                  <g
                    stroke-linejoin="round"
                    stroke-linecap="round"
                    id="SVGRepo_tracerCarrier"
                  ></g>
                  <g id="SVGRepo_iconCarrier">
                    <path
                      d="M488.474,270.899c-12.647-37.192-47.527-62.182-86.791-62.182c-5.892,0-11.728,0.749-17.499,1.879l-34.324-100.94 c-1.71-5.014-6.417-8.392-11.721-8.392H315.02c-6.836,0-12.382,5.547-12.382,12.382c0,6.836,5.545,12.381,12.382,12.381h14.252 l12.462,36.645H206.069v-21.998l21.732-2.821c3.353-0.434,6.135-3.079,6.585-6.585c0.54-4.183-2.402-8.013-6.585-8.553l-68.929-8.94 c-1.362-0.168-2.853-0.185-4.281,0c-9.116,1.186-15.55,9.537-14.373,18.653c1.185,9.118,9.537,15.55,18.653,14.364l22.434-2.909 v26.004l-41.255,52.798c-14.059-8.771-30.592-13.93-48.349-13.93C41.135,208.757,0,249.885,0,300.443 c0,50.565,41.135,91.7,91.701,91.7c44.882,0,82.261-32.437,90.113-75.095h33.605v12.647h-5.909c-4.563,0-8.254,3.693-8.254,8.254 c0,4.563,3.691,8.254,8.254,8.254h36.58c4.563,0,8.254-3.691,8.254-8.254c0-4.561-3.691-8.254-8.254-8.254h-5.908v-12.647h5.545 c3.814,0,7.409-1.756,9.755-4.756l95.546-122.267l9.776,28.729c-17.854,8.892-32.444,22.965-41.409,41.168 c-10.825,21.973-12.438,46.842-4.553,70.034c12.662,37.201,47.55,62.189,86.815,62.189c10.021,0,19.951-1.645,29.519-4.9 c23.191-7.885,41.926-24.329,52.744-46.302C494.746,318.966,496.367,294.09,488.474,270.899z M143.46,258.542 c7.698,9.488,12.776,21.014,14.349,33.742h-40.717L143.46,258.542z M91.701,367.379c-36.912,0-66.938-30.026-66.938-66.936 c0-36.904,30.026-66.923,66.938-66.923c12.002,0,23.11,3.427,32.864,8.981l-42.619,54.54c-2.917,3.732-3.448,8.794-1.378,13.05 c2.08,4.256,6.4,6.957,11.134,6.957h64.592C148.861,345.906,122.84,367.379,91.701,367.379z M239.69,292.284h-56.707 c-1.839-20.667-10.586-39.329-23.868-53.782l22.191-28.398v32.47c0,6.836,5.545,12.381,12.381,12.381 c6.836,0,12.382-5.545,12.382-12.381v-55.138h115.553L239.69,292.284z M383.546,285.618l6.384,18.79 c1.75,5.151,6.562,8.392,11.721,8.392c1.321,0,2.667-0.21,3.99-0.661c6.471-2.201,9.93-9.23,7.729-15.711l-6.336-18.637 c7.731,1.838,14.221,7.312,16.855,15.083c2.024,5.94,1.613,12.309-1.161,17.935c-2.773,5.626-7.569,9.835-13.509,11.858 c-12.068,4.078-25.716-2.717-29.785-14.671C376.735,300.055,378.597,291.689,383.546,285.618z M461.712,329.994 c-7.908,16.042-21.579,28.044-38.507,33.808c-6.997,2.378-14.244,3.578-21.547,3.578c-28.664,0-54.129-18.249-63.374-45.399 c-5.757-16.926-4.571-35.081,3.328-51.112c6.047-12.27,15.494-22.112,27.165-28.666l8.981,26.416 c-13.414,10.108-19.644,27.931-13.954,44.691c5.522,16.227,20.732,27.124,37.853,27.124c4.378,0,8.707-0.725,12.882-2.145 c10.108-3.434,18.282-10.607,22.999-20.184c4.723-9.585,5.425-20.435,1.982-30.551c-5.545-16.299-21.57-26.787-38.289-26.818 l-8.997-26.472c3.128-0.453,6.28-0.783,9.448-0.783c28.658,0,54.112,18.242,63.351,45.399 C470.788,295.799,469.613,313.96,461.712,329.994z"
                    ></path>
                  </g>
                </svg>
              </span>
              <span class="radio-label">${cl.caName}</span>
            </span>
          <div>
          	<ul>
          		<li>1</li>
          		<li>2</li>
          		<li>3</li>
          	</ul>
          </div>
          </label>
        </c:forEach>
         
        </div>
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
