<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style type="text/css">
      #detail-area {
        display: flex;
        justify-content: center;
        align-items: center;
      }
      .reviewModal {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;
        width: 700px;
        margin-top: 30px;
        margin-right: 0;
      }
      #comment-container {
        width: 500px;
        height: 300px;
        background: rgba(221, 236, 253, 0.7);
        border-radius: 16px;
        overflow: hidden;
        display: none;
        flex-direction: column;
        box-shadow: 0 15px 30px 0 rgba(0, 0, 0, 0.25);
      }
      .button,
      .input,
      .select,
      .textarea {
        font: inherit;
      }

      a {
        color: inherit;
      }

      .modal-container {
        max-height: 800px;
        min-height: 700px;
        max-width: 700px;
        margin-left: auto;
        margin-right: auto;
        background: rgba(221, 236, 253, 0.7);
        border-radius: 16px;
        overflow: hidden;
        display: flex;
        flex-direction: column;
        box-shadow: 0 15px 30px 0 rgba(0, 0, 0, 0.25);
      }

      @media (max-width: 600px) {
        .modal-container {
          width: 90%;
        }
      }

      .modal-container-header {
        padding: 16px 32px;
        border-bottom: 1px solid #ddd;
        display: flex;
        align-items: center;
        justify-content: space-between;
      }

      .modal-container-title {
        display: flex;
        align-items: center;
        gap: 8px;
        line-height: 1;
        font-weight: 700;
        font-size: 1.125;
      }

      .modal-container-title svg {
        width: 32px;
        height: 32px;
        color: #750550;
      }

      .modal-container-body {
        padding: 24px 32px 51px;
        min-height: 500px;
        background-color: #fff;
        overflow-y: auto;
      }
      #prodInfo {
        margin: -10px -10px 5px -10px;
        background-color: rgba(221, 236, 253, 0.7);
        border-radius: 20px;
        font-weight: 600;
        padding: 10px 10px 10px 10px;
      }

      .rtf h1,
      .rtf h2,
      .rtf h3,
      .rtf h4,
      .rtf h5,
      .rtf h6 {
        font-weight: 700;
      }

      .rtf h1 {
        font-size: 1.5rem;
        line-height: 1.125;
      }

      .rtf h2 {
        font-size: 1.25rem;
        line-height: 1.25;
      }

      .rtf h3 {
        font-size: 1rem;
        line-height: 1.5;
      }

      .rtf > * + * {
        margin-top: 1em;
      }

      .rtf > * + :is(h1, h2, h3) {
        margin-top: 2em;
      }

      .rtf > :is(h1, h2, h3) + * {
        margin-top: 0.75em;
      }

      .rtf ul,
      .rtf ol {
        margin-left: 20px;
        list-style-position: inside;
      }

      .rtf ol {
        list-style: numeric;
      }

      .rtf ul {
        list-style: disc;
      }

      .modal-container-footer {
        padding: 20px 32px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-top: 1px solid #ddd;
        gap: 12px;
        position: relative;
      }

      .modal-container-footer:after {
        content: "";
        display: block;
        position: absolute;
        top: -51px;
        left: 24px;
        right: 24px;
        height: 50px;
        flex-shrink: 0;
        pointer-events: none;
      }
      .button {
        padding: 12px 20px;
        border-radius: 8px;
        background-color: transparent;
        border: 0;
        font-weight: 600;
        cursor: pointer;
        transition: 0.15s ease;
      }

      .button.is-comment:hover,
      .button.is-comment:focus {
        background-color: #ffc107;
      }

      .button.is-comment {
        background-color: #ffc107;
      }

      .button.is-primary {
        background-color: #ffc107;
        color: black;
      }

      .button.is-primary:hover,
      .button.is-primary:focus {
        background-color: #ffc107;
      }

      .icon-button {
        padding: 0;
        border: 0;
        background-color: transparent;
        width: 40px;
        height: 40px;
        display: flex;
        align-items: center;
        justify-content: center;
        line-height: 1;
        cursor: pointer;
        border-radius: 8px;
        transition: 0.15s ease;
      }

      .icon-button svg {
        width: 24px;
        height: 24px;
      }

      .icon-button:hover,
      .icon-button:focus {
        background-color: #dfdad7;
      }

      #likeBtn {
        margin-left: -5px;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 12px 14px 12px 14px;
        box-shadow: rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
        background-color: #e8e8e8;
        border-color: #ffe2e2;
        border-style: solid;
        border-width: 9px;
        border-radius: 30px;
        transition: transform 400ms cubic-bezier(0.68, -0.55, 0.27, 2.5),
          border-color 400ms ease-in-out, background-color 400ms ease-in-out;
        word-spacing: -2px;
      }

      @keyframes movingBorders {
        0% {
          border-color: #fce4e4;
        }

        50% {
          border-color: #ffd8d8;
        }

        90% {
          border-color: #fce4e4;
        }
      }
      @keyframes movingBorders1 {
        0% {
          border-color: #a0a0a0;
        }

        50% {
          border-color: #a0a0a0;
        }

        90% {
          border-color: #a0a0a0;
        }
      }

      #likeBtn:hover {
        background-color: #eee;
        transform: scale(105%);
        animation: movingBorders 3s infinite;
      }

      #likeBtn svg {
        fill: rgb(255, 110, 110);
      }

      @keyframes beatingHeart {
        0% {
          transform: scale(1);
        }

        15% {
          transform: scale(1.12);
        }

        30% {
          transform: scale(1);
        }

        45% {
          transform: scale(1.12);
        }

        60% {
          transform: scale(1);
        }
      }

      #likeBtn:hover svg {
        transform: scale(105%);
        border-color: #ffd8d8;
        animation: beatingHeart 1.2s infinite;
      }
      .footer-button {
        margin: 0 15px;
      }
      .rating {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: row-reverse;
        /* Reverse the order of the stars */
        font-size: 0;
        /* Remove the space between the elements */
      }
      .rating-box,
      .rating-box:hover {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-left: 40px;
        cursor: auto;
      }

      .rating input[type="radio"] {
        display: none;
        /* Hide the radio buttons */
      }

      .rating label {
        font-size: 30px;
        color: rgba(187, 183, 183, 0.6);
        /* Empty star color */
        margin: 0 3px 5px;
        cursor: auto;
      }

      .rating label:before {
        content: "\2605";
        /* Unicode character for filled star */
      }

      .rating input[type="radio"]:checked ~ label:before {
        /* content: "\2606"; */
        content: "\2605";
        /* Unicode character for empty star */
        color: #ffc107;
        /* Filled star color */
      }
      #reviewTitle {
        font-size: 1.2rem;
        font-weight: 600;
      }
      #comment-info {
        margin-top: 10px;
        margin-bottom: 5px;
        padding-right: 10px;
        text-align: right;
      }
      #comments {
        padding: 5px 5px 5px;
        height: 200px;
        word-break: keep-all;
        background-color: #fff;
        overflow-y: auto;
      }
      #comment-input input {
        margin: 5px 5px 5px;
        border-radius: 10px;
        height: 50px;
        width: 400px;
        background-color: #fff;
        overflow-y: auto;
      }
      #comment-input img {
        margin-left: 10px;
        border-radius: 20px;
        background-color: white;
      }
      .comment-content {
        display: flex;
      }
      .comment-date {
        font-size: 10px;
      }
      .my-btns {
        margin-right: 5px;
      }
      .my-btns:hover {
        text-decoration: underline;
      }
      #editMyReview:hover {
        background-color: rgb(130, 183, 243, 0.8);
      }
      #deleteMyReview:hover {
        background-color: rgba(253, 46, 23, 0.5);
      }
    </style>
  </head>
  <body>
    <div id="wrap">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <script type="script" defer src="${root}/resources/js/main.js"></script>
      <div id="detail-area">
        <div class="reviewModal" id="${rvo.no}">
          <article class="modal-container">
            <header class="modal-container-header">
              <span class="modal-container-title">
                <svg
                  aria-hidden="true"
                  height="24"
                  width="24"
                  viewBox="0 0 24 24"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <path d="M0 0h24v24H0z" fill="none"></path>
                  <path
                    d="M14 9V4H5v16h6.056c.328.417.724.785 1.18 1.085l1.39.915H3.993A.993.993 0 0 1 3 21.008V2.992C3 2.455 3.449 2 4.002 2h10.995L21 8v1h-7zm-2 2h9v5.949c0 .99-.501 1.916-1.336 2.465L16.5 21.498l-3.164-2.084A2.953 2.953 0 0 1 12 16.95V11zm2 5.949c0 .316.162.614.436.795l2.064 1.36 2.064-1.36a.954.954 0 0 0 .436-.795V13h-5v3.949z"
                    fill="currentColor"
                  ></path>
                </svg>
                작성자:
                <c:if test="${empty rvo.profile}">
                  <img
                    class="img-circle"
                    src="${root}/resources/img/memberImg/defaultProfile.png"
                    style="width: 50px; height: 50px"
                  />
                </c:if>
                <c:if test="${!empty rvo.profile}">
                  <img
                    class="img-circle"
                    src="${root}/resources/img/memberImg/${rvo.profile}"
                    style="width: 50px; height: 50px"
                  />
                </c:if>
                ${rvo.nick}
                <div class="rating-box input-box">
                  <label>구매 만족도 &nbsp;&nbsp;</label>
                  <div class="rating">
                    <input value="5" name="score" id="star5" type="radio"
                    ${rvo.score == 5 ? 'checked' : ''} disabled />
                    <label for="star5"></label>
                    <input value="4" name="score" id="star4" type="radio"
                    ${rvo.score == 4 ? 'checked' : ''} disabled />
                    <label for="star4"></label>
                    <input value="3" name="score" id="star3" type="radio"
                    ${rvo.score == 3 ? 'checked' : ''} disabled />
                    <label for="star3"></label>
                    <input value="2" name="score" id="star2" type="radio"
                    ${rvo.score == 2 ? 'checked' : ''} disabled />
                    <label for="star2"></label>
                    <input value="1" name="score" id="star1" type="radio"
                    ${rvo.score == 1 ? 'checked' : ''} disabled />
                    <label for="star1"></label>
                  </div>
                  <div id="score"></div>
                </div>
              </span>
              <button class="icon-button">
                <svg
                  height="24"
                  width="24"
                  viewBox="0 0 24 24"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <path d="M0 0h24v24H0z" fill="none"></path>
                  <path
                    d="M12 10.586l4.95-4.95 1.414 1.414-4.95 4.95 4.95 4.95-1.414 1.414-4.95-4.95-4.95 4.95-1.414-1.414 4.95-4.95-4.95-4.95L7.05 5.636z"
                    fill="currentColor"
                  ></path>
                </svg>
              </button>
            </header>
            <section class="modal-container-body rtf">
              <div id="prodInfo">
                <p>리뷰 상품 : ${rvo.prodName}</p>
                <p>상품 구매일 : ${rvo.purchaseDate}</p>
                <p>리뷰 게시일 : ${rvo.postDate}</p>
                <p>리뷰 조회수 : ${rvo.count}</p>
                <span id="reviewTitle">제목 : ${rvo.title}</span>
              </div>

              <p>${rvo.content}</p>
            </section>
            <c:if test="${mvo.no eq rvo.memberNo}">
              <div style="margin: auto">
                <button class="button my-btns" id="editMyReview">
                  수정하기
                </button>
                <button class="button my-btns" id="deleteMyReview">
                  삭제하기
                </button>
              </div>
            </c:if>
            <footer class="modal-container-footer">
              <div id="likeContent">LIKE : ${rvo.isLike}</div>
              <c:if test="${!empty mvo}">
                <button id="likeBtn" class="footer-button">
                  <svg
                    class="heart-icon"
                    height="25"
                    width="25"
                    viewBox="0 0 24 24"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path d="M0 0H24V24H0z" fill="none"></path>
                    <path
                      d="M16.5 3C19.538 3 22 5.5 22 9c0 7-7.5 11-10 12.5C9.5 20 2 16 2 9c0-3.5 2.5-6 5.5-6C9.36 3 11 4 12 5c1-1 2.64-2 4.5-2z"
                    ></path>
                  </svg>
                </button>
                <a href="${root}/review/board/${rvo.subCaNo}"
                  ><button class="button is-primary footer-button">
                    목록으로
                  </button></a
                >
                <button class="button is-comment footer-button" id="commentChk">
                  댓글 확인(${rvo.commCount})
                </button>
              </c:if>
              <c:if test="${empty mvo}">
                <button
                  id="likeBtn"
                  class="footer-button"
                  disabled
                  style="background-color: #a0a0a0"
                >
                  <svg
                    class="heart-icon"
                    height="25"
                    width="25"
                    viewBox="0 0 24 24"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path d="M0 0H24V24H0z" fill="none"></path>
                    <path
                      d="M16.5 3C19.538 3 22 5.5 22 9c0 7-7.5 11-10 12.5C9.5 20 2 16 2 9c0-3.5 2.5-6 5.5-6C9.36 3 11 4 12 5c1-1 2.64-2 4.5-2z"
                    ></path>
                  </svg>
                </button>
                <a href="${root}/review/board/${rvo.subCaNo}"
                  ><button class="button is-primary footer-button">
                    목록으로
                  </button></a
                >
                <button class="button is-comment footer-button" id="commentChk">
                  댓글 확인(${rvo.commCount})
                </button>
              </c:if>
            </footer>
            <c:if test="${empty mvo}">
              <div style="text-align: center">
                좋아요, 댓글 작성은 로그인 후 가능합니다.
              </div>
            </c:if>
          </article>
        </div>
        <div id="comment-container">
          <div id="comment-info">댓글 : 총 ${rvo.commCount} 개</div>
          <div id="comments"></div>

          <div id="comment-input">
            <c:if test="${!empty mvo}">
              <c:if test="${empty mvo.profile}">
                <img
                  class="img-circle"
                  src="${root}/resources/img/memberImg/defaultProfile.png"
                  style="width: 50px; height: 50px"
                />
              </c:if>
              <c:if test="${!empty mvo.profile}">
                <img
                  class="img-circle"
                  src="${root}/resources/img/memberImg/${mvo.profile}"
                  style="width: 50px; height: 50px"
                />
              </c:if>
              <input
                type="text"
                id="comment"
                placeholder="댓글 입력 후 엔터를 누르면 댓글이 등록됩니다."
              />
            </c:if>
            <c:if test="${empty mvo}">
              <img
                class="img-circle"
                src="${root}/resources/img/memberImg/defaultProfile.png"
                style="width: 50px; height: 50px"
              />
              <input
                type="text"
                id="comment"
                placeholder="로그인 후 댓글입력 기능합니다.."
                disabled
                style="background-color: #a0a0a0"
              />
            </c:if>
          </div>
        </div>
      </div>

      <%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>
    </div>
  </body>
