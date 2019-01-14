package org.camunda.bpm.DataBase;


import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class DatabaseService extends DatabaseAbstractManager{
	
	public void insertConference(String nome,String object_conference, String emaconference_descriptionil, String location, int price, String conference_date, String end_date, int reserved){
        
		Connection connection = null;
		PreparedStatement statement = null;
		
		
		try{
			connection = databaseConnect();
			statement = connection.prepareStatement("insert into conference values(?,?,?,?,?,?,?)");
			statement.setString(1,nome);
			statement.setString(2,object_conference);
			statement.setString(3, emaconference_descriptionil);
			statement.setString(4, location);
			statement.setInt(5,price);
			statement.setString(6,conference_date);
			statement.setString(7,end_date);
			statement.setInt(8,reserved);
			statement.executeUpdate();
		}catch(SQLException s){
		    databaseDisconnect(connection,statement);
		    s.printStackTrace();
		}
	}	
		
	public void insertPartecipant(String nome,String surname, String job, String sex, String addres){

		Connection connection = null;
		PreparedStatement statement = null;


		try{
			connection = databaseConnect();
			statement = connection.prepareStatement("insert into conference values(?,?,?,?,?)");
			statement.setString(1,nome);
			statement.setString(2,surname);
			statement.setString(3, job);
			statement.setString(4, sex);
			statement.setString(5,addres);
			statement.executeUpdate();
		}catch(SQLException s){
			databaseDisconnect(connection,statement);
			s.printStackTrace();
		}


	}
	
	
	public void insertInvoice(String nome, String details, String addres, int ammount){

		Connection connection = null;
		PreparedStatement statement = null;


		try{
			connection = databaseConnect();
			statement = connection.prepareStatement("insert into conference values(?,?,?,?)");
			statement.setString(1, nome);
			statement.setString(2, details);
			statement.setString(3, addres);
			statement.setInt(4, ammount);
			statement.executeUpdate();
		}catch(SQLException s){
			databaseDisconnect(connection,statement);
			s.printStackTrace();
		}


	}
	
	
	public void updateIncrementReservation(String nome){
 
		Connection connection = null;
		PreparedStatement statement = null;


		try{
			connection = databaseConnect();
			statement = connection.prepareStatement("update conference set reserved = reserved + 1 where nome = ?");
			statement.setString(1, nome);
			statement.executeUpdate();
		}catch(SQLException s){
			databaseDisconnect(connection,statement);
			s.printStackTrace();
		}


	}
	
	// Occhio non vada in negativo
	public void updatedecrementtReservation(String nome){
		 
		Connection connection = null;
		PreparedStatement statement = null;


		try{
			connection = databaseConnect();
			statement = connection.prepareStatement("update conference set reserved = reserved - 1 where nome = ?");
			statement.setString(1, nome);
			statement.executeUpdate();
		}catch(SQLException s){
			databaseDisconnect(connection,statement);
			s.printStackTrace();
		}


	}
	
}