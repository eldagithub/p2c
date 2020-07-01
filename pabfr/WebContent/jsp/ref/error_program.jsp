<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script>
	function back(){
		$("#page_content").load('<%=request.getContextPath()%>/ref/listProgram?objet.categorie=PROGRAMME');
	}
</script>

<div class="inner bg-light lter">
        <div class="row">
			<br>
              <div class="col-lg-12">
                    <p class="lead"><s:text name="admin_page.title"/></p>
                    <p class="text-muted"><s:text name="admin_page.delete.title"/>&nbsp;<s:text name="repository1.Name"/></p>
                    <hr>
                    <br><br>
                    <p class="text-muted"><s:text name="admin_page.delete.subtitle"/></p>
			</div>
		</div>

        <div class="col-lg-12">
                <div class="form-group">
                 <label class="control-label col-lg-5"></label>
                 <div class="col-lg-1 "><br><br><br><br><br>
                   <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary"  onclick="javascript:back();">
                 </div>
                </div>
        </div><!-- /.col-lg-12 -->
<br><br><br><br><br><br><br><br>
</div>


<script type="text/javascript">
	restore();
</script>


