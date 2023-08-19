<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      #board-area{
      width: 60%;
	  margin: auto;
      }
      .panel-footer{
      text-align: center;
      }
      #conetent-holder, #content{
      height: 300px;
      }
      
      .titleBox a{
      font-weight:600;
      text-decoration: none;
   	  color: black;
      }
      #write-btn {
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  outline: none;
	  cursor: pointer;
	  width: 100px;
	  height: 40px;
	  background-image: linear-gradient(to top, #D8D9DB 0%, #fff 80%, #FDFDFD 100%);
	  border-radius: 30px;
	  border: 1px solid #8F9092;
	  transition: all 0.2s ease;
	  font-family: "Source Sans Pro", sans-serif;
	  font-size: 14px;
	  font-weight: 600;
	  color: #606060;
	  text-shadow: 0 1px #fff;
	  margin-left: 50px;
	}
	
	button:hover {
	  box-shadow: 0 4px 3px 1px #FCFCFC, 0 6px 8px #D6D7D9, 0 -4px 4px #CECFD1, 0 -6px 4px #FEFEFE, inset 0 0 3px 3px #CECFD1;
	}
	
	button:active {
	  box-shadow: 0 4px 3px 1px #FCFCFC, 0 6px 8px #D6D7D9, 0 -4px 4px #CECFD1, 0 -6px 4px #FEFEFE, inset 0 0 5px 3px #999, inset 0 0 30px #aaa;
	}
	
	button:focus {
	  box-shadow: 0 4px 3px 1px #FCFCFC, 0 6px 8px #D6D7D9, 0 -4px 4px #CECFD1, 0 -6px 4px #FEFEFE, inset 0 0 5px 3px #999, inset 0 0 30px #aaa;
	}
 
 	#table-bottom-area{
 	}
 	#page-area{
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

      <div id="board">
        <h3 class="fw-bold">고객문의 게시판</h3>
        <div id="board-area">
			        <div class="panel-heading fw-bold">무엇이든 편하게 질문해 주세요</div>
        <div class="panel-body" id="view">
			<table class ="table table-bordered">
				<tr>
					<td id="inquiryNo" style="width:5%;">번호</td>
					<td id="inquiryType" style="width:12%;">문의유형</td>
					<td id="inquiryTitle"style="width:50%;">제목</td>
					<td id="inquiryWriter"style="width:10%;">작성자</td>
					<td id="inquiryDate"style="width:15%;">작성일</td>
					<td id="inquiryCnt" style="width:8%;">조회수</td>
				</tr>
				<c:forEach items="${ivoList}" var="i">
					<tr>
						<td>${i.no}</td>
						<td>${i.type}</td>
          				<td class="titleBox" id="t${i.no}"><a href="javascript:contentDetail(${i.no})">${i.title}</a></td>
						<td>${i.nick}</td>
						<td>${i.enrollDate}</td>
						<td id="count${i.no}">${i.count}</td>
					</tr>
					<tr id="detail${i.no}" style="display:none">
						<td>내용</td>
						<td colspan = "5">
       					<textarea rows = "7" id="contentDetail${i.no}" class="form-control" readonly></textarea>
					<c:if test="${mvo.no == i.memberNo}">
						<br/>
			            <span id="updataBtn${i.no}"><button class="btn btn-success btn-sm" onclick="inquiryUpdate(${i.no})">수정화면</button></span>&nbsp;
			            <button class="btn btn-warning btn-sm" onclick="inquiryDelete(${i.no})">삭제</button>
					</c:if>
			   		<c:if test=" ${mvo.no != i.memberNo}">
						<br/>
						<span id="updataBtn${i.no}"><button disabled class="btn btn-success btn-sm" onclick="inquiryUpdate(${i.no})">수정하기</button></span>&nbsp;
						<button disabled class="btn btn-warning btn-sm" onclick="inquiryDelete(${i.no})">삭제</button>
					</c:if>
						</td>
					</tr>
				</c:forEach>
	     		 <c:if test="${empty mvo}">
	        			<tr>
	        				<td colspan ="6" id="table-bottom-area">
       				            <select name="searchType" class="">
					              <option value="#" selected>분류 선택</option>
					              <option value="type" >문의유형</option>
					              <option value="title">제목</option>
					              <option value="nick">닉네임</option>
					            </select>
					              <input
					                type="text"
					                id="qna-search"
					                name="searchValue"
					                value="${searchMap.searchValue}"
					              />
	        				</td>
        				</tr>	     		 
	     		 </c:if>
	     		 <c:if test="${not empty mvo}">
	        			<form action="inquiryBoard" method="get">
	        			<tr>
	        				<td colspan ="6" id="table-bottom-area">
       				            <select name="searchType" class="">
					              <option value="#" selected>분류 선택(전체)</option>
					              <option value="type" >문의유형 (
				                      <c:forEach items="${options}" var="option" varStatus="status">
								            <c:if test="${status.index > 0}">, </c:if>
								            ${option.type}
								      </c:forEach>
					              ) </option>
					              <option value="title">제목</option>
					              <option value="nick">닉네임</option>
					            </select>
					              <input
					                type="text"
					                id="qna-search"
					                name="searchValue"
                					value="${searchMap.searchValue}"					                
					              />
	        				<span style="display: inline-block;"><button id="write-btn" onclick='goQuiryForm()'>문의글 작성</button></span>
	        				</td>
        				</tr>
	        			</form>
	      		</c:if>
			</table>
        </div>
        <div class="panel-body" id="wForm" style="display: none">
          <form id="frm">
          	<input type="hidden"  id="id" name="memberNo" value="${mvo.no}">
            <table class="table">
              <tr>
              	<td>문의 유형</td>
              	<td>
	              	<select name="type" id="inquiryType">
					    <c:forEach items="${options}" var="option">
					        <option value="${option.no}">${option.type}</option>
					    </c:forEach>
	              	</select>
              	</td>
              </tr>
              <tr>
                <td>제목</td>
                <td>
                  <input
                    type="text"
                    id="title"
                    name="title"
                    class="form-control"
                  />
                </td>
              </tr>
              <tr>
                <td id="conetent-holder">내용</td>
                <td>
                  <textarea
                    row="7"
                    id="content"
                    name="content"
                    class="form-control"
                  ></textarea>
                </td>
              </tr>
              <tr>
                <td>작성자</td>
                <td>
                  <input
                    type="text"
                    id="writer"
                    class="form-control"
                    value="${mvo.nick}"
                    readonly
                  />
                </td>
              </tr>
              <tr>
                <td colspan="2" align="center">
                  <button
                    type="button"
                    class="btn btn-success btn-sm"
                    onclick="inQuiryInsert()"
                  >
                    등록
                  </button>
                  <button
                    type="reset"
                    class="btn btn-warning btn-sm"
                    id="clearForm"
                  >
                    취소
                  </button>
                  <button
                    type="button"
                    class="btn btn-info btn-sm"
                    onclick="goList()"
                  >
                    목록
                  </button>
                </td>
              </tr>
            </table>
          </form>
        </div>
              <div id="page-area">
             	 <ul class="pagination">
                <c:if test="${pv.currentPage > 1}">
				  <li class="page-item">
                  <a
                    href="${root}/inquiry/inquiryBoard?page=${pv.currentPage-1}&searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}"
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
                    <a class="page-link"
                      href="${root}/inquiry/inquiryBoard?page=${i}&searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}"
                      >${i}</a
                    >
				  </li>                    
                  </c:if>
                  <c:if test="${pv.currentPage == i}">
				  <li class="page-item active">                  
                    <a
					  class="page-link"
                      >${i}</a
                    >
				  </li>                    
                  </c:if>
                </c:forEach>
                <c:if test="${pv.currentPage < pv.maxPage}">
				  <li class="page-item">
                  <a
                    href="${root}/inquiry/inquiryBoard?page=${pv.currentPage+1}&searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}"
                    class="page-link"
                    >다음</a
                  >
				  </li>
                </c:if>
				 </ul>
              </div>
        <div class="panel-footer fw-bold">GODZIP CUSTOMER SERVICE CALL CENTER: 02-XXX-XXXX</div>
      </div>
        </div>
      </div>

      <%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>
    </div>
  </body>
  <script type="text/javascript">
 
	  function goQuiryForm() {
	      $("#view").css("display", "none"); //감추고
	      $("#wForm").css("display", "block"); //보이고
	    }
      function goList() {
          $("#view").css("display", "block"); //보이고
          $("#wForm").css("display", "none"); //감추고
        }
      function inQuiryInsert() {
          var fData = $("#frm").serialize(); //식별자 안의 조회할수 있는 데이터 값들을 직렬화
          
          $.ajax({
            url: "newInquiry",
            type: "post",
            data: fData,
            success: function(response) {
              alert("문의사항 접수가 완료되었습니다.");
 		      location.reload();
          },
            error: function (xhr, status, error) {
                console.error(xhr.responseText); // 에러 응답을 콘솔에 출력
                alert("ajax통신 실패");
              },
          });
          $("#clearForm").trigger("click");
        }
      function contentDetail(no) {
          if ($("#detail" + no).css("display") == "none") {
            $.ajax({
              url: "board/" + no,
              type: "get",
              data: { no: no },
              dataType: "JSON",
              success: function (data) {
                $("#contentDetail" + no).val(data.content);
              },
              error: function () {
                alert("error");
              },
            });
            $("#detail" + no).css("display", "table-row"); //보이게
            $("#contentDetail" + no).attr("readonly", true);
          } else {
            $("#detail" + no).css("display", "none"); //안보이게
            $.ajax({
              url: "board/count/" + no,
              type: "put",
              data: { no: no },
              dataType: "JSON",
              success: function (data) {
                console.log(data);
                $("#count" + no).text(data.count);
              },
              error: function (data) {
                console.log(data);
              },
            });
          }
        }
      
      function inquiryDelete(no) {
          $.ajax({
            url: "board/" + no,
            type: "delete",
            data: { no: no },
            success:  function () {
              alert("삭제완료!!");
 		      location.reload();
            },
            errer: function () {
              alert("error");
            },
          });
        }     
      function inquiryUpdate(no) {
          $("#contentDetail" + no).attr("readonly", false);
          var title = $("#t" + no).text();
          var newInput =
            "<input type='text' id='nt" +
            no +
            "' class='form-control' value='" +
            title +
            "'/>";
          $("#t" + no).html(newInput);

          var newBtn =
            "<button class='btn btn-primary btn-sm' onclick='boardEdit(" +
            no +
            ")'>수정</button>";
          $("#updataBtn" + no).html(newBtn);
        }
        function boardEdit(no) {
          var title = $("#nt" + no).val();
          var content = $("#contentDetail" + no).val();

          $.ajax({
            url: "board/edit",
            type: "put",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify({ no: no, title: title, content: content }),
        	success: function () {
              alert("수정완료!!");
 		      location.reload();
            },
            error: function () {
              alert("error");
            },
          });
        } 
           
  </script>
</html>
