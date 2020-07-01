<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html class="no-js">
  <head>
    <meta charset="UTF-8">
    <title>Process2Com - <s:text name="client.namespace"/></title>
    <!--IE Compatibility modes-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!--Mobile first-->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap @ Font Awesome  -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.min.css">
    
    <!-- Metis core stylesheet -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/theme.css">

    <!-- metisMenu stylesheet -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/metisMenu.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

    <!--[if lt IE 9]>
      <script src="<%=request.getContextPath()%>/js/html5shiv.js"></script>
      <script src="<%=request.getContextPath()%>/js/respond.js"></script>
      <![endif]-->
	<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/tinybox.js"></script>
	
<script type="text/javascript">
var opts = {
		  lines: 15, // The number of lines to draw
		  length: 20, // The length of each line
		  width: 10, // The line thickness
		  radius: 30, // The radius of the inner circle
		  corners: 1, // Corner roundness (0..1)
		  rotate: 0, // The rotation offset
		  direction: 1, // 1: clockwise, -1: counterclockwise
		  color: '#FFF', // #rgb or #rrggbb or array of colors
		  speed: 1, // Rounds per second
		  trail: 60, // Afterglow percentage
		  shadow: true, // Whether to render a shadow
		  hwaccel: false, // Whether to use hardware acceleration
		  className: 'spinner', // The CSS class to assign to the spinner
		  zIndex: 2e9, // The z-index (defaults to 2000000000)
		};


function overlay() {

	   var overlay = document.createElement("div");
	   overlay.setAttribute("id","overlay");
	   overlay.setAttribute("class", "overlay");
	   document.body.appendChild(overlay);
		var spinner = new Spinner(opts).spin(overlay);

	}

function restore() {
	   var overlay = document.getElementById("overlay");
	   if(overlay) document.body.removeChild( overlay );
	}

function pausecomp(millis)
{
	 var date = new Date();
	 var curDate = null;
	 do { curDate = new Date(); }
	 while(curDate-date < millis);
}
function NonVide(c){
	if (c==''){return false;}else{return true;}
}
function CheckDate(d) {
    // Cette fonction vérifie le format JJ/MM/AAAA saisi et la validité de la date.
    // Le séparateur est défini dans la variable separateur
    var amin=2014; // année mini
    var amax=2025; // année maxi
    var separateur="/"; // separateur entre jour/mois/annee
    var j=(d.substring(0,2));
    var m=(d.substring(3,5));
    var a=(d.substring(6));
    var ok=1;
    if ( ((isNaN(j))||(j<1)||(j>31)) && (ok==1) ) {
       alert("Le jour n'est pas correct."); ok=0;
    }
    if ( ((isNaN(m))||(m<1)||(m>12)) && (ok==1) ) {
       alert("Le mois n'est pas correct."); ok=0;
    }
    if ( ((isNaN(a))||(a<amin)||(a>amax)) && (ok==1) ) {
       alert("L'année n'est pas correcte."); ok=0;
    }
    if ( ((d.substring(2,3)!=separateur)||(d.substring(5,6)!=separateur)) && (ok==1) ) {
       alert("Les séparateurs doivent être des "+separateur); ok=0;
    }
    if (ok==1) {
       var d2=new Date(a,m-1,j);
       j2=d2.getDate();
       m2=d2.getMonth()+1;
       a2=d2.getFullYear();
       if (a2<=100) {a2=1900+a2}
       if ( (j!=j2)||(m!=m2)||(a!=a2) ) {
          alert("La date "+d+" n'existe pas !");
          ok=0;
       }
    }
    return ok;
 }

		function goTo(what){
			overlay();
			this.$("#page_content").load(what);
		}
		function loadTodo(){
			this.$("#right").load("<%=request.getContextPath()%>/todo/list"); 
		}
		
		function filAriane(fil){
	   		document.getElementById("logo_label").innerHTML=fil;
		}
		function changeMenuTop(what){
			document.getElementById("label_mes_processus").innerHTML=what.slice(39);
		}
		function changeMenuTop2(what){
			document.getElementById("label_mes_processus").innerHTML=what.slice();
		}
		function filArianeAppend(fil){
	   		document.getElementById("logo_label").innerHTML=document.getElementById("logo_label").innerHTML+ ' > ' +fil;
		}
		
		function    processRead(id, phaseencours)
		{	
			this.$("#page_content").load('<%=request.getContextPath()%>/prc/phaseList?process.id='+id+'&process.phaseencours='+phaseencours);
		}
		function    processRead(id)
		{	
			overlay();
			this.$("#page_content").load('<%=request.getContextPath()%>/prc/phaseList?process.id='+id);
		}
		function    phaseRead(id)
		{
			overlay();
		 	this.$("#tacheList").load('<%=request.getContextPath()%>/prc/taskList?phase.id='+id);
		}

		function    phaseRead2(idphase, idprocess)
		{
			this.$("#page_content").load('<%=request.getContextPath()%>/prc/phaseList?process.id='+idprocess);
			this.$("#tacheList").load('<%=request.getContextPath()%>/prc/taskList?phase.id='+idphase);
		}
		function    phaseRead3(id, idprocess)
		{	
		 	 this.$("#tacheList").load('<%=request.getContextPath()%>/prc/taskList?phase.id='+id+'&phase.idprocess='+idprocess);
		}
		
		function phaseActive(id, filed){
			
			  if (filed.checked) {
					value="yes";
			  } else {
					value="no";
			  }
		
			this.$("#foo").load('<%=request.getContextPath()%>/prc/phaseUpdate?action=active&phase.id='+id+'&phase.active='+value);	
		}
		function taskUpdateStatus(idprocess, idphase, id, status)
		{
		 	this.$("#tacheList").load('<%=request.getContextPath()%>/prc/taskUpdateStatus?idphase='+idphase+"&id=" + id + "&status=" + status);
		 	/*pausecomp(500);
			processRead(idprocess);*/
		}
		function loadTodo2(){
			document.getElementById("right").style.display =  "none";
			//$("#right").collapse("toggle");
		}	
		
		
	    function champsActive(id, filed)
	    {
	        if (filed.value != "" && filed.value != null){
		        //document.getElementById("indicator").style.display = "inline";
		        this.$("#foo").load('<%=request.getContextPath()%>/prc/champsUpdate?champs.id='+id+'&champs.value='+encodeURIComponent(filed.value));
		        document.getElementById("indicator").style.display = "none";
	        }else{
	        	alert('Veuillez compléter tous les champs.');
	        }
	    }
	    
