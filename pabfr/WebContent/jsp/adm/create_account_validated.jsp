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

function goTo(what){
	overlay();
	this.$("#page_content").load(what);
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
              <a href="#" class="navbar-brand">
                <img src="<%=request.getContextPath()%>/css/images/logo_p.png" class="logo" alt=""> 
              </a> 
              <div class="logo_label">Process2Com</div>
            </header>
          </div><!-- /.container-fluid -->
        </nav><!-- /.navbar -->
      </div><!-- /#top -->
      
       
      
      
      <div id="content">
            <div id="page_content" >
				<div class="mainbar_bgcolor" style="padding:10px;height:800px;">
			          <div class="row form-horizontal">
			              <div class="col-lg-12">
			              		<br>
			                    <p class="lead">Compte administrateur créé</p>
								<hr>
			          	<br>
						  </div>
						
				          <div class="row form-horizontal" style="padding:10px;">
				              <div class="col-lg-12">
									<s:form name="pForm" action="#">
				                      <div class="form-group">
				                        <label class="col-lg-3"></label>
				                        <label class="col-lg-8"><h2>Félicitations !!!</h2>
				                        <br>
				                        <h4>Vous venez de créer le compte administrateur de votre application P2C collaborative et digitale.
				                        <br>Vous allez recevoir un mail de confirmation à l'adresse email renseignée précédemment, pour accéder à votre :
				                        <br><br><ul>
				                        <li><span style="color:black;">Application P2C</span>
				                        	<ul style="list-style-type: square;">
				                        		<li>Pour l'administrer : utilisateurs, données, templates, ... </li>
				                        		<li>Pour démarer l'industrialisation et l'optimisation de vos activités transverses : création des instances, ...</li>
				                        	</ul>
				                        	<br><br>
				                        	
				                        </li>
				                        <li><span style="color:black;">Espace d'échange avec notre équipe support</span>
				                        	<ul style="list-style-type: square;">
				                        		<li>Pour réaliser et suivre vos demandes d'information</li>
				                        		<li>Pour créer et gérer vos tickets d'incidents</li>
				                        	</ul>
				                        </li>
				                        </ul>
				                         
				                        </h4></label>
				                      </div>
										<br><br>
				
									</s:form>
				              </div><!-- /.col-lg-12 -->
						</div>

					 </div>
				</div>

            </div>
      </div><!-- /#content -->
      
    </div><!-- /#wrap -->
    <footer class="Footer bg-dark dker">
      <p>2015 &copy; Process2Com</p>
    </footer><!-- /#footer -->


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
   	</script>
    
  </body>