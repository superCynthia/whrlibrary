<%@page import="com.whrlibrary.obj.ReBook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.whrlibrary.obj.Book"%>
<%@ page import="com.whrlibrary.obj.Elecsrc"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>whr的图书馆</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css"
	integrity="sha384-AysaV+vQoT3kOAXZkl02PThvDr8HYKPZhNT5h/CXfBThSRXQ6jW5DO2ekP5ViFdi"
	crossorigin="anonymous">
</head>
<body>

	<nav class="navbar navbar-light bg-faded"> <a
		class="navbar-brand" href="mainpage.jsp"> <img
		src="images/logo.jpg" width="30" height="30"
		class="d-inline-block align-top" alt="">&nbsp;&nbsp;whr的图书馆&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</a>
	<ul class="nav nav-tabs text-xs-center" id="myTab" role="tablist">
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#recom_solve" role="tab" aria-controls="recom_solve">荐购处理</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#addbook" role="tab" aria-controls="addbook">增添图书</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#editbook" role="tab" aria-controls="editbook">删改图书</a></li>
		<li class="nav-item"><a class="nav-link active" data-toggle="tab"
			href="#search" role="tab" aria-controls="search">检索系统</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#addreader" role="tab" aria-controls="addreader">读者注册</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#editreader" role="tab" aria-controls="editreader">删改读者</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#bo_re" role="tab" aria-controls="bo_re">图书借还</a></li>
	</ul>
	</nav>

	<div class="tab-content text-xs-center">
		<div class="tab-pane" id="recom_solve" role="tabpanel">
			<form name="btnForm" id="btnForm" action="GetReOpServlet"
				method="post">
				<input type="hidden" name="choosea_b" value="before" />
				<button type="button" class="btn btn-info" name="bBtn"
					onclick="submitRebook('before');">查看未处理的荐购图书</button>
				<button type="button" class="btn btn-danger" name="aBtn"
					onclick="submitRebook('after');">查看已处理的荐购图书</button>
			</form>
			<%
				List<ReBook> list1 = (List<ReBook>) request.getAttribute("bbooks");
				if (list1 != null && list1.size() > 0) {
			%>
			<form name="rbookForm" id="rbookForm" action="S_RecomServlet"
				method="post">
				<%
					for (ReBook rBook : list1) {
				%>
				<div class="form-check">
					<label class="form-check-label"> <input name="rcheckbox"
						class="form-check-input" type="checkbox" value="<%=rBook.toString()%>"> <%=rBook.toString()%>
					</label>
				</div>
				<%
					}
				%>
				<button type="submit" class="btn btn-info">添加荐购图书</button>
			</form>
			<%
				}
			%>
			<%
				List<ReBook> list2 = (List<ReBook>) request.getAttribute("abooks");
				if (list2 != null && list2.size() > 0) {
					for (ReBook rBook : list2) {
			%>
			<p class="h5"><%=rBook.toString()%></p>
			<%
				}
				}
			%>
		</div>
		<div class="tab-pane" id="addbook" role="tabpanel">
			<form name="addBookForm" id="addBookForm" action="AddBookServlet"
				method="post">
				<div class="form-group row">
					<label for="example-text-input" class="col-xs-2 col-form-label">图书名称</label>
					<div class="col-xs-7">
						<input class="form-control" type="text" name="aName" id="aName"
							value="图书名称" />
					</div>
				</div>
				<div class="form-group row">
					<label for="example-text-input" class="col-xs-2 col-form-label">作者</label>
					<div class="col-xs-7">
						<input class="form-control" type="text" name="awriter"
							id="awriter" value="作者" />
					</div>
				</div>
				<div class="form-group row">
					<label for="example-text-input" class="col-xs-2 col-form-label">出版社</label>
					<div class="col-xs-7">
						<input class="form-control" type="text" name="apblm" id="apblm"
							value="出版社" />
					</div>
				</div>
				<div class="form-group row">
					<label for="example-date-input" class="col-xs-2 col-form-label">出版日期</label>
					<div class="col-xs-7">
						<input class="form-control" type="date" name="atime" id="atime"
							value="出版日期" />
					</div>
				</div>
				<div class="form-group row">
					<label for="example-number-input" class="col-xs-2 col-form-label">数量</label>
					<div class="col-xs-7">
						<input class="form-control" type="number" name="count" value="1"
							id="count" />
					</div>
				</div>
				<button type="submit" class="btn btn-info">添加</button>
			</form>
		</div>
		<div class="tab-pane" id="editbook" role="tabpanel">
			<form name="myForm" action="E_DBookServlet">
				<div class="form-group row">
					<label for="example-text-input" class="col-xs-2 col-form-label">图书编号</label>
					<div class="col-xs-10">
						<input class="form-control" type="text" name="id" id="id">
					</div>
				</div>
				<div class="form-group row">
					<label for="example-text-input" class="col-xs-2 col-form-label">图书名称</label>
					<div class="col-xs-10">
						<input class="form-control" type="text" name="bookName"
							id="bookName">
					</div>
				</div>
				<div class="form-group row">
					<label for="example-text-input" class="col-xs-2 col-form-label">作者</label>
					<div class="col-xs-10">
						<input class="form-control" type="text" name="writer" id="writer">
					</div>
				</div>
				<div class="form-group row">
					<label for="example-text-input" class="col-xs-2 col-form-label">出版社</label>
					<div class="col-xs-10">
						<input class="form-control" type="text" name="pblm" id="pblm">
					</div>
				</div>
				<div class="form-group row">
					<label for="example-date-input" class="col-xs-2 col-form-label">出版日期</label>
					<div class="col-xs-10">
						<input class="form-control" type="date" name="coTime" id="coTime">
					</div>
				</div>
				<input type="hidden" name="action" value="edit" />
				<button type="button" class="btn btn-info" name="editBtn"
					onclick="submitFun('edit');">修改</button>
				<button type="button" class="btn btn-danger" name="delBtn"
					onclick="submitFun('del');">删除</button>
			</form>
		</div>
		<div class="tab-pane active" id="search" role="tabpanel">
			<div style="height: 40px;"></div>
			<form class="text-xs-center" action="MSearchBookServlet" mothed="post">
				<div class="form-group row text-xs-center">
					<div class="col-xs-2"></div>
					<div class="col-xs-2">
						<select class="form-control" style="width: 150px;"
							name="exampleSelect1" id="exampleSelect1">
							<option>书名</option>
							<option>作者</option>
							<option>出版社</option>
						</select>
					</div>
					<div class="col-xs-2">
						<select class="form-control" style="width: 150px;"
							name="exampleSelect2" id="exampleSelect2">
							<option>图书检索</option>
							<option>电子资源检索</option>
						</select>
					</div>
					<div class="col-xs-2">
						<input type="text" class="form-control" style="width: 200px;"
							name="keyword" id="keyword" placeholder="检索词"></input>
					</div>
					<button type="submit" class="btn btn-primarye btn-info col-xs-4"
						style="width: 100px;">检索</button>
				</div>
			</form>
			<table id="mytable">
				<%
					List<Book> list_b = (List<Book>) request.getAttribute("books");
					if (list_b != null && list_b.size() > 0) {
				%>
				<table class="table table-hover text-left">
					<thead>
						<tr class="text-left">
							<th>图书编号</th>
							<th>书名</th>
							<th>作者</th>
							<th>出版社</th>
							<th>出版日期</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (Book book : list_b) {
						%>
						<tr class="text-left">
							<th scope="row"><%=book.getBookID()%></th>
							<td><%=book.getBookName()%></td>
							<td><%=book.getWriter()%></td>
							<td><%=book.getPublishment()%></td>
							<td><%=book.getCoTime()%></td>
						</tr>
						<%
							}
							} else
								System.out.println("duias");
						%>

					</tbody>
				</table>
				</div>
				<div class="tab-pane" id="addreader" role="tabpanel">
					<form action="AddReaderServlet" method="post">
						<div class="form-group row">
							<label for="example-text-input" class="col-xs-2 col-form-label">姓名</label>
							<div class="col-xs-10">
								<input class="form-control" type="text" name="readerName"
									id="readerName">
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-xs-2 col-form-label">密码</label>
							<div class="col-xs-10">
								<input class="form-control" type="password" name="rpwd" id="rpwd">
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-xs-2 col-form-label">电话号码</label>
							<div class="col-xs-10">
								<input class="form-control" type="text" name="tel" id="tel">
							</div>
						</div>
						<fieldset class="form-group row">
							<legend class="col-form-legend col-sm-2">性别</legend>
							<div class="row">
								<div class="form-check">
									<label class="form-check-label"> <input
										class="form-check-input" type="radio" name="sex" id="Msex"
										value="男" checked> 男
									</label>
								</div>
								<div class="form-check">
									<label class="form-check-label"> <input
										class="form-check-input" type="radio" name="sex" id="Fsex"
										value="女"> 女
									</label>
								</div>
							</div>
						</fieldset>
						<button type="submit" class="btn btn-info">注册</button>
					</form>
				</div>
				<div class="tab-pane" id="editreader" role="tabpanel">
					<form action="E_DReaderServlet" method="post">
						<!-- 最后补充 -->
					</form>
				</div>
				<div class="tab-pane" id="bo_re" role="tabpanel">
					<form name="b_rForm" id="b_rForm" action="B_RBookServlet"
						method="post">
						<div class="form-group row">
							<label for="example-text-input" class="col-xs-2 col-form-label">图书编号</label>
							<div class="col-xs-10">
								<input class="form-control" type="text" name="b_id" id="b_id">
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-xs-2 col-form-label">读者编号</label>
							<div class="col-xs-10">
								<input class="form-control" type="text" name="r_id" id="r_id">
							</div>
						</div>
						<input type="hidden" name="operation" value="borrow" />
						<button type="button" class="btn btn-info" name="borrowbtn"
							onclick="submitType('borrow');">借阅图书</button>
						<button type="button" class="btn btn-info" name="returnbtn"
							onclick="submitType('return');">归还图书</button>
					</form>
				</div>
				</div>

				<script type="text/javascript">
					function submitFun(act) {
						myForm.action.value = act;
						myForm.bookName = document.getElementById("bookName");
						myForm.writer = document.getElementById("writer");
						myForm.pblm = document.getElementById("pblm");
						myForm.coTime = document.getElementById("coTime");
						myForm.id = document.getElementById("id");
						myForm.submit();
					}
				</script>
				<script type="text/javascript">
					function submitType(operation) {
						b_rForm.operation.value = operation;
						b_rForm.b_id = document.getElementById("b_id");
						b_rForm.r_id = document.getElementById("r_id");
						b_rForm.submit();
					}
				</script>
				<script type="text/javascript">
					function submitRebook(optype) {
						btnForm.choosea_b.value = optype;
						btnForm.submit();
					}
				</script>
				<!-- 
				<script type="text/javascript">
					function getChecked() {
						var stringlist = [];
						var checkboxlist = document
								.getElementsByName("rcheckbox");
						for (var i = 0, j = 0; i < checkboxlist.length; i++) {
							if (checkboxlist[i].checked) {
								stringlist[j++] = checkboxlist[i].value;
								continue;
							}
						}
					}
				</script>
				 -->
				<script
					src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"
					integrity="sha384-3ceskX3iaEnIogmQchP8opvBy3Mi7Ce34nWjpBIwVTHfGYWQS9jwHDVRnpKKHJg7"
					crossorigin="anonymous"></script>
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/js/tether.min.js"
					integrity="sha384-XTs3FgkjiBgo8qjEjBk0tGmf3wPrWtA6coPfQDfFEY8AnYJwjalXCiosYRBIBZX8"
					crossorigin="anonymous"></script>
				<script
					src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js"
					integrity="sha384-BLiI7JTZm+JWlgKa0M0kGRpJbF2J8q+qreVrKBC47e3K6BW78kGLrCkeRX6I9RoK"
					crossorigin="anonymous"></script>
</body>
</html>