package org.camunda.bpm.DataBase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;

public abstract class DatabaseAbstractManager {


	private String url;
	private String user;
	private String passw;
	
	/**
	 * Costruttore della classe
	 * */
	protected DatabaseAbstractManager(){
		ResourceBundle bundle = ResourceBundle.getBundle("configurazione");
		
		url = bundle.getString("database.url");
		user = bundle.getString("database.user");
		passw = bundle.getString("database.passwd");
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(Throwable t){
			t.printStackTrace();
		}
	}
	
	/**
	 * This method creates a database connection between database gioco and this service
	 * 
	 * @return Returns the connection between database and this service
	 * @exception SQLException
	 * */
	public Connection databaseConnect() throws SQLException{
		return DriverManager.getConnection(url,user,passw);
	}
	

	/**
	 * This method disconnect database from the service
	 * 
	 * @param Connection connection: a connection between database and client
	 * @param Statement statement: a statement that executes a sql statement 
	 * @param ResultSet resultSet: a result from a sql statement
	 * 
	 * 
	 * */
	public void databaseDisconnect(Connection connection,Statement statement,ResultSet resultSet){
		try{
			resultSet.close();
		}catch(Throwable t){
			//LASCIARE VUOTO
		}
		
		try{
			statement.close();
		}catch(Throwable t){
			//LASCIARE VUOTO
		}
		
		try{
			connection.close();
		}catch(Throwable t){
			//LASCIARE VUOTO
		}
	}
	
	public void databaseDisconnect(Connection connection,Statement statement){
		databaseDisconnect(connection, statement,null);
	}
	
	public void databaseDisconnect(Connection connection){
		databaseDisconnect(connection,null,null);
	}
	   

}
