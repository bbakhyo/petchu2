<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<head>
   <title>Cart</title>
   <link href="/resources/temp_page.css" rel="stylesheet">
   <link rel="stylesheet" href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
<div id="page">
   <div class="shopping_cart_page">
      <div class="cart_header">
         <div class="cart_header_top">
            <div class="cart_shipping_general">일반배송 1</div>
            <span>|</span>
            <div class="cart_shipping_regularly">지정배송</div>
         </div>
         <div class="cart_header_bottom">
            <div class="cart_select_all">
               <div><label for="chk_all"><input type="checkbox" class="bigCheckbox_page_header" id="chk_all" />전체 선택</label></div>
            </div>
         </div>
      </div>
      <div class="cart_container_main">
         <div class="cart_container_sub">
            <div class="cart_item">
               <div class="cart_item_header_row">
                  <div class="cart_item_header_row_title">
                     <div><span><input type="checkbox" class="bigCheckbox_cart" name="chk_all" /></span><span class="shop_name_container">PETCHUSHOP</span></div>
                  </div>
                  <span class="material-symbols-outlined">
                  home
                  </span>
               </div>
               <div class="cart_item_content_row_itemCard">
                  <div class="chk_box_col0"><input type="checkbox" class="bigCheckbox_item" name="chk_all" /></div>
                  <div class="content_col1_title">
                     <div class="col1_title_row1"></div>
                     <div class="col1_title_row2_img_and_content">
                        <img src="https://via.placeholder.com/97x97/fbeaac" alt='item_img'>
                        <div class="col1_title_row2_content_container">
                           <div class="col1_title_row2_content_title ellipsis2lines">포피갤러리 콤피 베이직 슬리브스 M-L강아지나시티 3컬러 포피갤러리 콤피 베이직 슬리브스 M-L강아지나시티 3컬러 포피갤러리 콤피 베이직 슬리브스 M-L강아지나시티 3컬러</div>
                           <div class="col1_title_row2_content_price">16,000 원</div>
                        </div>
                     </div>
                  </div>
                  <div class="content_col2_quantity">
                     <div class="cart_update_container">
                        <div class="extra_info">추가 정보</div>
                        <br />
                        <div><button class="cart_update">주문수정</button></div>
                     </div>
                  </div>
                  <div class="content_col3_subtotal_container">
                     <div class="content_col3_subtotal_label">상품금액</div>
                     <div class="content_col3_subtotal_amount">32,000원</div>
                     <div><button class="cart_paynow">주문하기</button></div>
                  </div>
                  <div class="content_col4_deliveryFee_container">
                     <div class="content_col3_subtotal_label">배송비</div>
                     <div class="content_col4_deliveryFee_amount">3,000원</div>
                     <div class="content_col4_deliveryFee_message">(8만원 이상 구매 시 배송비 무료)</div>
                  </div>
               </div>
               <div class="cart_item_footer">
                  <div class="cart_item_footer_inner">
                     <div class="cart_item_footer_col1_subtotal">
                        <div class="cart_footer_col_label">선택상품금액</div>
                        <div class="cart_footer_col_label_total"><span>40,000,00000000</span><span>원</span></div>
                     </div>
                     <span class="material-symbols-outlined math">
                     add
                     </span>
                     <div class="cart_item_footer_col2_delivery">
                        <div class="cart_footer_col_label">총 배송비</div>
                        <div class="cart_footer_col_label_deliveryfee">3,000원</div>
                     </div>
                     <span class="material-symbols-outlined math">
                     remove
                     </span>
                     <div class="cart_item_footer_col3_discount_amount">
                        <div class="cart_footer_col_label">할인예상금액</div>
                        <div class="cart_footer_col_label_total">8,000원</div>
                     </div>
                     <div class="cart_footer_col4_subtotal">
                        <span class="cart_footer_col_label">주문금액</span>
                        <span class="cart_footer_col_label_subtotal">500,000,000원</span>
                     </div>
                  </div>
                  <span><a href="#" class="payment_submit">PETCHUSHOP 주문하기</a></span>
               </div>
            </div>
         </div>
      </div>
      <div class="page_bottom_half">
         <div class="page_bottom_total_price">
            <div class="page_bottom_total_price_row1">
               <div class="page_item_footer_inner">
                  <div class="cart_item_footer_col1_subtotal">
                     <div class="page_footer_col_label">선택상품금액</div>
                     <div class="page_footer_col_amount">400,000,000원</div>
                  </div>
                  <span class="material-symbols-outlined math">
                  add
                  </span>
                  <div class="cart_item_footer_col2_deliveryfee">
                     <div class="page_footer_col_label">총 배송비</div>
                     <div class="page_footer_col_label_deliveryfee">3,000원</div>
                  </div>
                  <span class="material-symbols-outlined math">
                  remove
                  </span>
                  <div class="page_footer_col3_discount_amount">
                     <div class="page_footer_col_label">할인예상금액</div>
                     <div class="page_footer_col_label_discount">8,000원</div>
                  </div>
                  <div class="page_footer_col3_subtotal">
                     <span class="page_footer_col3_label"> 총 주문금액</span>
                     <span class="page_footer_col3_label_subtotal">35,000000원</span>          
                  </div>
               </div>
            </div>
         </div>
         <div class="bottom_total_price_row2_payment">
            <a href="#" class="payment_submit_now">총 1 건 주문하기</a>
         </div>
      </div>
   </div>
</div>
</body>

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
