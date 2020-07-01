<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">
		function rtChange(id, what, filed, loadfoo)
		{
		   loadfoo="tache_list";
			document.getElementById("fooTache").innerHTML='<img src="<%=request.getContextPath()%>/css/images/indicator.gif" alt="Loading..." style="display: inline" />';
		    this.$("#tache_list").load('<%=request.getContextPath()%>/ref/modifyRefTache?refTache.idref='+id+'&' + what + '='+encodeURIComponent(filed.value));
		}
		function rtChange2(id, what, filed, loadfoo)
		{
			   loadfoo="tache_list";
		   
			document.getElementById("fooTache").innerHTML='<img src="<%=request.getContextPath()%>/css/images/indicator.gif" alt="Loading..." style="display: inline" />';
		    this.$("#tache_list").load('<%=request.getContextPath()%>/ref/modifyRefTache?refTache.idref='+id+'&' + what + '='+encodeURIComponent(filed));
		}
	    
		function rtDelete(id, idref){
			document.getElementById("fooTache").innerHTML='<img src="<%=request.getContextPath()%>/css/images/indicator.gif" alt="Loading..." style="display: inline" />';
	        this.$("#tache_list").load('<%=request.getContextPath()%>/ref/deleteRefTache?refTache.idref='+id+'&refTache.idrefphase='+idref);
			//document.getElementById("foo" +idref).innerHTML='<img src="<%=request.getContextPath()%>/css/images/indicator.gif" alt="Loading..." style="display: none" />';
		}
		function rtAdd(idref){
			document.getElementById("fooTache").innerHTML='<img src="<%=request.getContextPath()%>/css/images/indicator.gif" alt="Loading..." style="display: inline" />';
	        //this.$("#collapse"+idref).load('<%=request.getContextPath()%>/ref/addRefTache?refTache.idrefphase='+idref);
	        this.$("#tache_list").load('<%=request.getContextPath()%>/ref/addRefTache?refTache.idrefphase='+idref);
	        
		}

</script>




            <div class="col-lg-12">
                    <p class="text-muted">Liste des tâches de la phase sélectionnée </p>
				<hr>
			</div>
          <div class="row form-horizontal">
              <div class="col-lg-2">			<div id='fooTache' ></div>
              	</div>
              <div class="col-lg-8">
		                    <table class="table-condensed responsive-table">
		                      <thead>
		                        <tr>
				                 <th class="text-center" style="width:200px;"><s:text name="admin_page.field.acronyme"/></th>
				                 <th class="hidden-xs text-center" style="width:450px;"><s:text name="admin_page.field.details"/></th>
				                 <th class="hidden-xs text-center" style="width:80px;">Active</th>
				                 <td style="width:50px;"></td>
				                 <td style="width:50px;"></td>
				                 <td style="width:50px;"></td>
		                      </thead>    
		                    </table>
               </div><!-- /.col-lg-8 -->
		  </div>



	<s:if test="refTacheList.size() > 0">
		<s:iterator value="refTacheList" status="refTacheStatus">



          <div class="row">
              <div class="col-lg-2"></div>
              
              <div class="col-lg-8">
                    <div class="panel box box-1A616F" style="margin-bottom:0px;">
                      <div class="box-header with-border">
                        <h4 class="box-title">
		                    <table class="responsive-table">
		                      <tbody>
		                        <tr>
		                          <td style="width:200px;padding-right:5px;">
									<input class="form-control" style="border:0px;"
									onchange="rtChange(<s:property value="idref"/>, 'refTache.nom', this, 'foo<s:property value="idrefphase"/>')"
									type="text" value="<s:property value='nom' />" />
								  </td>
								  <td style="width:400px;padding-right:5px;">
									<input class="form-control" style="border:0px;padding-right:5px;"
									onchange="rtChange(<s:property value="idref"/>, 'refTache.description', this, 'foo<s:property value="idrefphase"/>')"
									type="text" value="<s:property value='description' />" />		                          
								  </td>
		                          <td style="width:80px;padding-right:5px;">
									<select name="" id="" class="form-control" onchange="rtChange2(<s:property value="idref"/>, 'refTache.obligatoire', this.options[this.options.selectedIndex].value, 'foo<s:property value="idref"/>');">
										<option value="yes" <s:if test="obligatoire=='yes'"> selected </s:if>>yes</option>
										<option value="no" <s:if test="obligatoire=='no'"> selected </s:if>>no</option>
									</select>
								  </td>
								  <td style="padding-right:5px;">&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-times-circle box_clickable" title="Delete" onclick="javascript:rtDelete(<s:property value='idref' />, <s:property value='idrefphase' />);"></i></td>
		                         </tr>
		                      </tbody>    
		                    </table>
                        </h4>
                      </div>
                    </div>
              </div><!-- /.col-lg-12 -->
			</div>
		</s:iterator>
	</s:if>

          <div class="row">
             <div class="col-lg-2"></div>
             <div class="col-lg-8">
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;<i class=" fa fa-plus-square box_clickable fa-2x" title="<s:text name='admin_page.admin_account.metaprocess_mngt.add.field'/>" onclick="javascript:rtAdd(<s:property value='refPhase.idref' />);"></i>
				<br>
			</div>
		 </div>
<br><br><br><br><br><br>
