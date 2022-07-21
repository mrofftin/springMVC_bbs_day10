<%@page import="kr.mr.model.MemberDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>    
<%
	MemberDTO dto =(MemberDTO)request.getAttribute("dto");
%>
    
<%@ include file="../inc/header.jsp" %>
<div class='container'>                            
	<form action='${ctx}/memberUpdate.do' method='post'>  
		<input type='hidden' name='no' value="<%=dto.getNo()%>">
		<table class='table'>                                   
		<tbody>                                                 
			<tr>                                                
				<td colspan='2'><b><%=dto.getName()%></b> 회원 정보</td>
			</tr>                           
			<tr>                            
				<td>번호</td>               
				<td><%=dto.getNo()%></td>    
			</tr>                           
			<tr>                            
				<td>아이디</td>             
				<td><%=dto.getId()%></td>    
			</tr>                           
			<tr>                            
				<td>비밀번호</td>           
				<td><%=dto.getPw()%></td>    
			</tr>                           
			<tr>                            
				<td>이름</td>               
				<td><%=dto.getName()%></td>  
			</tr>                           
			<tr>                            
				<td>나이</td>               
				<td><input type='text' name='age' value="<%=dto.getAge()%>"></td>          
			</tr>                                         
			<tr>                                          
				<td>이메일</td>                           
				<td><input type='text' name='email' value="<%=dto.getEmail()%>"></td>        
			</tr>                                
			<tr>                                 
				<td>전화번호</td>                
				<td><input type='text' name='phone' value="<%=dto.getPhone()%>"></td>        
			</tr>                                             
			<tr>                                              
				<td colspan='2' align='center'>
					<c:if test="${sessionScope.userId != null}">
						<c:if test="${sessionScope.userId == dto.id}">
							<input type='submit' value='수정하기'
								   class='btn btn-primary'/>
						</c:if>
						<c:if test="${sessionScope.userId != dto.id}">
							<input type='submit' value='수정하기'
								   class='btn btn-primary' disabled/>
						</c:if>
					</c:if>
					<input type='reset' value='취소' class='btn btn-warning'/>         
					<a href='memberList.do' class='btn btn-info'>리스트</a> 
				</td>                                            
			</tr>                                                
		</tbody>                                                
		</table>                                                
		</form>                                                 
		</div>
<%@ include file="../inc/footer.jsp" %>