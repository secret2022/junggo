<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> productList.jsp문서  </title>

 <style type="text/css">
   *{ font-size: 14pt; }
   a{ font-size: 14pt; text-decoration: none;  color:blue;}
   a:hover{ font-size: 14pt; text-decoration: underline; color:green;}
   #span_rcnt{font-size: 13pt; color:red; }
 </style>

<script type="text/javascript">

</script> 
</head>
<body>  

 
 <table width=900  border=1  cellspacing=0>
   <tr>
    <td colspan="7" align="left"> 전체: ${GGtotal} &nbsp 검색어: ${Gtotal}  
       
    </td>
  </tr>
 
  <tr>
   <th>번호</th> <th>제목</th> <th>분류</th> <th>가격</th> <th>날짜</th>
  </tr>
 


<c:forEach  var="bean" items="${naver}">
  <tr>
    <td> ${bean.rn} </td>
    <td> <a href="productDetail.do?idx=${bean.p_id}">${bean.p_title}</a> </td>
    <td> ${bean.p_group }  </td>
    <td> ${bean.p_price } </td>
    <td> ${bean.p_date } </td>
  </tr> 
</c:forEach> 
  <tr align="center">
    <td colspan="7">
   	
   	<a href="productSearchList.do?pageNum=1">《</a>
 	  <c:if test="${startpage > 10}">
 	  	<a href=ProductSearchList.do?pageNum=${startpage-10}>〈</a>
 	  </c:if>
   	  
      <c:forEach var="i"  begin="${startpage+i}" end="${endpage}" step="1"> 
   	  	<c:choose>
   	  		<c:when test="${i == pageNUM}">
   	  			<font style="font-size:15pt font-weight:bolder;  color:purple"> ${i}</font>
   	  		</c:when>
   	  		<c:otherwise>
   	  			<a href=ProductSearchList.do?pageNum=${i}&keyfield=${skey}&keyword=${sval}>${i}</a>
   	  		</c:otherwise>
   	  	</c:choose>
   	  </c:forEach>	
   	  
   	  <c:if test="${pagecount > endpage}" >
   	  	<a href=ProductSearchList.do?pageNum=${startpage+10}>〉</a>
   	 </c:if> 
 
   	<a href=ProductSearchList.do?pageNum=${lastpage}>》</a> 
 		

    </td>
  </tr>
<tr align="center">
     <td colspan="7">
     <form name=myform action="ProductSearchList.do">
       검색:
       <select name="keyfield" onchange = "myclear()">
         <option  value="">-----검색필드-----</option>
         <option  value="p_userid" <c:if test ="${skey == 'p_userid' }" > selected </c:if> >이름필드</option>
         <option  value="p_title"<c:if test ="${skey == 'p_title'}" > selected </c:if> >제목필드</option>
       </select> 
       <input type="text" name="keyword" value="${sval }">
       <input type="submit" value="검색">
     </form>    
    </td>
   </tr>
 </table>
 <p>
 		<a href="ProductList.do">[리스트]</a>
 	 <a href="ProductSearchList.do">[검색]</a>
     <a href="index.jsp">[index]</a> 
   
</body>
</html>