</script>
    
  </head>
  <body class="menu-affix body-font">
    <div class="bg-dark dk" id="wrap">
      <div id="top">

        <!-- .navbar -->
        <nav class="navbar navbar-inverse navbar-fixed-top">
          <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <header class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span> 
                <span class="icon-bar"></span> 
                <span class="icon-bar"></span> 
                <span class="icon-bar"></span> 
              </button>
              <a href="#" class="navbar-brand"  onclick="location.href='<%=request.getContextPath()%>/jsp/home_reader.jsp';">
                <img src="<%=request.getContextPath()%>/css/images/logo_p.png" class="logo" alt=""> 
              </a> 
              <div class="logo_label">Process2Com</div>
            </header>
            <div class="topnav visible-lg-block">
              <div class="btn-group">
                <a data-placement="bottom" data-original-title="<s:text name="menu.label.pleinecran"/>" data-toggle="tooltip" class="btn btn-default btn-sm" id="toggleFullScreen">
                  <i class="glyphicon glyphicon-fullscreen"></i>
                </a> 
              </div>
              <div class="btn-group">
                <a data-placement="bottom" data-original-title="<s:text name="menu.label.wall"/>" href="#"  onclick='filAriane("<s:text name="menu.label.wall"/>");javascript:goTo("<%=request.getContextPath()%>/event/wallListReader");' data-toggle="tooltip" class="btn btn-default btn-sm">
                  <i class="fa fa-comments"></i>
                </a> 
                <a data-toggle="modal" data-original-title="<s:text name="menu.label.help"/>" data-placement="bottom" class="btn btn-default btn-sm" href="#helpModal">
                  <i class="fa fa-question"></i>
                </a> 
              </div>
              <div class="btn-group">
	      		<s:if test="#session.UserSessionKey.profile != null">
          		<a href="<%=request.getContextPath()%>/auth/logout" data-toggle="tooltip" data-original-title="<s:text name="menu.label.logout"/>" data-placement="boottom" class="btn btn-metis-1 btn-sm">
                  <i class="fa fa-power-off"></i>
                </a> &nbsp;<a href="<%=request.getContextPath()%>/profile/home" ></a> 
				</s:if>
				<s:else>
          		<a href="<%=request.getContextPath()%>/auth/login" data-toggle="tooltip" data-original-title="<s:text name="menu.label.login"/>" data-placement="bottom" class="btn btn-metis-1 btn-sm">
                  <i class="fa fa-power-off"></i>
                </a>
				</s:else>
              </div>
              <div class="btn-group">
                <a data-placement="bottom" data-original-title="<s:text name="menu.label.affichermasquermenu"/>" data-toggle="tooltip" class="btn btn-primary btn-sm toggle-left" id="menu-toggle">
                  <i class="fa fa-th"></i>
                </a> 
              </div>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse" id="navbar-toggle-top">

              <!-- .nav -->
              <ul class="nav navbar-nav">
                <li> <a href="#" onclick='filAriane("<s:text name="menu.label.wall"/>");javascript:goTo("<%=request.getContextPath()%>/event/wallListReader");$("#navbar-toggle-top").collapse("hide");'><s:text name="menu.label.wall"/></a>  </li>
                <li> <a href="#" onclick='filAriane("<s:text name="menu.label.process"/>");javascript:goTo("<%=request.getContextPath()%>/jsp/prc/activity/list_reader.jsp");$("#navbar-toggle-top").collapse("hide");'><s:text name="menu.label.process"/></a>  </li>
                 <li >
		      		<s:if test="#session.UserSessionKey.profile != null">
	          		<a class="visible-xs-block visible-sm-block visible-md-block " href="<%=request.getContextPath()%>/auth/logout" title="<s:text name="menu.label.logout"/>" ><s:text name="menu.label.logout"/></a> 
					</s:if>
					<s:else>
	          		<a class="visible-xs-block visible-sm-block visible-md-block " href="<%=request.getContextPath()%>/auth/login" title="<s:text name="menu.label.login"/>"><s:text name="menu.label.login"/></a>
					</s:else>
                </li>
              </ul><!-- /.nav -->
            </div>
          </div><!-- /.container-fluid -->
        </nav><!-- /.navbar -->
        <header class="head mainbar_bgcolor">
          <div class="search-bar mainbar_bgcolor visible-lg-block">
            <form class="main-search mainbar_bgcolor" action="">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="Live Search ..." style="color:white;">
                <span class="input-group-btn">
            <button class="btn btn-primary btn-sm text-muted" type="button">
                <i class="fa fa-search"></i>
            </button>
        </span> 
              </div>
            </form><!-- /.main-search -->
          </div><!-- /.search-bar -->
          <div class="main-bar mainbar_bgcolor">
            <h3>
              <i class="fa fa-home"></i>&nbsp;<span id="logo_label">Process2Com</span></h3>
          </div><!-- /.main-bar -->
        </header><!-- /.head -->
      </div><!-- /#top -->
      <div id="left">
        <div class="media user-media bg-dark dker">
          <div class="user-media-toggleHover">
            <span class="fa fa-user"></span> 
          </div>
          <div class="user-wrapper bg-dark">
            <a class="user-link" href="">
              <img class="media-object img-thumbnail user-img avatar_user" alt="User Picture" src="<%=request.getContextPath()%>/css/images/wall_avatar_user.png">
            </a> 
            <div class="media-body">
              <h5 class="media-heading"><s:property value="#session.UserSessionKey.name" /></h5>
              <ul class="list-unstyled user-info">
                <li> <a href="#" onclick="javascript:goTo('<%=request.getContextPath()%>/profile/home');"><s:text name="userprofile.full" /></a>  </li>
                <!-- <li><s:text name="profile_page.last_access"/> :
                  <br>
                  <small>
                    <i class="fa fa-calendar"></i>&nbsp;16 Mai 16:32</small> 
                </li>-->
              </ul>
            </div>
          </div>
        </div>

        <!-- #menu -->
        <ul id="menu" class="bg-blue dker">
          <li class="nav-header">Menu</li>
          <li class="nav-divider"></li>
          <li class="">
            <a href="#" onclick='filAriane("<s:text name="menu.label.wall"/>");javascript:goTo("<%=request.getContextPath()%>/event/wallListReader");'>
              <i class="fa fa-comments-o"></i><span class="link-title">&nbsp;<s:text name="menu.label.wall"/></span> 
            </a> 
          </li>
          <li class="" onclick='filAriane("<s:text name="menu.label.process"/>");javascript:goTo("<%=request.getContextPath()%>/jsp/prc/activity/list_reader.jsp");'>
            <a href="#" >
              <i class="fa fa-cogs "></i>
              <span class="link-title"><s:text name="menu.label.process"/></span> 
            </a> 
          </li>
        </ul><!-- /#menu -->
      </div><!-- /#left -->
      
      
      
      	
      
      
      
      
      <div id="content">
        <div class="outer">
            <div id="page_content" >
				<div class="inner bg-light lter">
				
			          <div class="row form-horizontal">
			              <div class="col-lg-12">
			              		<br>
			                    <p class="lead"><s:text name="home_page.welcome.title"/></p>
			                    <p class="text-muted"><s:text name="home_page.welcome.subtitle"/></p>
							<hr>
							<br>
						  </div>
			 				<br>
						
						<div class="col-lg-3"></div><br><br>
						<div class="col-lg-9" style="height:500px;">
						
						
          <div class="row">
            <div class="col-md-9 col-sm-12 col-xs-12">
              <div class="info-box bg-303030 box_clickable" onclick='filAriane("<s:text name="menu.label.wall"/>");javascript:goTo("<%=request.getContextPath()%>/event/wallListReader");'>
                <span class="info-box-icon"><i class="fa fa-comments-o"></i></span>
                <div class="info-box-content">
                  <span class="info-box-number"><s:text name="home_page.WALL.title"/></span>
                  <span class="info-box-text"><s:text name="home_page.WALL.subtitle"/></span>
                  <span class="progress-description"><s:text name="home_page.WALL.subtitle2"/></span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
		   </div>
		<br>						
          <div class="row">
            <div class="col-md-9 col-sm-12 col-xs-12">
              <div class="info-box bg-303030 box_clickable" onclick='filAriane("<s:text name="menu.label.process"/>");javascript:goTo("<%=request.getContextPath()%>/jsp/prc/activity/list_reader.jsp");' >
                <span class="info-box-icon"><i class="fa fa-cogs"></i></span>
                <div class="info-box-content">
                  <span class="info-box-number"><s:text name="home_page.PROCESS.title"/></span>
                  <span class="info-box-text"><s:text name="home_page.PROCESS.subtitle"/></span>
                  <span class="progress-description"><s:text name="home_page.PROCESS.subtitle2"/></span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
		  </div>
		<br>						
          <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
            </div><!-- /.col -->
		  </div>
