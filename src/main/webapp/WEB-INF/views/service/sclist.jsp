<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>

.main input[type=radio] {
	display: none;
}

#tab-1:checked ~ .contentss .content-dis:nth-child(1), 
#tab-2:checked ~ .contentss .content-dis:nth-child(2),
#tab-3:checked ~ .contentss .content-dis:nth-child(3)
	{
	display: block;
}

#tab-1:checked ~ .tab label:nth-child(1), 
#tab-2:checked ~ .tab label:nth-child(2),
#tab-3:checked ~ .tab label:nth-child(3)
	{
	background-color: rgba(0, 0, 0, 0.2);
	box-shadow: none;
}

.contentss > div {
	display: none;
}



.main {
	margin: 0 auto;
	main-width: 1380px;
}

.tab {
	overflow : hidden;
}

.tab label {
	font-size: 18px;
	cursor: pointer;
	float: left;
	width: 33.3%;
	text-align: center;
	padding: 15px 0;
	text-transform: uppercase;
	font-weight: bold;
	letter-spacing: 2px;
	user-select: none;
	-webkit-user-select: none;
}

.contentss {
	background-color: rgba(0, 0, 0, 0.2);
	min-height: 600px;
	overflow : hidden;
}

.contentss>div {
	padding: 30px;
	line-height: 1.5;
	font-size: 17px;
}

a:visited {
	color: white;
}

.beauty_box1{
	display : inline-block;
	background : lightgreen;
	width : 150px;
	margin: 35px;
	cursor : pointer;
}

.beauty_box2{
	display : inline-block;
	background : lightgreen;
	width : 150px;
	margin: 35px;
	cursor : pointer;
}


.beauty_box3{
	display : inline-block;
	background : lightgreen;
	width : 150px;
	margin: 35px;
	cursor : pointer;
}

</style>

<div class="main">
	<input type="radio" id="tab-1" name="show" checked /> 
	<input type="radio" id="tab-2" name="show" /> 
	<input type="radio" id="tab-3" name="show" /> 
	<input type="radio" id="tab-4" name="show" />
	<div class="tab">
		<label for="tab-1">�̿� ��û�� </label> 
		<label for="tab-2">Ȩ Ŭ���� ��û��</label> 
		<label for="tab-3">���� ��û��</label> 
	</div>
<div class="contentss">
    <div class="content-dis">
		<c:forEach items="${beautyList}" var="vo">
			<div class="beauty_box1" brno="${vo.brno}" uid="${vo.uid}">
				<p>${vo.pcate}</p>
				<p>${vo.beauty_classification}<p>
				<p>${vo.wish_date}</p>
				<span>${vo.wish_local1}</span> <span>${vo.wish_local2}</span> 
				<br/><br/>
			</div>
		</c:forEach>
	</div>
    <div class="content-dis">
    	<c:forEach items="${cleanList}" var="vo">
			<div class="beauty_box2" crno="${vo.crno}" uid="${vo.uid}">
				<p>${vo.building_classification}</p>
				<p>${vo.house_size}<p>
				<p>${vo.wish_date}</p>
				<span>${vo.wish_local1}</span> <span>${vo.wish_local2}</span> 
				<br/><br/>
			</div>
		</c:forEach>
	</div>
    <div class="content-dis">
    	<c:forEach items="${lessonList}" var="vo">
			<div class="beauty_box3" lrno="${vo.lrno}" uid="${vo.uid}">
				<p>${vo.lesson_classification}</p>
				<p>${vo.lesson_goal}<p>
				<p>${vo.lesson_method}</p>
				<span>${vo.wish_local1}</span> <span>${vo.wish_local2}</span> 
				<br/><br/>
			</div>
		</c:forEach>
    </div>
</div>
</div>
<script>
	$(".beauty_box1").on("click", function(){
		var brno = $(this).attr("brno");
		location.href="/service/bread?brno=" + brno;
	});
	
	$(".beauty_box2").on("click", function(){
		var crno = $(this).attr("crno");
		location.href="/service/cread?crno=" + crno;
	});
	
	$(".beauty_box3").on("click", function(){
		var lrno = $(this).attr("lrno");
		location.href="/service/lread?lrno=" + lrno;
	});
</script>
