<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script>
function newDocument(oFormElement)
{
	/*this.$("#page_content").load('<%=request.getContextPath()%>/ged/upload?ged.idprocess=' + idprocess
			+ '&description=' + escape(document.getElementById("description").value)
			+ '&file=' + escape(document.getElementById("file").value)
	);*/
	//this.$("#page_content").load('<%=request.getContextPath()%>/prc/home');
	//processRead(idprocess);
	var xhr = new XMLHttpRequest();
	xhr.open (oFormElement.method, oFormElement.action, true);
	xhr.send (new FormData (oFormElement));
	return false;
}


</script>


<div class="inner bg-light lter">
<br>
	<div class="row form-horizontal">
    	<div class="col-lg-12">
	        	<br><p class="lead"><s:text name="ged_page.title"/></p>
			<hr>
		</div>

 <s:form name="pForm" action="#" method="post" enctype="multipart/form-data" theme="simple" onsubmit="return newDocument(this);">  
  <s:actionerror cssClass="errorMessage"/>
  <s:fielderror cssClass="error"/>
    	<div class="col-lg-12">
            <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="ged_page.document_name"/></label>
                        <div class="col-lg-8">
                        	<input id="description" name="description" type="text" id="text1" class="form-control">
                        </div>
			</div>
            <div class="form-group">
                        <label class="control-label col-lg-3"></label>
                        <div class="col-lg-8">
                        	<input type="file" id="file" name="file" size=25 value="parcourir"/>
                        </div>
			</div>
		</div>
		<input type="hidden" name="ged.idprocess" value="<%= request.getParameter("ged.idprocess") %>" />
</s:form>
    	<div class="col-lg-12">
            <div class="form-group">
                      <div class="col-lg-5 "></div>
                      <div class="col-lg-2 ">
                         &nbsp;<input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary" onclick="newDocument(<%= request.getParameter("ged.idprocess") %>);" >
                       </div>
             </div>
		</div>
	</div>

</div>

<script type="text/javascript">
	restore();
</script>
