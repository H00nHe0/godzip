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
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-left: 300px;
      }
      #withdrawalAccount-button {
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

      #withdrawalAccount:hover {
        background-color: #005ce6;
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
      table tr td {
        padding-top: 5px;
      }
      table tr th {
        padding-top: 10px;
        padding-bottom: 10px;
      }
      .form-check {
        display: inline-block;
        text-align: right;
        justify-content: center;
        margin-right: 10px;
      }
      .withdrawalForm {
        display: none;
        position: fixed;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
      }
      #deleteForm {
        background-color: white;
        width: 400px;
        height: 200px;
        padding: 20px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
      }
      #deleteForm input {
        width: 80%;
        border-radius: 10px;
        height: 40px;
      }
      #withdrawal-btn {
        width: 60%;
        background-color: red;
      }
      #closeForm-btn {
        width: 60%;
      }
    </style>
  </head>
  <body>
    <div id="wrap">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <script type="script" defer src="${root}/resources/js/main.js"></script>
      <div>
        <h2>${mvo.nick}님의 방문에 감사드립니다.</h2>
      </div>

      <div id="joinForm-area">
        <div class="form-box">
          <form
            class="form"
            action="${root}/member/editInfo"
            method="post"
            onsubmit="return checkValidation();"
          >
            <span class="title"
              >회원 정보 수정
              <button
                type="button"
                id="withdrawalAccount"
                onclick="withdrawal()"
              >
                회원탈퇴하기
              </button></span
            >
            <!-- 회원 탏퇴 form -->
            <div class="form-container withdrawalForm">
              <table id="deleteForm">
                <tr>
                  <th colspan="2">회원 탈퇴를 위한 비밀번호를 입력해 주세요</th>
                </tr>
                <tr>
                  <td colspan="2">
                    <input
                      type="password"
                      id="lastPwdChk"
                      placeholder="비밀번호 입력"
                    />
                  </td>
                </tr>
                <tr>
                  <td style="width: 50%">
                    <button
                      type="button"
                      id="withdrawal-btn"
                      onclick="deleteMember()"
                    >
                      탈퇴하기
                    </button>
                  </td>
                  <td>
                    <button
                      type="button"
                      id="closeForm-btn"
                      onclick="closeForm()"
                    >
                      취소하기
                    </button>
                  </td>
                </tr>
              </table>
            </div>
            <span class="subtitle">Share , Check reviews and Choose!</span>
            <div class="form-container">
              <table id="joinInputTable">
                <tr>
                  <th colspan="2">아이디</th>
                </tr>
                <tr>
                  <td colspan="2">
                    <input
                      type="text"
                      class="joinInput my-1 text-center fs-6 fw-bold"
                      readonly
                      value="${mvo.id}"
                    />
                  </td>
                </tr>
                <tr>
                  <th colspan="2">
                    변경할 비밀번호
                    <span class="form-check">
                      <input type="hidden" id="pwd" name="pwd" />
                      <input
                        type="checkbox"
                        id="noPwdUpdate"
                        name="noPwdUpdate"
                        value="${mvo.pwd}"
                        checked
                      />
                      <label class="form-check-label" for="noPwdUpdate"
                        >기존 비밀번호 사용</label
                      >
                    </span>
                  </th>
                </tr>
                <tr>
                  <td colspan="2">
                    <input
                      type="password"
                      class="joinInput"
                      name="pwd1"
                      id="pwd1"
                      placeholder="8자리 이상의 알파벳 대.소문자와 특수문자 포함하여 구성"
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
                      <div class="my-1 text-center fs-6 fw-bold" id="pwdCheck">
                        비밀번호 확인
                      </div>
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
                      onkeyup="pwdValidChk()"
                      placeholder="비밀번호를 한번 더 입력해 주세요"
                    />
                  </td>
                </tr>
                <tr>
                  <th colspan="2">
                    이메일
                    <span class="form-check">
                      <input
                        type="checkbox"
                        id="noEmailUpdate"
                        name="noEmailUpdate"
                        value="${mvo.email}"
                        checked
                      />
                      <label class="form-check-label" for="noEmailUpdate"
                        >기존 이메일주소 사용</label
                      >
                    </span>
                  </th>
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
                      placeholder="이메일아이디입력"
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
                  <th colspan="2">
                    닉네임
                    <span class="form-check">
                      <input type="hidden" id="nick" name="nick" />
                      <input
                        type="checkbox"
                        id="noNickUpdate"
                        name="noNickUpdate"
                        value="${mvo.nick}"
                        checked
                      />
                      <label class="form-check-label" for="noNickUpdate"
                        >기존 닉네임 사용</label
                      >
                    </span>
                  </th>
                </tr>
                <tr>
                  <td colspan="2">
                    <input
                      type="text"
                      class="joinInput"
                      name="nickname"
                      id="nickname"
                      style="width: 80%"
                      placeholder="${mvo.nick}"
                    /><span
                      class="btn btn-warning btn-sm"
                      onclick="isValidNick()"
                      >닉네임 확인</span
                    >
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <button type="button" style="width: 90%">
                      회원 정보 변경하기
                    </button>
                  </td>
                </tr>
              </table>
            </div>
          </form>
        </div>
      </div>
      <%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>
    </div>
  </body>
