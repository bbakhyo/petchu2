<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	#tbl{
		border: 1px solid gray;
	}
	#tbl2{
		border: 1px solid gray;
	}
	.title{
		font-weight: bold;
		font-size: 15px;
	}
	.row{
		font-size: 12px;
	}
</style>
<div id="page">
	<h1>업체별 예약 리스트</h1>
	
	<table id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
		<tr class="title">
			<td>업체번호</th>
			<td>업체명</th>
			<td>예약번호</th>
			<td>입실일</th>
			<td>퇴실일</th>
			<td>예약자</th>
			<td>예약자 연락처</th>
			<td>예약일</th>
			<td>요청사항</th>
		</tr>
		{{#each list}}
		<tr class="row">
			<td>{{scno}}</td>
			<td>{{scname}}</td>
			<td>{{rno}}</td>
			<td>{{checkin}}</td>
			<td>{{checkout}}</td>
			<td>{{userName}}</td>
			<td>{{userTel}}</td>
			<td>{{reserveDate}}</td>
			<td>{{request}}</td>
		</tr>
		{{/each}}
	</script>
	
	<h1>지난 예약 리스트</h1>
	
	<table id="tbl2"></table>
	<script id="temp2" type="text/x-handlebars-template">
		<tr class="title">
			<td>업체번호</th>
			<td>업체명</th>
			<td>예약번호</th>
			<td>입실일</th>
			<td>퇴실일</th>
			<td>예약자</th>
			<td>예약자 연락처</th>
			<td>예약일</th>
			<td>요청사항</th>
		</tr>
		{{#each oldlist}}
		<tr class="row">
			<td>{{scno}}</td>
			<td>{{scname}}</td>
			<td>{{rno}}</td>
			<td>{{checkin}}</td>
			<td>{{checkout}}</td>
			<td>{{userName}}</td>
			<td>{{userTel}}</td>
			<td>{{reserveDate}}</td>
			<td>{{request}}</td>
		</tr>
		{{/each}}
	</script>
</div>
<script>
	var id="${id}";
	
	getList();
	getoldList()
	
	function getList(){
		$.ajax({
			type: "get",
			url: "/reserve/comReserveList.json",
			dataType: "json",
			data: {id:id},
			success: function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
				
				$.ajax({
					type: "get",
					url: "/reserve/comReserveList.json",
					dataType: "json",
					data: {id:id},
					success: function(data){
						var template = Handlebars.compile($("#temp2").html());
						$("#tbl2").html(template(data));
					}
				});
			}
		});
	}
	function getoldList(){
		$.ajax({
			type: "get",
			url: "/reserve/comReserveList.json",
			dataType: "json",
			data: {id:id},
			success: function(data){
				var template = Handlebars.compile($("#temp2").html());
				$("#tbl2").html(template(data));
			}
		});
	}
</script>

