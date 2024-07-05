<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path2" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${path2}/resources/css/login.css">
<title>Login</title>

	<style>
		.img:before {
		    content: '';
		    position: absolute;
		    right: 0;
		    top: 0;
		    width: 900px; /* $contW */
		    height: 100%; 
		    background-image: url(${path2}/resources/imgs/login/e2c17eb8fa492366b69bf6c2d0af73a0.jpg);
		    background-size: cover;
		    background-position-y: -50px;
		    transition: transform 1.2s ease-in-out; /* $switchAT */
		}
	</style>
</head>
<body>
	<div class="tab_content">
        <button class="pop_clo"><svg xmlns="http://www.w3.org/2000/svg" height="12px" viewBox="0 -960 960 960" width="12px" fill="#EA3323"><path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"/></svg></button>
          <p class="pop_op" style="text-align: center;
                  cursor: pointer;
                  font-size: 50px;
                  font-weight: 600;
                  margin-top: 20px;
                  margin-bottom: 35px;
                  color: black;"
          >ID / PW 찾기</p>
          
          <input type="radio" name="idpw" id="tab1" checked>
          <label class="rala1" for="tab1">아이디</label>
          <input type="radio" name="idpw" id="tab2">
          <label class="rala2" for="tab2">비밀번호</label>
  
          <div class="conbox con1">
            <form action="">
              <label for="idf">이름 </label>
              <input type="text" name="idf" id="idf1" required><br>
              <label for="idf">주민번호 </label>
              <input type="text" name="idf" id="idf2" required>
              <button type="submit" id="fnext">NEXT</button>
            </form>
          </div>
          <div class="conbox con2">
            <form action="">
              <label for="idf">이름 </label>
              <input type="text" name="idf" id="pwf1" required><br>
              <label for="idf">아이디 </label>
              <input type="text" name="idf" id="pwf2" required>
              <label for="idf">주민번호 </label>
              <input type="text" name="idf" id="pwf3" required>
              <button type="submit" id="fnext1">NEXT</button>
            </form> 
          </div>
      </div>
    <section class="contbox">
        <div class="cont">
            <div class="form sign-in">
                <img class="logo" src="${path2}/resources/imgs/login/SQL LCODE.png" alt="">
                    
                    <form id="accesspanel" name="loginForm" action="${path2 }/member/loginPro.do" method="post">
                        <div class="inset">
                            <p style="text-align: center;">
                                <input class="loginp" type="text" name="lid" id="lid" placeholder="ID를 입력 해주세요.">
                            </p>
                            <p style="text-align: center;">
                                <input class="loginp" type="password" name="lpw" id="lpw" placeholder="PW를 입력 해주세요.">
                            </p>

                            <div class="infofound">
                                <p><a href="">ID 찾기 / PW 찾기</a></p>
                            </div>
                            <p class="p-container">
                                <input type="submit" name="Login" id="go" value="LOGIN">
                            </p>
                    </form>
                       <c:if test="${not empty msg}">
                       <script>alert('${msg}');</script>
                       </c:if>
           	</div>
        </div>
            <div class="sub-cont">
			    <div class="img">
			        <div class="img__text m--up" style="margin-top: 50px;">
			            <h2>New here?</h2>
			            <p>Sign up and discover great amount of new opportunities!</p>
			        </div>
			        <div class="img__text m--in" style="margin-top: 50px;">
			            <h2>One of us?</h2>
			            <p>If you already has an account, just sign in. We've missed you!</p>
			        </div>
			        <div class="img__btn" style="margin-top: 50px;">
			            <span class="m--up">JOIN</span>
			            <span class="m--in">LOGIN</span>
			        </div>
			    </div>
			    <form name="frm1" id="frm1" action="${path2 }/member/joinPro.do" method="post" onsubmit="return joinCheck(this)">
			        <div class="inset">
			            <p>
			                <label class="label" for="id">아이디</label>
			                <input style="margin-bottom: 5px;" type="text" id="id" name="id">
			                <button class="ybtn" type="button" onclick="checkId()">중복검사</button>
			                <input type="hidden" name="idck" id="idck" value="no"/>
			                <c:if test="${empty qid }">
			                <p id="msg1" style="clear:both;padding:0.5rem;margin-left:130px" value=""></p>
			                </c:if>
			            </p>
			            <p>
			                <label for="pw">비밀번호</label>
			                <input type="password" id="pw" name="pw">
			            </p>
			            <p>
			                <label for="pw">비밀번호 확인</label>
			                <input type="password" id="pw2" name="pw2">
			            </p>
			            <p>
			                <label for="name">이름</label>
			                <input type="text" id="name" name="name">
			            </p>
			            <p>
			                <label for="email">이메일</label>
			                <input type="text" id="email" name="email">
			            </p>
			            <p>
			                <label for="tel">연락처</label>
			                <input type="text" id="tel" name="tel">
			            </p>
			            <p>
			                <label for="postcode">우편번호</label>
			                <input type="text" id="postcode" name="postcode">
			                <button class="ybtn" type="button" onclick="searchpostcode()">주소 검색</button>
			            </p>
			            <p>
			                <label for="addr1">주소</label>
			                <input type="text" id="addr1" name="addr1">
			            </p>
			            <p>
			                <label for="addr2">상세주소</label>
			                <input type="text" id="addr2" name="addr2">
			            </p>
			            <p>
			                <label for="birth">생년월일</label>
			                <input type="date" id="birth" name="birth">
			            </p>
			            <p style="font-size: 15px; font-weight: 600;">관심 게임 장르</p>
			            <p>
			                <label style="width: 180px;"><input type="checkbox" name="genre" value="RECORD PLAYERS"> RECORD PLAYERS</label>
			                <label style="width: 180px;"><input type="checkbox" name="genre" value="SPEAKERS"> SPEAKERS</label>
			                <label style="width: 180px;"><input type="checkbox" name="genre" value="RADIOS"> RADIOS</label>
			                <label style="width: 180px;"><input type="checkbox" name="genre" value="CD PLAYERS"> CD PLAYERS</label>
			                <label style="width: 180px;"><input type="checkbox" name="genre" value="CASSETTE PLAYERS"> CASSETTE PLAYERS</label>
			                <label style="width: 180px;"><input type="checkbox" name="genre" value="MEDIA STANDS"> MEDIA STANDS</label>
			                <label style="width: 180px;"><input type="checkbox" name="genre" value="VINYL"> VINYL</label>
			                
			                <input type="hidden" id="tag1" name="tag1">
			                <input type="hidden" id="tag2" name="tag2">
			                <input type="hidden" id="tag3" name="tag3">
			            </p>
			        </div>
			        <p class="p-container">
			            <input type="submit" value="JOIN" onclick="setGenreTags()">
			        </p>
			    </form>
			</div>
    </section>
    <script type="text/javascript">
	    function checkId() {
	    	if($("#id").val()==""){
	            alert("아이디를 입력 해주세요.");
	            $("#id").focus();
	            return;
	    	}
	    	var params = { id : $("#id").val() }
	    	$.ajax({
	    		url: "${path2 }/member/idCheck.do?id="+$("#id").val(),
				type: "get",
				dataType: "json",
				//data : "params",
				success:function(result){
					console.log(result.data);
	                var idChk = result.data;	//true 또는 false를 받음
	                if(idChk == false){	//사용할 수 없는 아이디
	                    $("#idck").val("no");
	                    $("#msg1").html("<strong style='color:red'>이미 사용중인 아이디가 있습니다.</strong>");
	                    $("#id").focus();
	                } else if(idChk == true){	//사용 가능한 아이디
	                    $("#idck").val("yes");
	                    $("#msg1").html("<strong style='color:blue'>사용가능한 아이디 입니다.</strong>");
	                } else if(idck==""){
	                    $("#msg1").html("<strong>아이디가 확인되지 않았습니다. 다시 시도해주시기 바랍니다.</strong>");
	                }
				}
	    	});
	    }
	    
    </script>
    <script src="${path2}/resources/js/login.js"></script>
</body>
</html>