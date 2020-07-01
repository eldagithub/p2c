<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title><s:text name="error_page.title"/></title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.1/css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css">

    <!-- Metis core stylesheet -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.min.css">
<script type="text/javascript">
		function    goUrl()
		{
			parent.location.href="<%=request.getContextPath()%>/";
		//	parent.location.reload(false);
			parent.TINY.box.hide();
		}
		function restore() {
			   var overlay = document.getElementById("overlay");
			   if(overlay) document.body.removeChild( overlay );
			}
		
</script>


  </head>
  <body class="error">
    <div class="container">
      <div class="col-lg-8 col-lg-offset-2 text-center">
        <div class="logo">
          <h1><s:text name="error_page.message1"/></h1>
        </div>
        <p class="lead text-muted"><s:text name="error_page.message2"/></p>
        <div class="clearfix"></div>
        <div class="col-lg-6 col-lg-offset-3">
        </div>
        <div class="clearfix"></div>
        <br>
        <div class="col-lg-6 col-lg-offset-3">
          <div class="btn-group btn-group-justified">
            <a href="javascript:goUrl()" class="btn btn-info" style="background-color:#1a616F;border:1px solid #1a616F;"><s:text name="error_page.back"/></a> 
          </div>
        </div>
      </div><!-- /.col-lg-8 col-offset-2 -->
    </div>
  </body>
</html>




<script type="text/javascript">
restore();
</script>