</html>
<script>
  var isNickValidated = false; // 닉네임 유효성 확인 여부
  var isPwdValidated = false; // 비밀번호 유효성 확인 여부
  var isEmailValidated = false; // 이메일 유효성 확인 여부
  const registeredEmail = document.querySelector(
    'input[name="noEmailUpdate"]'
  ).value;
  var [emailId, emailDomain] = registeredEmail.split("@");
  const registeredPwd = document.querySelector(
    'input[name="noPwdUpdate"]'
  ).value;
  const registeredNick = document.querySelector(
    'input[name="noNickUpdate"]'
  ).value;
  $(document).ready(function () {
    // 화면 로드시 인풋 태그들 비활성화
    disableInputFields();
    // placeholder로 설정.
    $("#emailId").attr("placeholder", emailId);
    $("#emailDomain").attr("placeholder", emailDomain);

    // 기본적으로 체크되어 있기 때문에 기존 정보를 사용하도록 설정
    $("#noPwdUpdate").prop("checked", true);
    $("#noEmailUpdate").prop("checked", true);
    $("#noNickUpdate").prop("checked", true);

    $("#pwd1").val(registeredPwd);
    $("#pwd2").val(registeredPwd);
    // 체크박스 클릭 시 기존 정보 사용/사용 안 함 설정
    $("#noPwdUpdate").on("click", function () {
      // 체크되지 않았을 때만 비밀번호 입력 필드 활성화
      if (!this.checked) {
        $("#pwd1").prop("disabled", false);
        $("#pwd2").prop("disabled", false);
      } else {
        $("#pwd1").val(registeredPwd);
        console.log(registeredPwd);
        $("#pwd2").val(registeredPwd);
        $("#pwd1").prop("disabled", true);
        $("#pwd2").prop("disabled", true);
        isPwdValidated = true;
      }
    });

    $("#noEmailUpdate").on("click", function () {
      // 체크되지 않았을 때만 이메일 입력 필드 활성화
      if (!this.checked) {
        $("#emailId").prop("disabled", false);
        $("#emailDomain").prop("disabled", false);
      } else {
        // 체크되어 있으면 다시 기존 이메일 정보로 설정
        $("#emailId").val(emailId);
        $("#emailDomain").val(emailDomain);
        $("#emailId").prop("disabled", true);
        $("#emailDomain").prop("disabled", true);
      }
    });

    $("#noNickUpdate").on("click", function () {
      if (!this.checked) {
        $("#nickname").prop("disabled", false);
      } else {
        // 체크되어 있으면 다시 기존 이메일 정보로 설정
        $("#nickname").val(registeredNick);
        console.log(registeredNick);
        $("#nickname").prop("disabled", true);
      }
    });
  });

  function disableInputFields() {
    $("#pwd1").prop("disabled", true);
    $("#pwd2").prop("disabled", true);
    $("#emailId").prop("disabled", true);
    $("#emailDomain").prop("disabled", true);
    $("#nickname").prop("disabled", true);
  }

  //체크박스 체크안하고 비밀번호 변경시 비밀번호 일치 확인, 유효성 검사(화면)
  function pwdValidChk() {
    var pwd1 = $("#pwd1").val();
    var pwd2 = $("#pwd2").val();
    var passwordPattern =
      /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,20}$/; //비밀번호 정규식 패턴
    // 입력값 비교 함수 + 입력한 두 비밀번호 일치 시 정규식 테스트 후 isPwsValidated = true or false;
    var pwdCheck = $("#pwdCheck");
    var message = $("#pwdMsg");

    if (pwd1 == pwd2) {
      pwdCheck.css("display", "none");
      message.text("비밀번호가 일치합니다.").css("color", "blue");
      if (passwordPattern.test(pwd2)) {
        document.querySelector('input[name="pwd"]').value = pwd2;
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

  // 두 비밀번호가 입력할 때마다 비교 함수를 호출.
  $("#pwd1, #pwd2").on("input", pwdValidChk);

  //닉네임 유효성 검사
  function isValidNick() {
    var nickName = document.querySelector('input[name="nickname"]').value;
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
        success: function (result) {
          // 중복유무 출력(result == 1: 사용가능, 아니면 사용불가)
          if (result === 0) {
            alert("중복된 닉네임 입니다. 다른 닉네임을 입력해 주세요.");
          } else {
            validNick();
          }
        },
        error: function (result) {
          console.log(result);
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
    document.querySelector('input[name="nick"]').value = document.querySelector(
      'input[name="nickname"]'
    ).value;
    alert(document.querySelector('input[name="nick"]').value);
    isNickValidated = true;
  }
  //이메일 도메인 넘어가게
  function setDomain(domain) {
    $("#emailDomain").val(domain);
  }

  //전체 유효성 검사
  function checkValidation() {
    var pwd1 = $("#pwd1").val();
    var pwd2 = $("#pwd2").val();
    var password = document.querySelector('input[name="pwd"]');
    var emailPattern =
      /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,}$/;
    var emailId = $("#emailId").val();
    var emailDomain = $("#emailDomain").val();
    var email = document.querySelector('input[name="email"]');
    var nick = document.querySelector('input[name="nick"]');

    if (!pwd1 || !pwd2 || pwd2 == null) {
      alert("비밀번호를 입력해 주세요");
      return false;
    }
    if (!(pwd1 == pwd2)) {
      alert("비밀번호가 일치하지 않습니다.");
      return false;
    }
    if (!isPwdValidated && !$("#noPwdUpdate").prop("checked")) {
      // 기존 비밀번호를 사용하는 체크박스가 체크되어 있지않고 비번유료성도 적합하지 않을때
      alert(
        "비밀번호 형식에 유효하지 않습니다.지정된 형식[8자리 이상의 알파벳 대.소문자와 특수문자 포함하여 구성]을 확인해 주세요"
      );
      return false;
    }
    if ($("#noPwdUpdate").prop("checked")) {
      password.value = registeredPwd;
      alert(document.querySelector('input[name="pwd"]').value);
      isNickValidated = true;
    }
    if ((!emailId || !emailDomain) && $("#noEmailUpdate").prop("checked")) {
      // 기존 이메일을 사용하는 체크박스가 체크되어 있고, 입력 필드에 값이 없으면 기존 이메일 정보 사용
      email.value = registeredEmail;
      isEmailValidated = true;
    } else {
      email.value = emailId + "@" + emailDomain;
      alert(email.value);
      isEmailValidated = true;
      if (!emailPattern.test(email.value)) {
        alert("이메일을 형식에 맞게 입력해주세요.");
        return false;
      }
    }
    if (!isEmailValidated) {
      alert("이메일을 확인해 주세요");
      return false;
    }
    if ($("#noNickUpdate").prop("checked")) {
      nick.value = registeredNick;
      alert(document.querySelector('input[name="nick"]').value);
      isNickValidated = true;
    } else if (
      (!$("#noNickUpdate").prop("checked") || !isNickValidated) &&
      !nick.value
    ) {
      alert("닉네임을 확인버튼을 눌러주세요");
      return false;
    } else if (!$("#noNickUpdate").prop("checked") && !nick.value) {
      alert("닉네임을 입력해 주세요");
      return false;
    }
    alert(password.value + nick.value + email.value);
    return true;
  }

  //회원탈퇴 
  var deleteForm = document.querySelector(".withdrawalForm");
  var inputPwd = document.querySelector("#lastPwdChk");
  function withdrawal() {
    if (window.confirm("정말로 탈퇴 하시겠습니까?")) {
      openPasswordPopup();
    }
  }
  function openPasswordPopup() {
    deleteForm.style.display = "block";
  }
  function closeForm() {
    inputPwd.value = "";
    deleteForm.style.display = "none";
  }
  //탈퇴 비번창 떳을때 엔터치면 함수실행(기존 엔터시 form제출은 button type='button'으로 방지)
  document
    .querySelector("#lastPwdChk")
    .addEventListener("keyup", function (event) {
      if (event.key === "Enter") {
        deleteMember();
      }
    });
  function deleteMember() {
    const password = inputPwd.value;
    console.log(password);
    if (password === "") {
      alert("회원 탈퇴를 위한 비밀번호를 입력해주세요");
    } else {
      $.ajax({
        url: "${root}/member/withdrawalPwdChk",
        type: "POST",
        data: { pwd: password },
        dataType: "text",
        success: function (result) {
          if (result === "success") {
            alert("회원 탈퇴 성공!");
            window.location.href = "${root}/home";
          } else {
            alert("회원탈퇴 실패.. 비밀번호를 확인해 주세요");
          }
        },
        error: function (error) {
          console.error("서버 통신실패", error);
        },
      });
    }
  }
</script>
