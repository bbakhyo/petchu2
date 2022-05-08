<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel='stylesheet' href="/resources/home.css">
	<link rel="short icon" href="#">
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script src="/resources/pagination.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript" src="/resources/chart.js"></script>
	<title>Insert title here</title>
</head>
<style>
.modal_wrap {
	display: none;
	width: 400px;
	height: 500px;
	position: absolute;
	top: 45%;
	left: 50%;
	margin: -250px 0 0 -250px;
	background: #FFFFFF;
	z-index: 2;
	border-radius: 30px;
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
	text-indent: -9999px;
}

.buttonc {
	position : relative;
	top:3%;
	left:65%;
	
}

.buttonb {
	position : relative;
	top: -2%;
	left: 77%;
	display : none;
}

#regi [type="radio"]{
   display:none;
}
#regi [type="radio"]+label{
   display: inline-block;
   cursor: pointer;
   padding: 10px 0px 10px 0px;
    width: 80px;
    border: 1px solid #A7CA37;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
    border-radius: 10px;
}
#regi [type="radio"]+label{
   background-color: white;
    color: #A7CA37;
}
#regi [type="radio"]:checked+label{
    background-color: #A7CA37;
    color: white;
}
.page1, .page2, .page3{
	display:none;
	height : 350px;
}
.show {
	display:;
}

.rad {
	margin-left : 45px;
}

h2{
	margin-left : 40px;
	margin-top : 80px;
}
input[type=radio] {
	vertical-align :3px;
}

.texta {
	margin: 0px auto;
	margin-top : 40px;
	text-align : center;
	resize : none;
}

.city {
	margin-top : 50px;
	margin-left : 45px;
}

.page3 input[type="checkbox"] {
    width: 0.8rem;
    height: 0.8rem;
    border-radius: 50%;
    border: 2px solid #999;
    appearance: none;
    transition: background 0.2s;
    margin-bottom : 15px;
 }

.page3 input[type="checkbox"]:checked {
    background: #2AA1C0;
    border: none;
 }
  
  
