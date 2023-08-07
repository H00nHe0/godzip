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

      #form-area {
        width: 100%;
      }

      input #pwd2 {
        text-align: left;
      }

      table {
        width: 100%;
      }
      table tr td{
      	padding-top: 5px;
      }
      table tr th{
      	padding-top: 10px;
      	padding-bottom: 10px;
      }      
      .filebox{
      	margin: auto;
      	border: 2px solid gray;
      	height: 200px;
      	width: 200px;
      	vertical-align: middle;
      	padding-top: 50px;
      }
		.filebox .upload-name {
		    display: inline-block;
		    height: 40px;
		    padding: 0 10px;
		    vertical-align: middle;
		    border: 1px solid #dddddd;
		    width: 80%;
		    color: #999999;
		}
		.filebox label {
		    display: inline-block;
		    padding: 10px 20px;
		    color: #fff;
		    vertical-align: middle;
		    background-color: #999999;
		    cursor: pointer;
		    height: 40px;
		    margin-left: 10px;
		}
		.filebox input[type="file"] {
		    position: absolute;
		    width: 0;
		    height: 0;
		    padding: 0;
		    overflow: hidden;
		    border: 0;
		}
			.cta {
			  border: none;
			  background: none;
			}
			
			.cta span {
			  padding-bottom: 7px;
			  letter-spacing: 4px;
			  font-size: 14px;
			  padding-right: 15px;
			  text-transform: uppercase;
			}
			
			.cta svg {
			  transform: translateX(-8px);
			  transition: all 0.3s ease;
			}
			
			.cta:hover svg {
			  transform: translateX(0);
			}
			
			.cta:active svg {
			  transform: scale(0.9);
			}
			
			.hover-underline-animation {
			  position: relative;
			  color: black;
			  padding-bottom: 20px;
			}
			
			.hover-underline-animation:after {
			  content: "";
			  position: absolute;
			  width: 100%;
			  transform: scaleX(0);
			  height: 2px;
			  bottom: 0;
			  left: 0;
			  background-color: #000000;
			  transform-origin: bottom right;
			  transition: transform 0.25s ease-out;
			}
			
			.cta:hover .hover-underline-animation:after {
			  transform: scaleX(1);
			  transform-origin: bottom left;
			}		
			
			#profileInfo{
				padding-top: 10px;
				font-size: 12px;
			}		
		
    </style>
  </head>
  <body>
    <div id="wrap">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <script type="script" defer src="${root}/resources/js/main.js"></script>
	          <div class="form-section">
	            <p class="fs-6 lead">회원 정보 수정을 원하시나요? 
	            <a href="${root}/member/editInfo">
	            	<button class="cta">
					    <span class="hover-underline-animation" style="font-size: 18px;"> click me</span>
					    <svg viewBox="0 0 46 16" height="10" width="30" xmlns="http://www.w3.org/2000/svg" id="arrow-horizontal">
					        <path transform="translate(30)" d="M8,0,6.545,1.455l5.506,5.506H-30V9.039H12.052L6.545,14.545,8,16l8-8Z" data-name="Path 10" id="Path_10"></path>
					    </svg>
					</button>
	            </a>
	            </p>
	          </div>
      <div>
        <h2>마이 페이지</h2>
      </div>

      <div id="form-area">
        <div class="form-box">
          <form
            class="form"
            action="${root}/member/myPage"
            method="post"
            onsubmit="return checkValidation();"
          >
            <span class="title"
              >${mvo.nick}님은
              <span id="gradeName">${mvo.gradeNo}</span> 등급입니다.</span
            >
            <span class="subtitle">Share , Check reviews and Choose!</span>
            <div class="form-container">
              <table>
                <tr>
                  <th class="col-md-6">프로필사진</th>
                  <th class="col-md-6">아이디</th>
                </tr>
                <tr>
                  <td>
					<div class="filebox">
					    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
					    <label for="file">사진 찾기</label> 
					    <input type="file" id="file">
					    <div id="profileInfo">
					    프로필사진은 10mb이하의 jpg,png,gif 형식만 가능합니다.
					    </div>
					</div>
                  </td>
                  <td>
                    <input
                      type="text"
                      class="joinInput my-1 text-center"
                      name="id"
                      value="${mvo.id}"
                      readonly
                    />
                  </td>
                </tr>
                <tr>
                  <th colspan="2">나의 출석 정보</th>
                </tr>
                <tr>
                  <td>
					총~일 출석
                    <input
                    />
                  </td>
                  <td>
					~~일 만 더
                    <input
                    />
                  </td>
                </tr>
                <tr>
                  <th colspan="2">나의 리뷰</th>
                </tr>
                <tr>
                  <td>
					내가 남긴 리뷰
                    <input
                    />
                  </td>
                  <td>
					받은 좋아요
                    <input
                    />
                  </td>
                </tr>
                <tr>
                  <th colspan="2">나의 문의내역</th>
                </tr>
                <tr>
                  <td colspan="2">
                    <input
                      type="text"
                      class="joinInput"
                      name="nick"
                      style="width: 80%"
                      placeholder="4~16자리의 한글,알파벳,숫자,특수문자 등으로 구성"
                    />
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <button style="width: 90%">내가 쓴 리뷰 확인하기</button>
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
 
</script>