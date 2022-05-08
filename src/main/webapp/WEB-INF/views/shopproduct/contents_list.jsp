<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.citem{
		cursor:pointer;
	}
	.citem{
		float:left;
		width:250px;
		height:150px;
		border: solid 1px black;	
	}
</style>
<div id="page">
	<h1 class="contents_name">해당 컨텐츠의 전체 내용  "${cate}", "${cate2}", "${cate3}"</h1>
	<table id="tbl"></table>
	
	<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
			<div class="cateItems"><span class="citem" pno="{{pno}}">({{pno}}){{pname}}  - {{pimage}} - {{pcate1}} - {{pcate2}} - {{pcate3}} - {{pcate4}}</span></div>
		{{/each}}
	</script>
</div>

<script>
	var selectCate="${cate}";
	var selectCate2="${cate2}";
	var selectCate3="${cate3}";
	getContentsList();
	
	$("#tbl").on("click", ".citem", function(){
		var pno = $(this).attr("pno");
		//alert(pno); 
		location.href="read?pno="+pno+"&selectCate="+selectCate+"&selectCate2="+selectCate2+"&selectCate3="+selectCate3;
		
	});
	
	
	function getContentsList(){
		$.ajax({
			type: "get",
			dataType: "json",
			url: "/shopproduct/contents_list.json?selectCate="+selectCate+"&selectCate2="+selectCate2+"&selectCate3="+selectCate3,
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
			}
		});
	}
</script>