package com.p2c.obj.back;

public interface P2cSql {
    
/* GESTION DES UTILISATEURS */  	
  	public static final String GET_USER = " from User where login= ? and  password = ? and active='yes'";
  	public static final String GET_USER_BYLOGIN = " from User where login= ? ";
  	public static final String GET_ALLUSERS = "from User order by active desc , id ";
  	public static final String GET_ACTIVEUSERS_BYPROFILE = "from User where active='yes' and ( profile = ? or profile = 'full' ) order by nom";
  	public static final String GET_USERS_BYPROFILE = "from User where objet = ? order by nom ";
  	public static final String INSERT_RATIOS_OBJET = "INSERT INTO Objet (ordre, nom, description, categorie, idresponsable) " +
  			" select ordre, nom, description, categorie, :idresponsable from Objet where idresponsable = 0 AND categorie='KPI'";

/* FIN GESTION DES UTILISATEURS */

/* GESTION DES UTILISATEURS */  	
 	
  	public static final String GET_REFPROCESS =  " from RefProcess where active = 'yes' order by ordre ";

  	public static final String GET_DFAULTREFPROCESS =  "select description from Objet where nom='DafaultRefProcess' ";

 	public static final String GET_PROCESSS= " select new Process (process.id, process.idref, process.idprogramme, programme.nom, process.idgare,  " + 
  			" gare.nom, process.iddp, concat(dp.nom, ' ', dp.prenom), process.idcp, concat(cp.nom, ' ', cp.prenom),   " + 
  			" process.status, process.couleur, process.codebudget, process.dstart, process.dfinprev, process.dfin, process.phaseencours) " + 
  			" from Process process,  " + 
  			" Objet programme, Objet gare, User cp, User dp where " + 
  			" programme.idref =idprogramme and  " + 
  			" gare.idref = idgare and  " + 
  			" cp.id = idcp and dp.id = iddp order by process.id desc"; //utiliser uniquement dans la todolist
  	
  	
  	
	public static final String GET_PROCESSS_BYLOGIN = " select new Process (process.id, process.idref, process.idprogramme, programme.nom, process.idgare,  " + 
  			" gare.nom, process.iddp, concat(dp.nom, ' ', dp.prenom), process.idcp, concat(cp.nom, ' ', cp.prenom),   " + 
  			" process.status, process.couleur, process.codebudget, process.dstart, process.dfinprev, process.dfin, process.phaseencours) " + 
  			" from Process process,  " + 
  			" Objet programme, Objet gare, User cp, User dp, User u where " + 
  			" programme.idref =idprogramme and  " + 
  			" gare.idref = idgare and  process.idref=:refprocess  and " + 
  			" cp.id = idcp and dp.id = iddp and u.login=:login and (u.profile='full' or u.id=process.idcp or u.id=process.iddp " + 
  			"  or ( process.id in ( select p.idprocess from Tache t, Phase p where t.idphase=p.id and t.idresponsable = u.id)  ) "  +
  			") order by process.id desc";
  	
	public static final String GET_PROCESSSREADER_BYLOGIN = " select new Process (process.id, process.idref, process.idprogramme, programme.nom, process.idgare,  " + 
  			" gare.nom, process.iddp, concat(dp.nom, ' ', dp.prenom), process.idcp, concat(cp.nom, ' ', cp.prenom),   " + 
  			" process.status, process.couleur, process.codebudget, process.dstart, process.dfinprev, process.dfin, process.phaseencours) " + 
  			" from Process process,  " + 
  			" Objet programme, Objet gare, User cp, User dp, User u where " + 
  			" programme.idref =idprogramme and  " + 
  			" gare.idref = idgare and  process.idref=:refprocess  and " + 
  			" cp.id = idcp and dp.id = iddp and u.login=:login and (u.profile='full' or u.id=process.idcp or u.id=process.iddp " + 
  			"  or ( process.id in ( select p.idprocess from Tache t, Phase p where t.idphase=p.id and t.idresponsable = u.id)  ) "  +
  			" or ( process.id in (select proc.id from Process proc, Objet prog where prog.idref=proc.idprogramme and prog.idresponsable=u.id and u.login=:login)) "+
  			") order by process.id desc";
  	
