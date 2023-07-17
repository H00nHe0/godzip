<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style type="text/css">
      h2 {
        padding-top: 30px;
        text-align: center;
      }
      .form-box {
        max-width: 800px;
        background: #f1f7fe;
        overflow: hidden;
        border-radius: 20px;
        color: #010101;
        margin: auto;
      }

      .form {
        position: relative;
        display: flex;
        flex-direction: column;
        padding: 32px 24px 24px;
        gap: 16px;
        text-align: center;
      }

      /*Form text*/
      .title {
        font-weight: bold;
        font-size: 1.6rem;
      }

      .subtitle {
        font-size: 1rem;
        color: #666;
      }

      /*Inputs box*/
      .form-container {
        overflow: hidden;
        border-radius: 8px;
        background-color: #fff;
        margin: 1rem 0 0.5rem;
        width: 90%;
        margin: auto;
      }

      .joinInput {
        background: none;
        border: 0;
        outline: 0;
        height: 40px;
        width: 95%;
        border-bottom: 1px solid #eee;
        font-size: 0.9rem;
        padding: 8px 15px;
      }

      .form-section {
        padding: 16px;
        font-size: 0.85rem;
        background-color: #e0ecfb;
        box-shadow: rgb(0 0 0 / 8%) 0 -1px;
      }

      .form-section a {
        font-weight: bold;
        color: #0066ff;
        transition: color 0.3s ease;
      }

      .form-section a:hover {
        color: #005ce6;
        text-decoration: underline;
      }

      /*Button*/
      .form button {
        background-color: #0066ff;
        color: #fff;
        border: 0;
        border-radius: 24px;
        padding: 10px 16px;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        transition: background-color 0.3s ease;
      }

      .form button:hover {
        background-color: #005ce6;
      }

      #loginForm-area {
        width: 100%;
        margin-top: 30px;
      }

      input #pwd2 {
        text-align: left;
      }

      table {
        width: 100%;
      }
    </style>
    

  </head>
  <body>
    <div id="wrap">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <script type="script" defer src="${root}/resources/js/main.js"></script>
      <div id="loginForm-area">
        <div class="form-box">
          <form
            class="form"
            action="${root}/member/login"
            method="post"
          >
            <span class="title">로그인</span>
            <span class="subtitle">Share , Check reviews and Choose!</span>
            <div class="form-container">
              <table>
                <tr>
                  <td colspan="2">아이디</td>
                </tr>
                <tr>
                  <td colspan="2">
                    <input
                      type="text"
                      class="joinInput my-1"
                      name="id"
                      placeholder="아이디를 입력해 주세요."
                    />
                  </td>
                </tr>
                <tr>
                  <td colspan="2">비밀번호</td>
                </tr>
                <tr>
                  <td colspan="2">
                    <input
                      type="password"
                      class="joinInput"
                      name="pwd"
                      id="pwd"
                      placeholder="비밀번호를 입력해 주세요."
                    />
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <button style="width: 90%">Log in</button>
                  </td>
                </tr>
              </table>
            </div>
          </form>
        </div>
      </div>
	<!-- The Modal -->
	<div class="modal" id="myMsg">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div id="messageType" class="modal-header">
            <h4 class="modal-title">${msgType}</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	      <!-- Modal body -->
	      <div class="modal-body">
     		<p id="checkMsg">${msg}</p>
	      </div>
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
      <%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>
    </div>
  </body>
</html>
    <script>
	$(document).ready(function() {
		var msgType = "${msgType}";
		if(msgType === "errorMsg"){
			$("#messageType").attr("class","modal-header bg-warning");
			$("#myMsg").modal("show");
		}
	});
    </script>

