<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	#popup01{
	    display: none;
	}
	#popup01{
	width: 500px;
	height: 620px;
	position: absolute;
	top: 30%;
	left: 50%;
	margin: -250px 0 0 -250px;
	background-color: #fff;
	z-index: 2;
	padding: 20px 100px;

	border-radius: 30px;
	    }
	.backon{
	    content: "";
	    width: 100%;
	    height: 100%;
	    background: #00000054;
	    position: fixed;
	    top: 0;
	    left: 0;
	    z-index: 1;
	}
	.close{
	  position:absolute;
	  top:670px;
	  right: 300px;
	  cursor:pointer;
	}
	
	.openPopup{
	
	  cursor:pointer;
	
	}
	.list{
		overflow: auto;
		margin: 20px;
		padding: 20px;
		text-align: center;
		font-size: 12px;
		height: 100px;
		cursor: pointer;
	}
	.hiddenbtn{
		display: none;
	}
	#oldreserve{
		margin-left: 150px;
		display: none;
	}
	#btnOldList{
		text-align: center;
		cursor: pointer;
	}
	.oldlist{
		overflow: auto;
		margin: 20px;
		padding: 20px;
		text-align: center;
		font-size: 12px;
		height: 100px;
		cursor: pointer;
	}
   #serviceInfo, #date{
   		border-bottom: 1px solid gray;
   }
   #date{
   	padding: 30px 0px;
   }
   #btnReserve{
   		margin-left: 200px;
   }
   .EditMessage{
   		display: none;
   		color:red;
   }
   .hiddenbtn2{
   		display: none;
   		color:red;
   }
