<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
}
</style>
<div class="myList">
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
		</div>
	</div>
	
	<div class="bigPrame">
		<div class="middlePrame">
			<p class="scname" style="color: white;">Ȩ Ŭ����</p>
			<p class="btnPrame">�󼼺���</p>
		</div>
		<div class="smallPrame">
		</div>
	</div>
	
	<div class="bigPrame">
		<div class="middlePrame">
			<p class="scname" style="color: white;">����</p>
			<p class="btnPrame">�󼼺���</p>
		</div>
		<div class="smallPrame">
		</div>
	</div>
</div>
<script>
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