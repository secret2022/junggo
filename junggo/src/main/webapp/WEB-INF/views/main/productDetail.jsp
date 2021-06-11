<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-weight: bold;
}
</style>

</head>
<body>

	<table border="1" width="900" cellspacing="0" cellpadding="12px">
		<tr align="center">
			<td colspan="5"><font style="font-size: 24pt; color: orange">${naver.p_userid} 님의
					<c:choose>
						<c:when test="${naver.p_flag == 0}">[판매중]상품입니다.</c:when>
						<c:when test="${naver.p_flag == 1}">[삽니다]상품입니다.</c:when>
						<c:otherwise> [완료]된상품입니다.</c:otherwise>
					</c:choose>
			</font></td>
		</tr>

		<tr>
			<td width="300" rowspan="6" align="center"><img
				src="${pageContext.request.contextPath}/sellupload/${naver.p_file }"
				width="250" height="100"
				onMouseOver="this.width=270; this.height=150"
				onMouseOut="this.width=150; this.height=100"></td>
			<td>등록번호:${naver.p_id}</td>
		</tr>
		<tr>
			<td>ID:${naver.p_userid }</td>
		</tr>
		<tr>
			<td>제목: ${naver.p_title }</td>
		</tr>
		<tr>
			<td>내용: ${naver.p_content }</td>
		</tr>
		<tr>
			<td>날짜: ${naver.p_date }</td>
		</tr>
		<tr>
			<td><a href="ProductSearchList.do">[메인]</a> 
				<a href="ProductPreEdit.do?idx=${naver.p_id}">[수정]</a>
			</td>
		</tr>
	</table>
</body>
</html>
















