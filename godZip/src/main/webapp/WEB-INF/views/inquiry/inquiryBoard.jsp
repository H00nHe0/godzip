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
      #view{
      margin-top: 10px;
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
      .table-bordered{
      border: 2px solid black;
      }
      .titleBox a{
      font-weight:600;
      text-decoration: none;
   	  color: black;
      }
      .detail-btn {
	  border: 1px solid #8F9092;
	  outline: none;
      background-image: linear-gradient(to top, #D8D9DB 0%, #fff 80%, #FDFDFD 100%);
	  padding: 8px 10px;
	  font-size: 12px;
	  font-weight: 700;
	  color: #606060;
	  border-radius: 20px;
	  transition: all ease 0.1s;
	  box-shadow: 0px 5px 0px 0px white;
	}
	
	.detail-btn:active {
	  transform: translateY(5px);
	  box-shadow: 0px 0px 0px 0px #a29bfe;
	}
      
      #write-btn {
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  outline: none;
	  cursor: pointer;
	  width: 130px;
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
	  margin-top: 20px;
	}
	
	#write-btn:hover {
	  box-shadow: 0 4px 3px 1px #FCFCFC, 0 6px 8px #D6D7D9, 0 -4px 4px #CECFD1, 0 -6px 4px #FEFEFE, inset 0 0 3px 3px #CECFD1;
	}
	
	#write-btn:active {
	  box-shadow: 0 4px 3px 1px #FCFCFC, 0 6px 8px #D6D7D9, 0 -4px 4px #CECFD1, 0 -6px 4px #FEFEFE, inset 0 0 5px 3px #999, inset 0 0 30px #aaa;
	}
	
	#write-btn:focus {
	  box-shadow: 0 4px 3px 1px #FCFCFC, 0 6px 8px #D6D7D9, 0 -4px 4px #CECFD1, 0 -6px 4px #FEFEFE, inset 0 0 5px 3px #999, inset 0 0 30px #aaa;
	}
 
 	#table-bottom-area{
 	 text-align: center;
 	}
 	#page-area{
		display: flex;
		justify-content: center;
		align-items: center;
 	}
 	#typeSelect{
	  padding: .15rem .5rem;
	  min-height: 30px;
	  border-radius: 4px;
 	}
 	
 	#qna-search {
	  max-width: 300px;
	  background-color: #ffffcc;
	  color: black;
	  padding: .15rem .5rem;
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

	#detail-btn-area{
	text-align: center;
	margin-top: -10px;
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
				<tr style="text-align: center;">
					<th id="inquiryNo" style="width:5%;">번호</th>
					<th id="inquiryType" style="width:12%;">문의유형</th>
					<th id="inquiryTitle"style="width:50%;">제목</th>
					<th id="inquiryWriter"style="width:10%;">작성자</th>
					<th id="inquiryDate"style="width:15%;">작성일</th>
					<th id="inquiryCnt" style="width:8%;">조회수</th>
				</tr>
				<c:if test="${empty ivoList}">
					<tr>
						<td colspan="6" style="text-align: center;">"${searchMap.searchValue}"에 대하여 찾으시는 조건의 게시물이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${ivoList}" var="i">
					<tr>
						<td style="text-align: center;">${i.no}</td>
						<td>${i.type}</td>
          				<td class="titleBox" id="t${i.no}"><a href="javascript:contentDetail(${i.no})">${i.title}</a>
          					 <c:if test="${i.answeredYn eq 'Y'}"><span class="badge bg-success">답변완료</span></c:if>
          					 <c:if test="${i.answeredYn eq 'N'}"><span class="badge bg-warning">답변필요</span></c:if>
          					 <c:if test="${i.answeredYn eq null}"><span class="badge bg-warning">답변필요</span></c:if>
          				</td>
						<td>${i.nick}</td>
						<td>${i.enrollDate}</td>
						<td id="count${i.no}" style="text-align: center;">${i.count}</td>
					</tr>
					<tr id="detail${i.no}" style="display:none">
						<td colspan="2">내용</td>
						<td colspan = "4">
       					<textarea rows = "7" id="contentDetail${i.no}" class="form-control" readonly></textarea>
						</td>
					</tr>
					<tr id="answer${i.no}" style="display:none">
						<td colspan="2">답변</td>
						<td colspan = "4">
       					<textarea rows = "7" id="answerArea${i.no}" class="form-control"name="answer"></textarea>
						<button class="btn btn-primary" onclick="submitAnswer(${i.no})">답변 등록</button>       					
						</td>					
					</tr>
					<tr  id="adminBtns${i.no}" style="display:none;" >
						<td colspan = "6">
						<c:if test="${mvo.no == i.memberNo}">
							<br/>
							<div id="detail-btn-area" >
				            <span id="updataBtn${i.no}"><button class="detail-btn" onclick="inquiryUpdate(${i.no})">수정화면</button></span>&nbsp;
				            <button class="detail-btn" onclick="inquiryDelete(${i.no})">삭제하기</button>
							</div>
						</c:if>
				   		<c:if test="${mvo.no != i.memberNo}">
							<br/>
						</c:if>
				   		<c:if test="${mvo.no == 3}">
							<div id="detail-btn-area">
				            <span id="updataBtn${i.no}"><button class="detail-btn" onclick="inquiryAnswer(${i.no})">답변하기(ADMIN)</button></span>&nbsp;
				            <button class="detail-btn" onclick="inquiryDelete(${i.no})">삭제하기</button>
							</div>
						</c:if>	
						</td>				
					
					</tr>
				</c:forEach>
	     		 <c:if test="${empty mvo}">
						<form id="searchForm" action="inquiryBoard" method="get">
		        			<tr>
		        				<td colspan ="6" id="table-bottom-area">
	       				            <select name="searchType" class="">
						              <option value="all" selected>분류 선택(전체)</option>
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
						                placeholder="검색 내용입력"
						                id="qna-search"
						                name="searchValue"
	                					value="${searchMap.searchValue}"					                
						              />
		        				</td>
	        				</tr>
	        			</form>   
	        				<c:if test="${mvo.no != 3}">
	        					<span style="display: inline-block;"><button id="write-btn" onclick='goQuiryForm()'>문의글 작성</button></span>
	        				</c:if>  		 
	     		 </c:if>
	     		 <c:if test="${not empty mvo}">
	        			<tr>
        				<td colspan ="6" id="table-bottom-area">
	        			<form id="searchForm" action="inquiryBoard" method="get">
       				            <select name="searchType" id="typeSelect">
					              <option value="all" selected>분류 선택(전체)</option>
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
					                placeholder="검색 내용입력"
					                name="searchValue"
                					value="${searchMap.searchValue}"					                
					              />
	        			</form>
	        				<c:if test="${mvo.no != 3}">
	        				<span style="display: inline-block;"><button id="write-btn" onclick='goQuiryForm()'>문의글 작성</button></span>
	        				</c:if>
	        				</td>
        				</tr>
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
	  $(document).ready(function () {
		    const searchForm = $("#searchForm");
		    const qnaSearchInput = $("#qna-search");

		    qnaSearchInput.on("keydown", function (event) {
		        if (event.key === "Enter") {
		            searchForm.submit();
		        }
		    });
	    });
 
	  function goQuiryForm() {
	      $("#view").css("display", "none"); 
	      $("#page-area").css("display", "none");
	      $("#wForm").css("display", "block"); 

	    }
      function goList() {
          $("#view").css("display", "block");
          $("#page-area").css("display", "block");
          $("#wForm").css("display", "none");
		  location.reload();
        }
      function inQuiryInsert() {
          var fData = $("#frm").serialize();
          
          $.ajax({
            url: "newInquiry",
            type: "post",
            data: fData,
            success: function(response) {
              alert("문의사항 접수가 완료되었습니다.");
 		      location.reload();
          },
            error: function (xhr, status, error) {
                console.error(xhr.responseText);
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
                $("#t" + no).css("background-color", "#ffffcc");
              },
              error: function () {
                alert("error");
              },
            });
            $("#detail" + no).css("display", "table-row");
            $("#adminBtns" + no).css("display", "table-row");
            $("#contentDetail" + no).attr("readonly", true);
          } else {
            $("#detail" + no).css("display", "none"); 
            $("#adminBtns" + no).css("display", "none"); 
            $("#answer" + no).css("display", "none");   
            $.ajax({
              url: "board/count/" + no,
              type: "put",
              data: { no: no },
              dataType: "JSON",
              success: function (data) {
            	  $("#count" + no).text(data.count);
            	  $("#t" + no).css("background-color", "white");
              },
              error: function (data) {
                console.log("error in growing count");
              },
            });
          }
        }
      function inquiryAnswer(no) {
           $("#answer" + no).css("display", "table-row");   
           $("#adminBtns" + no).css("display", "none");   
	}
      
       function submitAnswer(no) {
    	   var answerText = $("#answerArea" + no).val();
            $.ajax({
              url: "board/answer",
              type: "post",
              data: { no: no, answer:answerText },
              success: function (response) {
              if (response === "success") {
                  alert("답변이 등록되었습니다.");
     		      location.reload();
                } else {
                  alert("답변 등록에실패했습니다.");
                }
              },
              error: function () {
                alert("답변 등록중 에러발생");
              },
            });
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
