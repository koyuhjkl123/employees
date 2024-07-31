<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../includes/header.jsp" %>


<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Todo 리스트 등록</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            todo Register
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-10">
                                    <form role="form" action="/todo/register" method="post">
                                        <div class="form-group">
                                            <label>Title</label>
                                            <input class="form-control" name="title" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Content</label>
                                            <textarea class="form-control" rows="5" name="writer" required></textarea>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>Priority</label>
                                            <select name="priority">
                                            	<option value="1">아주 높음</option>
                                            	<option value="2">높음</option>
                                            	<option value="3">보통</option>
                                            	<option value="4">낮음</option>
                                            	<option value="5">아주 낮음</option>
                                            </select>
                                        </div>
                                       

                                        <button type="submit" class="btn btn-default">등록</button>
                                        <button type="reset" class="btn btn-default">취소</button>
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
            
            
            
<%@ include file="../includes/footer.jsp" %>