	public static final String GET_PROCESSS_BYOBJET = " select new Process (process.id, process.idref, process.idprogramme, programme.nom, process.idgare,  " + 
  			" gare.nom, process.iddp, concat(dp.nom, ' ', dp.prenom), process.idcp, concat(cp.nom, ' ', cp.prenom),   " + 
  			" process.status, process.couleur, process.codebudget, process.dstart, process.dfinprev, process.dfin, process.phaseencours) " + 
  			" from Process process,  " + 
  			" Objet programme, Objet gare, User cp, User dp, User u where " + 
  			" programme.idref =idprogramme and programme.idref=:idref and " + 
  			" gare.idref = idgare and  " + 
  			" cp.id = idcp and dp.id = iddp group by (process.id) order by process.id desc";
  	
  	public static final String GET_PROCESSS_BYLOGIN_DEVISZERO = " select new Process (process.id, process.idref, process.idprogramme, programme.nom, process.idgare,  " + 
  			" gare.nom, process.iddp, concat(dp.nom, ' ', dp.prenom), process.idcp, concat(cp.nom, ' ', cp.prenom),   " + 
  			" process.status, process.couleur, process.codebudget, process.dstart, process.dfinprev, process.dfin, process.phaseencours) " + 
  			" from Process process,  " + 
  			" Objet programme, Objet gare, User cp, User dp, User u, Champs c where " + 
  			" c.idprocess =process.id and  " + 
  			" c.nom ='Montant devis' and c.value=0 and " + 
  			" programme.idref =idprogramme and  " + 
  			" gare.idref = idgare and  process.idref=:refprocess  and " + 
  			" cp.id = idcp and dp.id = iddp and u.login=:login and (u.profile='full' or u.id=process.idcp or u.id=process.iddp " + 
  			"  or ( process.id in ( select p.idprocess from Tache t, Phase p where t.idphase=p.id and t.idresponsable = u.id)  ) "  +
  			") order by process.id desc";
  	
  	public static final String GET_PROCESSS_BYLOGIN_DEVISNONSIGNE = " select new Process (process.id, process.idref, process.idprogramme, programme.nom, process.idgare,  " + 
  			" gare.nom, process.iddp, concat(dp.nom, ' ', dp.prenom), process.idcp, concat(cp.nom, ' ', cp.prenom),   " + 
  			" process.status, process.couleur, process.codebudget, process.dstart, process.dfinprev, process.dfin, process.phaseencours) " + 
  			" from Process process,  " + 
  			" Objet programme, Objet gare, User cp, User dp, User u, Champs c where " + 
  			" c.idprocess =process.id and  " + 
  			" c.nom ='Devis signé ?' and c.value != 'oui' and " + 
  			" programme.idref =idprogramme and  " + 
  			" gare.idref = idgare and  process.idref=:refprocess  and " + 
  			" cp.id = idcp and dp.id = iddp and u.login=:login and (u.profile='full' or u.id=process.idcp or u.id=process.iddp " + 
  			"  or ( process.id in ( select p.idprocess from Tache t, Phase p where t.idphase=p.id and t.idresponsable = u.id)  ) "  +
  			") order by process.id desc";
  	
  	
  	
  	public static final String GET_PROCESS_BYID = " select new Process (process.id, process.idref, process.idprogramme, programme.nom, process.idgare,  " + 
  			" gare.nom, process.iddp, concat(dp.nom, ' ', dp.prenom), process.idcp, concat(cp.nom, ' ', cp.prenom),   " + 
  			" process.status, process.couleur, process.codebudget, process.dstart, process.dfinprev, process.dfin, process.phaseencours ) " + 
  			" from Process process,  " + 
  			" Objet programme, Objet gare, User cp, User dp where " + 
  			" programme.idref =idprogramme and  " + 
  			" gare.idref = idgare and  " + 
  			" cp.id = idcp and dp.id = iddp and process.id=:id ";
 
  	
  	public static final String INSERT_PROCESS_PHASES = "INSERT INTO phase (idprocess, idref, ordre, nom, description, obligatoire, active, status, classe) " +
  			" select :idprocess, idref, ordre, nom, description, obligatoire, obligatoire, " + 
  			" 'to_be_started', classe from refphase where idrefprocess = :idrefprocess ";
  	
  	public static final String GET_PHASEENCOURS = " from Phase where idprocess=:idprocess and ordre= (select min(ordre) from Phase "  +
				"where idprocess=:idprocess and active='yes' and status=:status)";

  	public static final String UPDATE_PROCESS_PHASEENCOURS = "update process set phaseencours = :phaseencours where id=:idprocess "; //+ 

