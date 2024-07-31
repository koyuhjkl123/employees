<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>

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