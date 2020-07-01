<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<body>
<script>
function pausecomp(millis)
{
 var date = new Date();
 var curDate = null;
 do { curDate = new Date(); }
 while(curDate-date < millis);
}

function    postAdd()
{
	var y=NonVide(document.getElementById("coment").value);
	if (y){			
		this.$("#form_new_post").load('<%=request.getContextPath()%>/event/add?tolist=' + escape(document.getElementById("tolist").options[tolist.selectedIndex].value)
				+ '&idobj=' + document.getElementById("idobj").options[idobj.selectedIndex].value
				+ '&coment=' + escape(document.getElementById("coment").value)
		);
		
		pausecomp(500);
		goTo('<%=request.getContextPath()%>/event/wall')
	}else{
		alert('<s:text name="label.unvalidated_form"/>');
	}
}
function NonVide(c){
	if (c==''){return false;}else{return true;}
}

</script>


<hr>

<s:form name="postForm"  action="#"  method="post"  >
    	<div class="col-lg-12">
            <div class="form-group">
                        <label class="control-label col-lg-2"><s:text name="wall_page.recipient"/></label>
                        <div class="col-lg-3">
					 		<select id="tolist" name="tolist" size="1" class="form-control">
					   			<option value="<br>@<a class='libelle_user'>Tous - Tous</a>" selected>Tous</option>
					 					<s:if test="userList.size() > 0">
											<s:iterator value="userList" status="userStatus">
												<option value="<br>@<a class='libelle_user'><s:property value='login' /> - <s:property value='nom' /> <s:property value='prenom' /></a>" >
													<s:property value='nom' /> <s:property value='prenom' /> 
												</option>
											</s:iterator>
										</s:if>
					 		</select>
                        </div>
                        <label class="control-label col-lg-2"><s:text name="wall_page.selected_process"/></label>
                        <div class="col-lg-3">
					 		<select id="idobj"  name="idobj" class="form-control">
									<s:if test="processList.size() > 0">
											<s:iterator value="processList" status="processStatus">
					   						<option value="<s:property value='id' />" >N°<s:property value='id' /> : <s:property value="programme" />  | <s:property value="gare" /></option>
											</s:iterator>
									</s:if>
					  		</select>
                        </div>
             </div>
		</div>
</s:form>

    	<div class="col-lg-12">
            <div class="form-group">
                        <label class="control-label col-lg-2"><s:text name="wall_page.message"/></label>
                        <div class="col-lg-8">
                        	<input id="coment" name="coment" type="text" id="text1" class="form-control">
                        </div>
                      <div class="col-lg-2 ">
                         &nbsp;<input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary btn-margin"  onclick="javascript:postAdd();">
                       </div>
             </div>


		</div>
