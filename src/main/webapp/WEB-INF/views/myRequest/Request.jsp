<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
.middlePrame {
	margin: 10px;
	padding: 10px;
	background-color: A7CA37;
	font-size: 20px;
	font-weight: bold;
	margin-left: 150px;
}

.btnPrame {
	color: navy;
	font-size: 15px;
	cursor: pointer;
}

.smallPrame {
	display: none;
	margin: 10px;
	padding: 10px;
	width : 900px;
	margin-left : 150px;
}
</style>
<div class="myList" style="text-align : left;">
	<div id="sidemenu">
		<jsp:include page="${sideMenu}" />
	</div>
	<h1>�ۼ��� ��û��</h1>
	<div class="bigPrame">
		<div class="middlePrame">
			<p class="scname" style="color: white;">�̿�</p>
			<p class="btnPrame">�󼼺���</p>
		</div>
		<div class="smallPrame">
		<c:choose>
			<c:when test="${bvo != null}">
					<button class="deadline" id="deadline1">��û�� ����ó��</button>
					<h3>1. �ݷ����� �з�</h3>
					<span>${bvo.pcate}</span>
					<hr />
					<h3>2. ���ϴ� ����</h3>
					<span>${bvo.beauty_classification}</span>
					<hr />
					<h3>3. �ݷ������� ü��</h3>
					<span>${bvo.weight}</span>
					<hr />
					<h3>4. �ݷ������� ����</h3>
					<span>${bvo.age}</span>
					<hr />
					<h3>5. ������ �̿�ñ�</h3>
					<span>${bvo.last_beautydate}</span>
					<hr />
					<h3>6. ������</h3>
					<span>${bvo.service_place}</span>
					<hr />
					<h3>7. ���������</h3>
					<span>${bvo.wish_date}</span>
					<hr />
					<h3>8. ���� ��� ����</h3>
					<span>${bvo.wish_local1} ${bvo.wish_local2}</span>
					<hr />
					<h3>9. ���� ���� ���� �� ���λ���</h3>
					<p>${bvo.detailed_matters}</p>
				</c:when>
			<c:when test="${bvo == null}">
				<h2>�ۼ��� ��û���� �����ϴ�</h2>
			</c:when>
		</c:choose>
			
		</div>
	</div>
	
	<div class="bigPrame">
		<div class="middlePrame">
			<p class="scname" style="color: white;">Ȩ Ŭ����</p>
			<p class="btnPrame">�󼼺���</p>
		</div>
		<div class="smallPrame">
			<c:choose>
			<c:when test="${cvo != null}">
					<button class="deadline" id="deadline2">��û�� ����ó��</button>
					<h3>1. �ǹ�����</h3>
					<span>${cvo.building_classification}</span>
					<hr />
					<h3>2. �� ����</h3>
					<span>${cvo.house_size}</span>
					<hr />
					<h3>3. Ŭ������ ���ϴ� ��</h3>
					<span>${cvo.wish_date}</span>
					<hr />
					<h3>4. ���ϴ� ����</h3>
					<span>${cvo.wish_local1} ${cvo.wish_local2}</span>
					<hr />
					<h3>5. Ŭ���� ���� �������</h3>
					<p>${cvo.hope_matters}</p>
				</c:when>
			<c:when test="${cvo == null}">
				<h2>�ۼ��� ��û���� �����ϴ�</h2>
			</c:when>
		</c:choose>
		</div>
	</div>
	
	<div class="bigPrame">
		<div class="middlePrame">
			<p class="scname" style="color: white;">����</p>
			<p class="btnPrame">�󼼺���</p>
		</div>
		<div class="smallPrame">
			<c:choose>
			<c:when test="${lvo != null}">
					<button class="deadline" id="deadline3">��û�� ����ó��</button>
					<h3>1. ���ϴ� ���� �з�</h3>
					<span>${lvo.lesson_classification}</span>
					<hr />
					<h3>2. ���� �޴� ����</h3>
					<span>${lvo.lesson_goal}</span>
					<hr />
					<h3>3. ���� ����</h3>
					<span>${lvo.lesson_method}</span>
					<hr />
					<h3>4. ����</h3>
					<span>${lvo.age}</span>
					<hr />
					<h3>5. ����</h3>
					<span>${lvo.gender}</span>
					<hr />
					<h3>6. ��ȣ�ϴ� ���� ����</h3>
					<span>${lvo.wish_gender}</span>
					<hr />
					<h3>7. ���� �ޱ� ���� ��¥</h3>
					<span>${lvo.wish_date}</span>
					<hr />
					<h3>8. ����ϴ� ���� �ð���</h3>
					<span>${lvo.wish_time}</span>
					<hr />
					<h3>9. ���� ���</h3>
					<span>${lvo.wish_local1} ${lvo.wish_local2}</span>
					<hr />
					<h3>10. ���ϴ� ����</h3>
					<span>${lvo.lesson_place}</span>
					<hr />
					<h3>11. ���� ���� ���ǻ���</h3>
					<p>${lvo.detailed_matters}</p>
				</c:when>
			<c:when test="${lvo == null}">
				<h2>�ۼ��� ��û���� �����ϴ�</h2>
			</c:when>
		</c:choose>
		</div>
	</div>
</div>
<script>
	var brno="${bvo.brno}";
	var crno="${cvo.crno}";
	var lrno="${lvo.lrno}";
	
	alert(brno + "\n" + crno + "\n" + lrno);
	
	var deadlines = document.getElementsByClassName("deadline");
	
	for(i=0; i < deadlines.length; i++){
		deadlines[i].addEventListener('click', function(){
		if(!confirm("��û���� �����Ͻðڽ��ϱ�?")) return;
	    console.log('function ON');
	    console.log(this.id);
	    switch(this.id){
	        case "deadline1" :
	        	$.ajax({
	        		type: "post",
	        		url : "/user/bisDeleteUpdate",
	        		data : {brno:brno},
	        		success:function(){
	        			location.reload();
	        		}
	        	});
	            break;
	        case "deadline2" :
	        	$.ajax({
	        		type: "post",
	        		url : "/user/cisDeleteUpdate",
	        		data : {crno:crno},
	        		success:function(){
	        			location.reload();
	        		}
	        	});
	            break;             
	        case "deadline3" :
	        	$.ajax({
	        		type: "post",
	        		url : "/user/lisDeleteUpdate",
	        		data : {lrno:lrno},
	        		success:function(){
	        			location.reload();
	        		}
	        	});
	            break;
	    }
	});
	}
	
	$(".middlePrame").on("click", ".btnPrame", function() {
		var target = $(this).closest('.bigPrame').find('.smallPrame');
		//     target.toggleClass("hidden")
		if (target.css("display") == "none") {
			target.show();
		} else {
			target.hide();
		}
	});
</script>