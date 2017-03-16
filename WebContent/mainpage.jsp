<%@page import="com.whrlibrary.obj.Manager"%>
<%@page import="com.whrlibrary.obj.Reader"%>
<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%
	//从session中获取reader对象
	Reader reader = new Reader();
	HttpSession session2 = request.getSession();
	reader = (Reader) session2.getAttribute("currentUser");
	String userName = new String();
	Manager manager = new Manager();
	HttpSession session3 = request.getSession();
	manager = (Manager) session3.getAttribute("currentMUser");
	String manName = new String();
	String url=new String();
	url="";
	if (reader == null) {
		userName = "读者登录";//没有登录就提示登录
	} else {
		userName = reader.getReaderName();//登录过了就显示名字
		manName = "管理员登录";
		url="NewFile.jsp";
	}
	if(manager == null){
		manName = "管理员登录";
	} else{
		manName = manager.getManagerName();
		userName = "读者登录";
		url="management.jsp";
	}
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name=”viewport” content=”width=device-width, initial-scale=1 "/>
<title>whr的图书馆</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css"
	integrity="sha384-AysaV+vQoT3kOAXZkl02PThvDr8HYKPZhNT5h/CXfBThSRXQ6jW5DO2ekP5ViFdi"
	crossorigin="anonymous">
</head>

