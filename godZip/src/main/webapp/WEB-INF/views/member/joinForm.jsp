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

      #joinForm-area {
        width: 100%;
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
      <div>
        <h2>회원 가입에 감사드립니다.</h2>
      </div>

      <div id="joinForm-area">
        <div class="form-box">
          <form
            class="form"
            action="${root}/member/join"
            method="post"
            onsubmit="return checkValidation();"
          >
            <span class="title">회원 가입</span>
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
                      style="width: 80%"
                      name="id"
                      placeholder="4~12자리의 알파벳 대.소문자와 숫자 등 구성"
                    /><span class="btn btn-warning btn-sm" onclick="isValidId()"
                      >아이디 확인</span
                    >
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
                      placeholder="8자리 이상의 알파벳 대.소문자와 특수문자,숫자 포함하여 구성"
                    />
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <div
                      style="
                        display: flex;
                        justify-content: center;
                        align-items: center;
                      "
                    >
                      <div id="pwdCheck">비밀번호 확인</div>
                      <span id="pwdMsg"></span>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <input
                      type="password"
                      class="joinInput"
                      name="pwd2"
                      id="pwd2"
                      placeholder="비밀번호를 한번 더 입력해 주세요"
                    />
                  </td>
                </tr>
                <tr>
                  <td colspan="2">이메일</td>
                </tr>
                <tr>
                  <td>
                    <input type="hidden" name="email" id="email" />
                    <input
                      type="text"
                      class="joinInput"
                      style="width: 80%"
                      name="emailId"
                      id="emailId"
                      placeholder="이메일 주소 입력 "
                    />
                  </td>
                  <td style="display: flex">
                    @<input
                      type="text"
                      class="joinInput"
                      style="width: 50%"
                      name="emailDomain"
                      id="emailDomain"
                      placeholder="도메인 입력"
                    />
                    <select
                      style="width: 50%"
                      class="form-select"
                      onclick="setDomain(this.value)"
                    >
                      <option value="" selected>도메인 선택</option>
                      <option value="naver.com">naver.com</option>
                      <option value="gmail.com">gmail.com</option>
                      <option value="nate.com">nate.com</option>
                      <option value="hanmail.net">hanmail.net</option>
                      <option value="">직접 입력</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">닉네임</td>
                </tr>
                <tr>
                  <td colspan="2">
                    <input
                      type="text"
                      class="joinInput"
                      name="nick"
                      style="width: 80%"
                      placeholder="4~16자리의 한글,알파벳,숫자,특수문자 등으로 구성"
                    /><span
                      class="btn btn-warning btn-sm"
                      onclick="isValidNick()"
                      >닉네임 확인</span
                    >
                  </td>
                </tr>
                <tr></tr>
                <tr>
                  <td colspan="2" style="padding-top: 10px">
                    <button style="width: 90%">Sign up</button>
                  </td>
                </tr>
              </table>
            </div>
          </form>
          <div class="form-section">
            <p>Have an account? <a href="${root}/member/logIn">Log in</a></p>
          </div>
        </div>
      </div>

      <%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>
    </div>
  </body>
