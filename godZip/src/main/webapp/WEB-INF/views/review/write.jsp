<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
        height: 90%;
        max-height: 800px;
        background: rgba(221, 236, 253, 0.7);
        margin-top: 20px;
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
        border:none;
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

      .form button {
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
        background: #FFC107;
      }

      .form button:hover {
        background: #FFC107;
      }
      #container-holder {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
        height: 100vh;
      }

      /* 별점 */
      .rating{
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: row-reverse;
      /* Reverse the order of the stars */
        font-size: 0;
      /* Remove the space between the elements */
      }
      .rating-box{
        display: flex;
        justify-content: center;
        align-items: center;
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
        color: #FFC107;
      /* Filled star color */
      }
      #score{
        padding-left: 10px;
      }

    </style>
  </head>
  <body>
    <div id="wrap">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <script type="script" defer src="${root}/resources/js/main.js"></script>

      <div id="container-holder">
        <section class="container-area">
          <header>리뷰 작성 양식</header>
          <form class="form" action="#">
            <div class="column">
              <div class="select-box">
                <select required>
                  <option hidden="">상품 카테고리</option>
                  <option>USA</option>
                  <option>UK</option>
                  <option>Germany</option>
                  <option>Japan</option>
                </select>
              </div>
              <div class="select-box">
                <select required>
                  <option hidden="">세부 카테고리</option>
                  <option>USA</option>
                  <option>UK</option>
                  <option>Germany</option>
                  <option>Japan</option>
                </select>
              </div>
            </div>
            <div class="input-box">
              <label>리뷰 제품명</label>
              <input required=""  type="text" />
            </div>
            <div class="column">
              <div class="input-box">
                <label>구매경로</label>
                <select>
                  <option hidden="">선택</option>
                  <option>USA</option>
                  <option>UK</option>
                  <option>Germany</option>
                  <option>Japan</option>
                </select>
              </div>
              <div class="input-box">
                <label>구매일</label>
                <input
                  required=""
                  placeholder="Enter purchase date"
                  type="date"
                />
              </div>
            </div>
            <div class="rating-box">
              <label>구매 만족도 &nbsp;&nbsp;</label> 
              <div class="rating">
                <input value="5" name="rating" id="star5" type="radio">
                <label for="star5"></label>
                <input value="4" name="rating" id="star4" type="radio">
                <label for="star4"></label>
                <input value="3" name="rating" id="star3" type="radio">
                <label for="star3"></label>
                <input value="2" name="rating" id="star2" type="radio">
                <label for="star2"></label>
                <input value="1" name="rating" id="star1" type="radio">
                <label for="star1"></label>
              </div>
              <div id="score"></div> 
            </div>
            <div class="comment-box">
              <label>Write a review!</label>
              <textarea
                rows="10"
                required=""
                placeholder="리뷰를 작성해 주세요"
              /></textarea>
            </div>
            <div style="text-align: center;">
              <button>Submit</button>
            </div>
          </form>
        </section>
      </div>

      <%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>
    </div>
  </body>
</html>
<script>
  $(document).ready(function() {
    // 라디오 버튼이 변경될 때마다 실행되는 함수
    $('input[name="rating"]').change(function() {
        var selectedValue = $(this).val(); // 선택된 라디오 버튼의 값
        var opinion = "";
        if (selectedValue == 1) {
          opinion = "horrible";
        }else if(selectedValue == 2){
          opinion = "bad";
        }else if(selectedValue == 3){
          opinion = "soso";
        }else if(selectedValue == 4){
          opinion = "good";
        }else{
          opinion = "excellent!";
        }
        $('#score').text(selectedValue +" star ("+opinion+")");
    });
});
</script>
