<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.title{
	position: relative;
    margin-bottom: 24.5px;
    padding-bottom: 18.5px;
    border-bottom: 1px solid rgb(216, 222, 229);
}
.title h2{
	margin-right: 18px;
    color: rgb(35, 35, 35);
    font-size: 24px;
    font-family: Regular, sans-serif;
    letter-spacing: -0.6px;
}
a{
 color: black;
 font-size: 15px;
 } 
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.reserves').click(function(){
		let no = $(this).attr("data-no");
		no = parseInt(no);
		$.ajax({
			type:'post',
			url:'../reserve/reserve_detail.do',
			data:{"no":no},
			success:function(result){
				$('#print').html(result);
			}
		})
	})
})
</script>
</head>
<body>
  <div class="title">
    <h2>나의 진행중 예약 내역</h2>
  </div> 
  <c:if test="${totalCount==0 }">
  	  <div class="text-center">
	 	<img src="https://shareit.kr/static/media/img-no-qna.0463e10d.png" style="width:30%;">
	 	<p class="de-text-desc">예약 내역이 없습니다.</p>
	 </div>
  </c:if>
  <c:if test="${totalCount!=0 }">
  <table class="table"> 
    <tr> 
      <th width="15%" class="text-center"></th>
      <th width="20%" class="text-center">장소이름</th>
      <th width="15%" class="text-center">예약일자</th>
      <th width="15%" class="text-center">예약시간</th>
      <th width="15%" class="text-center">신청일</th>
      <th width="10%" class="text-center">예약상태</th>
      <th width="10%" class="text-center"></th>
    </tr>
    <c:forEach var="vo" items="${list }">
    <c:if test="${vo.state==0 }">
	    <tr style="vertical-align:middle">
	      <td width="15%" class="text-center">
	       <a href="../place/detail.do?no=${vo.place_no }"><img src="${vo.rep_image }" style="width:100px; height:100px"></a>  
	      </td>	      
	      <td width="20%" class="text-center reserves" data-no="${vo.no }">${vo.name }</td>
	      <td width="15%" class="text-center">${vo.rdate }</td>
	      <td width="15%" class="text-center">${vo.rtime }</td>
	      <td width="15%" class="text-center">${vo.dbday }</td><!-- 예약신청한 날짜 -->
	      <td width="10%" class="text-center">예약대기</td>
	      <td width="10%" class="text-center"><a href="../mypage/reserve_cancel.do?no=${vo.no }" style="color:#2964D9; font-size: 14px;">취소</a></td>
	    </tr>
	</c:if>
    </c:forEach>
  </table>
  <!-- 페이지네이션 시작 -->
  <div class="custom-pagination" style="text-align:center">
	<c:if test="${startPage>1 }">
 		<a href="../mypage/reserve_list.do?page=${startPage-1 }">&laquo;</a>
  	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:choose>
	    	<c:when test="${i==curPage }">
	       		<c:set var="style" value="class=active"/>
	     	</c:when>
	    	<c:otherwise>
	       		<c:set var="style" value=""/>
	    	</c:otherwise>
	    </c:choose>
  		<a ${style } href="../mypage/reserve_list.do?page=${i}" value="${i }">${i }</a>
   	</c:forEach>
    	<c:if test="${endPage<totalPage }">
    		<a href="../mypage/reserve_list.do?page=${endPage+1 }">&raquo;</a>
   		</c:if>
	</div> 
	<!-- 페이지네이션 끝 -->
	<div id="print"></div>
 </c:if>
</body>
</html>