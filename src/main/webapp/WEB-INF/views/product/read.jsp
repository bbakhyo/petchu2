<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
<div id="page">
	<h1>��ǰ ������</h1>
	<form name="frm" action="adminUpdate" method="post" encType="multipart/form-data">
		<table>
			<tr>
				<td class="title" width=100>��ǰ�ڵ�</td>
				<td width=500>
					<input value="${vo.pno}" type="text" name="pno" size=5 readOnly/>
				</td>
			</tr>
			<tr>
				<td class="title" width=100>��ǰ����</td>
				<td width=500>
					<input value="${vo.pqantity}" type="text" name="pqantity" size=5/>
					<input type="checkbox" name="quan" <c:out value="${vo.pqantity == 0 ? 'checked' : ''}"></c:out>/>ǰ������
				</td>
			</tr>
			<tr>
				<td class="title" width=100>��ǰ�̸�</td>
				<td width=500><input value="${vo.pname}" type="text" name="pname" size=80></td>
			</tr>
			<tr>
				<td class="title" width=100>��ǰ����</td>
				<td width=500><input value="${vo.pprice}" type="text" name="pprice" size=50>��</td>
			</tr>
			<tr>
				<td class="title" width=100>�귣��</td>
				<td width=500><input value="${vo.pbrand}" type="text" name="pbrand" size=50></td>
			</tr>
			<tr>
				<td class="title" width=100>����Ŀ</td>
				<td width=500><input value="${vo.pmaker}" type="text" name="pmaker" size=50></td>
				
			</tr>
			<tr>
				<td class="title" width=100>�Һз�</td>
				<td width=500><input value="${vo.pcate3}" type="text" name="pcate3" size=50></td>
			</tr>
			<tr>
				<td class="title" width=100>���κз�</td>
				<td width=500><input value="${vo.pcate4}" type="text" name="pcate4" size=50></td>
			</tr>
			<tr>
				<td class="title" width=100>��ǰ�̹���</td>
				<td width=500>
					<img id="image" src="${vo.pimage}" width=200>
					<!-- ���ϵ��
					<input type="file" name="file" accept="image/*" style="display: none;">
					<input type="hidden" value="${vo.pimage}" name="pimage"/>
					 -->
				</td>
			</tr>
		</table>
		<div style="margin-top:20px;">
			<textarea id="editor" rows="100" cols="80" name="pcontents">${vo.pcontents}</textarea>
		</div>
			<div id="button">
				<input class="button" type="submit" value="��ǰ����"/>
				<input class="button" type="reset" value="�������"/>
				<input class="button" type="button" onClick="location.href='/product/list'" value="����̵�"/>
			</div>
	</form>	
</div>

<script>

//ckEditor���
var ckeditor_config = {
	 resize_enable : false, //editor ����� �������� ���Ѵ�. 
	 enterMode : CKEDITOR.ENTER_BR, 
	 shiftEnterMode : CKEDITOR.ENTER_P, 
	 filebrowserUploadUrl : "/ckupload", 
	 height: 300
 };
	CKEDITOR.replace('editor', ckeditor_config)
 
//���Եɶ�
$(frm).on("submit", function(e){
	e.preventDefault();
	var pname= $(frm.pname).val();
	var pprice= $(frm.pprice).val();

	
	if(pname=="") {
		alert("��ǰ���� �Է��ϼ���!");
		$(frm.pname).focus();
		return;
	}else if(pprice=="" || pprice.replace(/[0-9]/g,'')){
		alert("������ ���ڷ� �Է��ϼ���");
		$(frm.pprice).focus();
		return;
	}
	if(!confirm("��ǰ�� �����ϽǷ���?")) return;
	frm.submit();
});
/*
//�̹��� �̸�����
$(frm.file).on("change",function(){
	var file=$(frm.file)[0].files[0];
	$("#image").attr("src", URL.createObjectURL(file));
});

//�̹����� Ŭ���� ���
$("#image").on("click", function(){
	$(frm.file).click();
});
*/
</script>