# <img src="https://github.com/koyuhjkl123/portfolio/assets/94844952/42c3324c-69a1-477e-a6b9-ba68dd1f85fd" width="40" height="40"/> 사원 게시판 만들기

CRUD를 활용한 자신의 할당되는 업무 리스트를 우선순위를 적용하는 사원 게시판

# 목차
- 개요
- 프로젝트 구성
- 주요 기능 설명
- 프로젝트 후기

# 개요
* 프로젝트 이름 : 사원게시판
* 프로젝트 개발 기간 : 2024-03-04 ~ 2024-03-15(11일)
* 프로젝트 구성 인원 : 1명(개인 프로젝트)
* 프로젝트 개발 환경
  * 언어 : JAVA
  * DB : Oracle
  * 개발환경 : Spring


# 프로젝트 구성
* 전체조회
* 상세조회
* 추가
* 삭제
* 수정

# 주요 기능 설명
* 전체 조회
- 전체 리스트의 업무를 최신 기준으로 볼 수 있으며, 우선순위를 추가하여 높은 순 높지 않은 순으로
높은 순으로 확인이 가능하다
<br>

<details>
    <summary>코드 보기(html)</summary>

```html

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

```

</details>

<br>

* 상세조회
- 업무 리스트에 있는 제목을 클릭하면 상세 조회를 할 수 있으며, 수정 및 삭제를 클릭이 가능합니다


<details>
    <summary>코드 보기(html)</summary>

```html
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">상세조회</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">상세정보</div>
			<div class="panel-body">
				<div class="row">
				
				
					<div class="col-lg-10">
					
						<div class="form-group">
							<label>Tno</label> <input class="form-control" name="tno"
								value="${List.tno }" readonly="readonly">
						</div>
						<div class="form-group">
							<label>Title</label> <input class="form-control" name="title"
								value="${List.title }" readonly="readonly">
						</div>
						<div class="form-group">
							<label>DueDate</label> <input class="form-control" name="dueDate"
								value="${param.time}" readonly="readonly">
						</div>
						<div class="form-group">
							<label>Writer</label>
							<textarea class="form-control" rows="5" name="writer"
								readonly="readonly">${List.writer }</textarea>
						</div>

						<div class="form-group">
							<input type="checkbox" class="form-control" name="status" ${List.finished ? 'checked' : ''}
								disabled><label>Finished</label>
						</div>



						<form id="operForm" action="/todo/modify" method="get">
							<input type="hidden" id="tno" name="tno" value="${List.tno }" />
							<button data-oper="modify" class="btn btn-default">modify</button>
							<button data-oper="getlist" class="btn btn-info">getList</button>
							<button data-oper="register" class="btn btn-primary">Register</button>
						</form>
					</div>
					<!-- /.col-lg-6 (nested) -->
				</div>
				<!-- /.row (nested) -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->



<script type="text/javascript">
	let form = $("#operForm");

	$("button[data-oper='modify']").on("click", function(e) {

		form.attr("action", "/todo/modify").submit();

	});

	$("button[data-oper='getlist']").on("click", function(e) {

		form.attr("action", "/todo/getlist").submit();

	});

	$("button[data-oper='register']").on("click", function(e) {

		form.attr("action", "/todo/register").submit();

	});
</script>
<%@ include file="../includes/footer.jsp"%>

```

</details>


# 프로젝트 후기








