<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">수정</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Todo 리스트 정보수정</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-10">
					<form id="operForm" role="form" action="/todo/modify" method="post">
						<div class="form-group">
							<label>번호</label> <input class="form-control" name="tno"
								value="${List.tno }" readonly="readonly">
						</div>
						<div class="form-group">
							<label>제목</label> <input class="form-control" name="title"
								value="${List.title }">
						</div>
						<div class="form-group">
							<label>내용</label> <input class="form-control" name="writer"
								value="${List.writer }">
						</div>

						<div class="form-group">
							<label>DueDate</label> <input type="datetime-local" name="duedate">
						</div>
						<div class="form-group">
							<label>finished</label> 
							<input type="checkbox" class="form-control" name="finished" value="true"
								 readonly="readonly">
						</div>
		

						
							<input type="hidden" id="tno" name="tno" value="${List.tno }" />

							<div class="modal-footer">
								<button type="button" data-oper="modify" class="btn btn-warning">Modify</button>
								<button type="button" data-oper="remove" class="btn btn-danger">Remove</button>
								<button type="button" data-oper="register" class="btn btn-primary">Register</button>
								<button type="button" data-oper="getlist" class="btn btn-primary">Get List</button>
							</div>

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
$(document).ready(function(){
	const form = $("form");

	$("button").on("click", function(e) { /* 해당 버튼을 클릭을 할 경우 */

		e.preventDefault(); // submit 작동 해제

		const formOper = $(this).data("oper");

		if (formOper === "modify") {
			/* data-oper : 해당 버튼인 modify클릭 시 form 속성값 변경 */
			form.attr("action", "/todo/modify").attr("method", "POST");
		}else if(formOper == "remove"){
			form.attr("action", "/todo/remove").attr("method", "POST");
		}else if(formOper == "getlist"){
			form.attr("action", "/todo/getlist").attr("method", "get");
		}else if(formOper == "register"){
			form.attr("action", "/todo/register").attr("method", "get");
		}
		
		form.submit();
	})
});
	
	

</script>
<%@ include file="../includes/footer.jsp"%>