  	public static final String UPDATE_PHASE_NOTVISIBLE = "update phase set status = 'to_be_started' where  idprocess=:idprocess and (active='no' or status='in_progress_init' ) ";
  	
  	
  	public static final String GET_PHASE_BYPROCESSALL =  "from Phase where idprocess=:idprocess order by ordre";
  	public static final String GET_PHASE_BYPROCESS =  "from Phase where active='yes' and idprocess=:idprocess order by ordre";

  	public static final String INSERT_PROCESS_TACHES = "INSERT INTO tache (idphase, idref, ordre, nom, description, visibilite, status) " +
  			" select p.id, t.idref,  t.ordre, t.nom, t.description, t.obligatoire, 'to_be_started' from reftache t, phase p " +
  			" where t.idrefphase = p.idref and p.idprocess = :idprocess";

  	public static final String GET_TACHE_BYID =  "from Tache where id=:id ";
	
 
   	public static final String GET_TACHE_BYPHASE = " select new Tache (t.id, t.idphase, t.idref, t.ordre, t.nom, t.description, t.idresponsable, t.visibilite, t.status, t.dstartprev, t.dstart, t.dfinprev, t.dfin, t.montant, t.type, " +
  			"	(select concat(resp.nom, ' ', resp.prenom) from User resp where resp.id=t.idresponsable ) " + 
  			" ) from Tache t  , Etape e  where e.idtache=t.id and t.idphase=:idphase group by t.ordre ";//order by   t.ordre ";
 
  

  /* 	public static final String GET_TACHE_BYPHASE = " select new Tache (t.id, t.idphase, t.idref, t.ordre, t.nom, t.description, t.idresponsable, t.visibilite, t.status, t.dstartprev, t.dstart, t.dfinprev, t.dfin, t.montant, t.type, " +
  			"	(select concat(resp.nom, ' ', resp.prenom) from User resp where resp.id=t.idresponsable ) " + 
  			" ) from Tache t  where t.idphase=:idphase order by t.ordre ";
  */
  	public static final String GET_TACHE_BYIDACTE_IDPHASE_DENT = " select t.id, t.idphase, t.idref, t.ordre, t.nom, t.description, t.idresponsable, t.visibilite, t.status, t.dstartprev, t.dstart, t.dfinprev, t.dfin, t.montant, t.type, " +
  			"	(select concat(resp.nom, ' ', resp.prenom) from User resp where resp.id=t.idresponsable ) " + 
  			"  from Tache t, Etape et  where t.idphase=et.idphase and et.idacte=:idacte and et.idphase =:idphase and et.dent =:dent ";

   	public static final String GET_TACHES_DENTAIRE_BYPROCESSID = " select new Tache (t.id, t.idphase, t.idref, t.ordre, t.nom, t.description, t.idresponsable, t.visibilite, t.status, t.dstartprev, t.dstart, t.dfinprev, t.dfin, t.montant, t.type, " +
  			"	(select concat(resp.nom, ' ', resp.prenom) from User resp where resp.id=t.idresponsable ) " + 
  			" ) from Tache t, Phase ph, Process p  where t.idphase=ph.id and ph.idprocess=p.id and p.id=:id and ph.classe='DENTISTE' order by t.ordre ";

  	public static final String GET_TACHE_FUTURE = " select new Tache (t.id, t.idphase, t.idref, t.ordre, t.nom, t.description, t.idresponsable, t.visibilite, t.status, t.dstartprev, t.dstart, t.dfinprev, t.dfin, t.montant, t.type, " +
  			"	(select concat(resp.nom, ' ', resp.prenom) from User resp where resp.id=t.idresponsable ) " + 
  			" ) from Tache t, Phase ph, Process prj, User u where " + 
  			" t.idphase=ph.id and ph.idprocess = prj.id and t.idresponsable = u.id and u.login=:login and  prj.idref=:refprocess and " +
  			" TO_DAYS(t.dstartprev) - TO_DAYS(NOW()) > 0 and t.status != 'completed' order by t.dstartprev asc ";
  	
  	public static final String GET_TACHE_LATE = " select new Tache (t.id, t.idphase, t.idref, t.ordre, t.nom, t.description, t.idresponsable, t.visibilite, t.status, t.dstartprev, t.dstart, t.dfinprev, t.dfin, t.montant, t.type, " +
  			"	(select concat(resp.nom, ' ', resp.prenom) from User resp where resp.id=t.idresponsable ) " + 
  			" ) from Tache t, Phase ph, Process prj, User u where " + 
  			" t.idphase=ph.id and ph.idprocess = prj.id and t.idresponsable = u.id and u.login=:login and  prj.idref=:refprocess and " +
  			" TO_DAYS(t.dstartprev) - TO_DAYS(NOW()) < 0 and t.status != 'completed' order by t.dstartprev asc ";

