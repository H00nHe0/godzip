<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <style>
  .reviewTr:hover {
    cursor: pointer;
  }
  .table-bordered {
    max-height: 600px;
  }
  .reviewTr {
    height: 40px;
  }

  #typeSelect {
    padding: 0.15rem 0.5rem;
    min-height: 30px;
    border-radius: 4px;
  }

  #qna-search {
    max-width: 300px;
    background-color: #ffffcc;
    color: black;
    padding: 0.15rem 0.5rem;
    min-height: 30px;
    border-radius: 4px;
    outline: 2px solid #febf00;
    border: none;
    line-height: 1.15;
    box-shadow: 0px 10px 20px -18px;
    margin-top: 10px;
  }

  #qna-search:focus {
    border-bottom: 2px solid #5b5fc7;
    border-radius: 4px 4px 2px 2px;
  }

  #qna-search:hover {
    outline: 1px solid lightgrey;
  }
  #table-bottom-area {
    text-align: center;
  }
  table{
    border: 3px solid;
  }
  table td {
    font-weight: 600;
  }
  #page-area{
    display: flex;
    justify-content: center;
    align-items: center;
  }
  </style>
  <body>
    <div id="wrap">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <script type="script" defer src="${root}/resources/js/main.js"></script>
      <div id="myReview-area">
        <div class="container mt-3">
          <h2>내가 작성한 리뷰</h2>

          <p style="font-weight: 600">리뷰 from ${mvo.nick}</p>
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>번호</th>
                <th>제품명</th>
                <th>제품 분류</th>
                <th>제목</th>
                <th>별점</th>
                <th>작성일</th>
                <th>조회수</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${rvoList}" var="list">
                <tr id="no${list.no}" class="reviewTr">
                  <td>${list.rno}</td>
                  <td>${list.prodName}</td>
                  <td>${list.subCategory}</td>
                  <td>${list.title} (${list.commCount})</td>
                  <td style="width: 80px;"> <img src="${root}/resources/img/stars/star.png" alt="" style="width: 40px; height: 40px; margin-right: -10px;" > ${list.score}</td>
                  <td>${list.postDate}</td>
                  <td>${list.count}</td>
                </tr>
              </c:forEach>
            </tbody>
            <tfoot>
              <tr>
                <td colspan="7" id="table-bottom-area">
                  <form id="searchForm" action="#" method="get">
                    <select name="searchType" class="" id="typeSelect">
                      <option value="all" selected>분류 선택(전체)</option>
                      <option value="prodName">제품명</option>
                      <option value="title">제목</option>
                      <option value="content">내용</option>
                      <option value="subCategory">세부 카테고리</option>
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
                    href="${root}/review/board/${subCaNo}?page=${pv.currentPage-1}&searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}"
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
                      href="${root}/review/board/${subCaNo}?page=${i}&searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}"
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
                    href="${root}/review/board/${subCaNo}?page=${pv.currentPage+1}&searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}"
                    class="page-link"
                    >다음</a
                  >
                </li>
              </c:if>
            </ul>
          </div>
        </div>
      </div>
      <%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>
    </div>
  </body>
</html>
