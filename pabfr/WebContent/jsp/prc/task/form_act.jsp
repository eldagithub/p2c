<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/moment.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/fullcalendar.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/language/calendar_fr.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datepicker.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datepicker.fr.min.js"></script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-datepicker3.min.css">
<script>
function validateForm(){
   	
 	var x=NonVide(document.getElementById("datepicker_form_acte").value);

	if (x){
		var z=CheckDate(document.getElementById("datepicker_form_acte").value);
		if(z ==1){
			var values = "";
			for(var j=1; j<= 4; j++){	
				var elmt = document.getElementById("secteur"+j);
				for(var i=0; i< elmt.options.length; i++)
				{
					if(elmt.options[i].selected == true)
					{
						values += elmt.options[i].value+";";
					}
				}	
			}
			if (values == "") {
				alert('Vous devez sélectionner au moins une dent pour cet acte.');
			}else{
				$("#foo").load('<%=request.getContextPath()%>/prc/addActeDent3?tache.idphase=' + document.getElementById("taskform_idphase").value 
						+ '&tache.status=to_be_started' 
						+ '&tache.visibilite=yes' 
						+ '&tache.nom=' + escape("Séance") 
						+ '&tache.idresponsable=' + document.getElementById("taskform_idresponsable").options[taskform_idresponsable.selectedIndex].value 
						+ '&tache.dstartprev=' + document.getElementById("datepicker_form_acte").value 
						+ '&tache.description=' + escape(document.getElementById("tache.description").value)
						+ '&tache.idref=' + escape(document.getElementById("taskform_idref").value)
						+ '&tache.montant=0'
						+ '&tache.type=etape' 
						+ '&dentsList=' + values 
						+ '&etape.idacte=' + document.getElementById("taskform_idacte").options[taskform_idacte.selectedIndex].value 
				);
				document.getElementById("phaseList").style.display="block";	 	
				document.getElementById("tacheList").style.display="block";
				pausecomp(500);
				phaseRead(document.getElementById("taskform_idphase").value);
				document.getElementById("taskforms").innerHTML="";
			}
		}
	}else{
		var values = "";
		for(var j=1; j<= 4; j++){	
			var elmt = document.getElementById("secteur"+j);
			for(var i=0; i< elmt.options.length; i++)
			{
				if(elmt.options[i].selected == true)
				{
					values += elmt.options[i].value+";";
				}
			}	
		}
		if (values == "") {
			alert('Vous devez sélectionner au moins une dent pour cet acte.');
		}else{
			$("#foo").load('<%=request.getContextPath()%>/prc/addActeDent3?tache.idphase=' + document.getElementById("taskform_idphase").value 
					+ '&tache.status=to_be_started' 
					+ '&tache.visibilite=yes' 
					+ '&tache.nom=' + escape("Séance") 
					+ '&tache.idresponsable=' + document.getElementById("taskform_idresponsable").options[taskform_idresponsable.selectedIndex].value 
					+ '&tache.dstartprev=' + document.getElementById("datepicker_form_acte").value 
					+ '&tache.description=' + escape(document.getElementById("tache.description").value)
					+ '&tache.idref=' + escape(document.getElementById("taskform_idref").value)
					+ '&tache.montant=0'
					+ '&tache.type=etape' 
					+ '&dentsList=' + values 
					+ '&etape.idacte=' + document.getElementById("taskform_idacte").options[taskform_idacte.selectedIndex].value 
			);
			document.getElementById("phaseList").style.display="block";	 	
			document.getElementById("tacheList").style.display="block";
			pausecomp(500);
			phaseRead(document.getElementById("taskform_idphase").value);
			document.getElementById("taskforms").innerHTML="";
		}
	}
}


$('.datepicker_form_acte').datepicker({
    language: "fr",
    weekStart: "1",
    format:"dd/mm/yyyy",
	todayHighlight: true
});


</script>


          <div class="row form-horizontal">
              <div class="col-lg-12">
              		<br>
                    <p class="lead">Nouvel acte</p>
					<hr>