  	public static final String GET_TACHE_TODAY = " select new Tache (t.id, t.idphase, t.idref, t.ordre, t.nom, t.description, t.idresponsable, t.visibilite, t.status, t.dstartprev, t.dstart, t.dfinprev, t.dfin, t.montant, t.type, " +
  			"	(select concat(resp.nom, ' ', resp.prenom) from User resp where resp.id=t.idresponsable ) " + 
  			" ) from Tache t, Phase ph, Process prj, User u where " + 
  			" t.idphase=ph.id and ph.idprocess = prj.id and t.idresponsable = u.id and u.login=:login and prj.idref=:refprocess and " +
  			" TO_DAYS(t.dstartprev) - TO_DAYS(NOW()) = 0 and t.status != 'completed' order by t.dstartprev asc ";

  	public static final String GET_TACHES_BETWEENDATES = " select new Tache (t.id, t.idphase, t.idref, t.ordre, t.nom, t.description, t.idresponsable, t.visibilite, t.status, t.dstartprev, t.dstart, t.dfinprev, t.dfin, t.montant, t.type, " +
  			"	(select concat(resp.nom, ' ', resp.prenom) from User resp where resp.id=t.idresponsable ) " + 
  			" ) from Tache t, Phase ph, Process prj, User u where " + 
  			" t.type='etape' and t.idphase=ph.id and ph.idprocess = prj.id and t.idresponsable = u.id and u.login=:login and prj.idref=:refprocess and t.dstartprev >= :bornemin and t.dstartprev < :bornemax group by(t.id) order by t.dstartprev asc ";

  	public static final String GET_TACHES_BYPROCESS = " select new Tache (t.id, t.idphase, t.idref, t.ordre, t.nom, t.description, t.idresponsable, t.visibilite, t.status, t.dstartprev, t.dstart, t.dfinprev, t.dfin, t.montant, t.type, " +
  			"	(select concat(resp.nom, ' ', resp.prenom) from User resp where resp.id=t.idresponsable ) " + 
  			" ) from Tache t, Phase ph, Process prj where " + 
  			" t.idphase=ph.id and ph.idprocess = prj.id and prj.id=:idprocess and t.type != 'etape' order by t.dstartprev asc ";

  	public static final String GET_TACHE_DUREE_MAX = " select new Etape (e.id, e.idphase, e.idtache, e.idref, e.ordre, e.nom, e.description, e.status, e.dstartprev, e.dstart, e.dfin, " +
  			"  e.subordre, e.dent, e.idacte, e.acte, e.ordreacte, e.idfamille, e.famille,  e.ordrefamille, e.duree, e.delai) from Etape e, Tache t where e.idtache=t.id "+
  			" and t.id=:idtache group by e.acte, e.description order by sum(e.duree) desc ";

 	public static final String GET_ETAPES_diffACTE_memeDENT = " select new Etape (e.id, e.idphase, e.idtache, e.idref, e.ordre, e.nom, e.description, e.status, e.dstartprev, e.dstart, e.dfin, " +
  			"  e.subordre, e.dent, e.idacte, e.acte, e.ordreacte, e.idfamille, e.famille,  e.ordrefamille, ref.duree, e.delai) from Etape e, Tache t, RefEtape ref where e.idtache=t.id and ref.idref=e.idref "+
  			" and t.id =:idtache and e.idacte != :idacte and e.dent=:dent order by idtache, ref.duree desc ";

 	public static final String GET_ETAPES_memeACTE_diffDENT = " select new Etape (e.id, e.idphase, e.idtache, e.idref, e.ordre, e.nom, e.description, e.status, e.dstartprev, e.dstart, e.dfin, " +
  			"  e.subordre, e.dent, e.idacte, e.acte, e.ordreacte, e.idfamille, e.famille,  e.ordrefamille, ref.duree, e.delai) from Etape e, Tache t, RefEtape ref where e.idtache=t.id and ref.idref=e.idref "+
  			" and t.id =:idtache and e.idacte = :idacte and e.dent!=:dent order by idtache, ref.duree desc ";

