<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<link href="/resources/css/hoschool.css" rel="stylesheet" />
	<link href="https://www.cssscript.com/demo/segmented-control-toggle-radio/toggle-radios.css" rel="stylesheet" />


<div class="page_hoschool">
	
  	<div class="ho_page_header">
      <form name="frm" style="text-align: center;">
        <input type="text" id="keyword" name="keyword" >
        <button id="search" name="search" type="submit" >검색</button>
      </form>
    
    <div id="sort" class="toggle-radio" data-style="rounded">
  <input type="radio" name="sort" id="default_Option1" class="sort" value="rate">
  <label for="default_Option1">별점높은순</label>
  <input type="radio" name="sort" id="default_Option2" class="sort" value="rowPrice">
  <label for="default_Option2">낮은가격순</label>
  <input type="radio" name="sort" id="default_Option3" class="sort" value="higPrice">
  <label for="default_Option3">높은가격순</label>
</div>

<!--     <div id="sort">
      <input type="radio" name="sort"  class="sort" value="rate">별점높은순
      <input type="radio" name="sort"  class="sort" value="rowPrice">낮은가격순
      <input type="radio" name="sort"  class="sort" value="higPrice">높은가격순
	</div> -->
  </div>
  
  	<div class="ho_body">
	<!-- 좌측 색션(매뉴)	 -->
    <div class="ho_left_section">
    
			<div class="sideMenu_container"> 
	<!-- 	날짜 박스			 -->
			<div class="sideMenu_content_wrapper">
        <div class="date_box">
        	<div class="img_wrapper"><img src="	https://cdn-icons-png.flaticon.com/128/42/42446.png" alt='calendar_icon' id="icon_calendar"></div>
				<div class="datebox_heading">체크인</div>
				<span id="checkinArea"><input id="checkin" type="date" class="input_dates"></span>
				<div class="datebox_heading">체크아웃</div>
				<span id="checkoutArea"><input id="checkout" type="date" class='input_dates'></span>
        </div>
	<!--     태그 박스 부모     -->
				<div class="ho_tag_container">
          <div class="img_wrapper"><img src="	https://dylansmith.gallerycdn.vsassets.io/extensions/dylansmith/hash-and-cache/1.0.35/1631823901554/Microsoft.VisualStudio.Services.Icons.Default" id="hashtag" alt='hashtag'></div>
	<!--   태그 # 박스 자식       -->
	<div class="ho_tag_container_inner">
          <span class="tag" tag="산책">#산책</span>
          <span class="tag" tag="놀이터">#야외놀이터</span>
          <span class="tag" tag="수영장">#펫수영장</span>
          <span class="tag" tag="종일반">#종일반</span>
          <span class="tag" tag="1박">#1박2일</span>
          <span class="tag" tag="2박">#2박3일</span>
          <span class="tag" tag="3박">#3박4일</span>
          <span class="tag" tag="4박">#4박5일</span>
          <span class="tag" tag="장박">#장박</span>
          <span class="tag" tag="단독실">#단독실</span>
          <span class="tag" tag="대형">#대형</span>
          <span class="tag" tag="중형">#중형</span>
          <span class="tag" tag="소형">#소형</span>
          <span class="tag" tag="수의사">#수의사</span>
          <span class="tag" tag="cctv">#cctv</span>
          <span class="tag" tag="애견훈련">#애견훈련</span>
          <span class="tag" tag="애견카페">#애견카페</span>
          <span class="tag" tag="픽업">#픽업</span>
          <span class="tag" tag="당일 입실">#당일 입실</span>
          <span class="tag" tag="위생관리">#위생관리</span>
          <span class="tag" tag="목욕">#목욕</span>
          <span class="tag" tag="서울특별시">#서울특별시</span>
          <span class="tag" tag="인천광역시">#인천광역시</span>
          <span class="tag" tag="경기도">#경기도</span>
        </div>
        </div>
    </div>
   </div> 
	
  </div>
