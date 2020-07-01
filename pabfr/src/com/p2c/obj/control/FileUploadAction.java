package com.p2c.obj.control;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.io.File;
import org.apache.commons.io.FileUtils;  
import org.apache.struts2.dispatcher.SessionMap;

import java.io.FileInputStream;
import java.io.InputStream;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.p2c.obj.back.P2cDAO;
import com.p2c.obj.back.GedDAO;
import com.p2c.obj.back.P2cSql;
import com.p2c.obj.model.Gedo;
import com.p2c.session.AuthenticationInterceptor;
import com.p2c.session.UserSession;



public class FileUploadAction extends ActionSupport {

	private static final long serialVersionUID = 12323232L;
	private File file;
	private String fileFileName;
	private String fileContentType;

	private InputStream fileInputStream;
	 
	
	private P2cDAO p2cDao = new P2cDAO();

	private GedDAO gedDao = new GedDAO();
	private Gedo ged = new Gedo();
	private List<Gedo> gedList = new ArrayList<Gedo>();
	
	/**
	 * Doesn't do anything
	 */
	public String execute() {
		return Action.SUCCESS;
	}

   
	public File getFile() {
        return this.file;
     }

	public void setFile(File file) {
         this.file = file;
	}

	public InputStream getFileInputStream() {
		return fileInputStream;
	}
 
	

	/**
      * This method is called by the action.
      * Here you can do whatever you want with the uploaded file
      */

	public String upload() throws IOException  {

		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);

		File uploadedFile =this.getFile();
		String repCible = p2cDao.getValue(P2cSql.GET_GEDPATH) ;

      System.out.println("Repertoire cible est " + repCible);

      if (uploadedFile != null && repCible != null) {
    	  ged.setFileName(fileFileName);
    	  ged.setContentType(fileContentType);
    	  //ged.setIdprocess((long) 97);
    	  ged.setOwner(usersession.getName());
    	  
    	  gedDao.saveGed(ged);
      	  ged.setOrdre(ged.getId().toString());
      	    	  
    	  System.out.println("Received file with desc="+ ged.getDescription());
    	  
    	  File fileToCreate = new File(repCible, ged.getId().toString());  
    	  
          FileUtils.copyFile(uploadedFile, fileToCreate);  
      
      }
      else {
    	  System.out.println("Error uploading file.");
         // return ERROR;
      }
    	  // you can do whatever you want with the file
      return list();
	}

	public String download() throws Exception {

	     if (ged.getId() != null ) {
	    	 		
		Gedo gedtmp = gedDao.getGed(ged.getId());
		fileFileName = gedtmp.getFileName();
		fileContentType = gedtmp.getContentType();
  	    String repCible = p2cDao.getValue(P2cSql.GET_GEDPATH) ;

	    fileInputStream = new FileInputStream(new File(repCible + "/" + ged.getId()));
	     }  
	     else {
	    	  System.out.println("Error downloading file.");
	      }
	    return SUCCESS;
	}	

	public String remove() throws Exception {

		if (ged.getId() != null) {

			Gedo gedtmp = gedDao.getGed(ged.getId());
			this.ged.setIdprocess(gedtmp.getIdprocess());
			fileFileName = gedtmp.getFileName();
			fileContentType = gedtmp.getContentType();
			String repCible = p2cDao
					.getValue(P2cSql.GET_GEDPATH);

			File file = new File(repCible + "/" + ged.getId());

			if (file.delete()) {
				System.out.println(file.getName() + " is deleted!");
				p2cDao.deleteGedo(ged.getId());
			} else {
				System.out.println("Delete operation is failed.");
			}

		} else {
			System.out.println("Error removing file.");
		}
		return list();
	}	
	
	public String list()
	{
		
		System.out.println("id = " + ged.getIdprocess());
		if (ged.getIdprocess() != null ){
			gedList = p2cDao.listGed(ged.getIdprocess());
		} 
		/*
		else {
			phaseList = phaseDAO.listPhase();
		}
		*/
		return SUCCESS;
	}

	
	
	 public void setUpload(File file) {
        this.file = file;
     }


	public String getFileFileName() {
	
	return fileFileName;
	
	}
	
	
	public void setFileFileName(String fileFileName) {
	
	this.fileFileName = fileFileName;
	
	}
	
	
	public String getFileContentType() {
		return fileContentType;	
	}
	
	
	public void setFileContentType(String fileContentType) {
	
	this.fileContentType = fileContentType;
	
	}


	public Gedo getGed() {
		return ged;
	}


	public void setGed(Gedo ged) {
		this.ged = ged;
	}


	public List<Gedo> getGedList() {
		return gedList;
	}
	


}


