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
				<h2>Bill's SSM Practice Ajax Version</h2>
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
				<table class="table table-hover" id="dataInHere">
				<thead>
					<tr>
						<th>ID</th>
						<th>名字</th>
						<th>性別</th>
						<th>e-mail</th>
						<th>部門</th>
						<th>&nbsp;&nbsp;操作</th>
					</tr>
				</thead>
				<tbody></tbody>
					
				</table>
			</div>
		</div>
		
		
		
<!-- 		分頁 -->
		<div class="row">
				<div class="col-md-6" id="pageInfo"></div>
				
				<div class="col-md-6" id="pages"></div>
		</div>
	
	</div>
	
	
<!-- 	listAll ajax -->
	<script type="text/javascript">
		$(document).ready(function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/getAllReturnJson",
				data:"pn=1",
				type:"get",
				dataType:"json",
				success:function(result){
					console.log(result);
					list(result);
					navInfo(result);
					nav(result);
					
				},
				fail:function(result){
					alert("fail");
				}
			});
		});
		
		
		function list(result) {
			var emps=result.returnMap.pageInfo.list;
			$.each(emps,function(index,item){
				var empId=$("<td></td>").append(item.empId);
				var empName=$("<td></td>").append(item.empName);
				var empGender=$("<td></td>").append(item.gender==0?'male':'female');
				var empEmail=$("<td></td>").append(item.email);
				var empDept=$("<td></td>").append(item.dId);
				var editButton=$("<button></button>").addClass("btn btn-success").append("Edit");
				var deleteButton=$("<button></button>").addClass("btn btn-danger").append("Delete");
				var buttons=$("<td></td>").append(editButton).append(" ").append(deleteButton);
				$("<tr></tr>").append(empId)
							  .append(empName)
							  .append(empGender)
							  .append(empEmail)
							  .append(empDept)
							  .append(buttons)
							  .appendTo("#dataInHere tbody");
							  
				
			});
		}
		
		
		function navInfo(result){
			var navInfo=result.returnMap.pageInfo;
			$("<font></font>").append("現在在第 "+ navInfo.pageNum +" 頁，總共:"+navInfo.pages+" 頁<br>有"+navInfo.total+" 筆資料")
							 .appendTo("#pageInfo");
			
		}
		
		function nav(result) {
			var navInfo=result.returnMap.pageInfo;
			
			var nav=$("<nav></nav>");
			var ul=$("<ul></ul>").addClass("pagination");
			var firstPage=$("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").attr("href","#").append("首頁"));
			var lastPage=$("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").attr("href","#").append("末頁"));;
			var previousPage=$("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").attr({"aria-label":"Previous","href":"#"}).append("<span></span>").attr("aria-hidden","true").append("&laquo;"));
			var nextPage=$("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").attr({"aria-label":"Next","href":"#"}).append("<span></span>").attr("aria-hidden","true").append("&raquo;"));;
			
			ul.append(firstPage).append(previousPage)
			
			$.each(navInfo.navigatepageNums,function(index,item){
				var per=$("<li></li>").addClass("page-item").append("<a></a>").addClass("page-link").attr("href","#").append(item);
				ul.append(per);
			});
			
			
			ul.append(nextPage).append(lastPage);
			nav.append(ul).appendTo("#pages");

			
		}
	</script>

</body>
</html>