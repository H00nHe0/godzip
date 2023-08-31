<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style>
      .reviewTr:hover {
        cursor: pointer;
      }
      .table-bordered {
        min-height: 600px;
      }
      .reviewTr {
        height: 40px;
      }
    </style>
  </head>
  <body>
    <div id="wrap">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <script type="script" defer src="${root}/resources/js/main.js"></script>
      <div class="container mt-3">
        <h2>리뷰 게시판</h2>

        <p>리뷰 게시판 for ${rvoList[0].subCategory}</p>
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>번호</th>
              <th>제품명</th>
              <th>제목</th>
              <th>별점</th>
              <th>작성자</th>
              <th>작성일</th>
              <th>조회수</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${rvoList}" var="review">
              <tr id="no${review.no}" class="reviewTr">
                <td>${review.no}</td>
                <td>${review.prodName}</td>
                <td>${review.title}</td>
                <td>${review.score}</td>
                <td>${review.nick}</td>
                <td>${review.postDate}</td>
                <td>${review.count}</td>
              </tr>
            </c:forEach>
          </tbody>
          <tfoot>
            <tr>
              <td colspan="6" id="table-bottom-area">
                <form id="searchForm" action="${subCaNo}" method="get">
                  <select name="searchType" class="">
                    <option value="all" selected>분류 선택(전체)</option>
                    <option value="prodName">제품명</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                    <option value="nick">닉네임</option>
                  </select>
                  <input
                    type="text"
                    placeholder="검색 내용입력"
                    id="qna-search"
                    name="searchValue"
                    value="${searchMap.searchValue}"
                  />
                </form>
              </td>
            </tr>
          </tfoot>
        </table>
        <div id="page-area">
          <ul class="pagination">
            <c:if test="${pv.currentPage > 1}">
              <li class="page-item">
                <a
                  href="${root}/review/board/${rvoList.no}?page=${pv.currentPage-1}&searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}"
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
                    href="${root}/review/board/${rvoList.no}?page=${i}&searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}"
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
                  href="${root}/review/board/${rvoList.no}?page=${pv.currentPage+1}&searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}"
                  class="page-link"
                  >다음</a
                >
              </li>
            </c:if>
          </ul>
        </div>
      </div>

      <%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>
    </div>
  </body>
</html>
<script>
  $(document).ready(function () {
    $(".reviewTr").click(function () {
      var reviewId = this.id.replace("no", "");
      var moveToDetail = "${root}/review/board/detail/" + reviewId;
      window.location.href = moveToDetail;
    });
  });
</script>
