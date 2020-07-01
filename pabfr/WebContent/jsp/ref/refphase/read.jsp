<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script>
	function rpChange(id, what, filed)
	{
	    loadfoo="foo"+id;
	    document.getElementById(loadfoo).innerHTML='<img src="<%=request.getContextPath()%>/css/images/indicator.gif" alt="Loading..." style="display: inline" />';
	    this.$("#"+loadfoo).load('<%=request.getContextPath()%>/ref/modifyRefPhase?refPhase.idref='+id+'&' + what + '='+encodeURIComponent(filed.value));
	}
	function rpChange2(id, what, filed)
	{
	    loadfoo="foo"+id;
	    document.getElementById(loadfoo).innerHTML='<img src="<%=request.getContextPath()%>/css/images/indicator.gif" alt="Loading..." style="display: inline" />';
	    this.$("#"+loadfoo).load('<%=request.getContextPath()%>/ref/modifyRefPhase?refPhase.idref='+id+'&' + what + '='+encodeURIComponent(filed));
	}
</script>
 
          	<div class="row form-horizontal">
	            <div class="col-lg-9"></div>
	            <div class="col-lg-3">
	                    <p class="text-muted">
					    	<a class="no_underline" data-toggle="collapse" data-parent="#accordion" href="#collapsePhase">
	                    	<i class="  fa fa-question-circle fa-2x" title="Cliquer pour afficher les caractéristiques de la phase"></i> 
	                    	</a>
	                    </p>
				</div>
            </div>
<br><br>

          	<div class="row form-horizontal">
			<div id="collapsePhase" class="panel-collapse collapse"> 
              <div class="col-lg-12">
                      <div class="form-group">
                        <label class="control-label col-lg-3"><s:text name="admin_page.field.acronyme"/></label>
                        <div class="col-lg-7"><input onchange="rpChange(<s:property value="refPhase.idref"/>, 'refPhase.nom', this)" class="form-control" type="text"  placeholder="<s:property value='refPhase.nom' />"  value="<s:property value='refPhase.nom' />" ></div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-3"><s:text name="admin_page.field.details"/></label>
                        <div class="col-lg-7"><input onchange="rpChange(<s:property value="refPhase.idref"/>, 'refPhase.description', this)" class="form-control" type="text"  placeholder="<s:property value='refPhase.description' />"  value="<s:property value='refPhase.description' />" ></div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-3"><s:text name="admin_page.admin_account.metaprocess_mngt.add.phase.required"/></label>
                        <div class="col-lg-7">
							<select name="refPhase.active" id="refPhase.active" class="form-control" onchange="rpChange2(<s:property value="refPhase.idref"/>, 'refPhase.obligatoire', this.options[this.options.selectedIndex].value, 'foo<s:property value="refPhase.idref"/>');">
								<option value="yes" <s:if test="refPhase.obligatoire=='yes'"> selected </s:if>>yes</option>
								<option value="no" <s:if test="refPhase.obligatoire=='no'"> selected </s:if>>no</option>
							</select>
                        </div>
                      </div>
						<br><br>
				</div><!-- /.col-lg-12 -->
				<br><br><br><br><br>
			</div>
			</div>
<div id='foo<s:property value="refPhase.idref"/>' ></div>

<script type="text/javascript">
	restore();
</script>


