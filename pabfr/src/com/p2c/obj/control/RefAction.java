package com.p2c.obj.control;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.p2c.obj.back.RefDAO;
import com.p2c.obj.model.Objet;
import com.p2c.obj.model.RefChamps;
import com.p2c.obj.model.RefEtape;
import com.p2c.obj.model.RefProcess;
import com.p2c.obj.model.RefPhase;
import com.p2c.obj.model.RefTache;




public class RefAction extends ActionSupport implements ModelDriven<RefProcess> {

	private static final long serialVersionUID = 3062384647260555878L;
	private RefProcess refProcess = new RefProcess();
	private List<RefProcess> refProcessList = new ArrayList<RefProcess>();

	private RefChamps refChamps = new RefChamps();
	private List<RefChamps> refChampsList = new ArrayList<RefChamps>();

	private RefPhase refPhase = new RefPhase();
	private List<RefPhase> refPhaseList = new ArrayList<RefPhase>();
	
	private RefTache refTache = new RefTache();
	private List<RefTache> refTacheList = new ArrayList<RefTache>();

	private RefEtape refEtape = new RefEtape();
	private List<RefEtape> refEtapeList = new ArrayList<RefEtape>();

	private List<Objet> actesunitList = new ArrayList<Objet>();
	
	private RefDAO refDAO = new RefDAO();
	private String order; 


	@Override
	public RefProcess getModel() {
		return refProcess;
	}

	/* ************************************** */
	/*        Global Reference Process         */
	/* ************************************** */
	public String readRefProcess()
	{
		refProcess = refDAO.getRefProcess(this.refProcess.getIdref());
		return SUCCESS;
	}
	
	public String listRefProcess()
	{
		refProcessList = refDAO.listRefProcess();
		return SUCCESS;
	}

	
	public String modifyRefProcess()
	{
		RefProcess refProcessTmp = refDAO.getRefProcess(this.refProcess.getIdref());
		
		if(this.refProcess.getNom() != null)  refProcessTmp.setNom(this.refProcess.getNom());
		if(this.refProcess.getDescription() != null)  refProcessTmp.setDescription(this.refProcess.getDescription());
		if(this.refProcess.getActive() != null)  refProcessTmp.setActive(this.refProcess.getActive());
		if(this.refProcess.getVersion() != null)  refProcessTmp.setVersion(this.refProcess.getVersion());
		
		refDAO.saveRefProcess(refProcessTmp);		
		return listRefProcess();
	}
	
	public String createRefProcess()
	{
		Integer ordre = refDAO
				.getValue("select max(ordre)+1 from RefProcess " );
		
		refProcess.setOrdre(ordre.toString());
		refProcess.setNom("New process");
		refProcess.setDescription("New description");
		refProcess.setActive("no");
		refDAO.saveRefProcess(refProcess);		
		return listRefProcess();
		
	}

	
	public String deleteRefProcess()
	{
		refDAO.delRefProcess(this.refProcess.getIdref());
		return listRefProcess();
	}

	/* ************************************** */
	/*        Global Reference Phase         */
	/* ************************************** */
	public String listRefPhase()
	{
		this.refProcess = refDAO.getRefProcess(this.refProcess.getIdref());
		refPhaseList = refDAO.listRefPhase(refProcess.getIdref());
		return SUCCESS;
	}

	
	public String modifyRefPhase()
	{
		RefPhase refPhaseTmp = refDAO.getRefPhase(this.refPhase.getIdref());
		
		if(this.refPhase.getNom() != null)  refPhaseTmp.setNom(this.refPhase.getNom());
		if(this.refPhase.getDescription() != null)  refPhaseTmp.setDescription(this.refPhase.getDescription());
		if(this.refPhase.getObligatoire() != null)  refPhaseTmp.setObligatoire(this.refPhase.getObligatoire());
		
		refDAO.saveRefPhase(refPhaseTmp);		
		this.refProcess = refDAO.getRefProcess(refPhaseTmp.getIdrefprocess());
		return listRefPhase();
	}
	