 	public static final String GET_ETAPES_memeSECTEUR_diffACTE_diffDENT = " select new Etape (e.id, e.idphase, e.idtache, e.idref, e.ordre, e.nom, e.description, e.status, e.dstartprev, e.dstart, e.dfin, " +
  			"  e.subordre, e.dent, e.idacte, e.acte, e.ordreacte, e.idfamille, e.famille,  e.ordrefamille, ref.duree, e.delai) from Etape e, Tache t, RefEtape ref where e.idtache=t.id and ref.idref=e.idref "+
  			" and t.id =:idtache and e.idacte != :idacte and e.dent!=:dent and e.dent >=:secteur_inf and e.dent <=:secteur_sup order by idtache, ref.duree desc ";

 	public static final String GET_ETAPES_diffSECTEUR = " select new Etape (e.id, e.idphase, e.idtache, e.idref, e.ordre, e.nom, e.description, e.status, e.dstartprev, e.dstart, e.dfin, " +
  			"  e.subordre, e.dent, e.idacte, e.acte, e.ordreacte, e.idfamille, e.famille,  e.ordrefamille, ref.duree, e.delai) from Etape e, Tache t, RefEtape ref where e.idtache=t.id and ref.idref=e.idref "+
  			" and t.id =:idtache and (e.dent <:secteur_inf or e.dent >:secteur_sup) order by idtache, ref.duree desc ";

 	public static final String GET_ACTES_BY_IDTACHE = "select tt.id from Tache tt, Etape ett where ett.idtache=tt.id and tt.id  in (?) "+
  			" group by tt.id having sum(ett.duree) >= ALL "+
  			" (SELECT sum(et.duree) from Etape et, Tache t where et.idtache=t.id and t.id in (?)  group by t.id) ";
  	
  	public static final String GET_TACHES_TO_GROUP = "select t.id,et.id, et.nom, et.dent, sum(et.duree) as sum_duree "+
  			" from Etape et, Tache t where et.idtache=t.id and t.id in (?) "+
  			" group by t.id order by sum_duree, et.idtache, et.acte desc "; 
  	
  	public static final String GET_REFTACHE_BYREFPROCESS =  "from RefTache where idrefphase=:idrefphase order by ordre";

/* GESTION DES DELETE PROCESS PHASE TASK */  	
  	public static final String DEL_ETAPE_BYPROCESS = "Delete from etape where idphase in (select a.id from phase  a where idprocess=:idprocess) ";
  	public static final String DEL_TACHE_BYPROCESS = "Delete from tache where idphase in (select a.id from phase  a where idprocess=:idprocess) ";
  	public static final String DEL_PHASE_BYPROCESS = "Delete from phase where idprocess=:idprocess ";
  	public static final String DEL_PROCESS_BYPROCESS = "Delete from process where id=:idprocess ";
  	public static final String DEL_CHAMPS_BYPROCESS = "Delete from champs where idprocess=:idprocess ";
  	public static final String DEL_TACHE_BYPHASEACTEDENT = "Delete from tache where idphase = :idphase and idacte=:idacte and dent=:dent" ;

  	
  	/* GESTION DES ETAPES */
  	public static final String INSERT_PHASE_ETAPES = "INSERT INTO etape ( idphase, idref, ordre, subordre, dent, idacte, acte, ordreacte, idfamille, famille, ordrefamille, nom, description,  status, duree, delai) "+
  			"select ph.id, et.idref, et.ordre, et.subordre, :dent, et.idacte, et.acte, et.idacte, et.idfamille, et.famille, et.idfamille, et.nom, et.description, 'to_be_started', et.duree, et.delai " +
  			"from refetape et, phase ph where et.idrefphase = ph.idref and et.idacte=:idacte and ph.id=:idphase ";
  	
  	public static final String INSERT_PHASE_ETAPES_TACHE = "INSERT INTO etape ( idphase, idtache, idref, ordre, subordre, dent, idacte, acte, ordreacte, idfamille, famille, ordrefamille, nom, description,  status, duree, delai) "+
  			"select ph.id, :idtache, et.idref, et.ordre, et.subordre, :dent, et.idacte, et.acte, et.idacte, et.idfamille, et.famille, et.idfamille, et.nom, et.description, 'to_be_started', et.duree, et.delai " +
  			"from refetape et, phase ph where et.idrefphase = ph.idref and et.idacte=:idacte and ph.id=:idphase ";
  