</style>
<body>
	<h2>���ϴ� ���񽺸� �������ּ���!</h2>
	<div id="regi">
		<input type="radio" class="radio1" name="service" id="modal_btn1"> <label for="modal_btn1">�̿�</label> &nbsp;
		<input type="radio" class="radio1"name="service" id="modal_btn2">	<label for="modal_btn2">ȨŬ����</label> &nbsp;
		<input type="radio" class="radio1" name="service" id="modal_btn3">	<label for="modal_btn3">����</label> &nbsp;
	</div>
	
	<div class="black_bg" ></div> <!-- â ������� ��� -->
	<form name="frm1" action="binsert" method="post" enctype="multipart/form-data">
		<input type="text" name="uid" value="${id}" style="display:none;">
		<input type="text" name="nick" value="${nick}" style="display:none;">
		<div class="modal_wrap" id="modal_wrap1"> <!-- â ��ü -->
			<div class="modal_close" id="modal_close1"><a href="javascript:void(0);">close</a></div>
	    		<div class="page1" id="page1" style="display : block">
	    			<h2 class="title">[1/9] � �ݷ������ΰ���?</h2>
	    		    <input type="radio" class="rad" name="pcate" value="������"> ������ <br/><br/>
	    		    <input type="radio" class="rad" name="pcate" value="�����"> ����� <br/>
	   		 	</div>
	   		 	<div class="page1">
	   		 		<h2 class="title"> [2/9] � ���񽺸� ���Ͻó���?</h2>
	    		    <input type="radio" class="rad" name="beauty_classification" value="���"> ��� <br/><br/>
	    		    <input type="radio" class="rad" name="beauty_classification" value="��ü�̿�"> ��ü�̿� <br/><br/>
	    		    <input type="radio" class="rad" name="beauty_classification" value="�κй̿�"> �κй̿� <br/><br/>
	    		    <input type="radio" class="rad" name="beauty_classification" value="�����̿�"> �����̿� <br/><br/>
	   		 	</div>
	   		 	<div class="page1">
	   		 		<h2 class="title">[3/9] �ݷ����� ü���� �������ּ���</h2>
	    		    <input type="radio" class="rad" name="weight" value="4kg�̸�"> 4kg�̸� <br/><br/>
	    		    <input type="radio" class="rad" name="weight" value="4~7kg"> 4~7kg <br/><br/>
	    		    <input type="radio" class="rad" name="weight" value="7~10kg"> 7~10kg <br/><br/>
	    		    <input type="radio" class="rad" name="weight" value="10~14kg"> 10~14kg <br/><br/>
	   		 	</div>
	   		 	<div class="page1">
	   		 		<h2 class="title">[4/9] �ݷ����� ���̸� �������ּ���</h2>
	    		    <input type="radio" class="rad" name="age" value="1��̸�"> 1��̸�<br/><br/>
	    		    <input type="radio" class="rad" name="age" value="1~9��">  1~9��<br/><br/>	
	    		    <input type="radio" class="rad" name="age" value="10���̻�"> 10���̻� <br/><br/>
	   		 	</div>
	   		 	<div class="page1">
	   		 		<h2 class="title"> [5/9] ������ �̿�ñ�� �������ּ���</h2>
	    		    <input type="radio" class="rad" name="last_beautydate" value="ù�̿�"> ù�̿� <br/><br/>
	    		    <input type="radio" class="rad" name="last_beautydate" value="1�� ����"> 1�� ���� <br/><br/>
	    		    <input type="radio" class="rad" name="last_beautydate" value="2�� ����"> 2�� ���� <br/><br/>
	    		    <input type="radio" class="rad" name="last_beautydate" value="3�� ����"> 3�� ���� <br/><br/>
	    		    <input type="radio" class="rad" name="last_beautydate" value="unknown"> �� �𸣰ڴ� <br/><br/>
	   		 	</div>
	   		 	<div class="page1">
	   		 		<h2 class="title"> [6/9] ��� �����ϱ⸦ ���Ͻó���?</h2>
	    		    <input type="radio" class="rad" name="service_place" value="��(���� ����)"> ��(���� ����) <br/><br/>
	    		    <input type="radio" class="rad" name="service_place" value="���� �̿��"> ���� �̿�ü� <br/><br/>
	    		    <input type="radio" class="rad" name="service_place" value="����"> ���� <br/><br/>
	   		 	</div>
	   		 	<div class="page1">
	   		 		<h2 class="title"> [7/9] ����������� �������ּ���</h2>
	    		    <input type="radio" class="rad" name="wish_date" value="����"> ���� ���� <br/><br/>
	    		    <input type="radio" class="rad" name="wish_date" value="������ ���� ����">  ������ ���� ����<br/><br/>
	    		    <input type="radio" class="rad" name="wish_date" value="���� �̳�">  ������ �̳� ����<br/><br/>
	    		    <input type="radio" class="rad" name="wish_date" value="��� ����"> ��� ����  <br/><br/>
	   		 	</div>
	   		 	<div class="page1">
	   		 		<h2 class="title"> [8/9] ���� ��� ������ �����ּ���</h2>
	    		    <div class="city"><span class="sido">��/�� &nbsp; &nbsp; : </span><input type="text" style="margin-left:2px; margin-bottom:10px;" placeholder="ex. ��⵵" name="wish_local1"> <br/>
	    		   <span class="gungu"> ��/��/�� : </span><input type="text" placeholder="ex. ��õ��" name="wish_local2"></div>
	   		 	</div>
	   		 	<div class="page1">
	   		 		<h2 class="title"> [9/9] ���� ���� ���� �� ���λ����� �����ּ���</h2>
	    		    <div class="texta"><textarea style="width" rows="6" cols="50" name="detailed_matters" placeholder="�ݷ������� ǰ��, ����, ���� ���� �˷��ֽø� ���ƿ�!"></textarea></div>
	   		 	</div>
	   		 <button type="button" class="buttonc" id="prev1" disabled>����</button> &nbsp; <input type="button" class="buttonc" id="next1" value="����">
	   		 <input type="submit" class="buttonb" value="��û������">
   		</div> 
   	</form>
   	
   	<form name="frm2"  action="cinsert" method="post" enctype="multipart/form-data">
   		<input type="text" name="uid" value="${id}" style="display:none;">
   		<input type="text" name="nick" value="${nick}" style="display:none;">
 		<div class="modal_wrap" id="modal_wrap2"> <!-- â ��ü -->
			<div class="modal_close" id="modal_close2"><a href="javascript:void(0);">close</a></div>
	   		 	<div class="page2" id="page2" style="display : block;">
	    		    <h2 class="title">[1/5] �ǹ������� �������ּ���</h2>
	    		    <input type="radio" class="rad" name="building_classification" value="����Ʈ"> ����Ʈ <br/><br/>
	    		    <input type="radio" class="rad" name="building_classification" value="����"> ���� <br/><br/>
	    		    <input type="radio" class="rad" name="building_classification" value="����"> ���� <br/><br/>
	    		    <input type="radio" class="rad" name="building_classification" value="���ǽ���"> ���ǽ��� <br/><br/>
	   		 	</div>
	   		 	<div class="page2">
	    		     <h2 class="title">[2/5] �� ������ �������ּ���</h2>
	    		      <input type="radio" class="rad" name="house_size" value="10�� �̸�"> 10�� �̸� <br/><br/>
	    		    <input type="radio" class="rad" name="house_size" value="10���"> 10���<br/><br/>
	    		    <input type="radio" class="rad" name="house_size" value="20���"> 20���<br/><br/>
	    		    <input type="radio" class="rad" name="house_size" value="30���"> 30���<br/><br/>
	    		    <input type="radio" class="rad" name="house_size" value=> ��Ÿ   <input type="text" id="house_size_text" disabled>
	    		    
	   		 	</div>
	   		 	<div class="page2">
	    		     <h2 class="title">[3/5] Ŭ���� ���ϴ� ���� �������ּ���</h2>
	    		      <input type="radio" class="rad" name="wish_date" value="����"> ���� ���� <br/><br/>
	    		    <input type="radio" class="rad" name="wish_date" value="������ ����"> ������ ���� <br/><br/>
	    		    <input type="radio" class="rad" name="wish_date" value="���� �̳�"> ���� �̳�<br/><br/>
	    		    <input type="radio" class="rad" name="wish_date" id="wish_date" value=> ���ϴ� �� ���� <input type="date" id="wish_date_date" style="display: none;">
	    		    
	   		 	</div>
	   		 	<div class="page2">
	    		     <h2 class="title"> [4/5] ���ϴ� ������ �������ּ���</h2>
	    		      <div class="city"><span class="sido">��/�� &nbsp; &nbsp; : </span><input type="text" style="margin-left:2px; margin-bottom:10px;" placeholder="ex. ��⵵" name="wish_local1"> <br/>
	    		   <span class="gungu"> ��/��/�� : </span><input type="text" placeholder="ex. ��õ��" name="wish_local2"></div>
	   		 	</div>
	   		 	<div class="page2">
	    		     <h2 class="title"> [5/5] Ŭ���� ���� ��������� �����ּ���</h2>
	    		     <div class="texta"><textarea style="width" rows="6" cols="50" name="hope_matters" placeholder="ex. ���� ���� �� ��ռҵ� ���ؿ�"></textarea></div>
	   		 	</div>
   		 	 <button type="button" class="buttonc" id="prev2" disabled>����</button> &nbsp; <input type="button" class="buttonc" id="next2" value="����">
	   		 <input type="submit" class="buttonb" value="��û������">
   		</div> 
  	</form>
  	
  	<form name="frm3"  action="linsert" method="post" enctype="multipart/form-data">
  		<input type="text" name="uid" value="${id}" style="display:none;">
  		<input type="text" name="nick" value="${nick}" style="display:none;">
   		<div class="modal_wrap" id="modal_wrap3"> <!-- â ��ü -->
			<div class="modal_close" id="modal_close3"><a href="javascript:void(0);">close</a></div>
	   		 	<div class="page3" id="page3" style="display : block;">
	    		   <h2 class="title">[1/11] � ������ ���Ͻó���?</h2>
	    		    <input type="radio" class="rad" name="lesson_classification" value="�� �Ʒ� ����"> �Ʒ� <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_classification" value="�� �̿� ����"> �̿� <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_classification" value="�� ��ǰ ���� ����"> ���ǰ ���� <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_classification" value=> ��Ÿ <input type="text" id="lesson_text" disabled>
	   		 	</div>
	   		 	<div class="page3">
	    		    <h2 class="title">[2/11] ���� �޴� ������ �����ΰ���?</h2>
	    		    <input type="radio" class="rad" name="lesson_goal" value="Ȩ�ɾ�"> Ȩ �ɾ� <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_goal" value="�ڰ��� ���"> �ڰ��� ��� <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_goal" value="��� �غ�"> ��� �غ� <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_goal" value="â�� �غ�"> â�� �غ� <br/><br/>
	   		 	</div>
	   		 	<div class="page3">
	    		    <h2 class="title">[3/11] � ���� ���¸� ���Ͻó���?</h2>
	    		    <input type="radio" class="rad" name="lesson_method" value="���� ����"> ���� ����<br/><br/>
	    		    <input type="radio" class="rad" name="lesson_method" value="�׷� ����"> �׷� ���� <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_method" value="�¶��� ����"> �¶��� ���� <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_method" value="�п�"> �п� <br/><br/>
	   		 	</div>
	   		 	<div class="page3">
	    		    <h2 class="title">[4/11] ���ɴ븦 �������ּ���</h2>
	    		    <input type="radio" class="rad" name="age" value="10�� �̸�"> 10�� �̸�<br/><br/>
	    		    <input type="radio" class="rad" name="age" value="10��"> 10�� <br/><br/>
	    		    <input type="radio" class="rad" name="age" value="20��"> 20�� <br/><br/>
	    		    <input type="radio" class="rad" name="age" value="30��"> 30�� <br/><br/>
	    		    <input type="radio" class="rad" name="age" value="40��"> 40�� �̻� 
	   		 	</div>
	   		 	<div class="page3">
	    		    <h2 class="title">[5/11] ������ ��� �ǽó���?</h2>
	    		    <input type="radio" class="rad" name="gender" value="����"> ���� <br/><br/>
	    		    <input type="radio" class="rad" name="gender" value="����"> ���� <br/><br/>
	   		 	</div>
	   		 	<div class="page3">
	    		    <h2 class="title">[6/11] ��ȣ�ϴ� ������ ������ �����Ű���?</h2>
	    		    <input type="radio" class="rad" name="wish_gender" value="����"> ���� <br/><br/>
	    		    <input type="radio" class="rad" name="wish_gender" value="����"> ���� <br/><br/>
	    		    <input type="radio" class="rad" name="wish_gender" value="����"> ���� <br/><br/>
	   		 	</div>
	   		 	<div class="page3">
	    		    <h2 class="title">[7/11] ���� �ޱ� ���� ��¥�� �������ּ���</h2>
	    		    <label><input type="checkbox" class="rad" name="wish_date" value="��"> �� </label> <br/>
	    		     <label><input type="checkbox" class="rad" name="wish_date" value="ȭ"> ȭ</label>  <br/>
	    		     <label><input type="checkbox" class="rad" name="wish_date" value="��"> ��</label>  <br/>
	    		     <label><input type="checkbox" class="rad" name="wish_date" value="��"> ��</label>  <br/>
	    		     <label><input type="checkbox" class="rad" name="wish_date" value="��"> ��</label> <br/>
	    		     <label><input type="checkbox" class="rad" name="wish_date" value="��"> ��</label> <br/>
	    		     <label><input type="checkbox" class="rad" name="wish_date" value="��� ��"></label> ��� ��
	   		 	</div>
	   		 	<div class="page3">
	    		    <h2 class="title">[8/11] ����ϴ� ���� �ð��븦 �������ּ���</h2>
	    		    <input type="radio" class="rad" name="wish_time" value="�̸� ����(9�� ����)"> �̸� ����(9�� ����) <br/>
	    		    <input type="radio" class="rad" name="wish_time" value="����(9~12��)"> ����(9~12��) <br/>
	    		    <input type="radio" class="rad" name="wish_time" value="����(12~3��)"> ����(12~3��) <br/>
	    		    <input type="radio" class="rad" name="wish_time" value="���� ����(3��~6��)"> ���� ����(3��~6��) <br/>
	    		    <input type="radio" class="rad" name="wish_time" value="����(6~9��)">  ����(6~9��) <br/>
	    		    <input type="radio" class="rad" name="wish_time" value="���� ����(9�� ����)"> ���� ����(9�� ����) <br/>
	   		 	</div>
	   		 	<div class="page3">
	    		    <h2 class="title">[9/11] ��� �����ϱ� ���Ͻó���?</h2>
	    		    <input type="radio" class="rad" name="lesson_place" value="������ ��ҷ�"> ���� �ִ� ������ ���ּ��� <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_place" value="������"> ������ <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_place" value="����"> ���� <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_place" value=> ��Ÿ <input type="text" id="place_text" disabled>
	   		 	</div>
	   		 	<div class="page3">
	    		    <h2 class="title">[10/11] ���ϴ� ������ �������ּ���</h2>
	    		    <div class="city"><span class="sido">��/�� &nbsp; &nbsp; : </span><input type="text" style="margin-left:2px; margin-bottom:10px;" placeholder="ex)��⵵" name="wish_local1"> <br/>
	    		   <span class="gungu"> ��/��/�� : </span><input type="text" placeholder="ex)��õ��" name="wish_local2"></div>
	   		 	</div>
	   		 	<div class="page3">
	    		    <h2 class="title">[11/11] ���� ���� ���� ������ �����ּ���</h2>
	    		    <div class="texta"><textarea style="width" rows="6" cols="50" name="detailed_matters" placeholder="ex. �� �̿� �ڰ����� ���� �;��"></textarea></div>
	   		 	</div>
   		 	 <button type="button" class="buttonc" id="prev3" disabled>����</button> &nbsp; <input type="button" class="buttonc" id="next3" value="����">
	   		 <input type="submit" class="buttonb" value="��û������">
   		</div>
 	</form>
 	
