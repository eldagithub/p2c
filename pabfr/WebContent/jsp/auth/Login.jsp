<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title><s:text name="login_page.title"/></title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/theme.css">
  </head>
  <body class="login" style="background: #444 ;">
    <div class="form-signin">
      <div class="text-center">
        <img src="<%=request.getContextPath()%>/css/images/logo_p.png" class="logo" alt="Logo P2C">
      </div>
      <hr>
      <div class="tab-content">
        <form action="login.action" method="post">
	        <div id="login" class="tab-pane active">
	            <p class="text-muted text-center"><s:text name="login_page.label"/></p>
	            <input type="text" placeholder="<s:text name="login_page.login"/>" class="form-control top" name="username" >
	            <input type="password" placeholder="<s:text name="login_page.password"/>" class="form-control bottom" name="password" >
	            <button class="btn btn-lg btn-primary btn-block" type="submit"><s:text name="login_page.connection"/></button>
	        </div>
       </form>
      </div>
    </div>
  </body>
</html>