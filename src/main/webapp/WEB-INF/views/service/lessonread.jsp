<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="requestInfo" uid="${lvo.uid}}" lrno="${lvo.lrno}">
	<h1>[${lvo.nick}]���� ��û��</h1>
	<h3>1. ���ϴ� ���� �з�</h3>
	<span>${lvo.lesson_classification}</span>
	<hr/>
	<h3>2. ���� �޴� ����</h3>
	<span>${lvo.lesson_goal}</span>
	<hr/>
	<h3>3. ���� ����</h3>
	<span>${lvo.lesson_method}</span>
	<hr/>
	<h3>4. ����</h3>
	<span>${lvo.age}</span>
	<hr/>
	<h3>5. ����</h3>
	<span>${lvo.gender}</span>
	<hr/>
	<h3>6. ��ȣ�ϴ� ���� ����</h3>
	<span>${lvo.wish_gender}</span>
	<hr/>
	<h3>7. ���� �ޱ� ���� ��¥</h3>
	<span>${lvo.wish_date}</span>
	<hr/>
	<h3>8. ����ϴ� ���� �ð���</h3>
	<span>${lvo.wish_time}</span>
	<hr/>
	<h3>9. ���� ���</h3>
	<span>${lvo.wish_local1} ${lvo.wish_local2}</span>
	<hr/>
	<h3>10. ���ϴ� ����</h3>
	<span>${lvo.lesson_place}</span>
	<hr/>
	<h3>11. ���� ���� ���ǻ���</h3>
	<span>${lvo.detailed_matters}</span>
	<br/><br/>
	<form name="frm" action="leinsert" method="get">
		<input type="text" name="lrno" value="${lvo.lrno}" style="display:none;">
		<div> 
			<button type="button" style="float : right;" id="btnList">����̵�</button> 
			<button type="submit" style="float : right; margin-right : 10px;" id="estimate">������ �ۼ�</button> 
		</div>
	</form>
	<br/>
</div>
<script>
	$("#btnList").on("click" ,function(){
		location.href="/request/servicelist";
	});
	
	$(frm).on("submit", function(e){
		e.preventDefault();
		if(!confirm("������ �ۼ��������� �̵��Ͻðڽ��ϱ�?")) return;
		frm.submit();
	});
</script>