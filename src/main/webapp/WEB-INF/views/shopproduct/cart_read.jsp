<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.cart_item_image img{
		width:90px;
		height:90px;	
		cursor:pointer;
	}
	.select_quantity{
	}
	
	.quantity-chg{
	    display: block;
	    width: 52px;
	    height: 21px;
	    padding-top: 1px;
	    font-size: 11px;
	    border: 1px solid #888;
	    color: #111;
	    background: #fff;
	    text-align: center;
	    letter-spacing: -1px;
	    cursor:pointer;
	}
	
	.quantity-text{
		width:45px;
    	font-size: 12px;
    	line-height: 24px;
   	    margin: 0;
	    padding: 0;
	    color: #111;
	}
	.none{
		display:none;
	}
</style>
<div id="page">
	<h1>장바구니</h1>
	<table id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
		<input type="checkbox" class="chkAll">
		{{#each .}}
			<div class="cart_box" id="cart_box">
				<input type="checkbox" class="chk" chk={{chk}} cno={{cno}} pno = {{pno}} price={{pprice}} pname={{pname}} amount={{amount}}>
				<div class="cart_item_image"><img src="{{pimage}}"></div>
				<div class="cart_item_info"><p class="pay_p" price={{pprice}} amount={{amount}}>
						{{pname}} | {{pprice}}원 |
					<select class="select_quantity" data_quantity={{amount}}>
						<option value="0" class="none">0</option>
						<option vlue="1">1</option>
						<option vlue="2">2</option>
						<option vlue="3">3</option>
						<option vlue="4">4</option>
						<option vlue="5">5</option>
						<option vlue="6">6</option>
						<option vlue="7">7</option>
						<option vlue="8">8</option>
						<option vlue="9">9</option>
						<option vlue="10">10</option>
						<option vlue="10+">10+</option>
					</select> 
					<a class="select-text" style="display: none;">
						<input type="text" class="quantity-text" maxlength="4">
						<input type="button" class="quantity-chg" id="quantity-chg" value="수량변경" 
							onclick='getSelect(this)'
						>
					</a>
 					총합: <a class="sum">{{sum}}</a>원
		</p></div>		
			</div>
		{{/each}}
	</script>
	<button id="cart_delete">삭제</button>
	<button id="cart_buy">구매</button>		
	<div class="cart_total_price">
		<p>최종 구매금액: <a class="final_price"></a>원</p>
	<!--class sum의 모든 값을 합쳐야 함 -->
	</div>
</div>


<script>
	var uid = "${id}";
	getList();
	
	//chkall 체크되었을 경우
	$("#tbl").on("change",".chkAll", function(){
		if($('.chkAll').prop("checked")){
			$(".chk").prop("checked",true);
			$(".chk:checked").each(function(){
				var sum = $(this).parent().find(".cart_item_info .pay_p .sum").text();
				i = i + Number(sum);
			})
			$(".final_price").html(i);
			i = 0;
		}else{
			$(".chk").prop("checked",false);
			$(".chk:checked").each(function(){
				var sum = $(this).parent().find(".cart_item_info .pay_p .sum").text();
				i = i + Number(sum);
			})
			$(".final_price").html(i);
			i = 0;
		}
	});

	
	//tbl 내부에 있는 chk값이 변경될 경우 chk: 0 or 1 업데이트
	$("#tbl").on("change", ".chk", function(){
		//chk값 특정
		if($(this).is(":checked")){
			var chk = 1; 
		}else{
			var chk = 0; 
		}
		//DB에 chk값 업데이트
		var cno = $(this).attr("cno");
		$.ajax({
			type: "post",
			url: "/shopproduct/cart_chk_update",
			data: {chk:chk, cno:cno},
			success: function(){
				//alert("업데이트 성공")
			}
		});
		
	});
	
	// 체크박스에 따른 chkAll 체크유무
	$("#tbl").on('click','.chk',function(){
	    if($('input[class=chk]:checked').length==$('.chk').length){
	        $('.chkAll').prop('checked',true);
	    }else{
	       $('.chkAll').prop('checked',false);
	    }
	});
	
	//최종 금액 갱신
	var i = 0;
	$("#tbl").on("click", function(){
		$(".chk:checked").each(function(){
			var sum = $(this).parent().find(".cart_item_info .pay_p .sum").text();
			i = i + Number(sum);
		})
		$(".final_price").html(i);
		i = 0;
	});
	
	
	//장바구니 삭제 버튼을 클릭할 경우
	$("#cart_delete").on("click", function(){
		//checked 되어있는 chk의 "{{cno}}"값을 불러와서 delete. 
		if(!confirm("체크한 상품을 장바구니에서 삭제하시겠습니까?")) return;
		$("#tbl .cart_box .chk:checked").each(function(){
			var chk=$(this);
			var cno = $(this).attr("cno");
			$.ajax({
				type: "post",
				url: "/shopproduct/delete",
				data: {cno:cno},
				success: function(){
					chk.prop("checked", false);
					getList();
				}
			});
		});
	});

	
	
	//cart 정보 불러오기
	function getList(){
		$.ajax({
			type: "get",
			dataType: "json",
			data: {uid: uid},
			url: "/shopproduct/cart_read.json",
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
				
				
				//페이지 입장시 기존 amount값에 따라 option selected
				$("#tbl .cart_box .chk").each(function(){
					var amount = $(this).parent().find(".cart_item_info .pay_p").attr("amount");
					var input_amount = $(this).parent().find(".cart_item_info .pay_p .select_quantity");
					input_amount.val(amount).prop("selected", true);
					//만약 input_amount.val()이 10보다 크면 this.none 해제 후 html amount 부여
					if(input_amount.attr("data_quantity")>10){
						var zero = $(this).parent().find(".cart_item_info").find(".pay_p").find(".select_quantity").find(".none");
						zero.html(amount);
						zero.val(amount);
						zero.attr("class", "block");
						$(this).parent().find(".cart_item_info .pay_p .select_quantity").val(amount).prop("selected", true);
					}
				});

				//페이지 입장시 자동 체크된 항목들의 값을 계산하여 최종 금액 출력
				var i = 0;
				$("#tbl .cart_box .chk").each(function(){
					if($(this).attr("chk")==1){
						var sum = $(this).parent().find(".cart_item_info .pay_p .sum").text();
						i = i + Number(sum);
					}
				})
				$(".final_price").html(i);
				i = 0;
				
				//chk값 불러와서 체크박스 체크
				$(".chk").each(function(){
					var chk = $(this).attr("chk");
					if(chk==1){
						$(this).attr("checked", "checked");						
					}
				})
				//.chk가 모두 체크되어있을 경우 chkAll 체크 (.chk length와 .chk:checked length가 동일한 경우)
				if($('input[class=chk]:checked').length==$('.chk').length){
					if($('.chk').length==0){
						alert("장바구니에 등록된 상품이 없습니다.");
						location.href="/shopproduct/main";
					}else{
						$("#tbl .chkAll").attr("checked", "checked");
					}
				}
			}
		});
	}
		
	//수량 : select optoin을 선택했을 경우
	$("#tbl").on("change", ".select_quantity", function() {
		
		//
		//select 10+ 선택시 입력칸 생성
		if($(this).val()=="10+"){
			$(this).parent().find("block").attr("class", "none");
			$(this).attr("style", "display:none");
			$(this).parent().find(".select-text").attr("style", "display:block");
			return;
		}

		var selected = $(this).val(); //선택한 option의 value 값을 불러온다.
		$(this).attr('data_quantity', selected); //불러온 value값을 (data_quantity)에 집어넣는다.
		//선택된 option value에 따라 바뀌는 총합액을 갱신
		var price = $(this).parent().attr("price");
		var vsum = Number(selected) * Number(price);
		var sum = $(this).parent().find(".sum");
		sum.html(vsum);

		//DB에 수량 업데이트
		var amount = $(this).attr("data_quantity");
		var cno = $(this).parent().parent().parent().find(".chk").attr("cno");		
		$.ajax({
			type: "post",
			url: "/shopproduct/cart_update",
			data: {amount:amount, cno:cno},
			success: function(){
				//alert("업데이트 성공")
			}
		});
		

	});

	
	/* buy click function의 존재의의가 없다. 구매시 이동하기만 해도 될 것 같다. 정보를 list에 담아서 이동하는 코드 필요 */
	//구매 버튼을 클릭한 경우
	$("#cart_buy").on("click", function(){
		location.href="/shopproduct/multi_buy?uid=${id}";
	});
	
	//상품 이미지 클릭시 해당 페이지로 이동
	$("#tbl").on("click", "img", function(){
		var pno = $(this).parent().parent().find(".chk").attr("pno");
		location.href="/shopproduct/read?pno="+pno;
	});
	


	
	//수량 10+ 클릭시 기능
	function getSelect(e){
		//클릭시 parent.find.quantity-text.val() 불러오기
		var textVal = $(e).parent().find(".quantity-text").val();
		//해당 정보를 기존 select에 넣고 display 교체
		var select = $(e).parent().parent().find(".select_quantity");
		select.attr("style", "display:block");
		//display none이었던 0번째 옵션의 val을 textVal로 변경시키고 show, attr 또한 변경하며 열려있는 text박스 display none
		select.find(".none").val(textVal);
// 		select.find(".none").html(textVal);
		select.find(".none").attr("class", "block");
		select.find(".block").prop("selected", true);
		select.find(".block").html(textVal);
		select.attr("data_quantity", textVal);
		//paent display none
		$(e).parent().attr("style", "display:none");
		
		//해당 숫자에 대한 가격 및 DB 입력
		var amount = $(e).parent().parent().find(".select_quantity").attr("data_quantity");
		var price = $(e).parent().parent().attr("price");
		$(e).parent().parent().attr("amount", amount);
		//final가격에 가격 업데이트
		var final_price = Number(price) * Number(amount)
		$(e).parent().parent().find(".sum").html(final_price);
		//DB에 수량 업데이트
		var cno = $(e).parent().parent().parent().parent().find(".chk").attr("cno");
		$.ajax({
			type: "post",
			url: "/shopproduct/cart_update",
			data: {amount:amount, cno:cno},
			success: function(){
// 				alert("업데이트 성공")
			}
		});
	}
</script>