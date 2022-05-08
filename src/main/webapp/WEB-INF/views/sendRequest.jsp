<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/resources/css/request.css" rel="stylesheet" >
<div id="page">
	<p class="title">${vo.nick}�� �������� �ۼ��ϼ���</p>
	<input type="hidden" value="${vo.id}" id="id">

	<div id="selectPet"></div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
			<div class="row">
				<span class="pno">{{pno}}</span>
				<button class="btnpno">{{pname}}</button>
			</div>
		{{/each}}
	</script>
	<p id="nopet"></p>
	
	<div id="petlist">
		<p id="pname"></p>
	</div>
	
	<p class="title">�ݷ��� �ݷ����� ���̴� ������ üũ���ּ���</p>
	<div class="diseSelect">
		<input type="checkbox" name="disease" value="����1" id="d_1">
		<label for="d_1"><span>����1</span></label>
		<input type="checkbox" name="disease" value="����2" id="d_2">
		<label for="d_2"><span>����2</span></label>
		<input type="checkbox" name="disease" value="����3" id="d_3">
		<label for="d_3"><span>����3</span></label>
		<input type="checkbox" name="disease" value="����4" id="d_4">
		<label for="d_4"><span>����4</span></label>
		<input type="checkbox" name="disease" value="����5" id="d_5">
		<label for="d_5"><span>����5</span></label>
	</div>
	<p class="title">�ݷ��� �ݷ����� ���̴� ������ �ڼ��� �������ּ���</p>
	<textarea rows="5" cols="80" id="d_etc_insert" name="d_etc" placeholder="���� ���� �������ּ���"></textarea>
	<p class="title">������ �Կ��� ������ ÷�����ּ���</p>
	<div id="inputfile">
		<button id="btninputfile">÷ �� �� ��</button>
			<span>100MB ������ gif, jpg ���ϸ� �����մϴ�.</span>
		<input type="hidden" id="dvedio"><br>
		<input type="hidden" id="dimg1"><br>
		<input type="hidden" id="dimg2"><br>
		<input type="hidden" id="dimg3"><br>
	</div>
	
	<div id="buttons">
		<span id="alert"></span><br>
		<button id="reset">�ۼ� ���</button>
		<button id="sendrequest">������ ��û</button>
		
	</div>
	
</div>
<script>
	var id = $("#id").val();
	var pno=0;
	
	//�ݷ����� ����
	$("#selectPet").on("click", ".row .btnpno", function(){
		var row = $(this).parent();
		 pno = row.find(".pno").html();

		$.ajax({
			type: "get",
			dataType: "json",
			data : {pno:pno},
			url: "/pet/readpet",
			success:function(data){
				$("#pname").html(data.pname);
			}
		})
	})
	
	//�ݷ����� ����Ʈ ���
	$.ajax({
		type: "get",
		dataType: "json",
		data : {id:id},
		url: "/pet/petlist",
		success:function(data){
			var template = Handlebars.compile($("#temp").html());
			$("#selectPet").html(template(data));
			if(data==""){
				$("#nopet").html("�ݷ������� ����ϼ���");
			}
		}
	})

	//������Ʈ ������
	$("#sendrequest").on("click", function(){
		var row = $(this);
		var dvedio = $("#dvedio").val();
		var dimg1 = $("#dimg1").val();
		var dimg2 = $("#dimg2").val();
		var dimg3 = $("#dimg3").val();
		
		var d_1 = 0;
		var d_2 = 0;
		var d_3 = 0;
		var d_4 = 0;
		var d_5 = 0;
		
		if($("#d_1").is(":checked")){
			d_1 = 1;
		}
		if($("#d_2").is(":checked")){
			d_2 = 1;
		}
		if($("#d_3").is(":checked")){
			d_3 = 1;
		}
		if($("#d_4").is(":checked")){
			d_4 = 1;
		}
		if($("#d_5").is(":checked")){
			d_5 = 1;
		}
		
		alert(dvedio + " : " + dimg1);
		
		/*var darray = new Array();
		
	   var obj_length = document.getElementsByName("disease").length;
	   
        for (var i=0; i<obj_length; i++) {
            if (document.getElementsByName("disease")[i].checked == true) {
                darray.push(document.getElementsByName("disease")[i].value);
            }
        }*/
        if(pno==0){
        	$("#alert").html("�ݷ������� �����ϼ���");
			return;
        }
		var d_etc = $("#d_etc_insert").val();
        if(d_etc==""){
			$("#alert").html("���� ���� ������ �ۼ����ּ���");
			return;
		}
		
		if(!confirm("�������� �����ðڽ��ϱ�?")) return;
		$.ajax({
			type: "post",
			url: "/request/send",
			data: {pno:pno,d1:d_1, d2:d_2, d3:d_3, d4:d_4, d5:d_5, d_etc:d_etc, dvedio:dvedio, dimg1:dimg1, dimg2:dimg2, dimg3:dimg3},
			success: function(){
				alert("�������� ���������� ���½��ϴ�.");
			}
		})
	})
</script>