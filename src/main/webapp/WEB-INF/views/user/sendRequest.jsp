<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="/resources/css/request.css" rel="stylesheet">
<div id="page">
	<p class="title">${vo.nick}님견적서를 작성하세요</p>
	<input type="hidden" value="${vo.id}" id="id">

	<div id="selectPet"></div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
			<div class="row">
				<span class="pno" style="display:none">{{pno}}</span>
				<button class="btnpno">{{pname}}</button>
			</div>
		{{/each}}
	</script>
	<p id="nopet"></p>

	<div id="petlist">
		<p id="pname"></p>
		<p id="pcate"></p>
		<p id="pcate_1"></p>
		<p id="pbreed"></p>
		<p id="page"></p>
		<p id="pweight"></p>
		<p id="pgender"></p>
		<p id="pspaying"></p>
	</div>
	<p class="title">반려견 반려묘가 보이는 증상을 체크해주세요</p>
	<form name="frm" method="post" action="/request/send" enctype="multipart/form-data">
		<input type="text" name="pno" style="display: none">
		<div class="diseSelect">
			<input type="checkbox" value=0 name="d1">
			<label for="d1"><span>증상1</span></label>
			<input type="checkbox" value=0 name="d2">
			<label for="d2"><span>증상2</span></label>
			<input type="checkbox" value=0 name="d3">
			<label for="d3"><span>증상3</span></label>
			<input type="checkbox" value=0 name="d4">
			<label for="d4"><span>증상4</span></label>
			<input type="checkbox" value=0 name="d5">
			<label for="d5"><span>증상5</span></label>
		</div>
		<p class="title">반려견 반려묘가 보이는 증상을 자세히 설명해주세요</p>
		<textarea rows="5" cols="80" name="d_etc"
			placeholder="증상에 대해 설명해주세요"></textarea>
		<p class="title">증상을 촬영한 사진을 첨부해주세요</p>
		<div id="inputfile">
			<button type="button" id="btninputfile">첨 부 하 기</button>
			<span>100MB 이하의 gif, jpg, png 파일만 가능합니다.</span>
			<input type="file" name="uploadFile" id="uploadFile" multiple style="display: none">
			<div id="preview"></div>
		</div>

		<div id="buttons">
			<span id="alert"></span><br>
			<input type="reset" id="reset" value="작성취소">
			<input type="submit"  value="견적서 요청">
		</div>
	</form>
</div>
<script>
	var id = $("#id").val();
	var pno=0;
	
	//반려동물 선택
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
				$("#pcate").html(data.pcate);
				$("#pcate_1").html(data.pcate_1);
				$("#pbreed").html(data.pbreed);
				$("#pgender").html(data.pgender);
				$("#pspaying").html(data.pspaying);
				
				$.ajax({
					type: "get",
					dataType:"json",
					data: {pno:pno},
					url: "/request/regdatechk",
					success:function(dataa){
						if(dataa!=""){
							swal("3일 이내에 같은 반려동물의 견적서를 작성할 수 없습니다.");
							pno=0;
							return;
						}
					}
				})
				
			}
		})
	})
	
	//반려동물 리스트 출력
	$.ajax({
		type: "get",
		dataType: "json",
		data : {id:id},
		url: "/pet/petlist",
		success:function(data){
			var template = Handlebars.compile($("#temp").html());
			$("#selectPet").html(template(data));
			if(data==""){
				$("#nopet").html("반려동물을 등록하세요");
			}
			
		}
	})



	//리퀘스트 보내기
	$(frm).on("submit", function(e){
		e.preventDefault();
		if($(frm.d1).is(":checked")){
			$(frm.d1).val(1);
		}
		if($(frm.d2).is(":checked")){
			$(frm.d2).val(1);
		}
		if($(frm.d3).is(":checked")){
			$(frm.d3).val(1);
		}
		if($(frm.d4).is(":checked")){
			$(frm.d4).val(1);
		}
		if($(frm.d5).is(":checked")){
			$(frm.d5).val(1);
		}
		
		$(frm.pno).val(pno);

		var d_etc = $(frm.d_etc).val();
		if(d_etc==""){
			$("#alert").html("증상에 대한 설명을 작성해주세요");
			return;
		}
		if(pno==0){
			$("#alert").html("반려동물을 선택해주세요");
			return;
		}
		
		if(!confirm("견적서를 보내시겠습니까?")) 
			return;
		


		
		frm.submit();
	})
	
	//첨부하기 버튼 클릭
	$("#btninputfile").on("click", function(){
		$("#uploadFile").click();
	});

    var fileCount = 0;
    var totalCount = 4;
    var fileNum = 0;
    var arr=new Array();
    
  $(document).ready(function (e){
    $("input[type='file']").change(function(e){

      //div 내용 비워주기
      $('#preview').empty();

      var files = e.target.files;
      arr =Array.prototype.slice.call(files);

      //업로드 가능 파일인지 체크
      for(var i=0;i<files.length;i++){
        if(!checkExtension(files[i].name,files[i].size)){
          return false;
        }
      }
      
      if(fileCount + arr.length> totalCount){
    	  swal("파일은 " + totalCount + "개까지 업로드할 수 있습니다.");
    	  return;
      }else{
    	  fileCount = fileCount + arr.length;
      }
      preview(arr);
     
    });//file change
    
    function checkExtension(fileName,fileSize){
      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 20971520;  //20MB
      var fileEx = fileName.slice(fileName.indexOf(".")+1).toLowerCase();
      
      if(fileEx!="png" && fileEx!="jpg" && fileEx!="gif"){
    	  alert("등록가능한 형식이 아닙니다.");
    	  return false;
      }
      
      if(fileSize >= maxSize){
        alert('파일 사이즈 초과');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      
      if(regex.test(fileName)){
        alert('업로드 불가능한 파일이 있습니다.');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      return true;
    }
    
    function preview(arr){
      arr.forEach(function(f){
        
        //파일명이 길면 파일명...으로 처리
        var fileName = f.name;
        if(fileName.length > 10){
          fileName = fileName.substring(0,7)+"...";
        }
        
        //div에 이미지 추가
        var str = '<div style="display: inline-flex; padding: 10px;">';
       
        
        //이미지 파일 미리보기
        if(f.type.match('image.*')){
          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
            str += '<p>'+fileName+'</p>';
            str += '</div>';
            $(str).appendTo('#preview');
          } 
          reader.readAsDataURL(f);
        }else{
          str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
          $(str).appendTo('#preview');
        }
      });//arr.forEach
    }
  });
</script>

</script>