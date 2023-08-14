<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style type="text/css">
      .faqCard {
        width: 300px;
        height: 350px;
        background: rgb(255, 255, 204);
        box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px,
          rgba(0, 0, 0, 0.3) 0px 7px 13px -3px,
          rgba(0, 0, 0, 0.2) 0px -3px 0px inset;
        margin-left: 30px;
        margin-right: 30px;
        margin-top: 50px;
        word-break: keep-all;
      }
      .inquiryCard {
        width: 500px;
        height: 350px;
        background: #ffc100;
        box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px,
          rgba(0, 0, 0, 0.3) 0px 7px 13px -3px,
          rgba(0, 0, 0, 0.2) 0px -3px 0px inset;
        margin-left: 110px;
        margin-right: -110px;
        margin-top: 40px;
        word-break: keep-all;
        text-align: center;
      }
      #wrap {
        height: 100vh;
        width: 100%;
      }
      #board {
        height: 100%;
      }
      #faq-area {
        margin-bottom: 20px;
        height: 550px;
        width: 100%;
        display: flex;
        flex-wrap: wrap; /* 줄바꿈 설정 */
        justify-content: center; /* 가로 중앙 정렬 */
        align-items: center; /* 세로 중앙 정렬 */
      }
      #inquiry-area {
        display: flex;
        justify-content: center; /* 가로 중앙 정렬 */
        align-items: center; /* 세로 중앙 정렬 */
      }
      #faqTitle {
        margin-left: -50px;
        margin-right: 50px;
        font-size: x-large;
        font-weight: 700;
      }
      .inquiryTitle {
        margin: 40px 20px 20px;
        font-size: 25px;
      }
      h3 {
        text-align: center;
        padding-top: 20px;
        font: bold;
      }
      .faqQ {
        height: 25%;
        margin: 15px;
      }
      .faqA {
        height: 70%;
        margin: 15px;
        word-break: keep-all;
      }
      .cta {
        border: none;
        background: none;
        background-color: khaki;
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
      #moveInquiry {
        margin-top: 70px;
      }
    </style>
  </head>
  <body>
    <div id="wrap">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <script type="script" defer src="${root}/resources/js/main.js"></script>

      <div id="board">
        <h3 class="fw-bold">고객문의 - Customer Service</h3>
        <div id="faq-area">
          <p id="faqTitle">FAQ - 자주하는 질문</p>
          <c:forEach items="${faqList}" var="faq">
            <div class="faqCard">
              <h5 class="faqQ fw-bold">Q. ${faq.title}</h5>
              <div class="faqA fw-bold">A. ${faq.content}</div>
            </div>
          </c:forEach>
          <div class="inquiryCard">
            <p class="inquiryTitle fw-bold">
              찾으시는 문의사항이 없으시다면 아래 버튼을 눌러 문의 게시판으로
              이동해서 문의사항을 작성 해주세요
            </p>
            <p class="fs-8 fw-bold lead" id="moveInquiry">
              문의사항 작성하러 가기
              <a href="${root}/inquiry/inquiryBoard">
                <button class="cta">
                  <span
                    class="hover-underline-animation fw-bold"
                    style="font-size: 18px"
                  >
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
        </div>
      </div>

      <%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>
    </div>
  </body>
</html>
