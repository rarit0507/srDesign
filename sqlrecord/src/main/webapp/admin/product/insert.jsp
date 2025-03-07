<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title</title>
</head>
<body>
	<!-- 부트스트랩 form(상품 insert) -->
	<form>
	  <div class="form-group row" id="productNo" name="productNo" display="hidden">
	    <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
	    <div class="col-sm-10">
	      <input type="email" class="form-control" id="inputEmail3">
	    </div>
	  </div>
	  <div class="form-group row">
	    <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
	    <div class="col-sm-10">
	      <input type="password" class="form-control" id="inputPassword3">
	    </div>
	  </div>
	  <fieldset class="form-group row">
	    <legend class="col-form-label col-sm-2 float-sm-left pt-0">Radios</legend>
	    <div class="col-sm-10">
	      <div class="form-check">
	        <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
	        <label class="form-check-label" for="gridRadios1">
	          First radio
	        </label>
	      </div>
	      <div class="form-check">
	        <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
	        <label class="form-check-label" for="gridRadios2">
	          Second radio
	        </label>
	      </div>
	      <div class="form-check disabled">
	        <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios3" value="option3" disabled>
	        <label class="form-check-label" for="gridRadios3">
	          Third disabled radio
	        </label>
	      </div>
	    </div>
	  </fieldset>
	  <div class="form-group row">
	    <div class="col-sm-10 offset-sm-2">
	      <div class="form-check">
	        <input class="form-check-input" type="checkbox" id="gridCheck1">
	        <label class="form-check-label" for="gridCheck1">
	          Example checkbox
	        </label>
	      </div>
	    </div>
	  </div>
	  <div class="form-group row">
	    <div class="col-sm-10">
	      <button type="submit" class="btn btn-primary">Sign in</button>
	    </div>
	  </div>
	</form>
</body>
</html>