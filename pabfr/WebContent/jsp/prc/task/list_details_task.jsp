<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="box-body" style="padding-bottom:15px;">
	<br>	
	
	<!-- Nouveaux champs pour le cabinet dentaire -->
	<div class="row form-horizontal">
	<div class="col-lg-12">
	<div class="form-group">
	  <label class="control-label col-lg-4">Statut</label>
	  <div class="col-lg-8">
		<select id="statusTache"  name="statusTache" size="1" class="form-control" onchange="taskUpdateStatus(<%= request.getParameter("idphaseprocess") %>, <s:property value='tache.idphase' />, <s:property value='tache.id' />, this.value);">
			<option value="in_progress" <s:if test="tache.status == 'in_progress'"> selected </s:if>>Démarré</option>
			<option value="blocked" <s:if test="tache.status == 'blocked'"> selected </s:if>>En alerte</option>
			<option value="to_be_started" <s:if test="tache.status == 'to_be_started'"> selected </s:if>>A démarrer</option>
			<option value="completed" <s:if test="tache.status == 'completed'"> selected </s:if>>Terminé</option>
		</select>
	  </div>
	</div>
	<div class="form-group">
	  <label class="control-label col-lg-4">Type de l'étape</label>
	  <div class="col-lg-8">
		<select size="1" class="form-control" onchange="taskUpdateType(<s:property value='idphase' />, <s:property value='id' />, this.value);" >
			<option value="etape" <s:if test="tache.type == 'etape'"> selected </s:if>>Etape de traitement</option>
			<option value="facture" <s:if test="tache.type == 'facture'"> selected </s:if>>Facture</option>
			<option value="devis" <s:if test="tache.type == 'devis'"> selected </s:if>>Devis</option>
			<option value="paiement" <s:if test="tache.type == 'paiement'"> selected </s:if>>Paiement</option>
		</select>
	  </div>
	</div>
	<div class="form-group" <s:if test="tache.type == 'etape'"> style="display:none;" </s:if> >
	  <label class="control-label col-lg-4">Montant</label>
	  <div class="col-lg-8">
	  	<input id="montantTache" name="montantTache" type="text" class="form-control" value="<s:property value='tache.montant' />" onchange="taskUpdateMontant(<s:property value='tache.idphase' />, <s:property value='tache.id' />, this.value);" >
	  </div>
	</div>
	<div class="form-group">
	  <label class="control-label col-lg-4">Remarque</label>
	  <div class="col-lg-8">
	  	<textarea id="nom" name="nom" rows=4 class="form-control"  onchange="javascript:taskUpdateDescription(<s:property value="tache.idphase" />, <s:property value="tache.id" />, '<s:property value="tache.nom" />', this.value);"><s:property escape="false" value='tache.description'  /></textarea>
	  </div>
	</div>
											
	<s:if test="#session.UserSessionKey.profile == 'full' || #session.UserSessionKey.profile == 'CONDUCTEUR'">
	<div class="form-group">
	  <label class="control-label col-lg-9"></label>
	  <div class="col-lg-3 text-right">
			<s:if test="status != 'blocked'">
				<a href="#" style="margin-top:-10px;" class="btn btn-metis-1 btn-flat btn-margin" onclick="deleteTask(<s:property value="tache.id" />);"><s:text name="process_page.button.delete"/></a>&nbsp;						
			</s:if>
			<s:if test="type == 'etape'">
			&nbsp;
				<a href="#" style="margin-top:-10px;" class="btn btn-metis-5 btn-flat btn-margin"  title="Cliquer pour modifier les champs de la tâche" onclick="updateTask(<s:property value="tache.idphase" />, <s:property value="tache.id" />);"><s:text name="button.label.modify"/></a>&nbsp;
			</s:if>						
	  </div>
	</div>
	</s:if>
	
	</div>
	</div>
</div>

<script type="text/javascript">
	restore();
</script>











