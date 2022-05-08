<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
h1 {
	text-align : left;
}
input::placeholder {
  font-size : 30px;
}
input[type=text]{
	height :50px;
	font-size : 30px;
	width : 200px;
	line-height:100px;
	border : none;
	border-bottom : 1px dotted gray;
	outline : none;
	
}
textarea {
	padding : 10px;
	resize : none;
}
</style>
<div style="float : right; text-align : left; margin-right : 120px;">
	<h1>���� ������</h1><span style="display:none;" scno="${sc.scno}" scname="${sc.scname}" id="scinfo"></span>
	<% String brno = request.getParameter("brno"); %>
	<% String crno = request.getParameter("crno"); %>
	<% String lrno = request.getParameter("lrno"); %>
	<div style="display:none;" id="info" brno="<%=brno %>" crno="<%=crno %>" lrno="<%=lrno %>"><%=brno %><%=crno %><%=lrno %></div>
	<input type="text" id="price" style="text-align : right" placeholder="0" numberOnly><span style="font-size : 30px;" >��</span>
	<br/>
	
	<h2 style="margin-bottom : 5px;">���� ����</h2>
	<div class="textLengthWrap" style="float : right; margin-bottom : 5px;"> 
		<span class="textCount">0</span> <span class="textTotal"> /500</span> 
	</div>
	<div>
		<textarea id="description" cols="100%" rows="10"></textarea>
	</div>
	<br/>
	<div style="text-align : center;">
		<button style="width : 699.6px;" id="send">���� ������</button>
	</div>
	<br/><br/>
</div>
<script>
/*
 var price = document.querySelector('#price');
 
 price.addEventListener('keyup', function(e){
	 var value = e.target.value;
	 value = Number(value.replaceAll(',', ''));
	 if(isNaN(value)){
		 price.value = '';
	 }else{
		 const formatValue = value.toLocaleString('ko-KR');
		 price.value = formatValue;`
	 }
 });*/
	$("input:text[numberOnly]").on("keyup", function() {
	      $(this).val($(this).val().replace(/[^0-9]/g,""));
	 });


 $("#description").keyup(function(e){
	 //���ڼ�
	 var content = $(this).val();
	 if(content.length == 0 || content == ''){
		 $('.textCount').text('0��');
	 }else{
		 $('.textCount').text(content.length);
	 }
	 //���ڼ� ����
	 if(content.length > 500){
		 $(this).val($(this).val().substring(0, 500));
		 alert("500�ڱ��� �Է� �����մϴ�");
	 }
 });
 
 $('#send').on("click", function(){
	 var scno = $("#scinfo").attr("scno");
	 var scname = $("#scinfo").attr("scname");
	 var brno = $("#info").attr("brno");
	 var crno = $("#info").attr("crno");
	 var lrno = $("#info").attr("lrno");
	 var price= $("#price").val();
	 var description =$("#description").val();
	 
	 
 
	 alert("scno : " + scno + "\n" + "scname : " + scname + "\n" + "brno : " + brno + "\n" + "crno : " + crno
			 + "\n" + "lrno : " + lrno + "\n" + "price : " + price + "\n" + "description : " + description);
		if(!confirm("�������� �ۼ��Ͻðڽ��ϱ�?")) return;	
 		
		if(brno != null && crno == 'null' && lrno == 'null' && scno ==""){
			alert("�̿� ��ü ��� �� ������ �ۼ��� �����մϴ�!");
			return;
		}
		
		if(crno != null && brno == 'null' && lrno == 'null' && scno ==""){
			alert("Ȩ Ŭ���� ��ü ��� �� ������ �ۼ��� �����մϴ�!");
			return;
		}
		
		if(lrno != null && brno == 'null' && crno == 'null' && scno ==""){
			alert("���� ��ü ��� �� ������ �ۼ��� �����մϴ�!");
			return;
		}
		
		if(brno != null){
			 if(crno == 'null' && lrno == 'null'){
				 $.ajax({
						type: "post",
						url : "beinsert",
						data : {scno:scno, scname:scname, brno:brno, price:price, description:description},
						success:function(overlapCheck){
							if(overlapCheck == 0){
								alert("����");
								location.href="/request/servicelist"
							}else if(overlapCheck ==1){
								alert("������ �ۼ��� ��û����  1ȸ�� �����մϴ�!");
							}
							 
						}
					});
			 
			 }
		 }
		
		if(crno != null){
			if(brno == 'null' && lrno == 'null'){
				$.ajax({
					type: "post",
					url : "ceinsert",
					data : {scno:scno, scname:scname, crno:crno, price:price, description:description},
					success:function(overlapCheck){
						if(overlapCheck == 0){
							alert("����");
							location.href="/request/servicelist"
						}else if(overlapCheck ==1){
							alert("������ �ۼ��� ��û����  1ȸ�� �����մϴ�!");
						}
					}
				});
			}
		}
		
		if(lrno != null){
			if(brno == 'null' && crno == 'null'){
				$.ajax({
					type: "post",
					url : "leinsert",
					data : {scno:scno, scname:scname, lrno:lrno, price:price, description:description},
					success:function(overlapCheck){
						if(overlapCheck == 0){
							alert("����");
							location.href="/request/servicelist"
						}else if(overlapCheck ==1){
							alert("������ �ۼ��� ��û����  1ȸ�� �����մϴ�!");
						}
					}
				});
			}
		}
		
 });
 
</script>
