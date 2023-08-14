<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style type="text/css">
  
      #wrap {
        height: 100vh;
        width: 100%;
      }
      #board {
        height: 100%;
      }
 
      h3 {
        text-align: center;
        padding-top: 20px;
        font: bold;
      }
 
    </style>
  </head>
  <body>
    <div id="wrap">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <script type="script" defer src="${root}/resources/js/main.js"></script>

      <div id="board">
        <h3 class="fw-bold">고객문의 게시판</h3>
        <div id="board-area">

        </div>
      </div>

      <%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>
    </div>
  </body>
</html>
