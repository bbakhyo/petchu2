<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<link href="/resources/css/chat.css" rel="stylesheet" >
<div id="nevi">
<table id="menubar">
	<tr>
		<td width=80><a href="/chat/main">�ڷΰ���</a></td>
		<td>
			<c:if test="${type=='�ǻ�'}">
			<span id="hosname">${nick}</span>
			</c:if>
			<c:if test="${type=='�Ϲ�'}">
			<span id="hosname">${dname}</span>
			</c:if>
		</td>
	</tr>
</table>
</div>
<div id="message"></div>
<script id="temp" type="text/x-handlebars-template">
	{{#each .}}
		<div class="all {{display id}}">
				<div class="id {{display id}}">
					{{id}}
				</div>
				<div id="line">
					<span class="messagebox {{display id}}">
						{{message}}
					</span>
					<span class="readdate {{display id}}">{{show readdate}}</span>
				</div>				
			<div class="date {{display id}}">{{regdate}}</div>
		</div>
	{{/each}}
</script>
<div id="sendbox">
	<textarea id="txtMessage" placeholder="������ �Է��ϼ���."></textarea>
</div>
<script>
	Handlebars.registerHelper("display", function(id){
		if(id=="${id}"){
			return "right";
		}else{
			return "left";
		}
	})
	Handlebars.registerHelper("show", function(readdate){
		if(readdate!=null){
			return "����";
		}else{
			return "";
		}
	})
</script>
<script>
	var crno = "${crno}";

	getList();
	
	function getList(){
		$.ajax({
			type:"get",
			dataType: "json",
			url: "/chat/message.json?crno=" + crno,
			success:function(data){
				var temp = Handlebars.compile($("#temp").html());
				$("#message").html(temp(data));
				window.scrollTo(0, $("#chat").prop("scrollHeight"));
				
				$.ajax({
					type: "post",
					url: "/chat/update?crno=" + crno,
					success:function(){
						sock.send("updateReadDate");
					}
				})
			}
			
		})
	}
	//���ϼ���
	var sock = new SockJS("http://localhost:8088/sock_chat");
	sock.onmessage = onMessage;
	
	//�������� �޽��� ������
	function onMessage(msg){
	/* 	// '|'�� ���۵� �޽��� �и��ؼ� �迭����(msg.data.split("|")) ==> ���� ������ ����
		var items = msg.data.split("|");
		var sender = items[0];
		var message = items[1];
		var date = items[2];
		var data = {sender:sender, message:message, date:date};
		
		var temp = Handlebars.compile($("#temp").html());
		$("#chat").append(temp(data));  //append�� �ٲ۰� ����Ʈ�� ��� �߰��Ǵϱ� append�� Handlebar ���� ���� �ѹ� ��� ����~
		 */
		 getList();
	}
	
	//enterŬ��
	$("#txtMessage").on("keydown", function(e){
		if(e.keyCode==13 && !e.shiftKey){
			e.preventDefault();
			var message = $(this).val();
			if(message==""){
				alert("������ �Է��ϼ���");
				return;
			}
			var id = "${id}";
			var receiver = "user01";
			dno = 5;
			crno = "${crno}";
			send = 0;
			$.ajax({
				type: "post",
				url: "/chat/send",
				data: {message:message, id:id, receiver:receiver, dno:dno, crno:crno, send:send},
				success:function(){
					sock.send("insert");
					//sock.send(uid + "|" + message);
					$("#txtMessage").val("");
				}
			})
			
		}
	})
</script>