<body>
	<!-- modal要放在页面的最顶层 -->
	<form id="r_login" action="LoginServlet" name="r_login" method="post">
		<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">读者登录</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="recipient-name" class="form-control-label">证件号码:</label>
							<input type="text" class="form-control" id="id" name="id">
						</div>
						<div class="form-group">
							<label for="message-text" class="form-control-label">密码:</label>
							<input type='password' class="form-control" id="pwd" name="pwd">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary">确定</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<form action="MLoginServlet" method="post" name="m_login" id="m_login">
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">管理员登录</h4>
					</div>
					<div class="modal-body">
						<form>
							<div class="form-group">
								<label for="recipient-name" class="form-control-label">登录名:</label>
								<input type="text" class="form-control" id="mid" name="mid">
							</div>
							<div class="form-group">
								<label for="message-text" class="form-control-label">密码:</label>
								<input type="password" class="form-control" id="mpwd" name="mpwd">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary">确定</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<nav class="navbar navbar-fixed-top navbar-light bg-faded">
		<a class="navbar-brand" href="#"> <img src="images/logo.jpg"
			width="30" height="30" class="d-inline-block align-top" alt="">&nbsp;&nbsp;whr的图书馆&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</a>
		<ul class="nav navbar-nav">
			<li class="nav-item"><a class="nav-link" href="mainpage.jsp">&nbsp;&nbsp;&nbsp;首页&nbsp;&nbsp;&nbsp;</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="<%=url%>">&nbsp;&nbsp;&nbsp;个人&nbsp;&nbsp;&nbsp;</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="">&nbsp;&nbsp;&nbsp;检索系统&nbsp;&nbsp;&nbsp;</a>
			</li>
		</ul>

		<!-- 判断是登录还是名字，如果是名字，则不能点 -->
		<ol class="breadcrumb float-xs-right"
			style="background: #f7f7f9; padding-top: 0rem; padding-bottom: 0rem;">
			<li class="breadcrumb-item"><a
				style="color: rgba(0, 0, 0, 0.5);" data-toggle="modal"
				href="#myModal1"><%=userName%></a></li>
			<li class="breadcrumb-item"><a
				style="color: rgba(0, 0, 0, 0.5);" data-toggle="modal"
				href="#myModal2"><%=manName%></a></li>
		</ol>

	</nav>

	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="carousel-item active">
				<img src="images/q.jpg" alt="First slide">
			</div>
			<div class="carousel-item">
				<img src="images/w.jpg" alt="Second slide">
			</div>
			<div class="carousel-item">
				<img src="images/e.jpg" alt="Third slide">
			</div>
		</div>
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span class="icon-prev"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span class="icon-next"
			aria-hidden="true"></span> <span class="sr-only">Next</span>
		</a>
	</div>

	<div class="container">
		<div class="row">
			<div class="bd-content col-xs-12 col-md-9">

				<div id="accordion" role="tablist" aria-multiselectable="true"
					style="margin-top: 1.5rem;">
					<div class="card card-primary text-white">
						<div class="card-header" role="tab" id="headingOne">
							<h5 class="mb-0">
								<a class="collapsed text-white" data-toggle="collapse"
									data-parent="#accordion" href="#collapseOne"
									aria-expanded="false" aria-controls="collapseOne"> 读者须知 </a>
							</h5>
						</div>

						<div id="collapseOne" class="collapse" role="tabpanel"
							aria-labelledby="headingOne">
							<div class="card-block">
								<p>1.读者须凭本人借阅证件入馆。</p>
								<p>2.自觉遵守公共秩序，保持室内安静，禁止高声喧哗。</p>
								<p>3.举止文明礼貌，注意仪表仪容，请勿穿背心、拖鞋和带钉鞋入馆。</p>
								<p>4.维护环境卫生，保持馆内清洁，禁止携带食品饮料入馆，禁止随地吐痰、乱扔纸屑、果皮等杂物，禁止吃口香糖。</p>
								<p>5.不得抢占座位和随意搬动阅览座椅及馆内物品，爱护馆内的一切公共设施。</p>
								<p>6.请注意保管好随身携带的书包和私人物品。</p>
								<p>7.馆内严禁吸烟，严禁携带易燃、易爆等危险品入馆。</p>
								<p>8.爱护书刊资料，不得将未经办理借阅手续的书刊私自带出馆外，出入通道如监测器鸣响，请主动配合工作人员检查。</p>
								<p>9.外单位来馆办事人员，请先与办公室联系。</p>
								<p>10.自觉遵守图书馆的有关规章制度，服从工作人员的管理。</p>
							</div>
						</div>
					</div>
					<div class="card card-success text-white">
						<div class="card-header" role="tab" id="headingTwo">
							<h5 class="mb-0">
								<a class="collapsed text-white" data-toggle="collapse"
									data-parent="#accordion" href="#collapseTwo"
									aria-expanded="false" aria-controls="collapseTwo"> 图书借阅规则 </a>
							</h5>
						</div>
						<div id="collapseTwo" class="collapse" role="tabpanel"
							aria-labelledby="headingTwo">
							<div class="card-block">
								<p>1.读者须凭本人借书证借阅图书，证卡遗失应及时挂失，并进行补办。挂失前已被借出的所有图书由读者本人负责归还和赔偿。</p>
								<p>2.读者办理图书外借手续时，应当面检查所借图书有无缺损、划痕等情况，如有此类情况，应及时告知工作人员，由工作人员坐相应记录。否则归还时被发现有污损情况，将按有关规定予以处罚。</p>
								<p>3.在办理借还手续时，请读者仔细核对电脑显示的读者姓名、借还图书册数、书名等信息，避免发生差错。</p>
								<p>4.读者未办借阅手续，不得擅自将书刊带离图书馆，否则按窃书处理。</p>
								<p>5.爱护图书，不得在书上乱涂、乱画、不得撕毁书页，如有上述情况发生，一经核实，将按相关规定惩处；情节严重者，将通报给有关学院并记录在案。</p>
							</div>
						</div>
					</div>
					<div class="card card-info text-white">
						<div class="card-header" role="tab" id="headingThree">
							<h5 class="mb-0">
								<a class="collapsed text-white" data-toggle="collapse"
									data-parent="#accordion" href="#collapseThree"
									aria-expanded="false" aria-controls="collapseThree">
									借阅违规处理方法 </a>
							</h5>
						</div>
						<div id="collapseThree" class="collapse" role="tabpanel"
							aria-labelledby="headingThree">
							<div class="card-block">
								<p>1.读者有责任在借阅期内归还所借图书，凡逾期归还者，必须缴纳逾期费，每天每册 0.10 元。</p>
								<p>2.妥善保管所借图书。一旦丢失，须以版本相同的书刊赔偿，支付加工费2元。赔偿同种书刊确有困难者，按下列规定办理：</p>
								<p>（1）遗失1990年以前（包括1990年）出版的单本图书，按原价的10-20倍赔偿（年代较早的出版物，可参照现在同类书价格的3-5倍赔偿）；</p>
								<p>（2）遗失1990年以后出版的单本图书、外文原版图书，按原价的3-10倍赔偿；</p>
								<p>（3）遗失多卷书中的一册，按整卷图书价格的3-10倍赔偿，未丢失部分仍归图书馆所有；</p>
								<p>（4）遗失孤本书、工具书等珍贵图书，按原价10-20倍赔偿；</p>
								<p>（5）遗失单本期刊，按该刊全年价格赔偿；</p>
								<p>（6）赔偿时如已超过借阅期限，超期费照收；</p>
								<p>（7）赔偿书刊在一个月内找到，可凭赔偿收据退还赔款，超期费照收。</p>
								<p>3.书刊如被损坏、批注、涂抹、圈划、撕页等，视情节轻重，按所损图书原价的3-10倍罚款。</p>
							</div>
						</div>
					</div>
					<div class="card card-warning text-white">
						<div class="card-header" role="tab" id="headingFour">
							<h5 class="mb-0">
								<a class="collapsed text-white" data-toggle="collapse"
									data-parent="#accordion" href="#collapseFour"
									aria-expanded="false" aria-controls="collapseFour">
									电子阅览室管理规定 </a>
							</h5>
						</div>
						<div id="collapseFour" class="collapse" role="tabpanel"
							aria-labelledby="headingFour">
							<div class="card-block">
								<p>1.严格遵守国家有关计算机网络安全的法律法规。严禁访问含有暴力、色情内容的不健康网站，杜绝在网上载取或传播淫秽、反动、诋毁性的报道、影视、图片，严禁发布有害信息。</p>
								<p>2.读者凭本人一卡通上机，一机一人，如果找人或者多人共同完成学习任务需向工作人员提前说明。</p>
								<p>3.严禁上机玩游戏（包括纸牌类）。</p>
								<p>4.自觉爱护机器设备，严禁偷盗、损坏电脑部件，不得自行改动电脑软件、网络配置，严禁删除文件。</p>
								<p>5.电脑出现软、硬件故障，应及时告知管理人员，严禁自己动手解决，否则造成损失由读者本人负责。如有偷盗设备者，按规定严肃处理！</p>
								<p>6.保持室内清洁，严禁携带食品、饮料等入室，严禁吸烟、乱扔果皮、纸屑。</p>
								<p>7.要保持室内安静，严禁喧哗、接打电话。</p>
							</div>
						</div>
					</div>
					<div class="card card-danger text-white">
						<div class="card-header" role="tab" id="headingFive">
							<h5 class="mb-0">
								<a class="collapsed text-white" data-toggle="collapse"
									data-parent="#accordion" href="#collapseFive"
									aria-expanded="false" aria-controls="collapseFive">
									报刊阅览室管理规定 </a>
							</h5>
						</div>
						<div id="collapseFive" class="collapse" role="tabpanel"
							aria-labelledby="headingFive">
							<div class="card-block">
								<p>1.报刊阅览室文献实行开架阅览，读者可自由取阅，每次限取一种，阅后放回原处。</p>
								<p>2.报刊文献一律不外借，只能在本楼层阅览。如需复印报刊上的内容，可与本室工作人员联系。</p>
								<p>3.保持室内清洁，严禁随地吐痰，不得乱扔纸屑杂物，严禁吸烟,不得将零食和饮料带入阅览室。</p>
								<p>4.保持室内安静，不得喧哗、交谈，不得在报刊阅览室使用手机。（凡携带手机的读者须将手机调至震动状态。）</p>
								<p>5.爱护报刊文献及室内设施。对有意损坏、偷窃报刊文献者，将按有关规定给予严厉处罚。</p>
							</div>
						</div>
					</div>
				</div>

				<div class="card-columns" style="margin-top: 1.5rem;">
					<div class="card card-outline-primary">
						<img class="card-img-top img-fluid" src="images/xw1.jpg"
							alt="Card image cap">
						<div class="card-block">
							<h4 class="card-title">荐购书单上架啦！</h4>
							<p class="card-text">1、阿里巴巴正传</p>
							<p class="card-text">2、玛蒂娜贴纸书</p>
							<p class="card-text">3、乖 摸摸头</p>
							<p class="card-text">4、耶鲁大学公开课：死亡</p>
							<p class="card-text">5、刘墉给孩子的成长书</p>
						</div>
					</div>
					<div class="card card-outline-warning card-block">
						<blockquote class="card-blockquote">
							<p>根据国家相关规定，10月1—3日(国庆节)为法定节假日，图书馆闭馆三天。闭馆期间，电子资源正常提供阅读和下载服务。如有不便，敬请谅解，谢谢！</p>
							<footer>
								<small class="text-muted"> whr图书馆 <cite
									title="Source Title">   2016-09-30</cite>
								</small>
							</footer>
						</blockquote>
					</div>
					<div class="card">
						<img class="card-img-top img-fluid" src="images/xw2.jpg"
							alt="Card image cap">
						<div class="card-block">
							<h4 class="card-title">图书馆自习室建成！</h4>
							<p class="card-text">为方便广大读者阅读，图书馆新设读者读书自习室，请读者在使用的同时，自觉遵守相关规定，文明阅读。</p>
							<p class="card-text">
								<small class="text-muted">  2015-04-20 </small>
							</p>
						</div>
					</div>
					<div
						class="card card-block card-inverse card-primary text-xs-center">
						<blockquote class="card-blockquote">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Integer posuere erat.</p>
							<footer>
								<small> Someone famous in <cite title="Source Title">Source
										Title</cite>
								</small>
							</footer>
						</blockquote>
					</div>
					<div class="card card-outline-success card-block text-xs-center">
						<h4 class="card-title">Card title</h4>
						<p class="card-text">This card has supporting text below as a
							natural lead-in to additional content.</p>
						<p class="card-text">
							<small class="text-muted">Last updated 3 mins ago</small>
						</p>
					</div>
					<div class="card">
						<img class="card-img img-fluid" src="images/xw3.jpg"
							alt="Card image">
					</div>
					<div class="card card-outline-info card-block text-xs-right">
						<blockquote class="card-blockquote">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Integer posuere erat a ante.</p>
							<footer>
								<small class="text-muted"> Someone famous in <cite
									title="Source Title">Source Title</cite>
								</small>
							</footer>
						</blockquote>
					</div>
					<div class="card card-outline-danger card-block">
						<h4 class="card-title">Card title</h4>
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This card has
							even longer content than the first to show that equal height
							action.</p>
						<p class="card-text">
							<small class="text-muted">Last updated 3 mins ago</small>
						</p>
					</div>
				</div>

			</div>

			<div class=" bd-sidebar col-xs-12 col-md-3"
				style="margin-top: 1.5rem;">
				<h4>热门电子资源库</h4>
				<ul class="nav nav-pills nav-stacked" style="background: #f7f7f9;">
					<li class="nav-item"><a class="nav-link"
						href="http://www.cnki.net/" target="blank">中国知网</a></li>
					<li class="nav-item"><a class="nav-link"
						href="http://g.wanfangdata.com.cn/" target="blank">万方数据资源系统</a></li>
					<li class="nav-item"><a class="nav-link"
						href="http://www.duxiu.com/" target="blank">读秀</a></li>
					<li class="nav-item"><a class="nav-link"
						href="http://isiknowledge.com/wos" target="blank">Web
							ofScience</a></li>
					<li class="nav-item"><a class="nav-link"
						href="http://search.ebscohost.com/" target="blank">EBSCO(ASC&BSC)</a></li>
					<li class="nav-item"><a class="nav-link"
						href="http://www.scopus.com" target="blank">Scopus</a></li>
				</ul>

			</div>
		</div>
	</div>

	<div class="card card-inverse text-xs-center"
		style="background: #f7f7f9; margin-bottom: 0rem;">
		<div class="card-block">
			<blockquote class="card-blockquote">
				<p class="text-muted">作者 ：
					王浩榕&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系方式
					：17862707352&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮箱 ：
					17862707352@163.com</p>
			</blockquote>
		</div>
	</div>

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
	<script>
		$('#myModal').on('shown.bs.modal', function() {
			$('#myInput').focus()
		})
	</script>

</body>
</html>