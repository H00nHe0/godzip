<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix='fn'
uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style type="text/css">
      #grade-info-btn {
        border: 1px solid #8f9092;
        outline: none;
        background-image: linear-gradient(
          to top,
          #d8d9db 0%,
          #fff 80%,
          #fdfdfd 100%
        );
        padding: 8px 10px;
        font-size: 12px;
        font-weight: 700;
        color: #606060;
        border-radius: 20px;
        transition: all ease 0.1s;
        box-shadow: 0px 5px 0px 0px white;
        margin-left: 30px;
      }

      .grade-info-btn:active {
        transform: translateY(5px);
        box-shadow: 0px 0px 0px 0px #a29bfe;
      }
      h2 {
        padding-top: 30px;
        text-align: center;
      }
      .form-box {
        max-width: 800px;
        background: #f1f7fe;
        overflow: hidden;
        border-radius: 20px;
        color: #010101;
        margin: auto;
      }

      .myPageForm {
        position: relative;
        display: flex;
        flex-direction: column;
        padding: 32px 24px 24px;
        gap: 16px;
        text-align: center;
      }

      /*Form text*/
      .title {
        font-weight: bold;
        font-size: 1.6rem;
      }

      .subtitle {
        font-size: 1rem;
        color: #666;
      }

      /*Inputs box*/
      .form-container {
        overflow: hidden;
        border-radius: 8px;
        background-color: #fff;
        margin: 1rem 0 0.5rem;
        width: 90%;
        margin: auto;
      }

      .joinInput {
        background: none;
        border: 0;
        outline: 0;
        height: 40px;
        width: 95%;
        border-bottom: 1px solid #eee;
        font-size: 0.9rem;
        padding: 8px 15px;
      }

      .form-section {
        padding: 16px;
        font-size: 0.85rem;
        background-color: #e0ecfb;
        box-shadow: rgb(0 0 0 / 8%) 0 -1px;
      }

      .form-section a {
        font-weight: bold;
        color: #0066ff;
        transition: color 0.3s ease;
      }

      .form-section a:hover {
        color: #005ce6;
        text-decoration: underline;
      }

      /*Button*/
      #seeReview-btn {
        background-color: #0066ff;
        color: #fff;
        border: 0;
        border-radius: 24px;
        padding: 10px 16px;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        transition: background-color 0.3s ease;
      }

      #seeReview-btn:hover {
        background-color: #005ce6;
      }

      #form-area {
        width: 100%;
      }

      input #pwd2 {
        text-align: left;
      }

      table {
        width: 100%;
      }
      table tr td {
        padding-top: 5px;
      }
      table tr th {
        padding-top: 10px;
        padding-bottom: 10px;
      }
      .filebox {
        margin: auto;
        border: 2px solid gray;
        height: 200px;
        width: 200px;
        vertical-align: middle;
        /* padding-top: 0px; */
      }
      .filebox .upload-name {
        margin-top: 10px;
        display: inline-block;
        height: 30px;
        padding: 0 5px;
        vertical-align: middle;
        border: 1px solid #dddddd;
        width: 60%;
        color: #999999;
      }
      .filebox label {
        margin-top: 10px;
        display: inline-block;
        padding: 5px 5px;
        color: #fff;
        vertical-align: middle;
        background-color: #999999;
        cursor: pointer;
        height: 30px;
        width: 50%;
        font-size: 11px;
      }
      .filebox button {
        margin-top: 10px;
        display: inline-block;
        padding: 5px 5px;
        color: #fff;
        vertical-align: middle;
        background-color: #005ce6;
        cursor: pointer;
        height: 30px;
        width: 50%;
        font-size: 11px;

        border: none;
      }
      .filebox input[type="file"] {
        position: absolute;
        width: 0;
        height: 0;
        padding: 0;
        overflow: hidden;
        border: 0;
      }
      .cta {
        border: none;
        background: none;
      }

      .cta span {
        padding-bottom: 7px;
        letter-spacing: 4px;
        font-size: 14px;
        padding-right: 15px;
        text-transform: uppercase;
      }

      .cta svg {
        transform: translateX(-8px);
        transition: all 0.3s ease;
      }

      .cta:hover svg {
        transform: translateX(0);
      }

      .cta:active svg {
        transform: scale(0.9);
      }

      .hover-underline-animation {
        position: relative;
        color: black;
        padding-bottom: 20px;
      }

      .hover-underline-animation:after {
        content: "";
        position: absolute;
        width: 100%;
        transform: scaleX(0);
        height: 2px;
        bottom: 0;
        left: 0;
        background-color: #000000;
        transform-origin: bottom right;
        transition: transform 0.25s ease-out;
      }

      .cta:hover .hover-underline-animation:after {
        transform: scaleX(1);
        transform-origin: bottom left;
      }

      #profileInfo {
        padding-top: 10px;
        font-size: 12px;
      }
      .mypageInfo {
        font-weight: 600;
        border: none;
        text-align: center;
      }
      .titleBox a {
        font-weight: 600;
        text-decoration: none;
        color: black;
      }
      table th {
        background-color: #ffc107;
      }
      table .info-row > td {
        height: 40px;
      }
      .info-title {
        background-color: #ffffcc;
        font-weight: 600;
        margin-right: 15px;
      }
      #page-area {
        display: flex;
        justify-content: center;
        align-items: center;
      }
      .table-bordered {
        font-size: 13px;
      }
      #profileBtnHolder {
        display: flex;
        justify-content: center;
        align-items: center;
      }
    </style>
  </head>
  <body>
    <div id="wrap">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <script type="script" defer src="${root}/resources/js/main.js"></script>
      <div class="form-section">
        <p class="fs-6 lead">
          회원 정보 수정을 원하시나요?
          <a href="${root}/member/editInfo">
            <button class="cta">
              <span class="hover-underline-animation" style="font-size: 18px">
                click me</span
              >
              <svg
                viewBox="0 0 46 16"
                height="10"
                width="30"
                xmlns="http://www.w3.org/2000/svg"
                id="arrow-horizontal"
              >
                <path
                  transform="translate(30)"
                  d="M8,0,6.545,1.455l5.506,5.506H-30V9.039H12.052L6.545,14.545,8,16l8-8Z"
                  data-name="Path 10"
                  id="Path_10"
                ></path>
              </svg>
            </button>
          </a>
        </p>
      </div>
      <div>
        <h2>마이 페이지</h2>
      </div>

      <div id="form-area">
        <div class="form-box">
          <div class="myPageForm">
            <span class="title"
              >${mvo.nick}님은
              <span id="gradeName">${mvo.gradeNo}</span> 등급입니다.<span
                style="display: inline-block"
                ><button
                  type="button"
                  id="grade-info-btn"
                  data-bs-toggle="modal"
                  data-bs-target="#myModal"
                >
                  등급안내
                </button></span
              >
            </span>
            <!-- The Modal -->
            <div class="modal" id="myModal">
              <div class="modal-dialog">
                <div class="modal-content">
                  <!-- Modal Header -->
                  <div class="modal-header">
                    <h4 class="modal-title">등급 기준 안내</h4>
                    <button
                      type="button"
                      class="btn-close"
                      data-bs-dismiss="modal"
                    ></button>
                  </div>
                  <!-- Modal body -->
                  <div class="modal-body">
                    <c:forEach items="${gradeList}" var="gl">
                      <h4>${gl.grade}</h4>
                      <p>${gl.gradeInfo}</p>
                    </c:forEach>
                  </div>
                  <!-- Modal footer -->
                  <div class="modal-footer">
                    <button
                      type="button"
                      class="btn btn-danger"
                      data-bs-dismiss="modal"
                    >
                      Close
                    </button>
                  </div>
                </div>
              </div>
            </div>
            <span class="subtitle">Share , Check reviews and Choose!</span>
            <div class="form-container">
              <table>
                <tr>
                  <th class="col-md-6">프로필사진</th>
                  <th class="col-md-6">아이디</th>
                </tr>
                <tr>
                  <td>
                    <div id="showProfile" class="filebox">
                      <c:if test="${empty mvo.profile}">
                        <img
                          class="img-circle"
                          src="${root}/resources/img/memberImg/defaultProfile.png"
                          style="width: 100%; height: 80%"
                        />
                      </c:if>
                      <c:if test="${!empty mvo.profile}">
                        <img
                          class="img-circle"
                          src="${root}/resources/img/memberImg/${mvo.profile}"
                          style="width: 100%; height: 80%"
                        />
                      </c:if>
                      <div id="profileBtnHolder">
                        <label for="uploadProfile" id="profileChange"
                          >프로필 사진변경</label
                        >
                        <c:if test="${!empty mvo.profile}">
                          <button type="button" onclick="toDefaultProfile()">
                            기본사진사용
                          </button>
                        </c:if>
                        <input
                          type="file"
                          id="uploadProfile"
                          name="uploadProfile"
                        />
                      </div>
                    </div>
                    <div id="profileInfo">
                      프로필사진은 10mb이하의 jpg,png,gif 형식만 가능합니다.
                    </div>
                  </td>
                  <td>
                    <input
                      type="text"
                      class="joinInput my-1 text-center"
                      name="id"
                      value="${mvo.id}"
                      readonly
                    />
                  </td>
                </tr>
                <tr>
                  <th colspan="2">
                    나의 출석 정보 ( 가입일 :
                    <c:set
                      var="enrollYear"
                      value="${mvo.enrollDate.substring(0, 4)}"
                    />
                    <c:set
                      var="enrollMonth"
                      value="${mvo.enrollDate.substring(5, 7)}"
                    />
                    <c:set
                      var="enrollDay"
                      value="${mvo.enrollDate.substring(8, 10)}"
                    />
                    ${enrollYear}년 ${enrollMonth}월 ${enrollDay}일 )
                  </th>
                </tr>
                <tr class="info-row">
                  <td class="info-title">
                    최근 방문일
                    <input
                      class="mypageInfo"
                      type="text"
                      id="recentVisit"
                      value="${mvo.lastVisit}"
                      readonly
                    />
                  </td>
                  <td class="info-title">
                    총 방문일 수
                    <input
                      class="mypageInfo"
                      type="text"
                      id="totalVisit"
                      value="${mvo.visitedDays}"
                      readonly
                    />
                  </td>
                </tr>
                <tr>
                  <th colspan="2">나의 리뷰</th>
                </tr>
                <tr class="info-row">
                  <td class="info-title">
                    내가 남긴 리뷰
                    <input
                      class="mypageInfo"
                      type="text"
                      id="myReviewCnt"
                      value="${mvo.reviewCount} 개"
                      readonly
                    />
                  </td>
                  <td class="info-title">
                    받은 좋아요
                    <input
                      class="mypageInfo"
                      type="text"
                      id="likeCnt"
                      value=" 총 ${mvo.totalLikes} 개"
                      readonly
                    />
                  </td>
                </tr>
                <tr>
                  <th colspan="2">
                    나의 문의내역 (제목 클릭시 상세 내용 확인)
                  </th>
                </tr>
                <tr>
                  <td colspan="2">
                    <c:if test="${empty ivoList}">
                      <div class="panel-body fw-bold" id="view">
                        문의하신 내역이 없습니다.
                      </div>
                    </c:if>
                    <c:if test="${!empty ivoList}">
                      <div class="panel-body fw-bold" id="view">
                        <div class="panel-body" id="view">
                          <table class="table table-bordered">
                            <tr style="text-align: center">
                              <th id="inquiryNo" style="width: 5%">번호</th>
                              <th id="inquiryType" style="width: 12%">
                                문의유형
                              </th>
                              <th id="inquiryTitle" style="width: 50%">제목</th>
                              <th id="inquiryDate" style="width: 15%">
                                작성일
                              </th>
                            </tr>
                            <c:forEach items="${ivoList}" var="i">
                              <tr>
                                <td style="text-align: center">${i.rno}</td>
                                <td>${i.type}</td>
                                <td class="titleBox" id="t${i.no}">
                                  <a
                                    href="#"
                                    data-bs-toggle="modal"
                                    data-bs-target="#myModal${i.no}"
                                    >${i.title}</a
                                  >
                                  <c:if test="${i.answeredYn eq 'Y'}"
                                    ><span class="badge bg-success"
                                      >답변완료</span
                                    ></c:if
                                  >
                                  <c:if test="${i.answeredYn eq 'N'}"
                                    ><span class="badge bg-warning"
                                      >답변필요</span
                                    ></c:if
                                  >
                                  <c:if test="${i.answeredYn eq null}"
                                    ><span class="badge bg-warning"
                                      >답변필요</span
                                    ></c:if
                                  >
                                </td>
                                <td class="enrollDate">${i.enrollDate}</td>
                              </tr>
                              <!-- The Modal -->
                              <div class="modal" id="myModal${i.no}">
                                <div class="modal-dialog">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <c:set
                                        value="${i.enrollDate.substring(0, 4)}"
                                        var="inquiryYear"
                                      />
                                      <c:set
                                        value="${i.enrollDate.substring(5, 7)}"
                                        var="inquiryMonth"
                                      />
                                      <c:set
                                        value="${i.enrollDate.substring(8, 10)}"
                                        var="inquiryDay"
                                      />
                                      <h6>
                                        ${mvo.nick}님이 ${inquiryYear}년
                                        ${inquiryMonth}월 ${inquiryDay}일
                                        남겨주신 문의내역 입니다.
                                      </h6>
                                      <button
                                        type="button"
                                        class="btn-close"
                                        data-bs-dismiss="modal"
                                      ></button>
                                    </div>
                                    <!-- Modal Header -->
                                    <p
                                      class="modal-title"
                                      style="text-align: center"
                                    >
                                      문의 제목: ${i.title}
                                    </p>
                                    <!-- Modal body -->
                                    <div
                                      class="modal-body"
                                      style="text-align: left"
                                    >
                                      <p>문의 유형: ${i.type}</p>
                                      문의 내용 : ${i.content}<br /> 답변 내용 :
                                      ${i.answer}<br />
                                      답변 일자 : ${i.answerDate}
                                    </div>
                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                      <button
                                        type="button"
                                        class="btn btn-danger"
                                        data-bs-dismiss="modal"
                                      >
                                        Close
                                      </button>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </c:forEach>
                          </table>
                          <div id="page-area">
                            <ul class="pagination">
                              <c:if test="${pv.currentPage > 1}">
                                <li class="page-item">
                                  <a
                                    href="${root}/member/myPage?page=${pv.currentPage-1}"
                                    class="page-link"
                                    >이전</a
                                  >
                                </li>
                              </c:if>
                              <c:forEach
                                begin="${pv.startPage}"
                                end="${pv.endPage}"
                                step="1"
                                var="i"
                              >
                                <c:if test="${pv.currentPage != i}">
                                  <li class="page-item">
                                    <a
                                      class="page-link"
                                      href="${root}/member/myPage?page=${i}"
                                      >${i}</a
                                    >
                                  </li>
                                </c:if>
                                <c:if test="${pv.currentPage == i}">
                                  <li class="page-item active">
                                    <a class="page-link">${i}</a>
                                  </li>
                                </c:if>
                              </c:forEach>
                              <c:if test="${pv.currentPage < pv.maxPage}">
                                <li class="page-item">
                                  <a
                                    href="${root}/member/myPage?page=${pv.currentPage+1}"
                                    class="page-link"
                                    >다음</a
                                  >
                                </li>
                              </c:if>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </c:if>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <div id="HiddenNo" style="display: none">${mvo.no}</div>
                    <a href="${root}/review/board/myReview/${mvo.no}">
                      <button id="seeReview-btn" style="width: 90%">
                        내가 쓴 리뷰 확인하기(in progress..)
                      </button>
                    </a>
                  </td>
                </tr>
              </table>
            </div>
          </div>
        </div>
      </div>

      <%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>
    </div>
  </body>