</body>

<script>
var pageo = document.getElementsByClassName("page1");
var pages = document.getElementsByClassName("page2");
var paget = document.getElementsByClassName("page3");
var i=0; 
var s=0;
var t=0;


//��Ÿ
$("input:radio[name='house_size']").click(function(){
	var etcCheck1 = $('input:radio[name="house_size"]:checked').val();
	if( etcCheck1 == ""){
		$('#house_size_text').attr("disabled", false);
	}else{
		$('#house_size_text').attr("disabled", true);
	}
});

$("input:radio[name='lesson_classification']").click(function(){
	var etcCheck2 = $('input:radio[name="lesson_classification"]:checked').val();
	if( etcCheck2 == ""){
		$('#lesson_text').attr("disabled", false);
	}else{
		$('#lesson_text').attr("disabled", true);
	}
});

$("input:radio[name='lesson_place']").click(function(){
	var etcCheck3 = $('input:radio[name="lesson_place"]:checked').val();
	if( etcCheck3 == ""){
		$('#place_text').attr("disabled", false);
	}else{
		$('#place_text').attr("disabled", true);
	}
});

//���ϴ� ��¥
$("#wish_date").on("click", function(){
	if($(frm2.wish_date_date).css("display") == "none"){
         $(frm2.wish_date_date).show();
	}else{
		$(frm2.wish_date_date).hide();
	}
})

