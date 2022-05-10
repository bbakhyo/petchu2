<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	    
<style>
</style>
<div id="page">
	<h1>상품 상세정보</h1>
	<h5>${id}님의 테스트</h5>
	<table>
		<tr>
			<td class="title" width=100>상품코드</td>
			<td width=500><input value="${vo.pno}" type="text" name="pno"
				size=5 readOnly /></td>
		</tr>
		<tr>
			<td class="title" width=100>상품이미지</td>
			<td width=500><img id="image"
				src="/display?fileName=${vo.pimage}" width=200> <input
				type="file" name="file" accept="image/*" style="display: none;">
				<input type="hidden" value="${vo.pimage}" name="pimage" /></td>
		</tr>
		<tr>
			<td class="title" width=100>남은수량</td>
			<td width=500>
				<input value="${vo.pqantity}" type="text" name="pqantity" size=5 />
				<c:if test="${vo.pqantity==0}"><span style="color:red;">품절상품</span></c:if>
				<c:if test="${vo.pqantity!=0}"><span><fmt:formatNumber value="${vo.pqantity==0}" pattern="#,###원"/></span></c:if>
			</td>
		</tr>
		<tr>
			<td class="title" width=100>상품이름</td>
			<td width=500><input value="${vo.pname}" type="text"
				name="pname" size=80></td>
		</tr>
		<tr>
			<td class="title" width=100>상품가격</td>
			<td width=500><input value="${vo.pprice}" type="text"
				name="pprice" size=50>원</td>
		</tr>
		<tr>
			<td class="title" width=100>브랜드</td>
			<td width=500><input value="${vo.pbrand}" type="text"
				name="pbrand" size=50></td>
		</tr>
		<tr>
			<td class="title" width=100>메이커</td>
			<td width=500><input value="${vo.pmaker}" type="text"
				name="pmaker" size=50></td>

		</tr>
		<tr>
			<td class="title" width=100>분류</td>
			<td width=500><input value="${vo.pcate3} - ${vo.pcate4}" type="text"
				name="pcate3" size=50></td>
		</tr>
		<tr>
			<td class="title" width=100>상품설명</td>
			<td width=500><textarea rows="10" cols="80" name="pcontents">${vo.pcontents}</textarea>
			</td>
		</tr>
	</table>
	<div id="buy_bigBox">
		<div class="buy_box">
				<div id="count_button">
					<button class="countDown">감소</button>
					<button class="countIncrease">증가</button>
					<p class="final_count">1</p>개
					<p class="final_won">${vo.pprice}</p>원
				</div>
		</div>
		<div id="button">
			<button class="btnBuy">구매</button> 
			<button class="button cart_insert_btn">장바구니</button>
			<button class="button backcontents">목록이동</button>
		</div>
	</div>
</div>


<script>
	var cate1 = "${cate}";
	var cate2 = "${cate2}";
	var cate3 = "${cate3}";

	$(".backcontents").on("click", function(){
		location.href="/shopproduct/contents_list?selectCate=" +cate1 + "&selectCate2=" + cate2 + "&selectCate3=" + cate3;
	});

	//장바구니 버튼을 클릭한 경우 session에 저장된 id를 읽어서 장바구니DB에 등록
	$(".cart_insert_btn").on("click", function(){
		var pno = ${vo.pno}; // 상품번호
		var uid = "${id}";
		var amount = $(".final_count").html();	//구매자가 정한 수량
		//alert(pno+"\n"+uid+"\n"+amount);
		
		$.ajax({
			type: "post",
			url: "/shopproduct/insert",
			data: {pno:pno, uid:uid, amount:amount},
			success: function(data){
					//장바구니 페이지로 이동하기
					if(data==1){
						//장바구니 등록 완료
						if(!confirm("장바구니로 이동하시겠습니까?")) return;
						location.href="/shopproduct/cart_read?uid="+uid;
					}else{
						alert('이미 장바구니에 등록된 상품입니다.');
					}
				
			}
		});
	});

	//상품구매 클릭시 상품수량과 기본가격을 가지고 넘어감
	$(".btnBuy").on("click", function(){
		var pno = ${vo.pno}; // 상품번호
		var amount = $(".final_count").html();	//구매자가 정한 수량
		location.href="/shopproduct/buy?pno="+pno+"&amount="+amount;
	})

	//감소버튼 누를 경우 구매수량 감소
	$("#count_button").on("click", ".countDown" , function(){
		var fcount = $(".final_count").html();
		if(fcount>1){
			fcount--;
			$(".final_count").html(fcount);
			var fprice = ${vo.pprice};
			$(".final_won").html(fcount*fprice);
		}
	});
	//증가버튼 누를 경우 구매수량 증가
	$("#count_button").on("click", ".countIncrease" , function(){
		var fcount = $(".final_count").html();
		fcount++;
		$(".final_count").html(fcount);
		var fprice = ${vo.pprice};
		$(".final_won").html(fcount*fprice);
	});
	
	

</script>