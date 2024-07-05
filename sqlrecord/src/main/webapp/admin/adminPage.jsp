<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path2" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/head.jsp" %>
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<title>관리자 페이지</title>
<style>
.tab-bar {
    width: 100%;
    height: 60px;
    justify-content: center;
    align-items: center;
    display: flex;
    background-color: white;
    border-bottom: 1px solid #2f4f4f;
}
.tab-btnBox {
    width: 80%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}
.tab-btnItem {
    width: 10%;
    height: 100%;
    min-width: 80px;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    cursor: pointer;
    border-right: 1px solid #929292;
    border-left: 1px solid #929292;
}
.tab-btnItem:not(:last-child) { border-right: none; }
.tab-btnItem:first-child { border-left: 1px solid #929292; }
.tab-btnItem:last-child { border-right: 1px solid #929292; }

.tab-btnItem a {
    color: black;
    text-decoration: none;
}
.mainBox {
    width: 1500px;
    min-width: 1200px;
    height: auto;
    border: 1px solid black;
    margin: 0 auto;
    padding: 10px;
    margin-top: 50px;
    margin-bottom: 50px;
    display: flex;
    justify-content: space-between;
}
.manageBox {
    width: 48%;
    height: auto;
    border: 1px solid black;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 10px;
}
.manageBox canvas {
    width: 100% !important;
    height: auto !important;
}
.active {
    background-color: #2f4f4f;
}
.tab-btnItem.active a {
    color: white;
}
.tab-content {
    display: none;
    width: 100%;
}
.sidebar {
	display: block;
	width : 13%;
	height: auto;
	border: 1px solid black;
	padding: 10px;
	text-align:left;
}
.sidebar-element p {
	font-size: 17px;
	padding: 0.5rem 0px;
}
.sidebar a {
    color: inherit;
    text-decoration: none;
}

.sidebar a:hover, .sidebar a:active, .sidebar a:focus {
    color: inherit;  /* 또는 원하는 색상 */
    text-decoration: none;
    font-weight:bold;
}
.sidebar h2 {
	padding-bottom: 0.5rem;
}
.tab-content {
	margin : auto;
	text-align : center;
}
</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<!-- 상단 탭 -->
<div class="tab-bar">
    <ul class="tab-btnBox">
        <li class="tab-btnItem" data-tab="product"><a href="#product">상품</a></li>
        <li class="tab-btnItem" data-tab="order"><a href="#order">주문</a></li>
        <li class="tab-btnItem" data-tab="member"><a href="#member">회원</a></li>
        <li class="tab-btnItem" data-tab="review"><a href="#review">리뷰</a></li>
        <li class="tab-btnItem" data-tab="analytics"><a href="#analytics">통계·분석</a></li>
        <li class="tab-btnItem" data-tab="notice"><a href="#notice">공지사항</a></li>
        <li class="tab-btnItem" data-tab="qna"><a href="#qna">고객지원</a></li>
    </ul>
</div>

<div id="tabContent" class="mainBox"> <!-- ------------------------------------mainBox ------------------------------------>

	<!-- ------------- 상품 탭 ----------------- -->
	<div id="productContent" class="tab-content">
	    <h2>상품 관리</h2>
	    
	    <!-- 사이드바 -->
	    <div class="sidebar" id="productSidebar">
	    	<h2>상품 카테고리</h2>
	    	<div class="sidebar-element">
	    		<p><a href="#">상품 전체</a></p>
	    	</div>
	    	<hr/>
	    	<div class="sidebar-element">
	    		<p><a href="#">TURNTABLES</a></p>
	    	</div>
	    	<hr/>
	    	<div class="sidebar-element">
	    		<p><a href="#">SPEAKERS</a></p>
	    	</div>
	    	<hr/>
	    	<div class="sidebar-element">
	    		<p><a href="#">RADIOS</a></p>
	    	</div>
	    	<hr/>
	    	<div class="sidebar-element">
	    		<p><a href="#">CD PLAYERS</a></p>
	    	</div>
	    	<hr/>
	    	<div class="sidebar-element">
	    		<p><a href="#">CASSETTE PLAYERS</a></p>
	    	</div>
	    	<hr/>
	    	<div class="sidebar-element">
	    		<p><a href="#">MEDIA STANDS</a></p>
	    	</div>
	    	<hr/>
	    	<div class="sidebar-element">
	    		<p><a href="#">VINYLS</a></p>
	    	</div>
	    	<hr/>
	    	<hr/>
	    </div>
	    
	    <!-- 데이터테이블(아코디언) -->

	</div>
	
	<!-- ------------- 주문 탭 ----------------- -->
	<div id="orderContent" class="tab-content">
	    <h2>주문 관리</h2>
	    <!-- 주문 관리 내용 -->
	    <!-- 사이드바 -->
	    <div class="sidebar" id="orderSidebar">
	    	<h2>주문 관리</h2>
	    	<div class="sidebar-element">
	    		<p><a href="#">주문 내역</a></p>
	    	</div>
	    	<hr/>
	    	<div class="sidebar-element">
	    		<p><a href="#">교환 요청</a></p>
	    	</div>
	    	<hr/>
	    	<div class="sidebar-element">
	    		<p><a href="#">환불 요청</a></p>
	    	</div>
	    	<hr/>
	    	<hr/>
	    </div>
	</div>
	
	<!-- ------------- 회원 탭 ----------------- -->
	<div id="memberContent" class="tab-content">
	    <h2>회원 관리</h2>
	    <!-- 회원 관리 내용 -->
	    <div class="sidebar" id="memberSidebar">
	    	<h2>회원 관리</h2>
	    	<div class="sidebar-element">
	    		<p><a href="#">전체 회원</a></p>
	    	</div>
	    	<hr/>
	    	<div class="sidebar-element">
	    		<p><a href="#">탈퇴 회원</a></p>
	    	</div>
	    	<hr/>
	    	<hr/>
	    </div>
	</div>
	
	<!-- ------------- 리뷰 탭 ----------------- -->
	<div id="reviewContent" class="tab-content">
	    <h2>리뷰 관리</h2>
	    <!-- 리뷰 관리 내용 -->
	</div>
	
	<!-- ------------- 통계분석 탭 ----------------- -->
	<div id="analyticsContent" class="tab-content">
	    <h2>통계·분석</h2>
	    	<div>
		       <!-- 첫 번째 차트 -->
		       <canvas id="myChart1"></canvas>
		    </div>
		    <div class="manageBox">
		       <!-- 두 번째 차트 -->
		       <canvas id="myChart2"></canvas>
		    </div> 
	</div>
	
	<!-- ------------- 공지 탭 ----------------- -->
	<div id="noticeContent" class="tab-content">
	    <h2>공지사항 관리</h2>
	    <!-- 공지사항 관리 내용 -->
	</div>
	
	<!-- ------------- QNA 탭 ----------------- -->
	<div id="qnaContent" class="tab-content">
	    <h2>QnA 관리</h2>
	    <!-- QnA 관리 내용 -->
	</div>
	

</div> <!-- ------------------------------------mainBox ------------------------------------>
<%@ include file="/footer.jsp" %>

<script>
$(document).ready(function() {
    function showTab(tabName) {
        // 모든 탭 내용 숨기기
        $('.tab-content').hide();
        // 모든 탭 버튼 비활성화
        $('.tab-btnItem').removeClass('active');
        $('.tab-btnItem a').css('color', 'black');

        // 선택된 탭 내용 표시
        $('#' + tabName + 'Content').show();
        // 선택된 탭 버튼 활성화
        $('.tab-btnItem[data-tab="' + tabName + '"]').addClass('active');
        $('.tab-btnItem[data-tab="' + tabName + '"] a').css('color', 'white');

        // URL 해시 업데이트
        window.location.hash = tabName;
    }

    // URL 해시에서 탭 이름 가져오기
    function getTabFromHash() {
        return window.location.hash.substring(1) || 'product';
    }

    // 초기 탭 설정
    showTab(getTabFromHash());

    $('.tab-btnItem').click(function(e) {
        e.preventDefault();
        var tab = $(this).data('tab');
        showTab(tab);
    });

    // 해시 변경 이벤트 리스너
    $(window).on('hashchange', function() {
        showTab(getTabFromHash());
    });


    // 첫 번째 차트 생성
    const ctx1 = document.getElementById('myChart1').getContext('2d');
    new Chart(ctx1, {
        type: 'bar',
        data: {
            labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
            datasets: [{
                label: '# of Votes',
                data: [12, 19, 3, 5, 2, 3],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    // 두 번째 차트 생성
    const ctx2 = document.getElementById('myChart2').getContext('2d');
    new Chart(ctx2, {
        type: 'bar',
        data: {
            labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
            datasets: [{
                label: '# of Votes',
                data: [12, 19, 3, 5, 2, 3],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
});
</script>
</body>
</html>