//frm1
$("#next1").on("click", function(){
	pageo[i].style.display = 'none';
	if(i < pageo.length){i++}
	var si= i;
	pageo[si].style.display = 'block';
	$("#prev1").attr("disabled", false);
	if(i == pageo.length - 1){
		$(this).css({display : 'none'});
		$('.buttonb').css({display : 'block'});
	}else{
		$(this).css({display : ''});
		$('.buttonb').css({display : 'none'});
	}
});

$("#prev1").on("click", function(){
	$(".buttonb").css({display:"none"});
	$("#next1").css({display:""});
	pageo[i].style.display = 'none';
	i--
	pageo[i].style.display = 'block';
	if(i == 0){
		$(this).attr("disabled", true);
	}
});

$(frm1).on("submit", function(e){
	e.preventDefault();
	var uid=$(frm1.uid).val();
	var nick=$(frm1.nick).val();
	var pcate = $(':radio[name="pcate"]:checked').val();
	var beauty_classification = $(':radio[name="beauty_classification"]:checked').val();
	var weight = $(':radio[name="weight"]:checked').val();
	var age = $(':radio[name="age"]:checked').val();
	var last_beautydate = $(':radio[name="last_beautydate"]:checked').val();
	var service_place = $(':radio[name="service_place"]:checked').val();
	var wish_date = $(':radio[name="wish_date"]:checked').val();
	var wish_local1 = $(frm1.wish_local1).val();
	var wish_local2 = $(frm1.wish_local2).val();
	var detailed_matters = $(frm1.detailed_matters).val();
	
	alert(nick + "\n" + uid + "\n" + pcate + "\n" + beauty_classification + "\n" +  weight + "\n" + age + "\n" + last_beautydate + "\n" + service_place + 
			"\n" + wish_date + "\n" + wish_local1 + "\n" + wish_local2 + "\n" + detailed_matters);
	if(pcate == null){
		alert("1�� ������ �������ּ���");
		return;
	}else if(beauty_classification == null){
		alert("2�� ������ �������ּ���");
		return;
	}else if(weight == null){
		alert("3�� ������ �������ּ���");
		return;
	}else if(age == null){
		alert("4�� ������ �������ּ���");
		return;
	}else if(last_beautydate == null){
		alert("5�� ������ �������ּ���");
		return;
	}else if(service_place == null){
		alert("6�� ������ �������ּ���");
		return;
	}else if(wish_date == null){
		alert("7�� ������ �������ּ���");
		return;
	}else if(wish_local1 ==""){
		alert("8�� ������ �������ּ���");
		return;
	}else if(wish_local2 ==""){
		alert("8�� ������ �������ּ���");
		return;
	}
	if(!confirm("��û���� �ۼ��Ͻðڽ��ϱ�?")) return;
	frm1.submit();
});