</html>
<script>
  $(document).ready(function () {
    var qNAEnroll = $(".enrollDate");

    qNAEnroll.each(function () {
      var original = $(this).text();
      var formattedQNAEnroll = original.substring(0, 10);
      $(this).text(formattedQNAEnroll);
    });
  });

  //파일 확장자,사진 용량 제한
  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz|pdf)");
  var maxSize = 10485760; //10mb
  function checkExtension(fileName, fileSize) {
    if (fileSize >= maxSize) {
      alert("사진의 용량이 10mb를 넘습니다.");
      return false;
    }
    if (regex.test(fileName)) {
      alert("해당 확장자 파일은 업로드 할 수 없습니다.");
      return false;
    }
    return true;
  }

  $("#profileChange").on("click", function () {
    var formData = new FormData();
    var memberNo = document.querySelector("#HiddenNo").innerHTML;
    //이벤트 버블링 발생 하여 off메서드 사용
    $("input[name='uploadProfile']")
      .off()
      .on("change", function () {
        var selectedFile = $("input[name='uploadProfile']")[0].files[0];
        console.log("Selected file:", selectedFile);
        //첨부파일 서버로 보내서 저장하기
        if (!checkExtension(selectedFile.name, selectedFile.size)) {
          console.log("파일 확장자,사진 용량 제한");
          return false;
        }
        formData.append("profile", selectedFile);
        formData.append("no", memberNo);

        $.ajax({
          url: "${root}/member/uploadProfile",
          processData: false,
          contentType: false,
          data: formData,
          type: "POST",
          success: function (result) {
            alert("프로필 업데이트완료!");
            console.log(result);
            $(".img-circle").attr(
              "src",
              "${root}/resources/img/memberImg/" + result
            );
            location.reload();
          },
          error: function () {
            alert(formData);
            console.log("에러에러");
          },
        }); //ajax
      });
  });
  function toDefaultProfile() {
    var memberNo = document.querySelector("#HiddenNo").innerHTML;
    $.ajax({
      url: "${root}/member/toDefaultImg",
      type: "POST",
      data: { no: memberNo },
      success: function (response) {
        if (response == "success") {
          alert("기본프로필 사진으로 변경완료");
          location.reload();
        } else {
          console.log(response);
        }
      },
      error: function (response) {
        alert(response);
        console.log("에러에러");
      },
    });
  }
  //최근방문일 이쁘게
  var recentVisit = $("#recentVisit").val();
  var modifiedDate = recentVisit.substring(0, 10);
  $("#recentVisit").val(modifiedDate);
  //총 방문일 앞뒤 텍스트 붙이기
  var totalVisit = $("#totalVisit").val();
  var modifiedTotal = "총 " + totalVisit + "일 방문";
  $("#totalVisit").val(modifiedTotal);

  //등급별 색상변화
  var grade = $("span[id='gradeName']").text();
  if (grade == "GREEN") {
    $("span[id='gradeName']").css("color", "green");
  }
  if (grade == "SILVER") {
    $("span[id='gradeName']").css("color", "silver");
  }
  if (grade == "GOLD") {
    $("span[id='gradeName']").css("color", "gold");
  }
  if (grade == "DIAMOND") {
    $("span[id='gradeName']").css("color", "diamond");
  }
</script>
