<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.util.Map" %>
<c:set var="path2" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            width: 80%;
            margin: 0 auto;
        }
        .review-header {
            
            margin-top: 20px;
        }
        .review-header h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }
        .overall-rating {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
            padding: 10px 0;
            border-bottom: 1px solid #ccc;
        }
        .individual-rating {
            display: flex;
            flex-direction: column; /* Change flex direction to column */
            justify-content: space-between;
            margin: 20px 0;
            padding-right: 20px; /* Add padding to the right */
            border-right: 1px solid #ccc; /* Add right border to create a separator */
        }
        .individual-rating .bar-container {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .bar-container {width: 340px;}

        .individual-rating .bar {
            height: 10px;
            background-color: #ccc;
            margin-left: 10px;
            border-radius: 5px;
            width: 200px;
            position: relative;
        }
        .individual-rating .bar span {
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            background-color: #ffcc00;
            border-radius: 5px;
        }
        .total-rating {
            width: 321px;
            margin-left: 30px;
            display: flex;
            align-items: center;
            padding-left: 20px; /* Add padding to the left */
        }
        .total-rating h2 {
            margin: 0; padding: 0;
        }
        .total-rating .rating-details {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .reviews {
            margin-top: 20px;
        }
        .review {
            border-bottom: 1px solid #ccc;
            padding: 10px 0;
        }
        .review .review-title {
            display: flex;
            align-items: center;
            display: block;
        }
        .review .review-title .stars {
            display: flex;
            align-items: center;
        }
        .review .review-title .stars span {
            font-size: 18px;
        }
        .review .review-title .date {
            color: #999;
            font-weight: 600;
        }
        .review .review-content {
            margin-top: 10px;
        }
        .review .review-images {
            display: flex;
            margin-top: 10px;
        }
        .review .review-images img {
            width: 60px;
            height: 60px;
            margin-right: 10px;
            background-color: #ccc;
        }
        .pagination {
            text-align: center;
            margin-top: 20px;
        }
        .pagination a {
            margin: 0 5px;
            text-decoration: none;
            color: #000;
        }
        
        .recontent {border: none;
            border-bottom: 1px solid #333;
            margin-top: 15px;
            width: 60%; 
            font-size: 15px;
            font-weight: 600;
        }

        .rebtn1 {border: none; 
            background-color: #fff; 
            cursor: pointer;
        }

        #id {display: block;
            margin: 5px 0px;
        }
        .score-wrapper { position: relative; }
        .score { position: relative; display: inline-flex;}
        .foreground { overflow: hidden; width: 0%; color: gold; margin: 0; cursor: pointer; }
        .background { position: absolute; color: gold; margin: 0; cursor: pointer;}
        
        .sfavg { overflow: hidden; width: 0%; color: gold; margin: 0; }
        .sbavg { position: absolute; color: gold; margin: 0;}
        
        .s1favg { overflow: hidden; width: 0%; color: gold; margin: 0; }
        .s1bavg { position: absolute; color: gold; margin: 0;}

        .popup { display: none; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); padding: 20px; border: 1px solid #333; background: #fff; }
        .overlay { display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5); }
    
    	.review-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .align-right {
            margin-left: auto;
        }
        
        /* 수정 창 스타일 */
		.edit-popup {
		    display: none; /* 기본적으로 숨김 */
		    position: fixed; 
		    z-index: 9999; 
		    left: 0;
		    top: 0;
		    width: 100%;
		    height: 100%;
		    overflow: auto;
		    background-color: rgba(0, 0, 0, 0.4);
		}
		
		.edit-popup-content {
		    background-color: #fefefe;
		    margin: 15% auto; 
		    padding: 20px;
		    border: 1px solid #888;
		    width: 80%; 
		    max-width: 500px; 
		    border-radius: 10px; 
		}
		
		.close {
		    color: #aaa;
		    float: right;
		    font-size: 28px;
		    font-weight: bold;
		}
		
		.close:hover,
		.close:focus {
		    color: black;
		    text-decoration: none;
		    cursor: pointer;
		}
		
		.edit-popup-content p {
		    font-size: 20px;
		    margin-bottom: 10px;
		}
		
		.edit-popup-content input,
		.edit-popup-content textarea {
		    width: 100%;
		    padding: 10px;
		    margin: 10px 0;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		    font-size: 16px;
		}
		
		.edit-popup-content button {
		    background-color: #4CAF50;
		    color: white;
		    border: none;
		    padding: 10px 20px;
		    border-radius: 5px;
		    cursor: pointer;
		    font-size: 16px;
		}
		
		.edit-popup-content button:hover {
		    background-color: #45a049;
		}
    </style>
