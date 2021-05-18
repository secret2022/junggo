<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<body>  
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="index.jsp">중고거래 사이트</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">  <!--창이 작아지면은 우측상단 토글 메뉴로 변경 (사이즈는 F12 눌러서 확인)  -->
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbar">
        <ul class="navbar-nav mr-auto">         		 <!-- ul 리스트  li  -->
          <li class="nav-item active">
            <a class="nav-link" href="index.jsp">[Main]</a>
          </li>  
          <li class= "nav-item active">
            <a class="nav-link" href="http://localhost:7000/chat-client.html?name=sky"  target="_blank">[채팅거래]</a>
          </li>
          <li class="nav-item dropdown"> 	              
            <a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown"> [회원 메뉴]  </a>
            <div class="dropdown-menu" aria-labelledby="dropdown">             <!-- 드랍 다운 메뉴 -->

 <c:choose>
     <c:when test="${sessionScope.userID == null }">
              <a class="dropdown-item" href="./userLogin.jsp">로그인</a>
              <a class="dropdown-item" href="./userJoin.jsp">회원가입</a>
 </c:when>
  	<c:otherwise>
              <a class="dropdown-item" href="./userLogout.jsp">로그아웃</a>

 	</c:otherwise>
</c:choose> 
            </div>
          </li>
        </ul>
        <!-- <form class="form-inline my-2 my-lg-0">      
          <input class="form-control mr-sm-2" type="search" placeholder="내용을 입력하세요." aria-label="Search">    검색기능 
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
        </form> -->
      </div>
  </nav>
    <div class="container">
      <form name=myform action="./ProductSearchList.do" class="form-inline mt-3">
        <select name="keyfield" class="form-control mx-1 mt-2">
          <option value="">전체</option>
          <option value="p_title" <c:if test ="${skey == 'p_title'}" > selected </c:if>>제목</option>
          <option value="p_content" <c:if test ="${skey == 'p_content'}" > selected </c:if> >내용</option>
        </select>
        <input type="text" name="keyword" class="form-control mx-1 mt-2" value="${sval }" >
       	<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
        
        	<a class="bg-info btn btn-primary mx-1 mt-2" data-toggle="modal" href="#sellModal">팝니다.</a>
       		<a class="bg-info btn btn-primary mx-1 mt-2" data-toggle="modal" href="#buyModal">삽니다.</a>
        	<a class="btn btn-secondary ml-1 mt-2" data-toggle="modal" href="#questModal">문의사항 접수</a>
      </form>
   
  <!-- 팝니다. 모달팝업 -->
    <div class="modal fade" id="sellModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">  <!-- 등록하기 -->
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modal">물품 등록</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">     <!--  닫기  -->
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
          <!-- form --> 
            <form name="p_save" action="./ProductSellInsert.do" method="post" enctype="multipart/form-data"> <!-- 파일 업로드시 인코딩을 별도로 수행하지 않도록 -->
              <div class="form-row">
                <div class="input-gruop  col-sm-6 ">
                  <label>제목</label>
                  <input type="text" name="p_title" class="form-control" maxlength="40">
                </div>
                <div class="input-gruop  col-sm-6 ">
                  <label>가격</label>
                  <input type="number" name="p_price" class="form-control" maxlength="20">
                </div> 
               
              </div>
            <div class="form-row">
                <div class="form-group col-sm-6">
                  <label>물품 분류</label>
                  <select name="p_group" id="p_group" class="form-control" size="1">
                    <option value="디지털/가정" selected>디지털/가정</option>
                    <option value="패션">패션</option>
                    <option value="유아">유아</option>
                    <option value="인테리어">인테리어</option>
                    <option value="식품">식품</option>
                    <option value="잡화">잡화</option>
                    <option value="취미">취미</option>
                    <option value="기타물품" >기타물품</option>
                  </select>
                </div>
               
               <div class="form-group">
                <label>이미지업로드</label>
                <input multiple="multiple" type="file" name="p_file" id ="p_file" onchange="handleFileSelect();" class="form-control" maxlength="20">
              </div>
            </div>
             <div id="preview"></div>
             
              <div class="form-group" col-sm-6">
                <label>내용</label>
                <textarea  name="p_content" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
              </div>
             
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="submit" class="btn btn-primary">등록하기</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
   <!-- 삽니다. 모달팝업 -->
    <div class="modal fade" id="buyModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">  <!-- 등록하기 -->
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modal">물품 등록</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">     <!--  닫기  -->
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
          <!-- form --> 
            <form name="p_save" action="./ProductBuyInsert.do" method="post" enctype="multipart/form-data"> <!-- 파일 업로드시 인코딩을 별도로 수행하지 않도록 -->
              <div class="form-row">
                <div class="input-gruop  col-sm-6 ">
                  <label>제목</label>
                  <input type="text" name="p_title" class="form-control" maxlength="40">
                </div>
                <div class="input-gruop  col-sm-6 ">
                  <label>가격</label>
                  <input type="number" name="p_price" class="form-control" maxlength="20">
                </div> 
               
              </div>
            <div class="form-row">
                <div class="form-group col-sm-6">
                  <label>물품 분류</label>
                  <select name="p_group" id="p_group" class="form-control" size="1">
                    <option value="디지털/가정" selected>디지털/가정</option>
                    <option value="패션">패션</option>
                    <option value="유아">유아</option>
                    <option value="인테리어">인테리어</option>
                    <option value="식품">식품</option>
                    <option value="잡화">잡화</option>
                    <option value="취미">취미</option>
                    <option value="기타물품" >기타물품</option>
                  </select>
                </div>
               
               <div class="form-group">
                <label>이미지업로드</label>
                <input multiple="multiple" type="file" name="1p_file" id ="1p_file" onchange="handle_FileSelect();" class="form-control" maxlength="20">
              </div>
            </div>
             <div id="1preview"></div>
             
              <div class="form-group" col-sm-6">
                <label>내용</label>
                <textarea  name="p_content" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
              </div>
             
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="submit" class="btn btn-primary">등록하기</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
<!-- 문의사항 접수하기 -->    
    <div class="modal fade" id="questModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modal">문의사항</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form method="post" action="./question.jsp">
              <div class="form-group">
                <label>문의사항 제목</label>
                <input type="text" name="questionTitle" class="form-control" maxlength="20">
              </div>
              <div class="form-group">
                <label>문의 내용</label>
                <textarea name="questionContent" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="submit" class="btn btn-secondary">문의하기</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  <!-- 리스트 -->  
  
  <section>
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
    <td> <a href="ProductDetail.do?idx=${bean.p_id}">${bean.p_title} 
    				<c:choose>
						<c:when test="${bean.p_flag == 0}">[판매중]상품입니다.</c:when>
						<c:when test="${bean.p_flag == 1}">[삽니다]상품입니다.</c:when>
						<c:otherwise> [완료]된상품입니다.</c:otherwise>
					</c:choose>		</a> </td>
    <td> ${bean.p_group }  </td>
    <td> ${bean.p_price } </td>
    <td> ${bean.p_date } </td>
  </tr> 