</html>
<script>
  $(document).ready(function () {
    var likeBtn = document.querySelector("#likeBtn");
    var heart = likeBtn.innerHTML;
    var likeContent = document.querySelector("#likeContent");
    var reviewNo = document.querySelector(".reviewModal").id;
    var isLiked = false;

    // 좋아요 상태 확인
    $.ajax({
      url: "${root}/review/board/likeChk",
      method: "GET",
      data: { no: reviewNo },
      success: function (data) {
        if (data == "already") {
          isLiked = true;
          likeBtn.textContent = "좋아요 완료";
        } else if (data == "canLike") {
          isLiked = false;
        } else if (data == "notMember") {
          likeBtn.textContent = "로그인필요";
        } else {
          console.log("좋아요 했는지 여부 확인중 에러");
        }
      },
      error: function (data) {
        console.log("통신실패");
      },
    });

    likeBtn.addEventListener("click", function () {
      $.ajax({
        url: "${root}/review/board/likeManage",
        method: "POST",
        data: { no: reviewNo },
        success: function (rvo) {
          if (rvo !== null) {
            var likeCnt = parseInt(rvo.isLike);
            likeContent.textContent = "LIKE : " + likeCnt;

            if (isLiked) {
              likeBtn.innerHTML = heart;
            } else {
              likeBtn.textContent = "좋아요 완료";
            }
            isLiked = !isLiked;
          } else {
            alert(rvo.no + "번 리뷰 좋아요/싫어요 선택실패.");
          }
        },
        error: function (error) {
          console.log(error);
          alert(data + "통신실패");
        },
      });
    });

    var commentsDiv = document.querySelector("#comments");
    var commentInput = document.querySelector("#comment");
    var commentContainer = document.querySelector("#comment-container");
    var commentChk = document.querySelector("#commentChk");
    var commentInfo = document.querySelector("#comment-info");
    commentChk.addEventListener("click", function () {
      if (commentContainer.style.display === "block") {
        commentContainer.style.display = "none";
      } else {
        commentContainer.style.display = "block";
        $.ajax({
          url: "${root}/review/board/detail/" + reviewNo + "/comments",
          type: "GET",
          data: { reviewNo: reviewNo },
          success: function (cList) {
            if (cList !== null) {
              console.log("통신성공!");
              commentsDiv.innerHTML = "";
              for (var comment of cList) {
                var commentHTML = '<div class="comment-content">';
                commentHTML +=
                  '<p class="comment-nick">' + comment.nick + " </p>";
                commentHTML +=
                  '<p class="comment-date">' + comment.postDate + "</p>";
                commentHTML +=
                  '<h6 class="comment-text">' +
                  "  : " +
                  comment.content +
                  "</h6>";
                commentHTML += "</div>";

                commentsDiv.innerHTML += commentHTML;
              }
            } else {
              console.log("통신성공했으나 불러오기 실패!");
            }
          },
          error: function (params) {
            console.log("통신실패..");
          },
        });
      }
    });

    document
      .querySelector("#comment")
      .addEventListener("keyup", function (event) {
        if (event.key === "Enter") {
          insertComm();
        }
      });

    function insertComm() {
      var comment = commentInput.value;
      $.ajax({
        url: "${root}/review/board/detail/" + reviewNo + "/comment",
        type: "POST",
        data: { reviewNo: reviewNo, content: comment },
        dataType: "JSON",
        success: function (comments) {
          commentsDiv.innerHTML = "";
          comments.forEach(function (comments) {
            var commentHTML = '<div class="comment-content">';
            commentHTML += '<p class="comment-nick">' + comments.nick + "</p>";
            commentHTML +=
              '<p class="comment-date">' + comments.postDate + " </p>";
            commentHTML +=
              '<h6 class="comment-text">' + "  : " + comments.content + "</h6>";
            commentHTML += "</div>";

            commentsDiv.innerHTML += commentHTML;
          });
          commentInput.value = "";
          $.ajax({
            url: "${root}/review/board/editCommCnt",
            type: "GET",
            data: { reviewNo: reviewNo },
            dataType: "JSON",
            success: function (commCnt) {
              commentChk.innerHTML = "";
              commentInfo.innerHTML = "";
              if (commCnt) {
                commentChk.innerHTML = "댓글 확인(" + commCnt + ")";
                commentInfo.innerHTML = "댓글 : 총 " + commCnt + "개";
              }
              console.log("댓글수 ajax업뎃 값 안넘어옴");
            },
            error: function (params) {
              console.log("댓글수 ajax업뎃 통신실패");
            },
          });
        },
        error: function (response) {
          console.log("통신실패!!");
        },
      });
    }
    var deleteMyReview = document.querySelector("#deleteMyReview");
    deleteMyReview.addEventListener("click", function () {
      if (window.confirm("정말로 삭제 하시겠습니까?")) {
        $.ajax({
          url: "${root}/review/board/delete/" + reviewNo,
          method: "DELETE",
          data: { reviewNo: reviewNo },
          success: function (params) {
            if (params == "success") {
              alert("리뷰 삭제가 완료되었습니다");
              window.location.href = "${root}/review/board/${rvo.subCaNo}";
            } else {
              alert("리뷰 삭제중 오류가 발생하였습니다.");
            }
          },
          error: function () {
            console.log("리뷰 삭제 ajax통신실패!!");
          },
        });
      }
    });
  });
</script>
