<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<!-- title 영역 -->
		<tiles:insertAttribute name="title" />
		<link href="index.css" type="text/css" rel="stylesheet" />
	</head>
	<body>
		<!-- Header  영역 -->
		<tiles:insertAttribute name="header" />
		<!-- Main 영역 -->
		<div id="main">
			<!-- Content 영역 -->
			<tiles:insertAttribute name="content" />
		</div>
		<!-- Footer 영역  -->
		<tiles:insertAttribute name="footer" />
	</body>
</html>