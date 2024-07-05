<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="hpath" value="<%= request.getContextPath() %>"/>
<link rel="stylesheet" href="${hpath }/resources/css/common.css?after8"/>
<link rel="stylesheet" href="${hpath }/resources/css/header.css?after8"/>
<link rel="stylesheet" href="${hpath }/resources/css/breadCrumb.css?after8"/>
<link rel="stylesheet" href="${hpath }/resources/css/searchHeader.css?after2"/>
<script src="${hpath }/resources/js/jquery-3.2.1.min.js"></script>
<meta property="og:url" content="">
<meta property="og:title" content="sqlrecord">
<meta property="og:description" content="레코드 , LP">
<meta property="og:type" content="website">
<%-- <meta property="og:image" content="${hpath }/img/favicon.png"> --%>