  	public static final String INSERT_PHASE_ETAPES_TACHE_BYIDREF = "INSERT INTO etape ( idphase, idtache, idref, ordre, subordre, dent, idacte, acte, ordreacte, idfamille, famille, ordrefamille, nom, description,  status, duree, delai) "+
  			"select ph.id, :idtache, et.idref, et.ordre, et.subordre, :dent, et.idacte, et.acte, et.idacte, et.idfamille, et.famille, et.idfamille, et.nom, et.description, 'to_be_started', et.duree, et.delai " +
  			"from refetape et, phase ph where et.idrefphase = ph.idref and et.idacte=:idacte and ph.id=:idphase and et.idref = :idref ";
  
  	public static final String DEL_ETAPE_BYPHASE = "Delete from etape where idphase = :idphase ";
  	public static final String DEL_ETAPE_BYTACHE = "Delete from etape where idtache = :idtache ";
  	public static final String DEL_ETAPE_BYPHASEACTEDENT = "Delete from etape where idphase = :idphase and idacte=:idacte and dent=:dent" ;
  	public static final String DEL_TACHES_BYPHASEACTEDENT = "Delete from Tache where id in (select et.idtache from Etape et where et.idphase = :idphase and et.idacte=:idacte and et.dent=:dent) " ;
  	public static final String DEL_ETAPE_BYID = "Delete from etape where id = :id " ;
  	
  	public static final String GET_ETAPE_BYPHASE = " select new Etape (e.id, e.idphase, e.idtache, e.idref, e.ordre, e.nom, e.description, e.status, e.dstartprev, e.dstart, e.dfin, " +
  			"  e.subordre, e.dent, e.idacte, e.acte, e.ordreacte, e.idfamille, e.famille,  e.ordrefamille, e.duree, e.delai) from Etape e  where e.idphase=:idphase order by e.ordrefamille, e.ordreacte, e.idref, e.dent ";

 	public static final String GET_ETAPE_BYPHASEACTEDENT = " select new Etape (e.id, e.idphase, e.idtache, e.idref, e.ordre, e.nom, e.description, e.status, e.dstartprev, e.dstart, e.dfin, " +
  			"  e.subordre, e.dent, e.idacte, e.acte, e.ordreacte, e.idfamille, e.famille,  e.ordrefamille, e.duree, e.delai) from Etape e  where e.idphase=:idphase ande.dent=:dent order by e.ordrefamille, e.ordreacte, e.idref, e.dent ";

  	public static final String GET_ETAPE_BY_TACHE = " select new Etape (e.id, e.idphase, e.idtache, e.idref, e.ordre, e.nom, e.description, e.status, e.dstartprev, e.dstart, e.dfin, " +
  			"  e.subordre, e.dent, e.idacte, e.acte, e.ordreacte, e.idfamille, e.famille,  e.ordrefamille, e.duree, e.delai) from Etape e  where e.idtache=:idtache group by (concat(acte, '-', nom ) ) order by e.ordrefamille, e.ordreacte, e.idref, e.dent ";

  	public static final String GET_ETAPES_BY_TACHE = " select new Etape (e.id, e.idphase, e.idtache, e.idref, e.ordre, e.nom, e.description, e.status, e.dstartprev, e.dstart, e.dfin, " +
  			"  e.subordre, e.dent, e.idacte, e.acte, e.ordreacte, e.idfamille, e.famille,  e.ordrefamille, e.duree, e.delai) from Etape e  where e.idtache=:idtache ";

  	public static final String GET_DENTS_BY_TACHE = " select new Etape (e.id, e.idphase, e.idtache, e.idref, e.ordre, e.nom, e.description, e.status, e.dstartprev, e.dstart, e.dfin, " +
  			"  e.subordre, e.dent, e.idacte, e.acte, e.ordreacte, e.idfamille, e.famille,  e.ordrefamille, e.duree, e.delai) from Etape e  where e.idtache=:idtache group by (dent) order by e.dent ";

 	public static final String GET_FAMILLE_BYPHASE = " select new Etape (e.id, e.idphase, e.idtache, e.idref, e.ordre, e.nom, e.description, e.status, e.dstartprev, e.dstart, e.dfin, " +
  			"  e.subordre, e.dent, e.idacte, e.acte, e.ordreacte, e.idfamille, e.famille,  e.ordrefamille, e.duree, e.delai) from Etape e  where e.idphase=:idphase group by (idfamille) order by e.ordrefamille  ";

 	public static final String GET_ACTE_BYPHASE = " select new Etape (e.id, e.idphase, e.idtache, e.idref, e.ordre, e.nom, e.description, e.status, e.dstartprev, e.dstart, e.dfin, " +
  			"  e.subordre, e.dent, e.idacte, e.acte, e.ordreacte, e.idfamille, e.famille,  e.ordrefamille, e.duree, e.delai) from Etape e  where e.idphase=:idphase group by (concat(idacte, '-', dent ) ) order by e.ordreacte  ";

