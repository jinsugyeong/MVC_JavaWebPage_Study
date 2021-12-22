<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style type="text/css">
	#goodsForm {
		width: 340px;
		margin: 10px auto;
	}
	#goodsForm label{
		font-size: 14px;
		text-align: center;
	}
	#goodsForm select {
		margin-bottom : 10px;

	}
	#goodsForm select[name="sk"]{
		width: 80px;
		height: 22px;	
	}

</style>
<form action="<%= request.getContextPath()%>/goods/goods_search_list.jsp" method="post" id="goodsForm">
	<select name="sk">
		<option value=""> ::  선택  ::</option>
		<option value="g_name">상품명</option>
		<option value="g_color">색상</option>
		<option value="g_size">사이즈</option>
	</select>
	<label><input type="text" name="sv" placeholder="검색할 조건을 입력하세요"></label>
	<input type="submit" value="검색">
	<br>
	<b>카테고리　</b>
	<label><input type="radio" name="cate" value="아우터">아우터</label>
	<label><input type="radio" name="cate" value="상의">상의</label>
	<label><input type="radio" name="cate" value="하의">하의</label>
	<label><input type="radio" name="cate" value="악세사리">악세사리</label>
</form>
