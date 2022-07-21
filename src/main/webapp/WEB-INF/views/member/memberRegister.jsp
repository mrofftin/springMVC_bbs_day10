<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<c:set var="ctx" value="${pageContext.request.contextPath}"/> 

<%@ include file="../inc/header.jsp" %>
<!-- <form action="../memInsert.do" method="post"> -->
<div style="width:400px; padding:30px; 
            border:1px solid #ddd; border-radius:5px; margin: 50px auto;">
	<form action="${ctx}/memberInsert.do" method="post">
		
		<h4>회원가입</h4>
		<input class="form-control mb-2" type="text" name="id" placeholder="아이디">
		<input class="form-control mb-2" type="password" name="pw" placeholder="비밀번호">
		<input class="form-control mb-2" type="text" name="name" placeholder="이름">
		<input class="form-control mb-2" type="text" name="age" placeholder="나이">
		<input class="form-control mb-2" type="text" name="email" placeholder="이메일">
		<input class="form-control mb-2" type="text" name="phone" placeholder="전화번호">
		<!-- 주소  -->
		<div class="row m-0 mb-2">
			<div class="col-md-3 p-0">
				<input class="form-control form-control-sm mb-2" type="text" id="sample4_postcode" placeholder="우편번호" readonly/>
			</div>
			<div class="col-md-5">
				<a class="btn btn-sm btn-outline-secondary" href="javascript:sample4_execDaumPostcode()">우편번호 찾기</a>
			</div>
		</div>
		<input  class="form-control mb-2" type="text" id="sample4_roadAddress" placeholder="도로명주소" readonly>
		<input  class="form-control mb-2" type="text" id="sample4_jibunAddress" placeholder="지번주소" readonly>
		<!-- <span id="guide" style="color:#999;display:none"></span> -->
		<input  class="form-control mb-2" type="text" id="sample4_detailAddress" placeholder="상세주소">
		
		<div class="text-center mt-3">
		<input type="submit" value="가입" class="btn btn-primary"/>
		<input type="reset" value="취소" class="btn btn-info"/>
		</div>
	</form>	
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
/*                 if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }
 */
                //var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                /* if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                } */
            }
        }).open();
    }
</script>

<%@ include file="../inc/footer.jsp" %>