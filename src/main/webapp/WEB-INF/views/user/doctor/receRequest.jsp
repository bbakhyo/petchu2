<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="/resources/css/request.css" rel="stylesheet" > 
<div id="page">
	<div id="request">
		<input style="display:none" value="${hospital}" id="dno"></input>
		<p class="title"><b>${vo.nick}</b>���� �����ֽ� ������</p>
		<input type="hidden" value="${vo.id}" id="id">
	
		<table id="petinfo">
			<tr>
				<td width=100 class="title">�̸�</td>
				<td>${vo.pname}</td>
			</tr>
			<tr>
				<td class="title">����</td>
				<td>${vo.pgender}</td>
			</tr>
			<tr>
				<td class="title">����</td>
				<td>${vo.page}</td>
			</tr>
			<tr>
				<td class="title">������</td>
				<td>${vo.pweight}</td>
			</tr>
			<tr>
				<td class="title">ǰ��</td>
				<td>${vo.pbreed}</td>
			</tr>
			<tr>
				<td class="title">�߼�ȭ����</td>
				<td>${vo.pspaying}</td>
			</tr>
		</table>
		
		<div class="diseSelect">
			<p class="title">����</p>
			<input type="checkbox" name="disease" onClick="return false;" <c:if test="${vo.d1}">checked</c:if>>
			<label for="d_1"><span>����1</span></label>
			<input type="checkbox" name="disease" onClick="return false;" <c:if test="${vo.d2}">checked</c:if>>
			<label for="d_2"><span>����2</span></label>
			<input type="checkbox" name="disease" onClick="return false;" <c:if test="${vo.d3}">checked</c:if>>
			<label for="d_3"><span>����3</span></label>
			<input type="checkbox" name="disease" onClick="return false;" <c:if test="${vo.d4}">checked</c:if>>
			<label for="d_4"><span>����4</span></label>
			<input type="checkbox" name="disease" onClick="return false;" <c:if test="${vo.d5}">checked</c:if>>
			<label for="d_5"><span>����5</span></label>
		</div>
		<p class="title d_etc">�� ����</p>
		<p id="d_etc">${vo.d_etc}</p>
	</div>
	<hr>
	<form name="frm" action="/doctor/replyRequest" method="post" enctype="multipart/form-data">
		<p class="title">���ܸ�</p>
		<input type="text" name="pno" value="${vo.pno}" style="display:none">
		<input type="text" name="dno" value="${hospital}" style="display:none">
		<input type="text" name="drdisease">
		<p class="title">����</p>
		<textarea name="drcontent" rows="5" cols="80"></textarea><br>
		<input type="file" name="file" style="display:none"><br>
		<button type="button" id="btninputfile">÷ �� �� ��</button><br>
		<span class="title" style="float:right">����û���ݾ� 
		<input type="number" name="drprice"></span>
	
		<div id="buttons">
			<span id="alert"></span><br>
			<input type="button" id="pass" value="����">
			<input type="submit" value="������ ������">
		</div>
	</form>
	
</div>
<script>
	var rno = "${vo.rno}";
	$("#btninputfile").on("click", function(){
		$(frm.file).click();
	})
	$("#pass").on("click", function(){
		/* $.ajax({
			type: "post",
			url: "/doctor/ischecked",
			data: {rno:rno},
			success:function(){
				swal("�����Ǿ����ϴ�.");
				location.href="/request/list";
			}
		}) */
	})

	$(frm).on("submit", function(e){
		e.preventDefault();
		var drdisease = $(frm.drdisease).val();
		var drcontent = $(frm.drcontent).val();
		var drprice = $(frm.drprice).val();

		if(drdisease==""){
			swal("���ܸ��� �Է��ϼ���");
			$(frm.drdisease).focus();
			return;
		}else if(drcontent==""){
			swal("������ �Է��ϼ���");
			$(frm.drcontent).focus();
			return;
		}else if(drprice=="" || isNaN(drprice)){
			swal("����û���ݾ��� �Է��ϼ���");
			$(frm.drprice).focus();
			return;
		}else{
// 			$.ajax({
// 				type: "post",
// 				url: "/doctor/ischecked",
// 				data: {rno:rno},
// 				success:function(){
					
// 				}
// 			})
			frm.submit();
		}
	})
</script>