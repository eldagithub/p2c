<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script>
	function validateFormP(){
		$("#page_content").load('<%=request.getContextPath()%>/ref/addGare?objet.categorie=' + document.getElementById("objet.categorie").value
				+ '&objet.idresponsable=' + escape(document.getElementById("objet.idresponsable").value)
				+ '&objet.nom=' + escape(document.getElementById("objet.nom").value)
				+ '&objet.description=' + escape(document.getElementById("objet.description").value)
		);
	}
</script>

<div class="inner bg-light lter">
        <div class="row">
			<br>
              <div class="col-lg-12">
                    <p class="lead"><s:text name="admin_page.title"/></p>
                    <p class="text-muted"><s:text name="admin_page.add.title"/>&nbsp;<s:text name="repository2.Name"/></p>
		<s:if test="hasActionErrors()">
			<script type="text/javascript">
				alert("La gare existe déjà.");
			</script>
		</s:if>
				<hr>
			</div>
		</div>
          <div class="row form-horizontal">
              <div class="col-lg-12">
					<s:form name="pFormP" action="#">
						<input type="hidden" id="objet.categorie" name="objet.categorie" value="GARE">
						<input type="hidden" id="objet.idresponsable" name="objet.idresponsable" value="0">

                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="admin_page.field.acronyme"/></label>
                        <div class="col-lg-6"><input class="form-control" type="text" id="objet.nom" name="objet.nom" value="<s:property value="objet.nom"/>" ></div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="admin_page.field.details"/></label>
                        <div class="col-lg-6"><input class="form-control" type="text" id="objet.description" name="objet.description" value="<s:property value="objet.description"/>" ></div>
                      </div>
                      
					</s:form>
                      <div class="form-group">
                       <label class="control-label col-lg-6"></label>
	                      <div class="col-lg-1 "><br>
	                        <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary"  onclick="javascript:validateFormP();">
	                      </div>
                      </div>
              </div><!-- /.col-lg-12 -->
		</div>
<br>

</div>



<script type="text/javascript">
	restore();
</script>