 	public static final String GET_ACTEDENTTACHE_BYPHASE = " select new Etape (e.id, e.idphase, e.idtache, e.idref, e.ordre, e.nom, e.description, e.status, e.dstartprev, e.dstart, e.dfin, " +
  			"  e.subordre, e.dent, e.idacte, e.acte, e.ordreacte, e.idfamille, e.famille,  e.ordrefamille, e.duree, e.delai) from Etape e  where e.idphase=:idphase group by (concat(idacte, '-', dent, '-', idtache ) ) order by  e.ordrefamille, e.ordreacte, e.idref, e.dent  ";

 	// 	public static final String GET_FAMILLE_BYPHASE = " select new Etape ( e.idfamille, e.famille, e.ordrefamille) " + 
// 			" from Etape e  where e.idphase=:idphase group by (idfamille) order by e.ordrefamille ";
 	
  	public static final String GET_ACTES = " select new RefEtape (idacte, acte, idfamille, unitaire) from RefEtape   where unitaire=? group by (idacte) order by idacte, acte ";
  	public static final String GET_ACTES_ALL = " select new RefEtape (idacte, acte, idfamille, unitaire) from RefEtape group by (idacte) order by idacte, acte ";

 	public static final String UPDATE_ORDREFAMILLE_BYPHASE = "update etape set ordrefamille = :ordrefamille where idphase=:idphase and idfamille=:idfamille"; //+ 
  	
 	public static final String UPDATE_TACHEACTE_BYPHASE = "update etape set idtache = :idtache where idphase=:idphase and idacte=:idacte and dent=:dent"; //+ 

 	public static final String UPDATE_TACHE_BYIDTACHE = "update etape set idtache = :idtachelast where idtache=:idtache "; //+ 

 	//public static final String GET_ACTES = " select new Objet (re.idref,re.nom) from Objet re where 1=1 or re.nom=:uni";// where re.unitaire=:unitaire group by (re.idacte) order by re.idacte, re.acte ";


/* GESTION DES DELETE REFPROCESS CHAMPS PHASE TASK BY PROCESS */  	
  	public static final String DEL_REFTACHE_BYREFPROCESS = "Delete from reftache where idrefphase in (select a.idref from refphase  a where idrefprocess=:idrefprocess) ";
  	public static final String DEL_REFPHASE_BYREFPROCESS = "Delete from refphase where idrefprocess=:idrefprocess ";
  	public static final String DEL_REFPROCESS_BYREFPROCESS = "Delete from refprocess where idref=:idrefprocess ";
  	public static final String DEL_REFCHAMPS_BYREFPROCESS = "Delete from refchamps where idrefprocess=:idrefprocess ";

  	/* GESTION DES DELETE REFPROCESS PHASE TASK BY PHASE */  	
  	public static final String DEL_REFTACHE_BYREFPHASE = "Delete from reftache where idrefphase=:idrefphase";
  	public static final String DEL_REFPHASE_BYREFPHASE = "Delete from refphase where idref=:idrefphase";
  	 	
  	
  	
/* GESTION DES CHAMPS D'UN PROCESS */
  	public static final String GET_CHAMPS_BYPROCESSALL =  "from Champs where idprocess=:idprocess order by ordre";
  	public static final String GET_CHAMPS_BYPROCESS =  "from Champs where active='yes' and idprocess=:idprocess order by ordre";

  	public static final String INSERT_PROCESS_CHAMPS = "INSERT INTO champs (idprocess, idrefchamps, ordre, nom, description, value, obligatoire, active, type, maxlength, minlength, listvalues, width, height ) " +
  			" select :idprocess, idrefchamps, ordre, nom, description, 0, obligatoire, active, " + 
  			" type, maxlength, minlength, listvalues, width, height from refchamps where idrefprocess = :idrefprocess ";
  	

  	public static final String GET_REFCHAMPS_BYREFPROCESS =  "from RefChamps where idrefprocess=:idrefprocess order by ordre";

	/* GESTION DES REFETAPES */
	public static final String GET_ALLREFETAPES = " select new RefEtape  (idref, idacte, acte, idfamille, nom, description, duree, delai) from RefEtape order by idacte, subordre, description";

