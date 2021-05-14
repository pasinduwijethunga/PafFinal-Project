package com;
import java.sql.*;

public class Project {

// database connection 
	private Connection connect() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/gajetbuget", "root", "");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}



//Read Project method

	public String readProjects()
	{
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for reading.";
			}
			// Prepare the html table to be displayed
			
			output = "<table class='table table-hover'><tr><th>Project Code</th><th>Project Name </th><th>Project Price </th>"
					+ "<th>Project Description</th><th>Project Type</th>"
					+ "<th>Update</th><th>Remove</th></tr>";

			String query = "select * from projects";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			// iterate through the rows in the result set
			while (rs.next()) {
				String proID = Integer.toString(rs.getInt("proID"));
				String proCode = rs.getString("proCode");
				String proName = rs.getString("proName");
				String proPrice = rs.getString("proPrice");
				String proDesc = rs.getString("proDesc");
				String proType = rs.getString("proType");
				
				// Add into the html table
				output += "<tr><td><input id='hiddoctorIdUpdate' name='hiddoctorIdUpdate' type='hidden' value='" + proID
						+ "'>" + proCode + "</td>";
				output += "<td>" + proName + "</td>";
				output += "<td>" + proPrice + "</td>";
				output += "<td>" + proDesc + "</td>";
				output += "<td>" + proType + "</td>";
				
				// buttons
				output += "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary'></td>"
						+ "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-itemid='"
						+ proID + "'>" + "</td></tr>";
			}
			con.close();
			// Complete the html table
			output += "</table>";
		} catch (Exception e) {
			output = "Error while reading the Doctors.";
			System.err.println(e.getMessage());
		}
		return output;
	}
	
	
	
	
//Insert project details 
	
	public String insertProject(String proCode, String proName, String proPrice, String proDesc,String proType) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for inserting.";
			}
			// create a prepared statement
			String query = " insert into projects(`proID`,`proCode`,`proName`,`proDesc`,`proPrice`,`proType`)"
					+ "values(?, ?, ?, ?, ?, ?)";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, 0);
			preparedStmt.setString(2, proCode);
			preparedStmt.setString(3, proName);
			preparedStmt.setString(4, proPrice);
			preparedStmt.setString(5, proDesc);
			preparedStmt.setString(6, proType);
		
			// execute the statement
			preparedStmt.execute();
			con.close();
			String newPro = readProjects();
			output = "{\"status\":\"success\", \"data\": \"" +newPro+ "\"}";
			
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\":\"Error while inserting the Projects.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}
	
	
	
//Update project details
	
	public String updateProject(String ID, String Code, String Name, String Price, String Desc,String Type){
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for updating.";
			}
			// create a prepared statement
			String query = "UPDATE projects SET proCode=?,proName=?,proPrice=?,proDesc=?,proType=? WHERE proID=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			
		
			preparedStmt.setString(1, Code);
			preparedStmt.setString(2, Name);
			preparedStmt.setString(3, Price);
			preparedStmt.setString(4, Desc);
			preparedStmt.setString(5, Type);
			preparedStmt.setInt(6, Integer.parseInt(ID));
	
			// execute the statement
			preparedStmt.execute();
			con.close();
			String newPro =readProjects();
			output = "{\"status\":\"success\", \"data\": \"" +newPro+ "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\": \"Error while updating the doctor.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}
	
	
	
//Delete project 
	
	public String deleteProject(String proID) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for deleting.";
			}

			// create a prepared statement
			String query = "delete from projects where proID=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, Integer.parseInt(proID));
			// execute the statement
			preparedStmt.execute();
			con.close();
			String newPro = readProjects();
			output = "{\"status\":\"success\", \"data\": \"" +newPro+ "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\":\"Error while deleting the doctor.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}
}