</style>
<div id="page">
	<div id="reserveList">
		<h1>나의 예약리스트</h1>
		<div id="sidemenu">
			<jsp:include page="${sideMenu}" />
		</div>
		<div id="myreserve">
			<table id="tbl"></table>
			<script id="temp" type="text/x-handlebars-template">
				{{#each list}}

					<tbody class="list" isEdit="{{isEdit}}"  isDel="{{isDel}}">
						<tr>
							<td>업체명</td>
							<td><span class="scname">{{scname}}</span></td>
							<td>예약일</td>
							<td><span class="reserveDate">{{reserveDate}}</span></td>
						</tr>
						<tr>	
							<td>예약자 성함</td>
							<td class="userName">{{userName}}</td>
							<td>예약자 연락처</td>
							<td class="userTel">{{userTel}}</td>
						</tr>
					
						<tr>
							<td width=100>예약날짜</td>
							<td width=200>
								<span class="checkin">{{checkin}}</span>
								&nbsp; ~ &nbsp;
								<span class="checkout">{{checkout}}</span>
							</td>
							<td width=100>업체 연락처</td>
							<td width=150 class="sctel">{{sctel}}</td>
						</tr>
						<tr>
							<td class="EditMessage" colspan=4 style="border-left: hidden; border-right:hidden; text-align: right;">
								<p class="msg">예약 변경 요청중입니다</p>
							</td>
							<td colspan=4 class="hiddenbtn" style="border-left: hidden; border-right:hidden; text-align: right;">
								<button class="openPopup" rno={{rno}}>예약변경</button> &nbsp;
								<button class="reserveCancel" rno={{rno}}>예약취소</button>
							</td>
							<td colspan=2 class="hiddenbtn2" style="border-left: hidden; border-right:hidden; text-align: right;">
								<span class="msg">예약변경이 거절되었습니다.</span>
							</td>
							<td colspan=2 class="hiddenbtn2" style="border-left: hidden; border-right:hidden; text-align: right;">
								<button class="btnYes" rno={{rno}}>확인</button> &nbsp;
								<button class="reserveCancel" rno={{rno}}>예약취소</button>
							</td>
						</tr>
						<tr>
							<td colspan=4 style="border-left: hidden; border-right:hidden; text-align: right;"></td>
						</tr>
					</tbody>
				{{/each}}	
		</script>
		</div>
	</div>
	<hr>
	<div id="oldReserveList">
		<p id="btnOldList">나의 지난 예약리스트 보기</p>

		<div id="oldreserve">
			<table id="tbl2"></table>
			<script id="temp2" type="text/x-handlebars-template">
				{{#each oldlist}}

					<tbody class="oldlist" rno={{rno}}>
						<tr>
							<td>업체명</td>
							<td><span class="scname">{{scname}}</span></td>
							<td>예약일</td>
							<td><span class="reserveDate">{{reserveDate}}</span></td>
						</tr>
						<tr>	
							<td>예약자 성함</td>
							<td class="userName">{{userName}}</td>
							<td>예약자 연락처</td>
							<td class="userTel">{{userTel}}</td>
						</tr>
						<tr>
							<td width=100>예약날짜</td>
							<td width=200>
								<span class="checkin">{{checkin}}</span>
								&nbsp; ~ &nbsp;
								<span class="checkout">{{checkout}}</span>
							</td>
							<td width=100>업체 연락처</td>
							<td width=150 class="sctel">{{sctel}}</td>
						</tr>
						<tr>
							<td colspan=4 style="border-left: hidden; border-right:hidden; text-align: right;"></td>
						</tr>
					</tbody>
				{{/each}}	
		</script>
		</div>
	</div>
	<div id="popup01"></div>
		<script id="temp3" type="text/x-handlebars-template">
			<div id = "modal">
				<div id="serviceInfo">
					<h2 style="margin-left: 150px;" id="scname">{{scname}}</h2>
					<span id="scno" value="{{scno}}" style="display:none;"></span>
					<p>전화: <span class="num" id="sctel">{{sctel}}</span></p>
					<p>위치: <span id="scaddress1">{{scaddress1}}</span></p>
				</div>
				
				<div id="date">
					<span>체크인 <span id="checkin"><input type="date" id="checkinDate" value={{checkin}}></span></span>
					<span>체크아웃 <span id="checkout"><input type="date" id="checkoutDate" value={{checkout}}></span></span>
				</div>
				
				<div id="user">
					본인정보와 동일<input type="checkbox" id="userCheck" checked>
					<p>예약자 성함</p>
					<input type="text" id="userName" value="{{userName}}">
					<p>예약자 연락처</p>
					<input type="hidden" id="userTel" name="userTel" value="{{userTel}}">
					<input type="text" id="userTel1" size=3>
					<input type="text" id="userTel2" size=4>
					<input type="text" id="userTel3" size=4>
				</div>
				
				<div>
					<p>요청사항</p>
					<p><textarea rows="5" cols="40" id="request">{{request}}</textarea><p>
				</div>
				<div id="button">
					<button id="btnReserve">변경요청</button>
				</div>
				<div id="btnClose">
					<button class="close">종료</button>
				</div>
			</div>
		</div>
	</script>
</div>

<script>
	
	
	//종료버튼 클릭시
	$(".close").on("click",function(e){
		e.preventDefault();
		$("#popup01").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
	    $(".backon").hide();
	});
	
	//모달팝업 생성
	$(document).ready(function( $ ){     
	$("#myreserve").on("click",".openPopup", function(event) {  //팝업오픈 버튼 누르면
		$("#popup01").show();   //팝업 오픈
		$("body").append('<div class="backon"></div>'); //뒷배경 생성
		
		var rno = $(this).attr("rno");
	
		$.ajax({
			type: "get",
			url: "/reserve/myReserve.json",
			dataType:"json",
			data: {rno:rno},
			success: function(data){
				var template = Handlebars.compile($("#temp3").html());
				$("#popup01").html(template(data));
			
				
				//전화번호 포멧
				var num = $("#popup01").find(".num").html();
	
				var formatNum = '';
			
				if(num.length==11){
				    formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
				}else if(num.length==8){
				    formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
				}else if(num.indexOf('02')==0){
				    formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
				}else{
				    formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
				}
				$("#popup01").find(".num").html(formatNum);
					
				//전체전화번호 
				var userTel=$("#userTel").val();
				//유저네임
				var name= $("#userName").val();
	
				//전화번호 substring
				var tel1=userTel.substring(0,3);
				var tel2=userTel.substring(3,7);
				var tel3=userTel.substring(7,11);
				//substring 한 전화번호 출력
				$("#userTel1").val(tel1);
				$("#userTel2").val(tel2);
				$("#userTel3").val(tel3);
				
				//체크박스가 변동된 경우
				$("#userCheck").on("change", function(){
					if($(this).is(":checked")){
						$("#userName").val(name);
						$("#userTel1").val(tel1);
						$("#userTel2").val(tel2);
						$("#userTel3").val(tel3);
					}else{
						$("#userName").val("");
						$("#userTel1").val("");
						$("#userTel2").val("");
						$("#userTel3").val("");
					}
				});
				//변경요청 버튼을 클릭한 경우
				$("#button").on("click","#btnReserve", function(){
					var checkin = $("#checkinDate").val();
					var checkout = $("#checkoutDate").val();
					var request = $("#request").val();
					var userName = $("#userName").val();
					var tel1=$("#userTel1").val();
					var tel2=$("#userTel2").val();
					var tel3=$("#userTel3").val();
					var userTel = tel1 + tel2 + tel3;
					var isEdit = 1;
					var isDel = 0;
					console.log("체크인: "+checkin + "\n" +"체크아웃: "+checkout + "\n" + "요청사항: "+request + "\n" +"예약자 : "+userName + "\n" +"예약자 연락처 : "+userTel + "rno"+ rno);
					if(!confirm("수정요청 하시겠습니까?")) return;
						$.ajax({
							type:"post",
							url: "/reserve/updateReserve",
							data: {checkin:checkin, checkout:checkout, request:request, userName:userName, userTel:userTel, rno:rno, isEdit:isEdit, isDel:isDel},
							success: function(){
								if(!confirm("수정이 완료되었습니다. 수정내역을 확인하시겠습니까?")) return;
								location.href="/reserve/myreserveList?id=${id}";
							}
						});
				});
				
			}
		});
	});
	//뒷배경 클릭시
	$("body").on("click", function(event) { 
	    if(event.target.className == 'close' || event.target.className == 'backon'){
	        $("#popup01").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
	          $(".backon").hide();
	    }
	  });
	
	});
	//지난리스트 보기 클릭시
	$("#btnOldList").on("click", function(){
		var target = $("#oldreserve");
	//		target.toggleClass("hidden")
		if(target.css("display") == "none"){
			target.show();
		}else {
			target.hide();
		}
	});
	//예약리스트 클릭했을 때 토글
	$("#tbl").on("click",".list", function(){
		var isEdit = $(this).attr("isEdit");
		var isDel = $(this).attr("isDel");
		var target = $(this).find(".hiddenbtn");	//확인/취소버튼
		var target2 = $(this).find(".EditMessage");	//메세지출력
		var target3 = $(this).find(".EditMessage2");	//예약변경 거절시

		if(isEdit==1){		//예약변경요청 한 경우
			if(target2.css("display") == "none"){
				target2.show();
			}else {
				target2.hide();
			}
			
		}else if(isEdit == 0 && isDel == 0){	//평상시
			if(target.css("display") == "none"){
				target.show();
			}else {
				target.hide();
			}
		}else if(isDel == 1){	//취소요청 한 경우
			if(target2.css("display") == "none"){
				target2.show();
				target2.html("취소 요청 중 입니다.")
				alert("isDel이 1일때")
			}else {
				target2.hide();
			}
		}else if(isEdit ==2){	//예약변경 거절시
			if(target3.css("display") == "none"){
				target3.show();
			}else {
				target3.hide();

			}
		}else if(isDel==2){		//예약변경요청 한 경우
			if(target2.css("display") == "none"){
				
				target2.find(".msg").html("예약이 취소되었습니다.");
				target2.show();
			}else {
				target2.hide();
			}
			
		}
	});
		
	
		
		
		
	getList();
	getOldList()
	
	function getList(){
		$.ajax({
			type: "get",
			url: "/reserve/myreserveList.json",
			dataType:"json",
			success: function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
				
				//예약날짜 섭스트링
				$(".list").each(function(){
					var target = $(this).find(".checkin").html();
					var checkin = target.substring(0,10);
					$(this).find(".checkin").html(checkin);
					
					var target = $(this).find(".checkout").html();
					var checkout = target.substring(0,10);
					$(this).find(".checkout").html(checkout);
					
					//전화번호 포멧
					var num = $(this).find(".sctel").html();
					var tel = $(this).find(".userTel").html();
					var formatNum = '';
					var formatTel = '';
					
					if(num.length==11){
					    formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
					}else if(num.length==8){
					    formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
					}else if(num.indexOf('02')==0){
					    formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
					}else{
					    formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
					}
					if(tel.length==11){
					    formatTel = tel.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
					}else if(tel.length==8){
					    formatTel = tel.replace(/(\d{4})(\d{4})/, '$1-$2');
					}else if(tel.indexOf('02')==0){
					    formatTel = tel.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
					}else{
					    formatTel = tel.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
					}
						$(this).find(".sctel").html(formatNum);
						$(this).find(".userTel").html(formatTel);
						
						//취소요청 버튼을 클릭한 경우
						$("#tbl").on("click",".reserveCancel", function(){
							var isEdit = $(this).closest(".list").attr("isEdit");
							var isDel = $(this).closest(".list").attr("isDel");
							var rno = $(this).attr("rno");
							alert(isEdit+"/"+ isDel+"/"+rno)
							if(!confirm("예약을 취소하시겠습니까?")) return;
							isEdit = 0;
							isDel = 1;
							$.ajax({
								type: "post",
								url: "/reserve/ReserveEdit",
								data: {isEdit:isEdit, isDel:isDel, rno:rno},
								success: function(){
									if(!confirm("취소요청이 완료되었습니다. 내역을 확인하시겠습니까?")) return;
									location.href="/reserve/myreserveList?id=${id}";
									
								}
							});
						});
				});
			}
		});
	}
	function getOldList(){
		$.ajax({
			type: "get",
			url: "/reserve/myreserveList.json",
			dataType:"json",
			success: function(data){
				var template = Handlebars.compile($("#temp2").html());
				$("#tbl2").html(template(data));
				
				//예약날짜 섭스트링
				$("#oldreserve .oldlist").each(function(){
					var target = $(this).find(".checkin").html();
					var checkin = target.substring(0,10);
					$(this).find(".checkin").html(checkin);
					
					var target = $(this).find(".checkout").html();
					var checkout = target.substring(0,10);
					$(this).find(".checkout").html(checkout);
					
					//전화번호 포멧
					var num = $(this).find(".sctel").html();
					var tel = $(this).find(".userTel").html();
					var formatNum = '';
					var formatTel = '';
					
					if(num.length==11){
					    formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
					}else if(num.length==8){
					    formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
					}else if(num.indexOf('02')==0){
					    formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
					}else{
					    formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
					}
					if(tel.length==11){
					    formatTel = tel.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
					}else if(tel.length==8){
					    formatTel = tel.replace(/(\d{4})(\d{4})/, '$1-$2');
					}else if(tel.indexOf('02')==0){
					    formatTel = tel.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
					}else{
					    formatTel = tel.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
					}
						$(this).find(".sctel").html(formatNum);
						$(this).find(".userTel").html(formatTel);
				});
			}
		});
	}
	
	function getModal(){
		
		
	}
</script>