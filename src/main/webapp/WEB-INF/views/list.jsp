<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>員工</title>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<body>


	<div class="container">
		<!-- 標題 -->
		<div class="row">
			<div class="col-md-12">
				<h2>SSM</h2>
			</div>
		</div>
<!-- 		新增、刪除按鈕 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary">新增</button>
				<button class="btn btn-danger">刪除</button>
			</div>
		</div>
<!-- 		顯示getAll資料 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>ID</th>
						<th>名字</th>
						<th>性別</th>
						<th>e-mail</th>
						<th>部門</th>
						<th>操作</th>
					</tr>
					<tr>
						<th>1</th>
						<th>11</th>
						<th>1</th>
						<th>1111</th>
						<th>1</th>
						<th>
							<button class="btn btn-success">修改</button>
							<button class="btn btn-danger">刪除</button>
						</th>
					</tr>
				</table>
			</div>
		</div>
<!-- 		分頁 -->
		<div class="row">
			<div class="col-md-6">
				當前紀錄
			</div>
			<div class="col-md-6">
				
			</div>
		</div>
	
	</div>

</body>
</html>