<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page import="com.whrlibrary.obj.Book"%>
<%@ page import="com.whrlibrary.obj.Elecsrc"%>
<%@ page import="java.util.List"%>
<%@ page import="com.whrlibrary.obj.Reader"%>
<%
	//从session中获取reader对象
	Reader reader = new Reader();
	HttpSession session2 = request.getSession();
	reader = (Reader) session2.getAttribute("currentUser");
	String userName = new String();
	String login = new String();
	if (reader == null) {
		userName = "读者登录";//没有登录就提示登录
	} else {
		userName = reader.getReaderName();//登录过了就显示名字
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
			href="#changpwd" role="tab" aria-controls="changpwd">修改密码</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#recom" role="tab" aria-controls="recom">图书荐购</a></li>
		<li class="nav-item"><a class="nav-link active" data-toggle="tab"
			href="#search" role="tab" aria-controls="search">检索系统</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#borrow" role="tab" aria-controls="borrow">当前借阅与续借</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#bhistory" role="tab" aria-controls="bhistory">违规记录</a></li>
	</ul>
	</nav>

	<div class="tab-content text-xs-center">

		<div class="tab-pane text-xs-center" id="changpwd" role="tabpanel">
			<br></br> <br></br> <br></br>
			<form class="text-xs-center" action="" method="post">
				<div class="form-group row text-xs-center">
					<div class="col-xs-4"></div>
					<label class="col-xs-2 col-form-label">请输入当前密码：</label>
					<div class="col-xs-5">
						<input type="password" class="form-control" style="width: 200px;"
							id="change1" placeholder="旧密码"></input>
					</div>
				</div>
				<div class="form-group row text-xs-center">
					<div class="col-xs-4"></div>
					<label class="col-xs-2 col-form-label">请输入新密码：</label>
					<div class="col-xs-5">
						<input type="password" class="form-control" style="width: 200px;"
							id="change2" placeholder="新密码"> </input>
					</div>
				</div>
				<div class="form-group row text-xs-center">
					<div class="col-xs-4"></div>
					<label class="col-xs-2 col-form-label">请再次输入新密码：</label>
					<div class="col-xs-5">
						<input type="password" class="form-control" style="width: 200px;"
							id="change3" placeholder="新密码"> </input>
					</div>
				</div>
				<button id="cpw" type="submit" class="btn btn-primary">确定</button>
			</form>
		</div>
		<div class="tab-pane" id="recom" role="tabpanel">
			<br></br> <br></br> <br></br>
			<form class="text-xs-center">
				<div class="form-group row text-xs-center">
					<div class="col-xs-4"></div>
					<label class="col-xs-2 col-form-label">图书名称：</label>
					<div class="col-xs-5">
						<input class="form-control" style="width: 200px;" id="recom1" name="recom1"
							placeholder="图书名称"></input>
					</div>
				</div>
				<div class="form-group row text-xs-center">
					<div class="col-xs-4"></div>
					<label class="col-xs-2 col-form-label">图书出版社：</label>
					<div class="col-xs-5">
						<input class="form-control" style="width: 200px;" id="recom2" name="recom2"
							placeholder="图书出版社"> </input>
					</div>
				</div>
				<div class="form-group row text-xs-center">
					<div class="col-xs-4"></div>
					<label class="col-xs-2 col-form-label">作者：</label>
					<div class="col-xs-5">
						<input class="form-control" style="width: 200px;" id="recom3" name="recom3"
							placeholder="作者"> </input>
					</div>
				</div>
				<button type="submit" class="btn btn-primary">推荐</button>
			</form>
		</div>
		<div class="tab-pane active" id="search" role="tabpanel">
			<div style="height: 40px;"></div>
			<form class="text-xs-center" action="SearchBookServlet" method="post">
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
			<form id="mytable">

				<%
					List<Book> list_b = (List<Book>) request.getAttribute("books");
					if (list_b != null && list_b.size() > 0) {
				%>
				<table class="table table-hover text-left">
					<thead>
						<tr class="text-left">
							<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;书名</th>
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
							<th scope="row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=book.getBookName()%></th>
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
				<%
					List<Elecsrc> list_e = (List<Elecsrc>) request.getAttribute("elecsrcs");
					if (list_e != null && list_e.size() > 0) {
				%>
				<table class="table table-hover text-left">
					<thead>
						<tr class="text-left>
							<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;书名</th>
							<th>作者</th>
							<th>出版日期</th>
						</tr>
					</thead>
					<tbody>
						<%for (Elecsrc elecsrc : list_e) {%>
						<tr href="#" class="text-xs-center">
							<th scope="row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=elecsrc.getSrcName()%></th>
							<td><%=elecsrc.getWriter()%></td>
							<td><%=elecsrc.getCoTime()%></td>
						</tr>
						<%}
			} else
				System.out.println("duias");%>
					</tbody>
				</table>
			</form>
		</div>
		<div class="tab-pane" id="borrow" role="tabpanel"></div>
		<div class="tab-pane" id="bhistory" role="tabpanel"></div>
	</div>
	<script>
		$(function() {
			$('#myTab a:last').tab('show')
		})
	</script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"
			integrity="sha384-3ceskX3iaEnIogmQchP8opvBy3Mi7Ce34nWjpBIwVTHfGYWQS9jwHDVRnpKKHJg7"
			crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/js/tether.min.js"
			integrity="sha384-XTs3FgkjiBgo8qjEjBk0tGmf3wPrWtA6coPfQDfFEY8AnYJwjalXCiosYRBIBZX8"
			crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js"
			integrity="sha384-BLiI7JTZm+JWlgKa0M0kGRpJbF2J8q+qreVrKBC47e3K6BW78kGLrCkeRX6I9RoK"
			crossorigin="anonymous"></script>

</body>
</html>