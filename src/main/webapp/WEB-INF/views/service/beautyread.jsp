<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="requestInfo">
	<h1>[${bvo.nick}]���� ��û��</h1>
	<h3>1. �ݷ����� �з�</h3>
	<span>${bvo.pcate}</span>
	<hr/>
	<h3>2. ���ϴ� ���� </h3>
	<span>${bvo.beauty_classification}</span>
	<hr/>
	<h3>3. �ݷ������� ü��</h3>
	<span>${bvo.weight}</span>
	<hr/>
	<h3>4. �ݷ������� ����</h3>
	<span>${bvo.age}</span>
	<hr/>
	<h3>5. ������ �̿�ñ�</h3>
	<span>${bvo.last_beautydate}</span>
	<hr/>
	<h3>6. ������</h3>
	<span>${bvo.service_place}</span>
	<hr/>
	<h3>7. ���������</h3>
	<span>${bvo.wish_date}</span>
	<hr/>
	<h3>8. ���� ��� ����</h3>
	<span>${bvo.wish_local1} ${bvo.wish_local2}</span>
	<hr/>
	<h3>9. ���� ���� ���� �� ���λ���</h3>
	<span>${bvo.detailed_matters}</span>
	<br/><br/>
	
	<form name="frm" action="beinsert" method="get">
		<input type="text" name="brno" value="${bvo.brno}" style="display:none;">
		<div> 
			<button type="button" style="float : right;" id="btnList">����̵�</button> 
			<button type="submit" style="float : right; margin-right : 10px;" id="estimate">������ �ۼ�</button> 
		</div>
	</form>
	<br/>
</div>
<script>
    var brno = $('.requestInfo').attr("brno");
	$("#btnList").on("click" ,function(){
		location.href="/request/servicelist";
	});
	
	/*
	$("#estimate").on("click", function(){
		location.href="beinsert?" + uid + '&' + brno;
	});*/
	
	$(frm).on("submit", function(e){
		e.preventDefault();
		if(!confirm("������ �ۼ��������� �̵��Ͻðڽ��ϱ�?")) return;
		frm.submit();
	});
</script>