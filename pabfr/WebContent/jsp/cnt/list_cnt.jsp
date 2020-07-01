<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>


    <!-- #helpModal -->
    <div id="helpModal" class="modal fade">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title"><s:text name="menu.label.help"/></h4>
          </div>
          <div class="modal-body">
            <p>
				<b>Pour contacter l'administrateur fonctionnel :</b> 
				<ul>
				<li>par téléphone : +33 1 00 00 00 00 (00 00 00)
				</li><li>par mail : <a class="a_aide" href='mailto:<s:text name="client.email_admin_func" />?Subject=Process2Com - Question' target="_top"><s:text name="client.email_admin_func" /></a>
				</li></ul>
            </p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal"><s:text name="button.label.close"/></button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal --><!-- /#helpModal -->