//frm2
$("#next2").on("click", function(){
	pages[s].style.display = 'none';
	if(s < pages.length){s++}
	var ss= s;
	pages[ss].style.display = 'block';
	$("#prev2").attr("disabled", false);
	if(s == pages.length - 1){
		$(this).css({display : 'none'});
		$('.buttonb').css({display : 'block'});
	}else{
		$(this).css({display : ''});
		$('.buttonb').css({display : 'none'});
	}
});

$("#prev2").on("click", function(){
	$(".buttonb").css({display:"none"});
	$("#next2").css({display:""});
	pages[s].style.display = 'none';
	s--
	pages[s].style.display = 'block';
	if(s == 0){
		$(this).attr("disabled", true);
	}
});

$(frm2).on("submit", function(e){
	e.preventDefault();
	var uid=$(frm2.uid).val();
	var building_classification = $(':radio[name="building_classification"]:checked').val();
	var house_size = $(':radio[name="house_size"]:checked').val();
	var wish_date = $(':radio[name="wish_date"]:checked').val();
	var wish_local1 = $(frm2.wish_local1).val();
	var wish_local2 = $(frm2.wish_local2).val();
	var hope_matters = $(frm2.hope_matters).val();
	
	var house_size_etc = $("#house_size_text").val();
	var wish_date_date = $("#wish_date_date").val();
	
	alert("uid : " + uid + "\n" + "building_classification : " + building_classification + "\n" +  "house_size : " + house_size + "\n" +   "wish_date : " + wish_date + "\n" + wish_local1 + "\n" + wish_local2 + "\n" + hope_matters
			+ "\n" + "house_size_etc : " + house_size_etc + "\n" + "wish_date_date : " + wish_date_date);
	
	if(building_classification== null){
		alert("1�� ������ �������ּ���");
		return;
	}else if(house_size == null && house_size_text == ""){
		alert("2�� ������ �������ּ���");
		return;
	}else if(wish_date == null &&  wish_date_date == ""){
		alert("3�� ������ �������ּ���");
		return;
	}else if(wish_local1 == ""){
		alert("4�� ������ �������ּ���");
		return;
	}else if(wish_local2 ==""){
		alert("4�� ������ �������ּ���");
		return;
	}else{
		if(!confirm("��û���� �ۼ��Ͻðڽ��ϱ�?")) return;
		if(wish_date == ""){
			var date = $("#wish_date_date").val();
			$(frm2.wish_date).val(date);
		}
		if(house_size == ""){
			var size = $("#house_size_text").val();
			$(frm2.house_size).val(size);
		}
	}
	
	frm2.submit();
});

