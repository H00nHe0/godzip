<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style>
      .container-area {
        position: relative;
        max-width: 1000px;
        width: 80%;
        height: 95%;
        max-height: 1000px;
        background: rgba(221, 236, 253, 0.7);
        padding: 25px;
        border-radius: 8px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
      }

      .container-area header {
        font-size: 1.2rem;
        color: #000;
        font-weight: 600;
        text-align: center;
      }

      .container-area .form {
        margin-top: 15px;
      }

      .form .input-box {
        width: 100%;
        margin-top: 10px;
      }

      .input-box label {
        color: #000;
        font-weight: 600;
        font-size: 1.1rem;
      }

      .form
        :where(
          .input-box input,
          .select-box,
          .column input,
          .input-box select
        ) {
        position: relative;
        height: 35px;
        width: 100%;
        outline: none;
        font-size: 1rem;
        color: #808080;
        margin-top: 5px;
        border: none;
        border-radius: 6px;
        padding: 0 15px;
        background: white;
      }
      .comment-box textarea {
        max-height: 200px;
        width: 100%;
        outline: none;
        font-size: 1rem;
        color: #808080;
        margin-top: 5px;
        border: none;
        border-radius: 6px;
        padding: 0 15px;
        background: white;
      }
      .input-box input:focus {
        box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
      }

      .form .column {
        display: flex;
        column-gap: 15px;
      }

      .form .rating-box {
        margin-top: 10px;
      }

      .address :where(input, .select-box) {
        margin-top: 10px;
      }

      .select-box select {
        height: 100%;
        width: 100%;
        outline: none;
        border: none;
        color: #808080;
        font-size: 1rem;
        background: white;
      }

      .form #editBtn {
        height: 40px;
        width: 80%;
        color: #000;
        font-size: 1.3rem;
        font-weight: 400;
        margin-top: 25px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        transition: all 0.2s ease;
        background: #ffc107;
      }

      .form #editBtn:hover {
        background: #ffc107;
      }
      #container-holder {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
        height: 100vh;
      }

      /* 별점 */
      .rating {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: row-reverse;
        /* Reverse the order of the stars */
        font-size: 0;
        /* Remove the space between the elements */
      }
      .rating-box {
        display: flex;
        justify-content: center;
        align-items: center;
        padding-top: 10px;
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
        cursor: pointer;
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
      #score {
        padding-left: 10px;
      }
      .comment-box,
      .comment-box label {
        margin-top: 10px;
        font-size: 1.3rem;
      }
      .note-editable {
        background-color: white;
      }
      #title {
        height: 40px;
      }
      #reviewer {
        height: 35px;
        width: 30%;
        outline: none;
        font-size: 1rem;
        color: black;
        margin-top: 5px;
        margin-bottom: 10px;
        border: none;
        border-radius: 6px;
        padding: 5px 15px;
        background: white;
      }
    </style>
  </head>
  <body>
    <div id="wrap">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <script type="script" defer src="${root}/resources/js/main.js"></script>

      <div id="container-holder">
        <section class="container-area">
          <header>리뷰 수정 양식</header>
          <form class="form" action="${root}/review/board/edit" method="POST">
            <div id="reviewer">
              <label>Reviewer :</label>
              ${mvo.nick}
              <input type="hidden" name="no" value="${rvo.no}" />
            </div>
            <div class="column">
              <div class="select-box">
                <select required name="categoryNo" id="categorySelect">
                  <option value="">상품 카테고리</option>
                  <c:forEach items="${cList}" var="cl">
                    <option value="${cl.no}">${cl.caName}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="select-box">
                <select required name="subCaNo" id="subCategorySelect">
                  <option hidden="">세부 카테고리</option>
                </select>
              </div>
            </div>
            <div class="input-box">
              <label>리뷰 제품명</label>
              <input
                type="text"
                name="prodName"
                placeholder="${rvo.prodName}"
              />
            </div>
            <div class="column">
              <div class="input-box">
                <label>구매일</label>
                <input placeholder="${rvo.purchaseDate}" name="purchaseDate" />
              </div>
              <div class="rating-box input-box">
                <label>구매 만족도 &nbsp;&nbsp;</label>
                <div class="rating">
                  <input value="5" name="score" id="star5" type="radio"
                  ${rvo.score == 5 ? 'checked' : ''} />
                  <label for="star5"></label>
                  <input value="4" name="score" id="star4" type="radio"
                  ${rvo.score == 4 ? 'checked' : ''} />
                  <label for="star4"></label>
                  <input value="3" name="score" id="star3" type="radio"
                  ${rvo.score == 3 ? 'checked' : ''} />
                  <label for="star3"></label>
                  <input value="2" name="score" id="star2" type="radio"
                  ${rvo.score == 2 ? 'checked' : ''} />
                  <label for="star2"></label>
                  <input value="1" name="score" id="star1" type="radio"
                  ${rvo.score == 1 ? 'checked' : ''} />
                  <label for="star1"></label>
                </div>
                <div id="score"></div>
              </div>
            </div>

            <div class="comment-box">
              <label>Write a review!</label>
              <div class="input-box">
                <label>제목</label>
                <input
                  placeholder="${rvo.title}"
                  id="title"
                  type="text"
                  name="title"
                />
              </div>

              <div id="summernote-holder">
                <textarea id="summernote" name="content">
