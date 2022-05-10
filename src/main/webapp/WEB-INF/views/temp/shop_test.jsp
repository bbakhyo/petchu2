<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
.page_shop_main{
  background-color:white;
  width:960px;
  display:flex;
}
.panel, .flicking-panel{
  margin:5px;
}
</style>
<head>
<!-- for arrows -->
<link rel="stylesheet" href="https://naver.github.io/egjs-flicking-plugins/release/latest/dist/flicking-plugins.css">
<script src="https://unpkg.com/@egjs/flicking/dist/flicking.pkgd.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://unpkg.com/@egjs/flicking/dist/flicking.css" crossorigin="anonymous" />
<!--es6 olderbrowser support-->
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/es6-promise/dist/es6-promise.auto.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="page_shop_main">
  <div class="menu_header">menu<div>
    <div class="shop_main_body">
      
      
<div id="flick" class="flicking-viewport">
  <div class="flicking-camera">
    <div class="flicking-panel"><img src="https://via.placeholder.com/225x365/d3d3d3"></div>
    <div class="flicking-panel"><img src="https://via.placeholder.com/225x365/d3d3d3"></div>
    <div class="flicking-panel"><img src="https://via.placeholder.com/225x365/d3d3d3"></div>
    <div class="flicking-panel"><img src="https://via.placeholder.com/225x365/d3d3d3"></div>
    <div class="flicking-panel"><img src="https://via.placeholder.com/225x365/d3d3d3"></div>
     <div class="flicking-panel"><img src="https://via.placeholder.com/225x365/d3d3d3"></div>
    <div class="flicking-panel"><img src="https://via.placeholder.com/225x365/d3d3d3"></div>
    <div class="flicking-panel"><img src="https://via.placeholder.com/225x365/d3d3d3"></div>
     <div class="flicking-panel"><img src="https://via.placeholder.com/225x365/d3d3d3"></div>
    <div class="flicking-panel"><img src="https://via.placeholder.com/225x365/d3d3d3"></div>
    <div class="flicking-panel"><img src="https://via.placeholder.com/225x365/d3d3d3"></div>
  </div>
	<span class="flicking-arrow-prev"></span>
  <span class="flicking-arrow-next"></span>
</div>
<!-- <span class="flicking-arrow-prev is-outside"></span>
<span class="flicking-arrow-next is-outside"></span> -->

      
        <!-- Viewport element -->
<div id="carousel" class="flicking-viewport">
  <!-- Camera element -->
  <div class="flicking-camera">
    <!-- Panels, class names are your choice -->
    <div class="panel"><img src="https://via.placeholder.com/225x365/d3d3d3"></div>
    <div class="panel"><img src="https://via.placeholder.com/225x365/d3d3d3"></div>
    <div class="panel"><img src="https://via.placeholder.com/225x365/d3d3d3"></div>
    <div class="panel"><img src="https://via.placeholder.com/225x365/d3d3d3"></div>
    <div class="panel"><img src="https://via.placeholder.com/225x365/d3d3d3"></div>
    <div class="panel"><img src="https://via.placeholder.com/225x365/d3d3d3"></div>
  </div>
  <span class="flicking-arrow-prev"></span>
  <span class="flicking-arrow-next"></span>
</div>
      </div>
      </div>
      </div>
</div>
</body>
<script>
const flicking = new Flicking("#flick", {
	  align: "center",
	  circular: true,
	  bound: true,
	  renderOnlyVisible: true
	 
	 });
	flicking.addPlugins(new Arrow({
	}));
</script>
</html>