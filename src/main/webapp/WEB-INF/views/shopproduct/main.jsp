<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.category_item {
		width:213px;
		float:left;
	}
	.category_box, .category_list {
		cursor:pointer;
	}
	.category_snack, .category_foods, .category_supplies {
		display:none;
	}
	.category3{
		text-align:center;
		margin: 0px auto;
	}
	.none_show{
		display:none;
	}
	[type="radio"]+label {
	    display: inline-block;
	    cursor: pointer;
	    padding: 10px 0px 10px 0px;
	    width: 80px;
	    border: 1px solid #A7CA37;
	    line-height: 24px;
	    text-align: center;
	    font-weight: bold;
	    font-size: 13px;
	    border-radius: 10px;
	}
	[type="radio"]:checked+label {
	    background-color: #A7CA37;
	    color: white;
	}
	[type="radio"] {
    	display: none;
	}
	.category3{
		margin-bottom: 20px;
	}
</style>    
<h1>카테고리 테스트</h1>
<div id="categoryBody">
	<div class="category3">
		<input type="radio" name="animal" value="강아지" id="dog">
		<label for="dog">강아지</label>
		<input type="radio" name="animal" value="고양이" id="cat">
		<label for="cat">고양이</label>
	</div>
	<div class="category1 none_show">		<!-- 사료 / 간식 / 용품 -->
<!-- 		<div class="category_list none_show" id="pet_foods">사료</div> -->
<!-- 		<div class="category_list none_show" id="pet_snack">간식</div> -->
<!-- 		<div class="category_list none_show" id="pet_supplies">용품</div> -->
<!-- 		                         2424244                                   -->
		<input type="radio" name="item_type" value="사료" id="petFoods">
		<label for="petFoods">사료</label>
		<input type="radio" name="item_type" value="간식" id="petSnack" >
		<label for="petSnack">간식</label>
		<input type="radio" name="item_type" value="용품" id="petSupplies">
		<label for="petSupplies">용품</label>
	</div>
	<div class="category2">		<!-- 하위 카테고리 목록 -->
		<section>
			<ul class="category_list2 category_foods" selectCate2="사료">
				<li class="category_item">
					<div class="category_box">건식</div>
				</li>
				<li class="category_item">
					<div class="category_box">습식</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 카테고리3</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 카테고리4</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 카테고리5</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 카테고리6</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 카테고리7</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 카테고리8</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 카테고리9</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 카테고리10</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 카테고리11</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 카테고리12</div>
				</li>
				
				<li class="category_item">
					<div class="category_box">테스트 카테고리13</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 카테고리14</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 카테고리15</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 카테고리16</div>
				</li>
			</ul>
			<!-- -------------------------- -->
			<ul class="category_list2 category_snack" selectCate2="간식">
				<li class="category_item">
					<div class="category_box">동결건조</div>
				</li>
				<li class="category_item">
					<div class="category_box">수제간식</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 간식 카테고리3</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 간식 카테고리4</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 간식 카테고리5</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 간식 카테고리6</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 간식 카테고리7</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 간식 카테고리8</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 간식 카테고리9</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 간식 카테고리10</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 간식 카테고리11</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 간식 카테고리12</div>
				</li>
				
				<li class="category_item">
					<div class="category_box">테스트 간식 카테고리13</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 간식 카테고리14</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 간식 카테고리15</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 간식 카테고리16</div>
				</li>
			</ul>
			<!-- -------------------------- -->
			<ul class="category_list2 category_supplies" selectCate2="용품">
				<li class="category_item">
					<div class="category_box">모래</div>
				</li>
				<li class="category_item">
					<div class="category_box">배변패드</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 용품 카테고리3</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 용품 카테고리4</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 용품 카테고리5</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 용품 카테고리6</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 용품 카테고리7</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 용품 카테고리8</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 용품 카테고리9</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 용품 카테고리10</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 용품 카테고리11</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 용품 카테고리12</div>
				</li>
				
				<li class="category_item">
					<div class="category_box">테스트 용품 카테고리13</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 용품 카테고리14</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 용품 카테고리15</div>
				</li>
				<li class="category_item">
					<div class="category_box">테스트 용품 카테고리16</div>
				</li>
			</ul>
		</section>
	</div>
	
	<h1>오늘의 상품</h1>
	 <c:forEach items="${tlist}" var="tvo">
			${tvo.pname}<br>
	 </c:forEach>
	 
	 <h1>베스트 상품</h1>
 	 <c:forEach items="${blist}" var="bvo">
			${bvo.pname}<br>
	 </c:forEach>
</div>

<script>

	var cate3val = "";
	var cate2val = "";
	//카테고리 선택시 해당 카테고리의 정보를 담아서 페이지 이동
	$(".category_box").on("click", function(){
		var cateval = $(this).text();	//필터링할 카테고리 분류 
		location.href="/shopproduct/contents_list?selectCate="+cateval+"&selectCate2="+cate2val+"&selectCate3="+cate3val;
	});
	
	//하위 카테고리 display:none;
	function removeCate_2(){
		$(".category_foods").hide();
		$(".category_supplies").hide();
		$(".category_snack").hide();
	}
	
	$("input[name='animal']:radio").change(function () {
        //라디오 버튼 값을 가져온다.
        cate3val = this.value;
        $(".category1").attr("class", "category1");
		$(".category_list2").attr("style", "display:none");       
		$("input[name='item_type']:radio").prop("checked",false);;
	});
	
	$("input[name='item_type']:radio").change(function () {
		cate2val = this.value;
        //value값이 무엇이냐에 따라 다르게 출력  '
      	if(cate2val=='사료'){
      		removeCate_2();
			$(".category_foods").show();
      	}else if(cate2val=='간식'){
   			removeCate_2();	//보이게 하기 전에 열려있는 하위 카테고리 값 display:none으로 설정.
   			$(".category_snack").show();
      	}else{
      		removeCate_2();
			$(".category_supplies").show();
      	}
	});

</script>