//frm3
$("#next3").on("click", function(){
	paget[t].style.display = 'none';
	if(t < paget.length){t++}
	var st= t;
	paget[st].style.display = 'block';
	$("#prev3").attr("disabled", false);
	if(t == paget.length - 1){
		$(this).css({display : 'none'});
		$('.buttonb').css({display : 'block'});
	}else{
		$(this).css({display : ''});
		$('.buttonb').css({display : 'none'});
	}
});

$("#prev3").on("click", function(){
	$(".buttonb").css({display:"none"});
	$("#next3").css({display:""});
	paget[t].style.display = 'none';
	t--
	paget[t].style.display = 'block';
	if(t == 0){
		$(this).attr("disabled", true);
	}
});

$(frm3).on("submit", function(e){
	e.preventDefault();
	var uid=$(frm3.uid).val();
	var lesson_classification = $(':radio[name="lesson_classification"]:checked').val();
	var lesson_goal = $(':radio[name="lesson_goal"]:checked').val();
	var lesson_method = $(':radio[name="lesson_method"]:checked').val();
	var age = $(':radio[name="age"]:checked').val();
	var gender = $(':radio[name="gender"]:checked').val();
	var wish_gender = $(':radio[name="wish_gender"]:checked').val();
	var wish_date = $(':checkbox[name="wish_date"]:checked').val();
	var wish_time = $(':radio[name="wish_time"]:checked').val();
	var lesson_place = $(':radio[name="lesson_place"]:checked').val();
	var wish_local1 = $(frm3.wish_local1).val();
	var wish_local2 = $(frm3.wish_local2).val();
	var detailed_matters = $(frm3.detailed_matters).val();
	
	var lesson_classification_etc = $("#lesson_text").val();
	var lesson_place_etc = $("#place_text").val();
	
	console.log(wish_date);
	alert("uid : " + uid + "\n" + "lesson_classification : " + lesson_classification + "\n" +  
	"lesson_goal : " + lesson_goal + "\n" + "lesson_method : " + lesson_method + "\n" + "age : " + age + "\n" + "gender : " + gender 
	+ "\n" + "wish_gender : " + wish_gender + "\n" + "wish_date : " + wish_date + "\n" + "wish_time : " + wish_time 
	+ "\n" + "lesson_place : " + lesson_place + "\n" + "wish_local1 : " + wish_local1 + "\n" + "wish_local2 : " + wish_local2 +
	"\n" + "detailed_matters : " + detailed_matters + "\n" + "lesson_classification_etc : " + lesson_classification_etc + "\n" 
	+ "lesson_place_etc : " +  lesson_place_etc);
	
	if(lesson_classification == null && lesson_classification_etc == ""){
		alert("1�� ������ �������ּ���");
		return;
	}else if(lesson_goal == null){
		alert("2�� ������ �������ּ���");
		return;
	}else if(lesson_method == null){
		alert("3�� ������ �������ּ���");
		return;
	}else if(age == null){
		alert("4�� ������ �������ּ���");
		return;
	}else if(gender == null){
		alert("5�� ������ �������ּ���");
		return;
	}else if(wish_gender == null){
		alert("6�� ������ �������ּ���");
		return;
	}else if(wish_date == null){
		alert("7�� ������ �������ּ���");
		return;
	}else if(wish_time == null){
		alert("8�� ������ �������ּ���");
		return;
	}else if(lesson_place == null && lesson_place_etc == ""){
		alert("9�� ������ �������ּ���");
		return;
	}else if(wish_local1 == "" || wish_local2 == ""){
		alert("10�� ������ �������ּ���");
		return;
	}else{
		if(!confirm("��û���� �ۼ��Ͻðڽ��ϱ�?")) return;
		if(lesson_classification == ""){
			$(frm3.lesson_classification).val(lesson_classification_etc);
		}
		if(lesson_place == ""){
			$(frm3.lesson_place).val(lesson_place_etc);
		}
	}
	
	frm3.submit();
});