</head>
<body>
	<div class="container">
        <div class="review-header" style="text-align: center;">
            <h1>REVIEW</h1>
        </div>
        <div class="overall-rating">
            <div class="individual-rating">
		        <c:forEach var="star" items="${starAll}">
		            <div class="bar-container">
		                <span>${star.ratingRange}</span>
		                <div class="bar">
		                    <span style="width: ${star.percentage}%"></span>
		                </div>
		                <span>${star.count}</span>
		            </div>
		        </c:forEach>
		    </div>
        
            <div class="total-rating">
                <div style="text-align: center;">
                    <p style="margin-bottom: 5px; margin-top: 0px;">전체 평점</p>
                    <h2 class="pavg" style="font-size: 35px;">${avgStar}</h2>
                </div>
                <div class="rating-details" style="margin-left: 30px;">
                    <div class="score">
                        <p class="sfavg">★★★★★</p>
                        <p class="sbavg">☆☆☆☆☆</p>
                    </div>
                    <span>${replyCount}개 리뷰</span>
                </div>
            </div>
        </div>
        <c:if test="${!empty sid}">
        <form id="commentForm" action="${path2 }/reply/insReply.do" method="post" enctype="multipart/form-data">
	            <div class="overlay" id="overlay"></div>
	            <div class="popup" id="popup">
	                <p>평점을 입력하세요:</p>
	                <input type="number" id="ratingInput" name="star" min="0" max="5" step="0.1">
	                <button onclick="submitRating()">제출</button>
	            </div>
	            <div class="review-header">
	                <p>리뷰 작성하기</p>
	                <input type="hidden" name="pno" id="pno" value="1"> <!-- 상품 번호를 포함 -->
				    <input type="hidden" name="nno" id="nno" value="0"> <!-- 기본 댓글이므로 대댓글 번호는 0 -->
				    <input type="hidden" name="depth" id="depth" value="0"> <!-- 기본 댓글이므로 깊이는 0 -->
	                <div class="stars">
	                    <div class="score-wrapper">
	                        <div class="score" id="starRating">
	                            <p class="foreground" style="font-size: 25px; cursor: pointer;">★★★★★</p>
	                            <p class="background" style="font-size: 25px; cursor: pointer;">☆☆☆☆☆</p>
	                        </div>
	                        <span class="point" style="font-size: 25px;">평점</span>
	                    </div>
	                </div>
	                <input style="height: 30px;" class="recontent" id="content" name="content" type="text" placeholder="리뷰를 작성해주세요.">
	                <button class="rebtn1" id="rebtn1"><img style="width: 20px; height: 20px;" src="${path2}/resources/imgs/login/move_9743734.png" alt=""></button>
	                <input type="file" id="fileInput" multiple="multiple" style="display: none;">
	                <button class="rebtn2" id="rebtn2" onclick="commentWrite()" >등록</button>
	            </div>
        </form>
        </c:if>
        <c:forEach var="reply" items="${list }" varStatus="status" begin="0">
	        <div class="reviews" data-rno="${reply.rno}">
	            <div class="review">
	                <div class="review-title">
	                <div class="stars">
                        <div class="score">
	                        <p class="s1favg" style="font-size: 20px;">★★★★★</p>
	                        <p class="s1bavg" style="font-size: 20px;">☆☆☆☆☆</p>
	                    </div>
                        <h4 class="pavg1" id="yrestar" style="margin:0px;">${reply.star}</h4>
                    </div>
	                    <span id="id">${reply.id}</span>
	                    <div class="date">${reply.resdate}</div>
	                </div>
	                <div class="review-content">
	                	<span id="yrecon">${reply.content}</span>
	                	<c:if test="${sid == reply.id}">
		                	<div class="align-right">
		                        <button class="editButton" onclick="openEditPopup(${reply.rno})">수정</button>
		                        <button class="deleteButton" style="margin-left: 10px;">삭제</button>
		                    </div>
	                    </c:if>
	                <div id="editPopup" class="edit-popup">
					    <div class="edit-popup-content">
					        <span class="close" onclick="closeEditPopup()">&times;</span>
					        <p>댓글 수정하기</p>
					        <input type="number" id="editRatingInput" name="star" min="0" max="5" step="0.1" placeholder="별점 입력">
					        <textarea id="editContent" name="content" rows="4" placeholder="내용 수정"></textarea>
					        <button type="button" onclick="submitEdit(${reply.rno})">수정 완료</button>
					    </div>
					</div>    
	                </div>
	                <div class="review-images">
	                    ${reply.img1}
	                    ${reply.img2}
	                    ${reply.img3}
	                </div>
	            </div>
	        </div>
        </c:forEach>
        <div class="pagination">
            <a href="#">&laquo;</a>
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#">&raquo;</a>
        </div>
    </div>
    <script>
	    $(document).ready(function() {
	        const avgStar = $(".pavg").text(); 
	        const max = 5;
	        const percent = (avgStar / max) * 100;
	        $(".rating-details").find(".sfavg").css("width", percent + "%");
	    });
	    
	    // each 각각의 요소를 순회하며 주어진 함수를 실행 ,즉, 선택된 여러 요소를 하나씩 처리할 때 사용
	    $(document).ready(function() {
	        $(".reviews").each(function() {
	            const avgStar1 = $(this).find(".pavg1").text();
	            const max = 5;
	            const percent = (avgStar1 / max) * 100;
	            $(this).find(".s1favg").css("width", percent + "%");
	        });
	    });
	    
	  /*  이거는 모든 요소를 다 반복하면서 처리해서 오류 발생함 ㅗ fuck 
	  $(document).ready(function() {
	        const avgStar1 = $(".pavg1").text(); 
	        const max = 5;
	        const percent = (avgStar1 / max) * 100;
	        $(".stars").find(".s1favg").css("width", percent + "%");
	    }); */
    
	    $(document).ready(function() {
	        $('.deleteButton').on('click', function() {
	            const rno = $(this).closest('.reviews').data('rno');

	            if (confirm('댓글을 삭제하시겠습니까?')) {
	                $.ajax({
	                    type: 'POST',
	                    url: '${path2}/reply/delReply.do',
	                    data: { "rno" : rno },
	                    success: function(response) {
	                        console.log('삭제 성공:', response);
	                        // 삭제 후 페이지 리로드 또는 다른 동작 수행
	                        location.reload();
	                    },
	                    error: function(xhr, status, error) {
	                        console.error('삭제 실패:', error);
	                    }
	                });
	            }
	        });
	    });
	    
	 // 수정 창 열기 함수
	    function openEditPopup(currentContent, currentRating,rno) {
		    // 수정 창을 열 때 가져온 내용과 별점을 해당 입력 필드에 설정합니다.
		    currentRno = rno;
		    document.getElementById('editPopup').style.display = 'block';
		    document.getElementById('editContent').value = currentContent;
		    document.getElementById('editRatingInput').value = currentRating;
		}
		
		// 수정 버튼 클릭 시 해당 댓글의 내용과 별점을 가져와 수정 팝업을 열도록 설정
		$(".editButton").click(function() {
			// 해당 수정 버튼이 속한 댓글 요소를 찾습니다.
		    const reviewElement = $(this).closest('.reviews');
		    // 댓글 요소에서 rno 값을 가져옵니다.
		    const rno = reviewElement.data('rno');
		    const currentContent = $(this).closest('.review-content').find('#yrecon').text();
		    const currentRating = $(this).closest('.review').find('.pavg1').text();
		    openEditPopup(currentContent, currentRating);
		});

	    // 수정 창 닫기 함수
	    function closeEditPopup() {
	        document.getElementById('editPopup').style.display = 'none';
	    }

	    // 수정 제출 함수
	    function submitEdit(rno,count) {
		    const updatedContent = document.getElementById('editContent').value;
		    const updatedRating = document.getElementById('editRatingInput').value;
			
		    
		    // AJAX 요청 예시
		    $.ajax({
		        type: 'POST',
		        url: '${path2}/reply/upReply.do',
		        data: {
		            rno: rno,
		            content: updatedContent,
		            star: updatedRating,
		        },
		        success: function(response) {
		            alert("댓글 수정에 성공했습니다.");
		            location.reload();
		
		            // 수정 완료 후 수정 창 닫기
		            closeEditPopup();
		
		            // DOM 업데이트
		            
		            
		            
		            const reviewElement = document.querySelector(`.reviews[data-rno='${rno}']`);
		            if (reviewElement) {
		                reviewElement.querySelector('#yrecon').textContent = updatedContent;
		                reviewElement.querySelector('#yrestar').textContent = updatedRating;
		            }
		        },
		        error: function(xhr, status, error) {
		            alert("댓글 수정에 실패했습니다.");
		            console.error("댓글 수정 실패:", error);
		        }
		    });
		}
	    
	 
	    
	    
        function updateRating(rate) {
            const max = 5;
            const percent = (rate / max) * 100;
            $(".score-wrapper").find(".foreground").css("width", percent + "%");
            $(".score-wrapper").find(".point").text(rate);
        }

        //jquery를 이용한 show/hide 
        function openPopup() {
            $("#overlay").show();
            $("#popup").show();
        }

        function closePopup() {
            $("#overlay").hide();
            $("#popup").hide();
        }

        $("#starRating").click(function() {
            openPopup();
        });

        $("#overlay").click(function() {
            closePopup();
        });
        
        
        

        function submitRating() {
            event.preventDefault(); // form태그 안에서 새로고침 막는 용도
            const rate = parseFloat($("#ratingInput").val());
            if (!isNaN(rate) && rate >= 0 && rate <= 5) { //!isNaN 숫자인지 아닌지 검사
                updateRating(rate);
                closePopup();
            } else {
                alert("유효한 평점을 입력하세요 (0-5 사이).");
            }
        }

        /*
        function commentWrite() {
            // 파일 업로드를 위한 FormData 객체를 생성
            const formData = new FormData();
            formData.append('pno', document.getElementById('pno').value);
            formData.append('nno', document.getElementById('nno').value);
            formData.append('depth', document.getElementById('depth').value);
            formData.append('star', document.getElementById('ratingInput').value);
            formData.append('content', document.getElementById('content').value);

            // 파일이 선택되었다면 FormData에 추가
            const fileInput = document.getElementById('fileInput');
            if (fileInput.files.length > 0) {
                for (let i = 0; i < fileInput.files.length; i++) {
                    formData.append('files', fileInput.files[i]);
                }
            }
            $.ajax({
                type: "POST",
                url: "${path2}/reply/insReply.do",
                data: formData,
                contentType: false,
                processData: false,
                success: function(response) {
                	alert("댓글 등록에 성공했습니다.");
                    console.log("파일 등록 성공:", response);
                    
                    // 폼 초기화
                    document.getElementById('commentForm').reset();
                    
                    // 평점 초기화
                    document.getElementById('ratingInput').value = '';
                    
                    // 파일 입력 초기화
                    fileInput.value = '';

                    // 화면 갱신 (필요한 경우, 예를 들어 댓글 목록을 다시 불러오기)
                     reloadComments();
                },
                error: function(xhr, status, error) {
                	alert("댓글 등록에 실패했습니다.");
                    console.error("파일 등록 실패:", error);
                }
            });
        } */
        
      /*  function reloadComments() {
            $.ajax({
                type: "POST",
                url: `${path2}/reply/getComments.do?pno=${document.getElementById('pno').value}`,
                success: function(response) {
                    // 댓글 목록 갱신 코드
                    document.getElementById('commentList').innerHTML = response;
                },
                error: function(xhr, status, error) {
                    console.error("댓글 목록 갱신 실패:", error);
                }
            });
        }  */
       

        document.getElementById("rebtn1").addEventListener("click", function() {
        document.getElementById("fileInput").click();
        });

        document.getElementById("fileInput").addEventListener("change", function() {
            const selectedFile = this.files[0];
            console.log("선택된 파일:", selectedFile);
        });
        
       
       
        
    </script>
</body>
</html>