	public static final String UPDATE_ACTE_BYIDACTE = "update refetape set acte = :acte where idacte=:idacte "; // +

	public static final String DEL_ACTE_BYID = "Delete from refetape where idref=:idref";

	public static final String GET_REFETAPE_BYIDACTE = " select new RefEtape  (idrefphase, ordre, idacte, acte, idfamille, famille, unitaire) from RefEtape where idacte=:idacte group by (idacte) ";
	public static final String GET_REFETAPE_BYIDACTE2 = " from RefEtape where idacte=:idacte order by subordre, description ";
	public static final String GET_REFETAPE_BYID = " from RefEtape where idref=:idref ";
  	

/* GESTION DES LOGS */  	
  	public static final String GET_LOGS_BYPROCESS = " from  Log where classe = ? and idobj = ?  order by id desc ";
  	public static final String GET_LOGS = " from  Log order by dcreate desc ";
  	public static final String GET_LOGS_BYDATE = " from  Log where classe = ? and TO_DAYS(dcreate) - TO_DAYS(NOW())  >= ?  and ( idobj in " +
  			"(select process.id from Process process,  User cp, User dp, User u where  cp.id = idcp and dp.id = iddp and u.login=? and  " +
  			" (  u.profile='full' or u.id=process.idcp or u.id=process.iddp or ( process.id in ( select p.idprocess from Tache t, Phase p where t.idphase=p.id and t.idresponsable = u.id)  )  " +
  			" ) order by process.id desc ) ) order by id desc";

  	public static final String GET_LOGS_BYCLASSE_LOGIN = "from   Log where classe = ? and ( idobj in " +
  			"(select process.id from Process process,  User cp, User dp, User u where  cp.id = idcp and dp.id = iddp and u.login=? and process.idref=? and  " +
  			" (  u.profile='full' or u.id=process.idcp or u.id=process.iddp or ( process.id in ( select p.idprocess from Tache t, Phase p where t.idphase=p.id and t.idresponsable = u.id)  )  " +
  			" ) order by process.id desc ) ) order by id desc";
		
  	public static final String GET_LOGSREADER_BYCLASSE_LOGIN = "from   Log where classe = ? and ( idobj in " +
  			"(select process.id from Process process,  User cp, User dp, User u where  cp.id = idcp and dp.id = iddp and u.login=? and process.idref=? and  " +
  			" (  u.profile='full' or u.id=process.idcp or u.id=process.iddp or ( process.id in ( select p.idprocess from Tache t, Phase p where t.idphase=p.id and t.idresponsable = u.id)  )  " +
  			" or ( process.id in (select p.id from Process p, Objet programme where programme.idref=p.idprogramme and programme.idresponsable=u.id and u.login=?)) "+
  			" ) order by process.id desc ) ) order by id desc";
		
/* FIN GESTION DES LOGS */

/* GESTION DES TODOS */  	
  	public static final String GET_GEDPATH =  "select description from Objet where nom='UploadPath' ";
  	public static final String GET_TODOS_FILTRE = " from  Todo where owner = ? and  idobj = ? order by dcreate desc ";
  	public static final String GET_TODOS = " from  Todo order by dcreate desc ";
  	public static final String GET_GEDBYPROCESS=  "from Gedo where idprocess= ?";
		
/* FIN GESTION DES TODOS */

/* GESTION DES OBJETS */  	
  	public static final String GET_OBJBYCATEGORY =  "from Objet where categorie = ? order by ordre ";
  	public static final String GET_RATIOS =  " from Objet o where o.id in (select ob.idref from Objet ob, User u where categorie = ? and ob.idresponsable=u.id and u.login=?) order by o.ordre ";
  	public static final String UPDATE_OBJET_RATIO = "update Objet set description = :description where idref=:idref "; //+ 

/* FIN GESTION DES OBJETS */
  	/* GESTION DES REFS DATA */  	
  	public static final String GET_ALLREFPROCESS =  " from RefProcess  order by active desc, ordre ";
  	public static final String GET_ALLREFPHASE =  " from RefPhase where idrefprocess=:idrefprocess order by  ordre ";
  	public static final String DEL_OBJET_TEMP = "update Objet set categorie = :categorie where idref=:id "; //+ 
  	public static final String ACTIVATE_OBJET_TEMP = "update Objet set categorie = :categorie where idresponsable=:id "; //+ 
  	public static final String GET_OBJET_BYIDRESPONSABLE=  "from Objet where idresponsable=:idresponsable ";

/* FIN GESTION DES OBJETS */

  	
}