<!--   우측 색션     -->
    <div class="ho_section_right">
        <div class="ho_content_list">
          	<div id="bigPrame"></div>
	        <script id="temp" type="text/x-handlebars-template">
			{{#each list}}
         	 <div class="prame" scno="{{scno}}">
            <div class="prame_content">
			  <!--  1열(상단) :  업체명/전화번호  -->
              <div class="prame_row1">
                <div class="prame_name scname" placeholder="어바웃펫">{{scname}}</div>
                <div class="prame_contact sctel">☎ {{sctel}}</div>
              </div>
              <!--  2열(중간)) :  업체명 상세정보  -->
                <div class="prame_row2">
                  <div class="prame_description  sconeline">{{sconeline}}</div>
                </div>
              <!--  3열(하단)) :  별점 / isDelete / 금액  -->
              <div class="prame_row3">
				<!--   별크기는 .rating (css)에서 font-size로 조절   -->
                 <div class="rating rating2"><!--
					--><a href="#5" title="Give 5 stars">★</a><!--
					--><a href="#4" title="Give 4 stars">★</a><!--
					--><a href="#3" title="Give 3 stars">★</a><!--
					--><a href="#2" title="Give 2 stars">★</a><!--
					--><a href="#1" title="Give 1 star">★</a>
				</div>
                <div><input class="isDelete" type="hidden" value={{isDelete}}></div>
               <div class="prame_price scprice">{{display scprice}}원</div>
              </div>
            </div>         
          </div>
          {{/each}}

         </script>
        </div>
    </div>

    
    
    </div>
  
  	<script>
	Handlebars.registerHelper("display", function(scprice){
		return scprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	});
	</script>
  </div>
<script>
	var date=new Date().toISOString().slice(0, 10);
	var keyword=$(frm.keyword).val();
	var sort="";
	var checkin="";
	var checkout="";

	//체크인 체크아웃 오늘날짜로 설정
	document.getElementById('checkin').value = new Date().toISOString().substring(0, 10);
	document.getElementById('checkout').value = new Date().toISOString().substring(0, 10);
	
	
	checkin = document.getElementById('checkin').value;
	checkout = document.getElementById('checkout').value;
	
	getList();
	
	//체크인이 체인지 된 경우
	$("#tag").on("change","#checkin",function(){
		checkin= $(this).val();
		checkout=$(this).closest("#tag").find("#checkout");
		checkout.val(checkin);
		checkout=checkin;
		
		console.log("체크인이 첸지된 경우" + "\n 체크인" + checkin + "\n 체크아웃" + checkout)
		
		if(checkin < date){
			alert("당일보다 이전날짜는 선택할 수 없습니다.")
		}
		getList();
		
	});
	//체크아웃이 체인지 된 경우
	$("#tag").on("change", "#checkout",function(){
		checkin=$(this).closest("#tag").find("#checkin").val();
		checkout=$(this).val();
		console.log("체크아웃이 첸지된 경우" + checkin +"/n" + checkout);
		if(checkout<checkin){
			alert("체크아웃은 체크인 이후로 입력가능합니다.");
		}
		getList();
		
	});

	//데이트 클릭할때 달력표시하고싶은데 ...........
	$("#checkinArea").on("click", function(){
		$(this).find("#checkin");

	});
		
	//소트를 체크한 경우
	$("#sort").on("click",".sort", function(){
		sort = $(this).val();
		
		getList();
	});

	function getList(){
		console.log('겟리스트가 받은 데이타'+"\n"+'키워드:'+keyword+"\n"+'소트:'+sort+"\n"+'체크인:'+checkin+"\n"+'체크아웃:'+checkout)
		$.ajax({
			type:"get",
			url:"/hoschool/list.json",
			dataType:"json",
			data:{keyword:keyword, sort:sort, checkin:checkin, checkout:checkout},
			success: function(data){
				console.log(data);
				var template = Handlebars.compile($("#temp").html());
				$("#bigPrame").html(template(data));
			}
		});
	}
	
		//검색버튼을 클릭했을 때
	  $(frm).on("submit",function(e){
		  e.preventDefault();
		  keyword=$(frm.keyword).val();

		  getList();
	  });
		
	  //태그를 클릭한 경우
	  $(".tag").on("click", function(){
		  keyword=$(this).attr("tag");
		  
		  getList();
	  });
	  
	  //프레임을 클릭한 경우
	  $("#bigPrame").on("click",".prame",function(){
		 var scno=$(this).attr("scno");
		 var id="${id}";
		 var target = $(this).find('.prame');
		 var checkin = $("#checkin").val();
		 var checkout = $("#checkout").val();
		 	location.href="/hoschool/read?scno=" + scno + "&id=" + id + "&checkin=" + checkin + "&checkout=" + checkout;
		 
	  });
</script>

