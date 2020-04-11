<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
				<h2>Bill's SSM Practice</h2>
			</div>
		</div>
<!-- 		新增、刪除按鈕 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary">新增</button>
<!-- 				<button class="btn btn-danger">刪除</button> -->
			</div>
		</div>
		<br>
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
						<th>&nbsp;&nbsp;操作</th>
					</tr>
					
					<c:forEach items="${pageInfo.list}" var="emp">					
						<tr>
							<th>${emp.empId}</th>
							<th>${emp.empName}</th>
							<c:choose>
								<c:when test="${emp.gender==0}">
									<th>male</th>
								</c:when>
								<c:otherwise>
									<th>female</th>
								</c:otherwise>
							</c:choose>
							<th>${emp.email}</th>
<%-- 							<th>${emp.department.deptName}</th> --%>
								<th>${emp.dId}</th>
							<th>
								<div>
									<button class="btn btn-success">修改</button>
									<button class="btn btn-danger">刪除</button>
								</div>
							</th>
						</tr>
					</c:forEach>
					
				</table>
			</div>
		</div>
<!-- 		分頁 -->
		<div class="row">
				<div class="col-md-6">
					現在在第  ${pageInfo.pageNum} 頁，總共: ${pageInfo.pages}頁<br>
					有${pageInfo.total}筆資料
				</div>
				
				<div class="col-md-6">
	<!-- 				分頁條 -->
						<nav aria-label="Page navigation example">
							  <ul class="pagination">
							  
<!-- 							  首頁 -->
							  	<li class="page-item" ><a class="page-link" href="${pageContext.request.contextPath }/getAll?pn=1">第一頁</a></li>
							  	
<!-- 							  	上一頁 -->
						<c:if test="${pageInfo.hasPreviousPage}">
							    <li class="page-item">
							      <a class="page-link" href="${pageContext.request.contextPath}/getAll?pn=${pageInfo.pageNum-1}" aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span>
							      </a>
							    </li>
						</c:if>
							    
<!-- 							    現在在的頁 -->
								<c:forEach items="${pageInfo.navigatepageNums}" var="page">
									<c:choose>
										<c:when test="${pageInfo.pageNum==page}">
							    			<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/getAll?pn=${page}">${page}</a></li>
							    		</c:when>
							    		<c:otherwise>
							    			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/getAll?pn=${page}">${page}</a></li>
							    		</c:otherwise>
							    	</c:choose>
							   	</c:forEach>
<!-- 							   下一頁 -->
						<c:if test="${pageInfo.hasNextPage}">
							    <li class="page-item">
							      <a class="page-link" href="${pageContext.request.contextPath }/getAll?pn=${pageInfo.pageNum+1}" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							      </a>
							    </li>
						</c:if>	    
<!-- 							    末頁 -->
							    <li class="page-item"><a class="page-link"  href="${pageContext.request.contextPath }/getAll?pn=${pageInfo.pages}">最後一頁</a></li>
							  </ul>
						</nav>
				</div>
		</div>
	
	</div>

</body>
</html>