<s:form name="pForm3" action="#">
			<input type="hidden" id="taskform_idphase" name="taskform_idphase" value="<%= request.getParameter("idphase") %>">
			<input type="hidden" id="taskform_idref" name="taskform_idref" value="<%= request.getParameter("idref") %>">
			<input type="hidden" id="status"  name="status" value="to_be_started" />
			<input type="hidden" id="visibilite"  name="visibilite" value="yes" />
			
                      <div class="form-group">
                        <label class="control-label col-lg-4">Nom de l'acte<s:property value="idref" /></label>
                        <div class="col-lg-8">
							<select id="taskform_idacte"  name="taskform_idacte" size="1" class="form-control" >
								<s:iterator value="actesunitList" status="status1">
									<option value="<s:property value="idacte"/>"><s:property value="acte"/></option>					
								</s:iterator>
							</select>
                        </div>
                      </div>
  
  
                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="process_page.task_responsible"/></label>
                        <div class="col-lg-8">
							<select id="taskform_idresponsable"  name="taskform_idresponsable" size="5" class="form-control" >
								<s:if test="ctList.size() > 0">
									<s:iterator value="ctList" status="ctStatus">
										<s:if test="nom!='elmos'">
										<option value="<s:property value='id' />"
											<s:if test=" #ctStatus.first == true ">selected</s:if>>
											<s:property value='nom' /> <s:property value='prenom' /> 
										</option>
										</s:if>
									</s:iterator>
								</s:if>
							</select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4">Dent(s)</label>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4"></label>
                        <div class="col-lg-2">
							<select id="secteur1"  name="secteur1" size="4" class="form-control" multiple>
										<option>11</option>
										<option>12</option>
										<option>13</option>
										<option>14</option>
										<option>15</option>
										<option>16</option>
										<option>17</option>
										<option>18</option>
							</select>
                        </div>
                        <div class="col-lg-2">
							<select id="secteur2"  name="secteur2" size="4" class="form-control" multiple>
										<option>21</option>
										<option>22</option>
										<option>23</option>
										<option>24</option>
										<option>25</option>
										<option>26</option>
										<option>27</option>
										<option>28</option>
							</select>
                        </div>
                        <div class="col-lg-2">
							<select id="secteur3"  name="secteur3" size="4" class="form-control" multiple>
										<option>31</option>
										<option>32</option>
										<option>33</option>
										<option>34</option>
										<option>35</option>
										<option>36</option>
										<option>37</option>
										<option>38</option>
							</select>
                        </div>
                        <div class="col-lg-2">
							<select id="secteur4"  name="secteur4" size="4" class="form-control" multiple>
										<option>41</option>
										<option>42</option>
										<option>43</option>
										<option>44</option>
										<option>45</option>
										<option>46</option>
										<option>47</option>
										<option>48</option>
							</select>
                        </div>
                      </div>


                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="process_page.task_sdateprev"/> * </label>
                        <div class="col-lg-8"><input type="text" id="datepicker_form_acte" name="dstartprev" placeholder="JJ/MM/YYYY"  class="form-control datepicker_form_acte"></div>
                      </div>
                                             
                      <div class="form-group">
                        <label for="text4" class="control-label col-lg-4"><s:text name="process_page.description"/></label>
                        <div class="col-lg-8">
                          <textarea id="tache.description" class="form-control" name="tache.description" ></textarea>
                        </div>
                      </div><!-- /.form-group -->
                      <div class="form-group">
                        <label for="text4" class="control-label col-lg-4"></label>
                        <div class="col-lg-8">
                          <p class=" col-lg-4 text-muted"><s:text name="label.required_field"/></p>
                        </div>
                      </div><!-- /.form-group -->
</s:form>
                      <div class="form-group">
                       <label class="control-label col-lg-6"></label>
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.back"/>" class="btn btn-metis-5 btn-flat"  onclick="javascript:rollback();">
	                      </div>
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary"  onclick="javascript:validateForm();">
	                      </div>
                      </div>
              </div><!-- /.col-lg-12 -->
		</div>






<div id="foo" style="display: none"></div>

<script type="text/javascript">
	restore();
</script>
