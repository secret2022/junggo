<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %> 

<body>
	<h2>수정</h2>
	<form name="myform" action="ProductEdit.do">
		<table border="1" width="900" cellspacing="0" cellpadding="12px">
			<tr align="center">
				<td colspan="6"><font style="font-size: 24pt; color: orange">${naver.p_userid}님의
						<c:choose>
							<c:when test="${naver.p_flag == 0}">[판매중]상품입니다.</c:when>
							<c:when test="${naver.p_flag == 1}">[삽니다]상품입니다.</c:when>
							<c:otherwise> [완료]된상품입니다.</c:otherwise>
						</c:choose>
				</font></td>
			</tr>

			<tr>
				<td width="300" rowspan="11" align="center" id="preview"><img
					src="${pageContext.request.contextPath}/sellupload/${naver.p_file }"
					width="250" height="100"
					onMouseOver="this.width=270; this.height=150"
					onMouseOut="this.width=150; this.height=100"></td>
				<td>등록번호:<input type="text" name="p_id" value=${naver.p_id} readonly></td>
			</tr>
			<tr>
				<td>아이디:<input type="text" name="p_userid" value=${naver.p_userid} readonly></td>
			</tr>
			
	<c:choose>
     <c:when test="${sessionScope.userID != naver.p_userid}"> 
     		<tr>	
				<td><a href="ProductSearchList.do">[메인]</a></td>
			</tr>
     </c:when>
     <c:otherwise>
			<tr>
				<td>제목: <input type="text" name="p_title" value=${naver.p_title}>
				</td>
			</tr>
			<tr>
				<td>가격: <input type="number" name="p_price" value=${naver.p_price}>
				</td>
			</tr>
			<tr>
				<td>파일: <input type="file" multiple="multiple" name="p_file" 
				value=${naver.p_file} onchange="handle_FileSelect();">
				</td>
			</tr>
			<tr>
				<td>제목: <input type="text" name="p_content" value=${naver.p_content}>
				</td>
			</tr>
			<tr>
				<td>그룹: <input type="text" name="p_group" value=${naver.p_group}>
				</td>
			</tr>
			<tr>
				
				<td>
					<select name="p_flag">
						<c:if test="${naver.p_flag == 0}">	<option value="0" <c:if test="${naver.p_flag == 0}"> selected</c:if>>[판매중]상품입니다.</option></c:if>
						<c:if test="${naver.p_flag == 1}">	<option value="1" <c:if test="${naver.p_flag == 1}"> selected</c:if>>[삽니다]상품입니다.</option></c:if>
						<option value="2" <c:if test="${naver.p_flag == 2}"> selected</c:if>>[완료]된상품입니다.</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="수정">
				<input type="reset" value="취소"></td>
			</tr>
			<tr>
				<td><a href="ProductSearchList.do">[메인]</a> <a
					href="ProductDelete.do?idx=${naver.p_id}">[삭제]</a>
			</tr>
		</c:otherwise>
	</c:choose>	
		</table>
	</form>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
