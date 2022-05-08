<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/resources/css/mypage.css" rel="stylesheet" > 

<div id="page">
	<h1>마이펫 추가하기</h1>
	<div id="sidemenu">
		<jsp:include page="${sideMenu}" />
	</div>
	<form name="frm" action="insertPet" method="post" enctype="multipart/form-data">
		<div id="contents">
			<table width=700 style="margin: 0px auto; margin: 20px; margin-left: 150px;">
				<tr>
					<td width=100>아이디</td>
					<td width=500 class="id">
						<input type="text" name="id" value="${id }" readonly>
					</td>
				</tr>
				<tr>
					<td width=100>이름</td>
					<td width=500 class="pname">
						<input type="text" name="pname" placeholder="초코">
					</td>
				</tr>
				<tr>
					<td width=100>종류</td>
					<td width=500 class="pcate">
		
						<input type="text" name="pcate" placeholder="강아지 or 고양이 등">
					</td>
				</tr>
				<tr>
					<td width=100>품종</td>
					<td width=500 class="pbreed">
						<input type="text" name="pbreed" placeholder="푸들,페르시안 ...">
					</td>
				</tr>
				<tr>
					<td width=100>나이</td>
					<td width=500 class="page">
						<input type="number" class="change" style="width:70px"  name="petage"> &nbsp;살
					</td>
				</tr>
				<tr>
					<td width=100>성별</td>
					<td width=500 class="pgender">
						<input type="radio" id="male" name="pgender" value="남">
						<label for="male">남아</label>
						<input type="radio" id="female" name="pgender" value="여">
						<label for="female">여아</label>
					</td>
				</tr>
				<tr>
					<td width=100>몸무게</td>
					<td width=500 class="pweight">
						<input type="number" name="pweight" style="width:70px"> &nbsp;																																																																																																																																																																																																																												KG
					</td>
				</tr>
				<tr>
					<td width=100>중성화여부</td>
					<td width=500 class="pspaying">
						<select name="pspaying">
							<option value="Y"> 함
							<option value="N"> 안함
						</select>
					</td>
				</tr>
				<tr>
					<td width=100 >사진</td>
					<td width=500>
						<input type="file" name="file" style="display:none" accept="image/*">
						<img id="image" src="/resources/petAdd.jpg" width=200>				
					</td>
				</tr>
			</table>
			<div style="margin: 0px auto; text-align: center; margin: 20px;">
				<button type="submit">등록하기</button>
			</div>
		</div>
	</form>
</div>

<script>
//Submit 버튼을 클릭한 경우
$(frm).on("submit", function(e){
	e.preventDefault();
	var pname=$(frm.pname).val();
	var file=$(frm.file).val();
	alert(pname+"\n"+file);
	
	if(pname==""){
		alert("펫의 이름을 입력하세요");
		$(frm.name).focus();
		return;
	}
	
	if(!confirm("펫을 등록하실래요?")) retun;
	
	frm.submit();
	
});

//이미지 미리보기
$("#image").on("click", function(){
	$(frm.file).click();
});

$(frm.file).on("change", function(e){
	var file=$(frm.file)[0].files[0];
	$("#image").attr("src", URL.createObjectURL(file));
});
</script>

