<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<%@ include file="../inc/header.jsp" %>

<div class="container d-flex mt-5 justify-content-center">
	<div class="w-75 shadow p-5 rounded border">
		<form id="moveForm" method="post" action="<c:url value='modify.do'/>">
			<input type="hidden" name="viewPage" value="${viewPage}"/>
			<input type="hidden" name="keyWord" value="${bvo.keyWord}"/>
			<input type="hidden" name="searchType" value="${bvo.searchType}"/>
			
			<h3>글수정 하기</h3>
			<div class="d-flex">
				<div class="form-group">
					<label for="subject">번호</label>
					<input type="text" class="form-control" id="bid" 
						name="bid" readonly value="${board.bid}"/>
				</div>
				<div class="form-group px-2">
					<label for="writer">글쓴이</label>
					<input type="text" class="form-control" id="writer" 
						name="writer" readonly value="${board.writer}"/>
				</div>
				<div class="form-group">
					<label for="hit">조회수</label>
					<input type="text" class="form-control" id="hit" 
						name="hit" readonly value="${board.hit}"/>
				</div>
			</div>
	
			<div class="form-group">
				<label for="subject">제목</label>
				<input type="text" class="form-control" id="subject" 
					name="subject" value="${board.subject}"/>
			</div>
	
			<div class="form-group">
				<label for="contents">내용</label>
				<textarea class="form-control" id="contents" 
					name="contents" rows="4">${board.contents}</textarea>
			</div>

			<div class="form-group mt-4">
				<button type="submit" id="btn-modify" class="btn btn-primary me-2">수정하기</button>
				<button type="button" id="btn-remove" data-link="remove" class="btn btn-danger me-2">삭제</button>
				<button type="button" id="btn-list" data-link="list" class="btn btn-secondary">리스트</button>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
/* 		$("#btn-list").click(() => {
			location.href="<c:url value='/list.do?viewPage=${viewPage}&searchType=${bvo.searchType}&keyWord=${bvo.keyWord}'/>";
		})
		
		$("#btn-remove").click(() => {
			location.href="<c:url value='/remove.do?bid=${board.bid}&viewPage=${viewPage}&searchType=${bvo.searchType}&keyWord=${bvo.keyWord}'/>";
		}) */
		
		var moveForm = $("#moveForm");
		
		$("button").on("click", function(e){
			e.preventDefault();
			
			var linkBtn = $(this).data("link");
			
			if(linkBtn === "remove"){
				moveForm.attr("action", "remove.do");
			}else if(linkBtn === "list"){
				moveForm.attr("action", "list.do").attr("method", "get");
				
				// clone()은 복사해옴.
				var viewPageObj = $("input[name='viewPage']").clone();
				var keyWordObj = $("input[name='keyWord']").clone();
				var searchTypeObj = $("input[name='searchType']").clone();
				
				// list로 넘어가는 파라미터는 viewPage, keyWord, searchType만
				// 필요하다. 나머지는 필요없기 때문에 지워버리고 
				// 세계의 파라미터만 담아서 보냄
				moveForm.empty();
				
				moveForm.append(viewPageObj);
				moveForm.append(keyWordObj);
				moveForm.append(searchTypeObj);
			}
			moveForm.submit();
		});
	});
</script>

<%@ include file="../inc/footer.jsp" %>