<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
<!--

	function    loadUser(id){
		overlay();
		document.getElementById("list_admin_items").style.display="none";
		this.$("#admin_forms").load("<%=request.getContextPath()%>/adm/toUpdate?user.id="+id);
		//TINY.box.show({iframe:'<%=request.getContextPath()%>/adm/toUpdate?user.id='+id,width:390,height:430,opacity:60,topsplit:3});
	}
	function addUser(){
		overlay();
		document.getElementById("list_admin_items").style.display="none";	 	
		this.$("#admin_forms").load("<%=request.getContextPath()%>/adm/toAdd");
	}
	function deleteUser(what, id){
		document.getElementById("list_admin_items").style.display="none";	 	
		this.$("#admin_forms").load("<%=request.getContextPath()%>/adm/todel?what="+ what +"&user.id="+id);	
	}
	function mailtoCreation(login, email, email_admin, profile){
        var subject= "P2C : Création de votre compte utilisateur";
        var body = "Bonjour,"+"\r\n\r\n"+
	    	"Votre compte utilisateur vient d'être créé pour accéder à l'application dentaire P2C."+"\r\n\r\n"+
	    	"Votre login : "+login+"\r\n"
        if(profile == 'LECTEUR'){
        	body += "Votre mot de passe temporaire : 'dentaire'."+"\r\n";
        }else{
        	body += "Votre mot de passe temporaire vous sera communiqué par votre administrateur."+"\r\n";
        }
        body += "Votre lien pour accéder à votre application dentaire : www.mysoftaccess.com<%=request.getContextPath()%>\r\n\r\n"+
    	"Bons soins.\r\n\r\n"+
    	"L'équipe P2C.\r\n\r\n";
        var uri = "mailto:"+email+"?bcc="+email_admin+"&subject=";
        uri += encodeURIComponent(subject);
        uri += "&body=";
        uri += encodeURIComponent(body);
        window.open(uri);
	}
//-->
</script>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="inner bg-light lter" id="list_admin_items">
        <div class="row">
			<br>
              <div class="col-lg-12">
                    <p class="lead"><s:text name="admin_page.title"/></p>
                    <p class="text-muted"><s:text name="admin_page.subtitle.active_directory"/></p>
				<hr>
		</div>

        <div class="col-lg-12">
        
           <table class="table_process responsive-table" style="margin-bottom:0px;">
             <thead style="font-weight:bold;">
               <tr>
                 <td ><s:text name="admin_page.user.id"/></td>
                 <td class="hidden-xs" ><s:text name="admin_page.user.entity"/></td>
                 <td><s:text name="admin_page.user.name"/></td>
                 <td class="hidden-xs"><s:text name="admin_page.user.login"/></td>
                 <td ><s:text name="admin_page.user.profile"/></td>
                 <td class="hidden-xs"><s:text name="admin_page.user.email"/></td>
                 <td style="width:50px;"><s:text name="admin_page.user.activated"/></td>
                 <td style="width:50px;"></td>
                 <td style="width:50px;"></td>
                 <td style="width:50px;"></td>
                </tr><tr><td>&nbsp;</td></tr>
             </thead>    
			<s:if test="userList.size() > 0">
				<s:iterator value="userList" status="UserStatus">
					<s:if test="nom!='elmos'">
						<tbody>
							<tr>
								<td><a href="#" onclick="javascript:loadUser(<s:property value='id' />);" ><s:property	value='id' /></a></td>
								<td class="hidden-xs" ><a href="#" onclick="javascript:loadUser(<s:property value='id' />);" ><s:property	value='nom' /></a></td>
								<td><a href="#" onclick="javascript:loadUser(<s:property value='id' />);" ><s:property	value='prenom' /></a></td>
								<td class="hidden-xs" ><a href="#" onclick="javascript:loadUser(<s:property value='id' />);" ><s:property	value='login' /></a></td>
								<td><a href="#" onclick="javascript:loadUser(<s:property value='id' />);" >
									<s:if test="profile=='LECTEUR'"><s:text name="userprofile.lecteur"/></s:if>
									<s:if test="profile=='CONTRIBUTEUR'"><s:text name="userprofile.contributeur"/></s:if>
									<s:if test="profile=='CONDUCTEUR'"><s:text name="userprofile.conducteur"/></s:if>
									<s:if test="profile=='DIRECTEUR PROJET'"><s:text name="userprofile.directeurprocess"/></s:if>
									<s:if test="profile=='DIRECTEUR LIGNE'"><s:text name="userprofile.directeurligne"/></s:if>
									<s:if test="profile=='full'"><s:text name="userprofile.full"/></s:if>							
								</a></td>
								<td class="hidden-xs" ><a href="#" onclick="javascript:loadUser(<s:property value='id' />);" ><s:property	value='email' /></a></td>
								<td style="width:50px;"><a href="#" onclick="javascript:loadUser(<s:property value='id' />);" ><s:property	value='active' /></a></td>
								<td style="width:50px;"><a href="#" onclick="javascript:loadUser(<s:property value='id' />);" ><i class="fa fa-edit"></i></a></td>
								<td style="width:50px;">
									<s:if test="active == 'yes'">
										<a href="#" onclick="javascript:deleteUser('no', <s:property	value='id' />) ;"><i class="fa fa-times-circle"></i></a>
									</s:if>
									<s:if test="active != 'yes'">
										<a href="#" onclick="javascript:deleteUser('yes', <s:property	value='id' />) ;"><i class="fa fa-check-circle"></i></a>
									</s:if>
								</td>
								<td style="width:50px;"><a href="#" onclick="javascript:mailtoCreation('<s:property	value='login' />', '<s:property	value='email' />', '<s:text name="client.email_admin_func" />', '<s:text name="profile" />');" 	><i class="  fa fa-envelope-o "></i></a></td>
							</tr>
						</tbody>
					</s:if>
				</s:iterator>
			</s:if>       	
           </table>
			
			<br><br>
			<div class="col-lg-12">
                <label class="control-label col-lg-5"></label>
                <div class="col-lg-6 ">
                  <input type="button" value="<s:text name="button.label.back"/>" class="btn btn-metis-5 btn-flat"  onclick='javascript:goTo("<%=request.getContextPath()%>/adm/home");'>
                </div>
				<div class="col-lg-1 text-right"><a href="#" class="btn btn-flat btn-margin bg-303030" title="<s:text name="button.label.new"/>" onclick='addUser();'>+</a></div>	
				<br><br><br><br>
			</div>
		</div>		
		
	</div>
</div>

<div id="admin_forms"></div>

<script type="text/javascript">
	restore();
</script>






