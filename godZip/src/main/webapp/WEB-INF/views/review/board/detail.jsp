<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style type="text/css">
      .reviewModal {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;
        width: 100%;
        margin-top: 30px;
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
      #prodInfo{
      margin: -10px -10px 5px -10px;
      background-color: rgba(221, 236, 253, 0.7);
      border-radius: 20px;
      padding: 10px 10px 2px 10px;
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
        background-image: linear-gradient(
          to top,
          rgba(255, 255, 255, 0.75),
          transparent
        );
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
      #unLikeBtn {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 12px 14px 12px 14px;
        box-shadow: rgba(160, 160, 160, 0.35) 0px -2px 6px 0px inset;
        background-color: #e8e8e8;
        border-color: #a0a0a0;
        border-style: solid;
        border-width: 8px;
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
      #unLikeBtn:hover {
        background-color: #a0a0a0;
        transform: scale(105%);
        animation: movingBorders1 3s infinite;
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
    </style>
  </head>
  <body>
    <div id="wrap">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <script type="script" defer src="${root}/resources/js/main.js"></script>
      <div class="reviewModal">
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
              <img
                class="img-circle"
                src="${root}/resources/img/memberImg/${rvo.profile}"
                style="width: 50px; height: 50px"
              />
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
            </div>
            <span>제목 : ${rvo.title}</span>

            <p>${rvo.content}</p>
          </section>
          <footer class="modal-container-footer">
            LIKE
            <button id="likeBtn" class="footer-button">
              <svg
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
            UNLIKE
            <button id="unLikeBtn" class="footer-button">
              <svg
                height="22"
                width="22"
                viewBox="0 0 24 24"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path d="M0 0H24V24H0z" fill="none"></path>
                <path
                  d="M16.5 3C19.538 3 22 5.5 22 9c0 7-7.5 11-10 12.5C9.5 20 2 16 2 9c0-3.5 2.5-6 5.5-6C9.36 3 11 4 12 5c1-1 2.64-2 4.5-2z"
                ></path>
              </svg>
            </button>
            <button class="button is-primary footer-button">목록으로</button>
            <button class="button is-comment footer-button">댓글등록</button>
          </footer>
        </article>
      </div>

      <%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>
    </div>
  </body>
</html>
