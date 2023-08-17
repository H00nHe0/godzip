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
        <div class="panel-body" id="view">Panel Content</div>
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
        <div class="panel-footer fw-bold">GODZIP CUSTOMER SERVICE CALL CENTER: 02-XXX-XXXX</div>
      </div>
        </div>
      </div>

      <%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>
    </div>
  </body>
  <script type="text/javascript">
  $(document).ready(function () {
      loadList();
    });
  function loadList() {
      //서버와의 통신: 데이터 가져오기
      $.ajax({
        url: "board",
        type: "get",
        dataType: "json",
        success: makeView, //콜백함수:클라이언트에서 서버에요청 -> 응답에 따라 실행되는 함수
        error: function () {
          alert("error");
        },
      });
    } 
  function makeView(data) {
      // data = [{},{},{},,,,,]
      console.log(data);
      var listHtml = "<table class ='table table-bordered'> ";
      listHtml += "<tr>";
      listHtml += "<td id='inquiryNo' style='width:5%;'>번호</td>";
      listHtml += "<td id='inquiryType' style='width:12%;'>문의유형</td>";
      listHtml += "<td id='inquiryTitle'style='width:50%;'>제목</td>";
      listHtml += "<td id='inquiryWriter'style='width:10%;'>작성자</td>";
      listHtml += "<td id='inquiryDate'style='width:15%;'>작성일</td>";
      listHtml += "<td id='inquiryCnt'style='width:8%;'>조회수</td>";
      listHtml += "</tr>";
      $.each(data, function (index, obj) {
        listHtml += "<tr>";
        listHtml += "<td>" + obj.no + "</td>";
        listHtml += "<td>" + obj.type + "</td>";
        listHtml +=
          "<td class='titleBox' id='t" +
          obj.no +
          "'><a href='javascript:contentDetail(" +
          obj.no +
          ")'>" +
          obj.title +
          "</a></td>";
        listHtml += "<td>" + obj.nick + "</td>";
        listHtml += "<td>" + obj.qdate + "</td>";
        listHtml += "<td id='count" + obj.no + "'>" + obj.count + "</td>";
        listHtml += "</tr>";

        listHtml += "<tr id='detail" + obj.no + "' style='display:none'>";
        listHtml += "<td>내용</td>";
        listHtml += "<td colspan = '4'>";
        listHtml +=
          "<textarea rows = '7' id='contentDetail" +
          obj.no +
          "' class='form-control' readonly></textarea>";

        if("${mvo.no}" == obj.memberNo){
        listHtml += "<br/>";
        listHtml +=
          "<span id='updataBtn" +
          obj.no +
          "'><button class='btn btn-success btn-sm' onclick='inquiryUpdate(" +
          obj.no +
          ")'>수정화면</button></span>&nbsp;";
        listHtml +=
          "<button class='btn btn-warning btn-sm' onclick='inquiryDelete(" +
          obj.no +
          ")'>삭제</button>";
        }else{
         listHtml += "<br/>";
         listHtml +=
           "<span id='updataBtn" +
           obj.no +
           "'><button disabled class='btn btn-success btn-sm' onclick='inquiryUpdate(" +
           obj.no +
           ")'>수정하기</button></span>&nbsp;";
         listHtml +=
           "<button disabled class='btn btn-warning btn-sm' onclick='inquiryDelete(" +
           obj.no +
           ")'>삭제</button>";
        }
        listHtml += "</td>";
        listHtml += "</tr>";
      });
    
	//로그인을 해야 보이는 부분
	if(${!empty mvo}){
	      listHtml +=
	        "<tr><td colspan ='5'><button class='btn btn-primary btn-sm' onclick='goQuiryForm()'>게시글 작성</button></td></tr>";
	}
      listHtml += "</table>";
      $("#view").html(listHtml);
      $("#view").css("display", "block"); //보이고
      $("#wForm").css("display", "none"); //감추고
    }
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
              console.log("문의사항 insert성공!");
              loadList(); 
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
            success: loadList,
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
            success: loadList,
            error: function () {
              alert("error");
            },
          });
        }      
  </script>
</html>