var services = document.getElementsByName("service");

for(a=0; a < services.length; a++){
    services[a].addEventListener('click', function(){
    console.log('function ON');
    console.log(this.id);
    switch(this.id){
        case "modal_btn1" :
        	document.querySelector('.black_bg').style.display ='block';
        	document.querySelector('#modal_wrap1').style.display ='block';
            break;
        case "modal_btn2" :
        	document.querySelector('.black_bg').style.display ='block';
        	document.querySelector('#modal_wrap2').style.display ='block';
            break;             
        case "modal_btn3" :
        	document.querySelector('.black_bg').style.display ='block';
        	document.querySelector('#modal_wrap3').style.display ='block';
            break;
    }
});
}

window.onload = function() {
	 

    function offClick() {
        document.querySelector('#modal_wrap1').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
        $('.page1').css({display:'none'});
    	$('#page1').css({display:'block'});
    	$("#next1").css({display : ''});
		$('.buttonb').css({display : 'none'});
		i=0;
        
    }
    function offClick1() {
        document.querySelector('#modal_wrap2').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
        $('.page2').css({display:'none'});
    	$('#page2').css({display:'block'});
    	$("#next2").css({display : ''});
		$('.buttonb').css({display : 'none'});
		s=0;
    }
    function offClick2() {
        document.querySelector('#modal_wrap3').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
        $('.page3').css({display:'none'});
    	$('#page3').css({display:'block'});
    	$("#next3").css({display : ''});
		$('.buttonb').css({display : 'none'});
		t=0;
    }
    document.querySelector('#modal_close1').addEventListener('click', offClick);
    document.querySelector('#modal_close2').addEventListener('click', offClick1);
    document.querySelector('#modal_close3').addEventListener('click', offClick2);
};
</script>
</html>