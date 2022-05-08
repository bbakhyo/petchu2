<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
.smallBox {
	border: 2px double gray;
	margin-bottom: 10px;
	margin-right: 5px;
	width: 180px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	display: inline-block;
}

#tbl p {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

#tbl {
	width: 800px;
	overflow: hidden;
	float: left;
}

.modal_wrap {
	display: none;
	width: 500px;
	min-height: 400px;
	position: absolute;
	top: 40%;
	left: 50%;
	margin: -250px 0 0 -250px;
	background: #FFFFFF;
	z-index: 2;
	border-radius: 30px;
	padding : 25px;

}

.black_bg {
	display: none;
	position: absolute;
	content: "";
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	top: 0;
	left: 0;
	z-index: 1;
}

.modal_close {
	width: 26px;
	height: 26px;
	position: absolute;
	top: -30px;
	right: 0;
}

.modal_close>a {
	display: block;
	width: 100%;
	height: 100%;
	background: url(https://img.icons8.com/metro/26/000000/close-window.png);
	background-color : skyblue;
	text-indent: -9999px;
}

.modal_wrap p{
	font-size : 15px;
}
</style>
<h1>미용 견적서 목록</h1>
<div id="sidemenu">
		<jsp:include page="${sideMenu}" />
</div>
	<h2 id="text" style="display:none;">작성된 견적서가 없습니다</h2>
<div>
	<div id="tbl" ></div>
	<script id="temp" type="text/x-handlebars-template">
	      {{#each .}}
			<div class="smallBox" brno={{brno}} scno={{scno}}>
		       <p style="text-align : center;">{{nick}}님의 요청서</p>
		       <p>{{beauty_classification}}</p>
		       <span>{{wish_local1}}</span> <span>{{wish_local2}}</span> </br>
			   <p>가격 : {{printPrice price}}</p>
			   <p>견적설명 : {{description}}</p>
			</div>
	      {{/each}}
	</script>
		<div class="black_bg" ></div> <!-- 창 띄웠을시 배경 -->
		<div class="modal_wrap" id="modal_wrap1"></div> <!-- 창 본체 -->
		<script id="temp2" type="text/x-handlebars-template">
			<div class="modal_close" id="modal_close1"><a href="javascript:void(0);">close</a></div>
			<h2 style="text-align : center;">{{nick}}님의 요청사항과 견적</h2>
			<p>펫 분류 : {{pcate}}</p>
			<p>원하는 서비스 : {{beauty_classification}}</p>
            <p>체중/나이 : {{weight}}, {{age}}</p>
            <p>마지막 미용시기 : {{last_beautydate}}</p>
            <p>진행 장소 : {{service_place}}</p> <p>희망 서비스일  : {{wish_date}}</p>
			<p>문의사항 : {{detailed_matters}}</p>
			<h4 style="margin-bottom : 3px;">견적 설명</h4>
			<textarea cols="72.5" rows="13" readonly>{{description}}</textarea>
		</script>
</div>
<script>
Handlebars.registerHelper("printPrice", function(price){
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
 });
 
 
var target = document.getElementById("text");

getList();
	function getList(){
		target.setAttribute('data-value', 'gg');
		var i = 1;
		$.ajax({
			type : "get",
			dataType : "json",
			url : "/service/beslist.json",
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
				
			},
			error : function(xhr, ajaxSettings, thrownError) 
			   {
				target.style.display = 'block';
			   }

		});
	}
	$("#tbl").on("click", ".smallBox", function(){
		var brno = $(this).attr('brno');
		var scno = $(this).attr('scno');
		alert(brno + scno);
		document.querySelector('.black_bg').style.display ='block';
    	document.querySelector('#modal_wrap1').style.display ='block';
    		$.ajax({
    			type : "get",
    			dataType : "json",
    			data :{brno:brno, scno:scno},
    			url : "besread.json",
    			success:function(data){
    				var template = Handlebars.compile($("#temp2").html());
    				$("#modal_wrap1").html(template(data));
    				$('#modal_close1').click(function(){
    					offClick();
    				});
    			}
    		});
    	
	});
	    function offClick() {
	        document.querySelector('#modal_wrap1').style.display ='none';
	        document.querySelector('.black_bg').style.display ='none';
	    }
</script>