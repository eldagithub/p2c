<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<html style="overflow:hidden;">
  <head>
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
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.1.min.js"></script>
  </head>

<body>
	<div class="row form-horizontal">
    	<div class="col-lg-12">
	        	<br><p class="lead"><s:text name="ged_page.title"/></p>
			<hr>
		</div>

		<s:form name="pFormUploadGed" id="pFormUploadGed" action="/ged/upload" method="post" enctype="multipart/form-data" theme="simple">  
		  <s:actionerror cssClass="errorMessage"/>
		  <s:fielderror cssClass="error"/>
			<input type="hidden" name="ged.idprocess" value="<%= request.getParameter("ged.idprocess") %>" />

		  	<div class="col-lg-12">
	            <div class="form-group">
	                        <label class="control-label col-lg-2"><s:text name="ged_page.document_name"/></label>
	                        <div class="col-lg-8">
	                        	<input id="ged.description"  name="ged.description" size=10 type="text" class="form-control" >
	                        </div>
	             </div>
	            <div class="form-group">
	                        <label class="control-label col-lg-2"></label>
	                        <div class="col-lg-8">
	                        	<input type="file" name="file" value="parcourir"/>
	                        </div>
	             </div>
	        </div>
		<br><br>
    	<div class="col-lg-12">
            <div class="form-group">
                      <div class="col-lg-12 text-center ">
                         <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary">
                         <input type="submit" value="<s:text name="button.label.cancel"/>" class="btn btn-metis-5 btn-flat" onclick="javascript:TINY.box.hide();">
                       </div>
             </div>
		</div>
		<br><br><br><br><br><br><br><br><br>	
  		</s:form>
	</div>
</body>
</html>





