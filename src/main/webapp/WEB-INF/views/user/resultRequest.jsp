<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="/resources/css/request.css" rel="stylesheet">
<div id="sendrequpage">
	<div id="request">
		<p class="title">
			<b>${vo.dname}</b> ���� �亯�� ������
		</p>
		<table id="petinfo">
			<tr>
				<td width=100 class="title">�̸�</td>
				<td>${vo.pname}</td>
			</tr>
			<tr>
				<td class="title">���ܸ�</td>
				<td>${vo.drdisease}</td>
			</tr>
			<tr>
				<td class="title">����</td>
				<td>${vo.drcontent}</td>
			</tr>
			<tr>
				<td class="title">����û���ݾ�</td>
				<td>${vo.drprice}</td>
			</tr>
		</table>
		<div id="btn">
			<button id="bigbtn" onClick="location.href='result'">����̵�</button>
			<button id="bigbtn">�����ϱ�</button>
		</div>
	</div>
	<div id="hosinfo">
		<table id="hospital"></table>
		<script id="temp" type="text/x-handlebars-template">
			<tr>
				<td class="title" style="text-align:center; font-size: 25px"  colspan=4><b>{{dname}} ����</b></td>
			</tr>
			<tr>
				<td width=100><b>���½ð�</b></td>
				<td>{{open}}</td>
				<td width=100><b>�����ð�</b></td>
				<td>{{close}}</td>
			</tr>
			<tr>
				<td><b>���ɽð�</b></td>
				<td colspan=3>{{o_break}} - {{c_break}}</td>
			</tr>
			<tr>
				<td><b>��ȭ��ȣ</b></td>
				<td colspan=3>{{dtel}}</td>
			</tr>
			<tr>
				<td><b>�����Ұ�</b></td>
				<td colspan=3>{{dinfo}}</td>
			</tr>
			<tr>
				<td><b>�ּ�</b></td>
				<td colspan=3>{{daddress1}} {{daddress2}}</td>
			</tr>
		</script>
		
		<div id="map"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5c9e09df993f534bf4a2916f4cf43cdd&libraries=services"></script>
	</div>
</div>
<script>
var dno = "${vo.dno}";

	getList();
	function getList(){
		$.ajax({
			type: "get",
			dataType: "json",
			url: "/request/doctorinfo",
			data:{dno:dno},
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#hospital").html(template(data));
			}
		})
	}
</script>
<script>

var address="${vo.daddress1}";
	var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
		level : 3
	// ������ Ȯ�� ����
	};

	//������ �����մϴ�    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	//�ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
	var geocoder = new kakao.maps.services.Geocoder();

	//�ּҷ� ��ǥ�� �˻��մϴ�
	geocoder
			.addressSearch(
					address,
					function(result, status) {

						// ���������� �˻��� �Ϸ������ 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							// ����������� ��ҿ� ���� ������ ǥ���մϴ�
							var infowindow = new kakao.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:6px 0;">${vo.dname}</div>'
									});
							infowindow.open(map, marker);

							// ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
							map.setCenter(coords);
						}
					});
</script>