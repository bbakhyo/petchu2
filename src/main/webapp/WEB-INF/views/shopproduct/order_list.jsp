<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<style>
#page {
	margin: 0px auto;
}
	.order_read{
		cursor:pointer;
	}
	#tbl{
		overflow:hidden;
		border: none;
		padding: 10px;
		margin: 10px;
		text-align: center;
	}
	tr, td{
		border:none;
	}
	.tbody{
		margin: 20px;
	}
	.border{
		border-top:1px solid;
	}
	.image{
		cursor:pointer;
	}
</style>
<div id="page">
	<h1>구매목록</h1>
	<table id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
		{{#each .}}	
		<tbody class="tbody" bno="{{bno}}" orno="{{orno}}" pno="{{pno}}">
		<tr class="date_tr">
			<td colspan="3" style="text-align:right;" class="date_td">{{odate}}</td>
		</tr>
		<tr>
			<td rowspan="3"><img class="image" src="{{pimage}}" width=100></td>
			<td>{{pname}}</td>
			<td rowspan="3"><span class="order_read" bno={{bno}}>주문 상세보기</span></td>
		</tr>
		<tr>
			<td class="price" pprice="{{pprice}}" amount="{{amount}}">가격*수량 값</td>
		</tr>
		<tr>
			<td>{{amount}}개</td>
		</tr>
		</tbody>
		{{/each}}
	</script>
</div>

    
<script>	
var uid = "${id}";

// $(".date_box_righgt").on("click", "span", function(){
// 	alert("리드이동");
// });


//상세보기 클릭시 이동
$("#tbl").on("click", ".order_read", function(){
	var bno = $(this).attr("bno");
	location.href="/shopproduct/order_read?bno="+bno;
});

//order list 불러오기
getList();
function getList() {
	$.ajax({
		type : "get",
		dataType : "json",
		data : {
			uid : uid
		},
		url : "/shopproduct/order_list.json",
		success : function(data) {
			console.log(data);
			var template = Handlebars.compile($("#temp").html());
			$("#tbl").html(template(data));
			
			
			//가격 계산
			$(".price").each(function(){
				var pprice = $(this).attr("pprice");
				var amount = $(this).attr("amount");
				var final_price = Number(pprice) * Number(amount);
				$(this).html(final_price);
			});
			
			//orno별 구분선 등록
			var tno = "";
			var orno = "";
			var i = 0
			$(".tbody").each(function(){
				orno = $(this).attr("orno");
				var test = document.getElementsByClassName('tbody')[i];
				i++;
				if(tno==""||tno!=orno){
					//alert("tno=" + tno + "\norno=" + orno);
					test.classList.add('border');
					$(this).find(".date_tr").find(".date_td").attr("date_only", "date_only");
				}
				tno=orno;
			});	
			$(".date_td").each(function(){
				if(!$(this).attr("date_only")){
					$(this).html("");
				}
			});
		}
	});
}

//상품 이미지 클릭시 해당 페이지로 이동
$("#tbl").on("click", "img", function(){
	var pno = $(this).parent().parent().parent().attr("pno");
	location.href="/shopproduct/read?pno="+pno;
});
</script>