<%-- qna>>
@JSP : insertQnaboard.jsp
@Date : 2018.10.09
@Author : 이주원
@Desc : Q&A 게시판 글쓰기 화면입니다. 동기식으로 이동합니다.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=yaps0ah95j72p1podkonpizywofdvarpwuuzjrfbjm1ysadp"></script>
<script src="${pageContext.request.contextPath}/resources/js/textEditer.js"></script>
<se:authentication property="name" var="loginuser" />
<se:authentication property="authorities" var="role" />
<section id="content">
	<div class="container">
		<c:choose>
			<c:when test="${qna.qnaDept==1}">
				<div class="qnaReply">
					QnA 답글 작성
				</div>
				<form action="${pageContext.request.contextPath}/qna/insertQnaReply.htm" method="post" id="insertQnaform" class="contact-form">
					<input type="hidden" name="qnaNum" value="${qna.qnaNum}" />
					<input type="hidden" name="qnaDept" value="${qna.qnaDept}" />
			</c:when>
			<c:otherwise>
				<form action="${pageContext.request.contextPath}/qna/insertQnaboard.htm" method="post" id="insertQnaform" class="contact-form">
			</c:otherwise>
		</c:choose>
			<div class="col-md-12">
				<div class="form-group">
					<input type="text" class="form-control qnaTitle" name="qnaTitle"
						autocomplete="off" id="qnatitle" placeholder="제목"/>&ensp;
					<!-- 관리자 - 공지사항 여부 -->
					<c:if test="${qna.qnaDept==0}">
					<se:authorize access="hasAnyRole('ROLE_ADMIN')">
						<div class="qnaNotice"><input type="checkbox" value="1"  name="qnaNotice" class="qnaNotice">&nbsp;공지사항</div>
					</se:authorize>
					</c:if>
				</div>
			</div>
			<div class="col-md-12">
				<div class="form-group">
					<textarea class="form-control textarea" rows="15" name="qnaContent"
						id="qnacontent" placeholder="내용을 입력하세요"></textarea>
				</div>
			</div>
			<div class="col-md-12">
				<div class="qnaSecret"><input type="checkbox" value="1" name="qnaSecret" class="qnaSecret">&nbsp;비공개
				<button type="submit" class="btn btn-danger center-block"
					id="qnainsertbtn">등록</button></div>
			</div>
		</form>
	</div>
</section>
<script type="text/javascript">
$(function(){
	
});
</script>
