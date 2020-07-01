<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script>
	function validateForm(){
	}
</script>


<div class="inner bg-light lter">
        <div class="row">
			<br>
              <div class="col-lg-12">
                    <p class="lead"><s:text name="admin_page.admin_account.profiles_mngt.title"/></p>
                    <p class="text-muted"><s:text name="admin_page.admin_account.profiles_mngt.subtitle"/></p>
				<hr>
			</div>
		</div>
		<br><br>
          <div class="row form-horizontal">
              <div class="col-lg-3"></div>
              <div class="col-lg-1 box_wrapable box_editable" contentEditable="true"><s:text name="userprofile.finalclient"/></div>
              <div class="col-lg-1 box_wrapable box_editable" contentEditable="true"><s:text name="userprofile.internalcustomer"/></div>
              <div class="col-lg-1 box_wrapable box_editable" contentEditable="true"><s:text name="userprofile.contributeur"/></div>
              <div class="col-lg-1 box_wrapable box_editable" contentEditable="true"><s:text name="userprofile.conducteur"/></div>
              <div class="col-lg-1 box_wrapable box_editable" contentEditable="true"><s:text name="userprofile.directeurprocess"/></div>
              <div class="col-lg-1 box_wrapable box_editable" contentEditable="true"><s:text name="userprofile.full"/></div>
              <div class="col-lg-1"></div>
          </div>
		<br><br>

<%
    String[] droits_profils = {"Accès aux paramètres d'administration", 
		"Afficher le WALL", 
		"Poster un message sur le WALL", 
		"Afficher la liste des processus en cours", 
		"Afficher l'avancement détailler d'un processus", 
		"Créer une instance de processus", 
		"Suprrimer une instance de processus", 
		"Modifier les informations d'une instance de processus", 
		"Valider une phase", 
		"Valider une tâche", 
		"Ajouter un document à une instance de processus", 
		"Lire les tableaux de bord"};
	request.setAttribute("droits_profils" , droits_profils);
%>

		
          <div class="row form-horizontal">
              <div class="col-lg-12">
					<s:form name="pForm" action="#">
					<s:iterator status="Status" begin="1" end="11">
                      <div class="form-group">
                        <label class="control-label col-lg-3 box_wrapable" >${ droits_profils[Status.index] }</label>
                        <div class="col-lg-1 checkbox text-center"><input type="checkbox" title="<s:text name="userprofile.finalclient"/>"></div>
                        <div class="col-lg-1 checkbox text-center"><input type="checkbox" title="<s:text name="userprofile.internalcustomer"/>"></div>
                        <div class="col-lg-1 checkbox text-center"><input type="checkbox" title="<s:text name="userprofile.contributeur"/>"></div>
                        <div class="col-lg-1 checkbox text-center"><input type="checkbox" title="<s:text name="userprofile.conducteur"/>"></div>
                        <div class="col-lg-1 checkbox text-center"><input type="checkbox" title="<s:text name="userprofile.directeurprocess"/>"></div>
                        <div class="col-lg-1 checkbox text-center"><input type="checkbox" title="<s:text name="userprofile.full"/>"></div>
                        <div class="col-lg-1"></div>
                      </div>
					</s:iterator>

			<div class="col-lg-12">
				<div class="col-lg-2"></div>
				<div class="col-lg-3"><a href="#" class="btn btn-flat btn-margin bg-303030" title="<s:text name="admin_page.admin_account.profiles_mngt.add_role"/>">+</a></div>
			</div>
<br><br><br><br><br>
					
					</s:form>
                      <div class="form-group">
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.save"/>" class="btn btn-primary"  onclick="javascript:validateForm();">
	                      </div>
                      </div>
              </div><!-- /.col-lg-12 -->
		</div>
<br><br><br><br><br>

</div>



<script type="text/javascript">
	restore();
</script>