	public String createRefPhase()
	{
		this.refPhase.setIdrefprocess(this.refProcess.getIdref());
		int ordre = refDAO
				.getValue("select max(ordre) from RefPhase where idrefprocess="
						+ refPhase.getIdrefprocess());
		refPhase.setOrdre(ordre + 1);
		refPhase.setNom("New");
		refPhase.setDescription("New description");
		refPhase.setObligatoire("yes");

		
		refDAO.saveRefPhase(refPhase);		
		return listRefPhase();
	}

	
	public String deleteRefPhase()
	{
		RefPhase refPhaseTmp = refDAO.getRefPhase(this.refPhase.getIdref());
		this.refProcess = refDAO.getRefProcess(refPhaseTmp.getIdrefprocess());
		refDAO.delRefPhase(this.refPhase.getIdref());
		return listRefPhase();
	}

	public String readRefPhase()
	{
		refPhase = refDAO.getRefPhase(this.refPhase.getIdref());
		return SUCCESS;
	}
	
	/* ************************* */
	// REFTACHE
	/* ************************* */
	public String listRefTache() {

		if (refPhase.getIdref() != null) {
			refTacheList = refDAO.listRefTache(refPhase.getIdref());
			refPhase = refDAO.getRefPhase(refPhase.getIdref());
		}

		return SUCCESS;
	}

	public String modifyRefTache() {
		RefTache refTacheTmp = refDAO.getRefTache(this.refTache
				.getIdref());
		this.refPhase.setIdref(refTacheTmp.getIdrefphase());

		if (this.refTache.getNom() != null)
			refTacheTmp.setNom(this.refTache.getNom());
		if (this.refTache.getDescription() != null)
			refTacheTmp.setDescription(this.refTache.getDescription());
		if (this.refTache.getObligatoire() != null)
			refTacheTmp.setObligatoire(this.refTache.getObligatoire());

		return listRefTache();
	}

	public String deleteRefTache() {
		this.refPhase.setIdref(refTache.getIdrefphase());
		refDAO.delRefTache(this.refTache.getIdref());
		return listRefTache();
	}

	public String addRefTache() {
		this.refPhase.setIdref(refTache.getIdrefphase());
		int ordre = refDAO
				.getValue("select max(ordre) from RefTache where idrefphase="
						+ refTache.getIdrefphase());
		refTache.setOrdre(ordre + 1);
		refTache.setNom("New task");
		refTache.setDescription("");
		refTache.setObligatoire("yes");
		refDAO.saveRefTache(refTache);
		return listRefTache();

	}

	public String orderRefTache()
	{
		String[] parts = order.split(":");
		
		for (int i=1; i<parts.length; i++){
			RefTache refTacheTmp = refDAO.getRefTache(Long.parseLong(parts[i]) );
			
			refTacheTmp.setOrdre(i);
		} 
			
		return listRefTache();
		
	}
	
	
	/* ************************* */
	// REFCHAMPS
	/* ************************* */
	public String listRefChamps() {

		if (refProcess.getIdref() != null) {
			refChampsList = refDAO.listRefChamps(refProcess.getIdref());
			refProcess = refDAO.getRefProcess(refProcess.getIdref());
		}

		return SUCCESS;
	}

	public String modifyRefChamps() {
		RefChamps refChampsTmp = refDAO.getRefChamps(this.refChamps
				.getIdrefchamps());

		if (this.refChamps.getNom() != null)
			refChampsTmp.setNom(this.refChamps.getNom());
		if (this.refChamps.getDescription() != null)
			refChampsTmp.setDescription(this.refChamps.getDescription());
		if (this.refChamps.getActive() != null)
			refChampsTmp.setActive(this.refChamps.getActive());
		if (this.refChamps.getType() != null)
			refChampsTmp.setType(this.refChamps.getType());
		if (this.refChamps.getListvalues() != null)
			refChampsTmp.setListvalues(this.refChamps.getListvalues());

		return SUCCESS;
	}

	public String deleteRefChamps() {
		this.refProcess.setIdref(refChamps.getIdrefprocess());
		refDAO.delRefChamps(this.refChamps.getIdrefchamps());
		return listRefChamps();
	}

	public String addRefChamps() {
		this.refProcess.setIdref(refChamps.getIdrefprocess());
		int ordre = refDAO
				.getValue("select max(ordre) from RefChamps where idrefprocess="
						+ refChamps.getIdrefprocess());
		refChamps.setOrdre(ordre + 1);
		refChamps.setActive("yes");
		refChamps.setType("text");
		refDAO.saveRefChamps(refChamps);
		return listRefChamps();

	}
	
	
	/* ************************* */
	// REFETAPE
	/* ************************* */
	public String listRefEtape() {

		setRefEtapeList(refDAO.listRefEtape());
		return SUCCESS;
	}
	
