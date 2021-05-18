<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<!-- JSTL -->
<%-- <%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions" %> --%>

<%@ include file="../include/header.jsp" %> 
<!-- servlet

 -->
 
  <body>
  
  
  <%
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
  %> 
   
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="index.jsp">중고거래 사이트</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">  <!--창이 작아지면은 우측상단 토글 메뉴로 변경 (사이즈는 F12 눌러서 확인)  -->
        <span class="navbar-toggler-icon"></span>
      </button>
      <!-- ul 리스트  li  -->
      <div class="collapse navbar-collapse" id="navbar">
        <ul class="navbar-nav mr-auto">         		 
          <li class="nav-item">
            <a class="nav-link" href="index.jsp">메인</a>
          </li>
          <li class="nav-item dropdown"> 	              
            <a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">  회원 관리  </a>
            <div class="dropdown-menu" aria-labelledby="dropdown">             <!-- 드랍 다운 메뉴 -->

<c:choose>
     <c:when test="${sessionScope.userID == null }">
    		  <a class="dropdown-item active" href="./userLogin.jsp">로그인</a>
              <a class="dropdown-item" href="./userJoin.jsp">회원가입</a>
	</c:when>
  	<c:otherwise>
             <a class="dropdown-item" href="./userLogout.jsp">로그아웃</a>
	</c:otherwise>
</c:choose> 
            </div>
          </li>
        </ul>
        
        <form class="form-inline my-2 my-lg-0">      
          <input class="form-control mr-sm-2" type="search" placeholder="내용을 입력하세요." aria-label="Search">    <!-- 검색기능  -->
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
        </form>
     </div>
  </nav>
   <!--아이디 / 비밀번호  /로그인  -->
   <section class ="container mt-5" style="max-width:560;">
		<form method="post" action="./userLoginAction.jsp">
			<div class="form-group ">
				<label>아이디 </label> <input type="text" name="userID"
					class="form-control" placeholder="아이디 입력란">
			</div>

			<div class="from-group ">
				<label>비밀번호</label> <input type="password" name="userPassword"
					class="form-control" placeholder="비밀번호 입력란">
			</div>
			
			<button type="submit" class="btn btn-primary btn-sm col-lg-12 ">로그인</button>

			<div class="col-md-6 offset-md-4">
				<a href="#" class="btn btn-link"> 비밀번호 잃어버리 셨나요? </a>
				<a href="#" class="btn btn-link"> 비밀번호 변경하고 싶은세요? </a>
			</div>
		</form>

	</section>
  <jsp:include page="../include/footer.jsp"></jsp:include>
    <!-- <footer> <script src="./footer.jsp"></script></footer> -->
  </body>
</html>






