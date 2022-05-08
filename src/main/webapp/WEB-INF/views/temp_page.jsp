<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link href="/resources/temp_page.css" rel="stylesheet">
<div class="menu_heading"><h1>작업공간</h1></div>

<div id="temp_page_menu">
	<div id="temp_menu1">
		<h2>Menu:</h2><hr style="width:150px">
		<a href="/temp/api_search">API검색</a><br/> 
		<a href="/temp/list">상품목록</a><br/>
		<a href="/temp/payment_request">결제 페이지</a><br/>
		<a href="/temp/register">회원가입</a><br/>
		<a href="/temp/shopping_cart">장바구니</a><br/>
		<a href="/temp/checkout">결제 페이지</a><br/>
		<a href="/temp/news">크롤링 뉴스 </a><br/>
		<a href="/temp/shop">쇼핑 테스트 </a><br/>
	</div>
	
	<div id="temp_menu2">
		<h2>Portal:</h2><hr style="width:150px">
		<a href="/user/mypage?id=">My Page</a><br/> 
 		<a href="/shopproduct/list">상품목록</a><br/>
		<a href="/shopproduct/main">SP Main</a><br/>
		<a href="/temp/shopproduct">상품정보</a><br/>
		<a href="/temp/shopping_cart">장바구니</a><br/>
		<a href="/temp/checkout">결제 페이지</a><br/>
		<a href="/temp/news">크롤링 뉴스 </a><br/>
		<a href="/temp/shop">쇼핑 테스트 </a><br/> 
	</div>
	<br><br>
	
	
	<div id="temp_heading">
		<h1>sidebar1(div 형식)  /  sidebar2(list 형식)</h1> 
	</div><br>
	
	<div id="menu_container">
		<div>
			<a>
				<%-- <jsp:include page="sidebar1.jsp"/> --%>
			</a>
		</div>
	
		<div>
			<a>
				<%-- <jsp:include page="sidebar2.jsp"/> --%>
			</a>
		</div>
	</div>
</div>