</html>
<script>
  var isIdValidated = false; // 아이디 유효성 확인 여부
  var isNickValidated = false; // 닉네임 유효성 확인 여부
  var isPwdValidated = false; // 비밀번호 유효성 확인 여부

  //아이디 유효성 검사
  function isValidId() {
    var id = document.querySelector('input[name="id"]').value;
    var idPattern = /^[a-zA-Z0-9]{4,12}$/;
    if (id == "") {
      alert("아이디를 입력하세요.");
    } else if (idPattern.test(id)) {
      $.ajax({
        url: "${root}/member/idDupChk",
        type: "get",
        data: { id: id },
        success: function (response) {
          if (response === "duplicate") {
            alert("중복된 아이디 입니다. 다른 아이디를 입력해 주세요.");
          } else {
            validId();
          }
        },
        error: function (response) {
          console.log(response);
        },
      });
    } else {
      alert(
        "아이디가 유효하지 않습니다.지정된 형식[4~12자리의 알파벳 대.소문자와 숫자 등 구성]을 확인해 주세요"
      );
    }
  }
  function validId() {
    alert("사용가능한 아이디 입니다.");
    isIdValidated = true;
  }
  //비밀번호 일치 확인, 유효성 검사
  function pwdValidChk() {
    var pwd = $("#pwd").val();
    var pwd2 = $("#pwd2").val();
    var passwordPattern =
      /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,20}$/; //비밀번호 정규식 패턴
    // 입력값 비교 함수 + 입력한 두 비밀번호 일치 시 정규식 테스트 후 isPwsValidated = true or false;
    var message = $("#pwdMsg");
    var pwdCheck = $("#pwdCheck");
    if (pwd == pwd2) {
      pwdCheck.css("display", "none");
      message.text("비밀번호가 일치합니다.").css("color", "blue");
      if (passwordPattern.test(pwd2)) {
        isPwdValidated = true;
      } else {
        message
          .html(
            "비밀번호 형식이 유효하지 않습니다.<br>8자리 이상의 알파벳 대/소문자와 특수문자, 숫자를 포함하여 구성"
          )
          .css("color", "red");
        isPwdValidated = false;
      }
    } else {
      pwdCheck.css("display", "none");
      message.text("비밀번호가 일치하지 않습니다.").css("color", "red");
    }
    // 비밀번호 입력값이 없을 때 숨깁.
    if (pwd2 === "") {
      message.css("display", "none");
      pwdCheck.css("display", "block");
    } else {
      message.css("display", "block");
      pwdCheck.css("display", "none");
    }
  }
  // 두 비밀번호를 입력할 때마다 비교 함수를 호출.
  $("#pwd, #pwd2").on("input", pwdValidChk);

  //닉네임 유효성 검사
  function isValidNick() {
    var nickName = document.querySelector('input[name="nick"]').value;
    console.log(nickName);
    var nickPattern =
      /^[가-힣a-zA-Z0-9!@#$%^&*()\-_=+{}[\]\\|;:'",.<>/?]{4,16}$/;
    if (nickName == "") {
      alert("닉네임을 입력하세요.");
    } else if (nickPattern.test(nickName)) {
      $.ajax({
        url: "${root}/member/nickDupChk",
        type: "get",
        data: { nick: nickName },
        success: function (response) {
          // 중복유무 출력(result == 1: 사용가능, 아니면 사용불가)
          if (response === "duplicate") {
            alert("중복된 닉네임 입니다. 다른 닉네임을 입력해 주세요.");
          } else {
            validNick();
          }
        },
        error: function (response) {
          console.log(response);
        },
      });
    } else {
      alert(
        "닉네임이 유효하지 않습니다.지정된 형식[4~16자리의 한글,알파벳,숫자,특수문자 등으로 구성]을 확인해 주세요"
      );
    }
  }
  function validNick() {
    alert("사용가능한 닉네임 입니다.");
    isNickValidated = true;
  }
  //이메일 도메인 넘어가게
  function setDomain(domain) {
    $("#emailDomain").val(domain);
  }

  //전체 유효성 검사
  function checkValidation() {
    var pwd = $("#pwd").val();
    var pwd2 = $("#pwd2").val();
    var emailPattern =
      /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,}$/;
    var emailId = $("#emailId").val();
    var emailDomain = $("#emailDomain").val();
    var email = "";
    if (!pwd || !pwd2) {
      alert("비밀번호를 입력해 주세요");
      return false;
    }
    if (pwd !== pwd2) {
      alert("비밀번호가 일치하지 않습니다.");
      console.log("pwd : " + pwd + "pwd2 :" + pwd2);
      return false;
    }
    if (!emailId) {
      console.log(emailId);
      alert("이메일을 입력해주세요");
      $("#emailId").focus();
      return false;
    }
    if (!emailDomain) {
      alert("도메인을 입력해주세요");
      $("#emailDomain").focus();
      return false;
    }
    email = emailId + "@" + emailDomain;
    $("#email").val(email);
    console.log(email);

    if (!emailPattern.test(email)) {
      alert("이메일을 형식에 맞게 입력해주세요.");
      return false;
    }
    if (!isIdValidated || !isNickValidated) {
      alert("아이디 확인 또는 닉네임 확인 버튼을 눌러 확인해 주세요");
      return false;
    }
    if (!isPwdValidated) {
      alert(
        "비밀번호 형식에 유효하지 않습니다.지정된 형식[8자리 이상의 알파벳 대.소문자와 특수문자 포함하여 구성]을 확인해 주세요"
      );
      return false;
    }
    return true;
  }

  //집가서 할거, 회원가입완료후 메인 페이지로 전환하고 모달로 회원가입 축하 메시지 보내기 + 로그인 기능. + 마이페이지
</script>