	public String updateRefEtape() {

		RefEtape refEtapeTmp = refDAO.getRefEtape(this.refEtape.getIdref());

		if (this.refEtape.getNom() != null)
			refEtapeTmp.setNom(this.refEtape.getNom());
		if (this.refEtape.getDescription() != null)
			refEtapeTmp.setDescription(this.refEtape.getDescription());
		if (this.refEtape.getDuree() >= 0)
			refEtapeTmp.setDuree(this.refEtape.getDuree());
		if (this.refEtape.getDelai() >= 0)
			refEtapeTmp.setDelai(this.refEtape.getDelai());
		
		return listRefEtape();
	}
	
	public String deleteRefEtape() {
		
		long count = refDAO
				.getValueLong("select count(idref) from RefEtape where idref="
						+ refEtape.getIdref());
		if (count > 0){
			refDAO.delRefEtape(this.refEtape.getIdref());
		}
		return listRefEtape();
	}

	public String refEtapeToAdd() {
		
		setActesunitList(refDAO.listActes());
		return SUCCESS;
	}

	public String addRefEtape() {
		RefEtape refEtapeTmp = refDAO.getRefEtapeByIdacte(this.refEtape.getIdacte());

		int ordre = refDAO.getValue("select max(subordre) from RefEtape where idacte="+ this.refEtape.getIdacte());
		refEtapeTmp.setSubordre(ordre + 1);

		if (this.refEtape.getNom() != null)
			refEtapeTmp.setNom(this.refEtape.getNom());
		if (this.refEtape.getDescription() != null)
			refEtapeTmp.setDescription(this.refEtape.getDescription());
		if (this.refEtape.getDuree() > 0)
			refEtapeTmp.setDuree(this.refEtape.getDuree());
		if (this.refEtape.getDelai() > 0)
			refEtapeTmp.setDelai(this.refEtape.getDelai());
		
		
		//refEtapeTmp.setIdref(0);
		refDAO.saveRefEtape(refEtapeTmp);
		return listRefEtape();

	}


	//Getter Setter

	public RefProcess getRefProcess() {
		return refProcess;
	}

	public void setRefProcess(RefProcess refProcess) {
		this.refProcess = refProcess;
	}


	public RefPhase getRefPhase() {
		return refPhase;
	}

	public void setRefPhase(RefPhase refPhase) {
		this.refPhase = refPhase;
	}

	public List<RefPhase> getRefPhaseList() {
		return refPhaseList;
	}

	public void setRefPhaseList(List<RefPhase> refPhaseList) {
		this.refPhaseList = refPhaseList;
	}

	public RefTache getRefTache() {
		return refTache;
	}

	public void setRefTache(RefTache refTache) {
		this.refTache = refTache;
	}

	public List<RefTache> getRefTacheList() {
		return refTacheList;
	}

	public void setRefTacheList(List<RefTache> refTacheList) {
		this.refTacheList = refTacheList;
	}

	public List<RefProcess> getRefProcessList() {
		return refProcessList;
	}

	public void setRefProcessList(List<RefProcess> refProcessList) {
		this.refProcessList = refProcessList;
	}

	public RefChamps getRefChamps() {
		return refChamps;
	}

	public void setRefChamps(RefChamps refChamps) {
		this.refChamps = refChamps;
	}

	public List<RefChamps> getRefChampsList() {
		return refChampsList;
	}

	public void setRefChampsList(List<RefChamps> refChampsList) {
		this.refChampsList = refChampsList;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public RefEtape getRefEtape() {
		return refEtape;
	}

	public void setRefEtape(RefEtape refEtape) {
		this.refEtape = refEtape;
	}

	public List<RefEtape> getRefEtapeList() {
		return refEtapeList;
	}

	public void setRefEtapeList(List<RefEtape> refEtapeList) {
		this.refEtapeList = refEtapeList;
	}

	public List<Objet> getActesunitList() {
		return actesunitList;
	}

	public void setActesunitList(List<Objet> actesunitList) {
		this.actesunitList = actesunitList;
	}

}