${rvo.content}
                </textarea>
                <input id="thumbnail" name="attFile" style="display: none
                ;"></input>
              </div>
            </div>
            <div style="text-align: center">
              <button id="editBtn">수정하기</button>
            </div>
          </form>
        </section>
      </div>

      <%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>
    </div>
  </body>
</html>
<script>
  $(document).ready(function () {
    // 라디오 버튼이 변경될 때마다 실행되는 함수
    $('input[name="score"]').change(function () {
      var selectedValue = $(this).val(); // 선택된 라디오 버튼의 값
      var opinion = "";
      if (selectedValue == 1) {
        opinion = "Horrible....";
      } else if (selectedValue == 2) {
        opinion = "Bad...";
      } else if (selectedValue == 3) {
        opinion = "Soso..";
      } else if (selectedValue == 4) {
        opinion = "Good!";
      } else {
        opinion = "Excellent!!";
      }
      $("#score").text(selectedValue + " star (" + opinion + ")");
    });

    $("#summernote").summernote({
      placeholder: "",
      tabsize: 2,
      height: 350,
      lang: "ko-KR",
      focus: true,
      callbacks: {
        //onImageUpload = 이미지 업로드시 작동하는 콜백함수
        onImageUpload: function (files, editor, welEditable) {
          for (var i = 0; i < files.length; i++) {
            uploadSummernoteImageFile(files[i], this);
          }
        },
      },
      toolbar: [
        // 글꼴 설정
        ["fontname", ["fontname"]],
        // 글자 크기 설정
        ["fontsize", ["fontsize"]],
        ["style", ["style"]],
        ["font", ["bold", "underline", "clear"]],
        ["color", ["color"]],
        ["para", ["ul", "ol", "paragraph"]],
        ["table", ["table"]],
        ["insert", ["link", "picture", "video"]],
        ["view", ["fullscreen", "codeview", "help"]],
      ],
      // 추가한 글꼴
      fontNames: [
        "Arial",
        "Arial Black",
        "Comic Sans MS",
        "Courier New",
        "맑은 고딕",
        "궁서",
        "굴림체",
        "굴림",
        "돋음체",
        "바탕체",
      ],
      // 추가한 폰트사이즈
      fontSizes: [
        "8",
        "9",
        "10",
        "11",
        "12",
        "14",
        "16",
        "18",
        "20",
        "22",
        "24",
        "28",
        "30",
        "36",
        "50",
        "72",
      ],
    });
    function uploadSummernoteImageFile(file, editor) {
      var thumbnail = document.querySelector("#thumbnail");
      data = new FormData();
      data.append("file", file);
      $.ajax({
        url: "${root}/review/uploadSummernoteImage",
        data: data,
        type: "POST",
        dataType: "JSON",
        contentType: false,
        processData: false,

        success: function (data) {
          $(editor).summernote("insertImage", data.url);
          if (!thumbnail.value) {
            thumbnail.value +=
              "<img style='width: 60px; height: 60px;' src='" + data.url + "'>";
          }
        },
      });
    }

    // 상품 카테고리 선택 박스 변경 시 이벤트 리스너
    $("#categorySelect").change(function () {
      var categoryNo = $(this).val();
      $.ajax({
        url: "${root}/review/subCategory",
        method: "GET",
        data: { caNo: categoryNo },
        dataType: "JSON",
        success: function (result) {
          var sList = result;
          var subCategories = $("#subCategorySelect");
          subCategories
            .empty()
            .append('<option hidden="">세부 카테고리</option>');

          for (let i = 0; i < sList.length; i++) {
            var sNo = sList[i].no;
            var subCategory = sList[i].subCategory;
            var addOption =
              "<option value=" + sNo + ">" + subCategory + "</option>";
            subCategories.append(addOption);
          }
        },
        error: function (error) {
          console.log("Error:", error);
        },
      });
    });
    var form = document.querySelector(".form");
    var inputProdName = document.querySelector("input[name = 'prodName']");
    var inputPurchaseDate = document.querySelector(
      "input[name = 'purchaseDate']"
    );
    var inputTitle = document.querySelector("input[name = 'title']");
    form.addEventListener("submit", function (event) {
      if (inputProdName.value.trim() === "") {
        inputProdName.setAttribute("value", inputProdName.placeholder);
      }
      if (inputPurchaseDate.value.trim() === "") {
        inputPurchaseDate.setAttribute("value", inputPurchaseDate.placeholder);
      }
      if (inputTitle.value.trim() === "") {
        inputTitle.setAttribute("value", inputTitle.placeholder);
      }
    });
  });
</script>
