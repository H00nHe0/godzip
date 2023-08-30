<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style></style>
  </head>
  <body>
    <div id="wrap">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <script type="script" defer src="${root}/resources/js/main.js"></script>
      <div class="container mt-3">
        <h2>리뷰 게시판</h2>
        <p>
          The .table-bordered class adds borders on all sides of the table and
          the cells:
        </p>
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>번호</th>
              <th>카테고리 번호</th>
              <th>제품명</th>
              <th>제목</th>
              <th>작성자 번호</th>
              <th>작성일</th>
              <th>조회수</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${rvoList}" var="review">
              <tr>
                <td>${review.no}</td>
                <td>${review.categoryNo}</td>
                <td>${review.prodName}</td>
                <td>${review.title}</td>
                <td>${review.memberNo}</td>
                <td>${review.postDate}</td>
                <td>${review.count}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>

      <%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>
    </div>
  </body>
</html>
