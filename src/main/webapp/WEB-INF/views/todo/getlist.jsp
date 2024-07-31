<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트</title>
<style type="text/css">
.priority {
	position: absolute;
	top: 120px;
	right: 0;
}
</style>
</head>
<body>

	<h1>Todo 리스트</h1>
	<form action="/todo/get" method="get">
		<table border="1">
			<thead>
				<tr>
					<th>Tno</th>
					<th>Title</th>
					<th>DueDate</th>
					<th>Writer</th>x
					<th>Finlshed</th>
					<th>Priority</th>

				</tr>
			</thead>
			<c:forEach items="${List }" var="todo" varStatus="status">
				<input type="hidden" name="duedate" value="${time[status.index]}">

				<tr>
					<td>${todo.tno }</td>
					<!-- 상세 조회에서 페이지 이동을 위한 수정 -->
					<td><a
						href="/Tdos/todo/get?tno=${todo.tno}&amp;time=${time[status.index]}">${todo.title }</a></td>


					<td>${time[status.index]}</td>
					<td>${todo.writer }</td>

					<td><c:choose>
							<c:when test="${finishedList[status.index]}">
								작업 완료
							</c:when>
							<c:otherwise>
								작업 미완료
							</c:otherwise>
						</c:choose></td>
					<td><c:choose>
							<c:when test="${todo.priority == 1}">
									아주 높음
								</c:when>
							<c:when test="${todo.priority == 2}">
									높음
								</c:when>
							<c:when test="${todo.priority == 3}">
									보통
								</c:when>
							<c:when test="${todo.priority == 4}">
									낮음
								</c:when>
							<c:when test="${todo.priority == 5}">
									아주 낮음
								</c:when>
							<c:otherwise>
									정보 없음
								</c:otherwise>
						</c:choose></td>

				</tr>
			</c:forEach>


		</table>
		<div class="priority">
		<h1>Todo 리스트 중요도</h1>
			<table border="1">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>완료 예정 일자</th>
						<th>작업 여부</th>
						<th>우선순위</th>
					</tr>
				</thead>


				<c:set var="count" value="1" />
				<c:forEach items="${list_priority}" var="todo" varStatus="status">
					<c:if
						test="${(todo.priority == 1 or todo.priority == 2) and count <= 5}">
						<tr>
							<td>${count}</td>
							<td><a
								href="/Tdos/todo/get?tno=${todo.tno}&amp;time=${time[status.index]}">${todo.title}</a></td>
							<td>${datess[status.index]}</td>
							<td><c:choose>
									<c:when test="${finishedList[status.index]}">작업 완료</c:when>
									<c:otherwise>작업 미완료</c:otherwise>
								</c:choose></td>
							<td><c:choose>
									<c:when test="${todo.priority == 1}">아주 높음</c:when>
									<c:when test="${todo.priority == 2}">높음</c:when>
								</c:choose></td>
						</tr>
						<c:set var="count" value="${count + 1}" />
					</c:if>
				</c:forEach>


			</table>


		</div>


	</form>
</body>
</html>