<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">
		function rcChange(id, what, filed, loadfoo)
		{
			document.getElementById(loadfoo).innerHTML='<img src="<%=request.getContextPath()%>/css/images/indicator.gif" alt="Loading..." style="display: inline" />';
		    this.$("#"+loadfoo).load('<%=request.getContextPath()%>/ref/modifyRefChamps?refChamps.idrefchamps='+id+'&' + what + '='+encodeURIComponent(filed.value));
		}
		function rcChange2(id, what, filed, loadfoo)
		{
			document.getElementById(loadfoo).innerHTML='<img src="<%=request.getContextPath()%>/css/images/indicator.gif" alt="Loading..." style="display: inline" />';
		    this.$("#"+loadfoo).load('<%=request.getContextPath()%>/ref/modifyRefChamps?refChamps.idrefchamps='+id+'&' + what + '='+encodeURIComponent(filed));
		}
	    
		function rcDelete(id, idref){
			document.getElementById("foo" +idref).innerHTML='<img src="<%=request.getContextPath()%>/css/images/indicator.gif" alt="Loading..." style="display: inline" />';
	        this.$("#collapse"+idref).load('<%=request.getContextPath()%>/ref/deleteRefChamps?refChamps.idrefchamps='+id+'&refChamps.idrefprocess='+idref);
			document.getElementById("foo" +idref).innerHTML='<img src="<%=request.getContextPath()%>/css/images/indicator.gif" alt="Loading..." style="display: none" />';
		}
		function rcAdd(idref){
			document.getElementById("foo" +idref).innerHTML='<img src="<%=request.getContextPath()%>/css/images/indicator.gif" alt="Loading..." style="display: inline" />';
	        this.$("#collapse"+idref).load('<%=request.getContextPath()%>/ref/addRefChamps?refChamps.idrefprocess='+idref);
			document.getElementById("foo" +idref).innerHTML='<img src="<%=request.getContextPath()%>/css/images/indicator.gif" alt="Loading..." style="display: none" />';
		}

</script>

	<p class="text-muted">Modification des champs des tâches ...</p>
	<table class="responsive-table"
		style="padding:5px;color:grey;margin-left:10px;">
		<thead>
			<tr>
				<td class="text-center" style="width:150px;">Nom</td>
				<td class="text-center hidden-xs" style="width:150px;">Description</td>
				<td class="text-center hidden-xs" style="width:155px;">Type</td>
				<td class="text-center" style="width:150px;">Liste des valeurs</td>
				<td class="text-center" style="width:70px;">Active</td>
			</tr>

			<tr>
				<td></td>
			</tr>
		</thead>


		<tbody>
			<s:iterator status="refChampsStatus" begin="1" end="3">
				<tr>
					<td style="padding-right:5px;"><input size="15" class="form-control" onchange="rcChange(<s:property value="idrefchamps"/>, 'refChamps.nom', this, 'foo<s:property value="idrefprocess"/>')"
						type="text" value="<s:property value='nom' />" /></td>

					<td style="padding-right:5px;"><input size="15" class="form-control" onchange="rcChange(<s:property value="idrefchamps"/>, 'refChamps.description', this, 'foo<s:property value="idrefprocess"/>')"
						type="text" value="<s:property value='description' />" /></td>

					<td style="padding-right:5px;">
						<select class="form-control" onchange="rcChange2(<s:property value="idrefchamps"/>, 'refChamps.type', this.options[this.options.selectedIndex].value, 'foo<s:property value="idrefprocess"/>');">
							<option value="text" <s:if test="type=='text'"> selected </s:if> >Champ texte</option>
							<option value="text" <s:if test="type=='chiffre'"> selected </s:if> >Champ chiffré</option>
							<option value="date" <s:if test="type=='date'"> selected </s:if> >Champ date</option>
							<option value="select" <s:if test="type=='select'"> selected </s:if> >Liste d'objets</option>
						</select>
					</td>
					<td style="padding-right:5px;"><input size="15" class="form-control" onchange="rcChange(<s:property value="idrefchamps"/>, 'refChamps.listvalues', this, 'foo<s:property value="idrefprocess"/>')"
						type="text" value="<s:property value='listvalues' />" /></td>						
					<td style="padding-right:5px;">				
						<select class="form-control" onchange="rcChange2(<s:property value="idrefchamps"/>, 'refChamps.active', this.options[this.options.selectedIndex].value, 'foo<s:property value="idrefprocess"/>');">
							<option value="yes" <s:if test="active=='yes'"> selected </s:if>>yes</option>
							<option value="no" <s:if test="active=='no'"> selected </s:if>>no</option>
						</select>
					</td>

  		            <td style="padding-right:5px;"><i class="fa fa-times-circle box_clickable" title="Delete" onclick="javascript:rcDelete(<s:property value='idrefchamps' />, <s:property value='idrefprocess' />);"></i></td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
	<br>
	&nbsp;&nbsp;&nbsp;&nbsp;<i class=" fa fa-plus-square box_clickable fa-2x " title="<s:text name='admin_page.admin_account.metaprocess_mngt.add.field'/>" onclick="javascript:rcAdd(<s:property value='refProcess.idref' />);"></i>
	<br>
	
