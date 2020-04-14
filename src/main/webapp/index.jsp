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

		<div class="modal" tabindex="-1" role="dialog" id="addModal">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">員工新增</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		       
		       
		      		 <form class="form-horizontal">
							<div class="form-group">
								<label for="empName_add_input" class="col-sm-2 control-label">Name</label>
								<div class="col-sm-10">
									<input type="text" name="empName" class="form-control" id="addName" placeholder="name..."> <span id="helpBlock2"
									 class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">Gender</label>
								<div class="col-sm-10">
									<label class="radio-inline"> 
										<input type="radio" name="gender" id="addMale" value="0" checked="checked">男
									</label> 
									<label class="radio-inline"> 
										<input type="radio" name="gender" id="addFemale" value="1">女
									</label>
								</div>
							</div>
							<div class="form-group">
								<label for="email_add_input" class="col-sm-2 control-label">email</label>
								<div class="row">
									<div class="col-sm-7">
										<input type="email" class="form-control" name="email" id="addEmail" placeholder="xxx@gmail.com"> 
									</div>
									<div class="col-sm-3">
										<font id="emailValidate"></font>
									</div>
								
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label">Dept</label>
								<div class="col-sm-4">
									<select class="form-control" name="dId" id="addDept">

									</select>
								</div>
							</div>
						</form>
		       
		       
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="saveButton">Save</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>



	<div class="container">
		<!-- 標題 -->
		<div class="row">
			<div class="col-md-12">
				<h2>Bill's SSM Practice Ajax Version</h2>
			</div>
		</div>
<!-- 		新增按鈕 -->
		<div class="row">
			<div class="col-md-9"></div>
			<div class="col-md-3">
				<button class="btn btn-primary" id="addButton">新增</button>
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
	
// 	設全域變數，給新增玩的function到最後一頁
	var totalRecord;
		
		$(document).ready(function(){
			goToPage(1);
		});
		
		function goToPage(pn){
			$.ajax({
				url:"${pageContext.request.contextPath}/getAllReturnJson",
				data:"pn="+pn,
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
		}
		
		function list(result) {
			$("#dataInHere tbody").empty();
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
			$("#pageInfo").empty();
			var navInfo=result.returnMap.pageInfo;
			$("<font></font>").append("現在在第 "+ navInfo.pageNum +" 頁，總共:"+navInfo.pages+" 頁<br>有"+navInfo.total+" 筆資料")
							 .appendTo("#pageInfo");
			
			totalRecord=navInfo.pages;
			
		}
		
		function nav(result) {
			$("#pages").empty();
			var navInfo=result.returnMap.pageInfo;
			
			var nav=$("<nav></nav>");
			var ul=$("<ul></ul>").addClass("pagination");
			var firstPage=$("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").attr("href","#").append("首頁"));
			var lastPage=$("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").attr("href","#").append("末頁"));;
			var previousPage=$("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").attr({"aria-label":"Previous","href":"#"}).append("<span></span>").attr("aria-hidden","true").append("&laquo;"));
			var nextPage=$("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").attr({"aria-label":"Next","href":"#"}).append("<span></span>").attr("aria-hidden","true").append("&raquo;"));;
			
			
			if(navInfo.isFirstPage){
				firstPage.addClass("disabled");
				previousPage.addClass("disabled");
			}else{
				firstPage.click(function(){
					goToPage(1);
				});
				previousPage.click(function(){
					goToPage(navInfo.pageNum-1);
				});
			}
			
			
			
			ul.append(firstPage).append(previousPage);
			
			$.each(navInfo.navigatepageNums,function(index,item){
				var link=$("<a></a>").attr({"class":"page-link","href":"#"}).append(item);
				var per=$("<li></li>").addClass("page-item").append(link);
				if(item == navInfo.pageNum){
					per.addClass("active");
				}
				per.click(function(){
					goToPage(item);
				});
				
				ul.append(per);
			});
			
			
			if(navInfo.isLastPage){
				lastPage.addClass("disabled");
				nextPage.addClass("disabled");
			}else{
				lastPage.click(function(){
					goToPage(navInfo.pages);
				});
				nextPage.click(function(){
					goToPage(navInfo.pageNum+1);
				});
			}
			
			ul.append(nextPage).append(lastPage);
			nav.append(ul).appendTo("#pages");
			
			
		}
	
<!-- 	新增 -->

		$("#addButton").click(function(){
			getDept();
			
			$("#addModal").modal({
				backdrop: "static"
			});
			
			
		});
		
		function getDept(){
			$("#addDept").empty();
			$.ajax({
				url:"${pageContext.request.contextPath}/getDept",
				type:"get",
				dataType:"json",
				success:function(result){
// 					console.log(result);
					$.each(result.returnMap.dept,function(index,item){
						$("<option></option>").append(item.departmentName)
											  .attr("value",item.id)
											  .appendTo("#addDept");
					});
				}
				
			});
		}
		
		$("#addEmail").keyup(function(){
			$("#emailValidate").empty();
			var input=$("#addEmail").val();
			var inputReg=/^[A-Za-z0-9._%+-]+@[A-Z0-9a-z]+\.[a-z]{2,}$/;
// 			alert(inputReg.test(input));
			if(inputReg.test(input)){
				$("#emailValidate").append("yes");
				$("#saveButton").attr("disabled",false);
			}else{
				$("#emailValidate").append("no");
				$("#saveButton").attr("disabled",true);
			}
		});
		
		$("#saveButton").click(function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/addEmp",
				type:"POST",
				data:$("#addModal form").serialize(),
// 				dataType:"json",
				success:function(result){
					if(result.code==100){
// 						顯示新增成功alert
// 						alert(result.msg);
// 						modal關起來
						$("#addModal").modal('hide');
// 						去最後一頁  偷懶寫法->goToPage(9999)   , 但頁數大於9999的話會失效 ->所以用 筆數 (永遠大於頁數)
						goToPage(totalRecord);
					}else{
						console.log(result.msg);
					}
					
				}
				
			});
		});
	
	</script>

</body>
</html>