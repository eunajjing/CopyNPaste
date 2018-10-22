<!-- note>>
@JSP : list.jsp
@Date : 2018.10.09
@Author : 우나연, 임효진
@Desc : note 목록 페이지.
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="n-container">
	<div class="n-inner">
		<!-- Section -->
		<section id="droppable">
			<header class="major">
				<h3>
					미분류<i class="fas fa-trash icon-size"></i>
				</h3>
			</header>
		</section>
		
		
		<div class="row" id="noteList">
		<!-- 	<div id="noteList"></div> -->
			<%-- 	<c:forEach var="noteList" items="${noteList}">
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 ">
				<div class="text-center noteDiv">
					<!-- a HTML (to Trigger Modal) -->
					<a data-toggle="modal"
						href="${pageContext.request.contextPath}/note/noteDetail.htm?noteNum=${noteList.noteNum}&cmd=mynote"
						data-target="#modal-testNew" role="button" data-backdrop="static">
						<div class="item">
							<img class="img-rounded"
								src="${noteList.noteThumnail}"
								alt="${noteList.noteTitle}" width="100%">
							 <div class="caption">
								<i class="fa fa-plus" aria-hidden="true"></i>
							</div> 
						</div>
						<div>
						<input type="hidden" id="noteNum" class="noteNum" value="${noteList.noteNum}">
							<h4>${noteList.noteTitle}</h4>
							<strong>${noteList.userNick}</strong> <span> ${noteList.noteDate}</span>
						</div>
					</a>
				</div>
			</div>
				</c:forEach> --%>
			
			
			
			
			
			</div>


		</div>
	</div>
	<br>



<!-- Modal HTML -->
<div id="modal-testNew" class="modal fade text-center overlay" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">Content will be loaded here from
			"note/noteDetail.htm" file</div>
	</div>
</div>

<script>

</script>