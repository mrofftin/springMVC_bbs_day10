<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
    
<%@ include file="../inc/header.jsp" %>
<div class='container'>
	<h3 class='mt-3'>회원 리스트</h3>
	<table class='table'>  
		<thead>                
			<tr>               
				<th>번호</th>  
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>  
				<th>나이</th>  
				<th>이메일</th>
				<th>전화번호</th>
				<th>삭제</th> 
			</tr>              
		</thead>               
		<tbody>
		<%-- <% for(MemberDTO dto : memberList) { %> --%>
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.no}</td>
				<td><a href="memberInfo.do?no=${dto.no}">${dto.id}</a></td>
				<td>${dto.pw}</td>
				<td>${dto.name}</td>
				<td>${dto.age}</td>
				<td>${dto.email}</td>
				<td>${dto.phone}</td>
				<c:if test="${sessionScope.userId==dto.id}">
				<td><input type="button" value="삭제" 
						class="btn btn-danger" 
						onclick="deleteMem(${dto.no})"/></td>
				</c:if>
				<c:if test="${sessionScope.userId != dto.id}">
				<td><input type="button" value="삭제"
						class="btn btn-danger"
						onclick="deleteMem(${dto.no})" disabled/></td>
				</c:if>
			</tr>
		</c:forEach>
<!-- 			<tr>
				<td colspan="8" class="text-center">
					<input type="button" value="Ajax리스트 보기" 
						class="btn btn-secondary" onclick="showList()"/>
				</td>
			</tr> -->
			<tr>
				<td colspan="8" class="text-center" id="ajax-list"></td>
			</tr>
		
			<tr>
				<td colspan='8' class='text-center'>
				<c:if test="${sessionScope.userId ==null || sessionScope.userId==''}">
				<a href='memberRegister.do' class='btn btn-primary'>회원가입</a>
				</c:if>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<script type="text/javascript">
	function deleteMem(no){
		location.href="memberDelete.do?no="+no;
	}
	
	function showList(){
		$.ajax({
			url:"<c:url value='/memberAjaxList.do'/>",
			type:"get",
			dataType: "json",
			success: resultList,
			error: function(){alert("error")}
		});
	}
	
	function resultList(data){
		console.log(data);
		alert(data);
		
		var html = "<table class='table'>";
		html+="<thead class='thead-light'>";                
		html+="<tr>                       ";
		html+="	<th>번호</th>             ";
		html+="	<th>아이디</th>           ";
		html+="	<th>비밀번호</th>         ";
		html+="	<th>이름</th>             ";
		html+="	<th>나이</th>             ";
		html+="	<th>이메일</th>           ";
		html+="	<th>전화번호</th>         ";
		html+="</tr>                      ";
		html+="</thead>                   ";
		html+="<tbody>                   ";
		$.each(data, function(index, obj){			
			html+="<tr>";
			html+="<td>"+obj.no+"</td>";
			html+="<td>"+obj.id+"</td>";
			html+="<td>"+obj.pw+"</td>";
			html+="<td>"+obj.name+"</td>";
			html+="<td>"+obj.age+"</td>";
			html+="<td>"+obj.email+"</td>";
			html+="<td>"+obj.phone+"</td>";
			html+="</tr>";
		});
		html+="</tbody>                   ";
		html+="</table>                   ";
		
		$("#ajax-list").html(html);
	}
</script>
<%@ include file="../inc/footer.jsp" %>