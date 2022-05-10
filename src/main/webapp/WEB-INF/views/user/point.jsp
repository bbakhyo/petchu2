<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="page">
	<p>내 포인트 : ${point}</p>
	<p>포인트 사용내역</p>
	<c:forEach items="${history}" var="vo">
		<p>${vo.amount} | ${vo.content}</p>
	</c:forEach>
	
</div>