<br><br><br>
						</div>
					 </div>
				</div>
            
            
            
            

            </div>
        </div><!-- /.outer -->
      </div><!-- /#content -->
      <div id="right" class="bg-light lter">
      		<!--<jsp:include page="./todo/home.jsp" />-->
      </div><!-- /#right -->
      
    </div><!-- /#wrap -->
    <footer class="Footer bg-dark dker">
      <p>2015 &copy; Process2Com</p>
    </footer><!-- /#footer -->

	<jsp:include page="./cnt/list_cnt.jsp" />

    <!--jQuery -->
    <script src="<%=request.getContextPath()%>/js/jquery.js"></script>
    <!--<script src="http://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>-->

    <!--Bootstrap -->
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

    <!-- MetisMenu -->
    <script src="<%=request.getContextPath()%>/js/metisMenu.min.js"></script>

    <!-- Screenfull -->
    <script src="<%=request.getContextPath()%>/js/screenfull.min.js"></script>

    <!-- Metis core scripts -->
    <script src="<%=request.getContextPath()%>/js/core.js"></script>

    <!-- Metis demo scripts -->
    <script src="<%=request.getContextPath()%>/js/app.js"></script>
    
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/spin.min.js"></script>
    <script type="text/javascript">
   		//goTo('<%=request.getContextPath()%>/event/wallListReader');
   		document.getElementById("label_mes_processus").innerHTML=document.getElementById("nom_selected_process").value+"";
   		restore();
   </script>
    
  </body>