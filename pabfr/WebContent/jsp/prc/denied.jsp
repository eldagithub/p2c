<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<head>
    <meta charset="UTF-8">
    <title><s:text name="error_page.title"/></title>

<script type="text/javascript">
		function    goUrl()
		{
			parent.location.href="<%=request.getContextPath()%>/";
		//	parent.location.reload(false);
			parent.TINY.box.hide();
		}
		
</script>


  </head>
  <body class="error">
    <div class="container">
      <div class="col-lg-8 col-lg-offset-2 text-center">
        <div class="logo">
          <h1><s:text name="error_page.message1"/></h1>
        </div>
        <p class="lead text-muted">Désolé.<br>Vous n'avez pas les droits nécessaires à l'éxecution de cette requête </p>
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