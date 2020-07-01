package com.p2c.obj.control;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.struts2.dispatcher.SessionMap;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.p2c.obj.back.P2cDAO;
import com.p2c.obj.back.ProcessDAO;
import com.p2c.obj.back.UserDAO;
import com.p2c.obj.model.Process;
import com.p2c.obj.model.Todo;
import com.p2c.session.AuthenticationInterceptor;
import com.p2c.session.UserSession;
import com.p2c.obj.model.User;



public class TodoAction extends ActionSupport implements ModelDriven<Todo> {

	private static final long serialVersionUID = -7759925652584240539L;

	private Todo todo = new Todo();
	HashMap<String, List<Todo>> todoMap = new HashMap<String, List<Todo>>();
	
	private List<Todo> todoList = new ArrayList<Todo>();
	private P2cDAO p2cDao = new P2cDAO();

	private ProcessDAO processDAO = new ProcessDAO();
	private List<Process> processList = new ArrayList<Process>();

	private UserDAO userDAO = new UserDAO();
	
	private String id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public Todo getModel() {
		return todo;
	}

	
	public String toAdd() 
	{
		setProcessList(processDAO.listProcess());
		return SUCCESS;
	}
	
	public String add()
	{
		
		try {
			@SuppressWarnings("rawtypes")
			SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
			UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);
			User user = (User) userDAO.getUser(usersession.getName());

			Process prj = processDAO.getProcess(todo.getIdobj());
			
			todo.setOwner(user.getId().toString()) ;
			todo.setStatus("in_progress") ;
			todo.setTypeobj(prj.getGare());
		
			p2cDao.addTodo(todo);
			return this.list();

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
			
		}
	}
		
	public String update() throws Exception
	{
		
		if (todo.getId() != null ) {

			if (todo.getTypeobj().equals("Delete")) p2cDao.deleteTodo(todo.getId());

			if (todo.getTypeobj().equals("Status")) {
				Todo tdTmp = p2cDao.getTodo(todo.getId());
				tdTmp.setStatus(todo.getStatus());
				tdTmp.setDend(new Date(System.currentTimeMillis()));
			}
		
		}
		
		return this.list();
	}
		

		
	public String list() throws Exception
	{
//		this.todo.setIdobj(0);
//		this.todo.setClasse("EVENT");
//		todoList = p2cDao.listTodo(this.todo);
		String filObjID = "";
		
		
		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);
		
		User user = (User) userDAO.getUser(usersession.getName());
		if (this.todo.getIdobj() != null && this.todo.getIdobj() !=0 ) 
			filObjID = " owner=" + user.getId() + " and idobj=" +  this.todo.getIdobj();
		else 
			filObjID = " owner=" + user.getId();
		
		setProcessList(processDAO.listProcess());
		
		todoList = p2cDao.listTodo(" where " + filObjID + " and status='completed' order by dcreate desc ");
		todoMap.put("Terminé", todoList);

		todoList = p2cDao.listTodo(" where " + filObjID + " and status!='completed' and dendprev < NOW() order by dcreate desc  ");
		todoMap.put("En retard", todoList);
		
		todoList = p2cDao.listTodo(" where " + filObjID + " and status!='completed' and  dendprev > NOW() and TO_DAYS(dendprev) - TO_DAYS(NOW()) <= 7 order by dcreate desc ");
		todoMap.put("Dans 1 semaine", todoList);
		
		todoList = p2cDao.listTodo(" where " + filObjID + " and status!='completed' and  TO_DAYS(dendprev) - TO_DAYS(NOW()) > 7 order by dcreate desc ");
		todoMap.put("Dans +1 semaine", todoList);

		
		return SUCCESS;
	}

	
	public Todo getTodo() {
		return todo;
	}

	public void setTodo(Todo todo) {
		this.todo = todo;
	}

	public List<Todo> getTodoList() {
		return todoList;
	}

	public void setTodoList(List<Todo> todoList) {
		this.todoList = todoList;
	}

	public List<Process> getProcessList() {
		return processList;
	}

	public void setProcessList(List<Process> processList) {
		this.processList = processList;
	}

	public HashMap<String, List<Todo>> getTodoMap() {
		return todoMap;
	}

	public void setTodoMap(HashMap<String, List<Todo>> todoMap) {
		this.todoMap = todoMap;
	}

}
