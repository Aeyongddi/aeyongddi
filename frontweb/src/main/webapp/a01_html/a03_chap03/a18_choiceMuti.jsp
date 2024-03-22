<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h2>선택한 값</h2>
    <h3>선택1: ${paramValues.Music[0] }</h3>
    <h3>선택2: ${paramValues.Music[1] }</h3>
    <h3>선택3: ${paramValues.Music[2] }</h3>
</body>
</html>
<!-- 
# 요청데이터의 단일 데이터와 다중 데이터 처리
1. 단일 데이터   
    1) name="속성값"
        name 속성값이 화면에 하나만 있을 때
        일반적으로 name="속성값"이 다중으로 있더라도 하나만 선택해야 하는
        type="radio"의 경우 단일 데이터 전송
    2) 전송된 데이터 처리 코드(서버단에서 처리)
        ${param.key} 형식으로 데이터 받을 수 있다.
2. 다중 데이터
    1) name="속성값"
        name 속성값이 여러개인 경우
        type="checkbox" 인 경우 check가 된 데이터만 받음
        type="text"인 경우 모든 데이터 받음
    2) 위와 같은 형태의 form 태그인 경우 다중으로 데이터를 받아서 처리하는데,
        일반적으로 배열로 데이터를 받아 처리 가능
        {paramValues.name속성값[0]}
        {paramValues.name속성값[1]}
        {paramValues.name속성값[2]}
        {paramValues.name속성값[3]}
 -->