</c:forEach>  

<tr align="center">
     <td colspan="7">
     <form name=myform action="ProductSearchList.do">
       검색:
       <select name="keyfield" onchange = "myclear()">
         <option  value="">전체</option>
         <option  value="p_userid" <c:if test ="${skey == 'p_userid' }" > selected </c:if> >이름필드</option>
         <option  value="p_title"<c:if test ="${skey == 'p_title'}" > selected </c:if> >제목필드</option>
       </select> 
       <input type="text" name="keyword" value="${sval }">
       <input type="submit" value="검색">
     </form>    
    </td>
   </tr>

  <tr align="center">
    <td colspan="7"> 

   	<a href="ProductSearchList.do?pageNum=1">《</a> 
 	  <c:if test="${startpage > 10}">
 	  <a href=ProductSearchList.do?pageNum=${startpage-10}>이전페이지</a> 
 	  </c:if>
   	  
      <c:forEach var="i"  begin="${startpage}" end="${endpage}" step="1"> 
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
   	  	<a href=ProductSearchList.do?pageNum=${startpage+10}>다음페이지</a> 
   	 </c:if> 
 
  		<a href=ProductSearchList.do?pageNum=${lastpage}>》</a> 	
	
 	</td>
  </tr>

</table>

 </section> 
  </body>
