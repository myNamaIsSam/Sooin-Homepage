package core;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DB;


public class ManagerDAO {
	
	private static Manager makeManager(ResultSet rs) throws Exception{
		Manager obj = new Manager();
		obj.setId(rs.getString("id"));
		obj.setPassword(rs.getString("password"));
		return obj;
	}
	
	public static Manager selectByLoginId(String loginId) throws Exception{
		String sql = "select * from manager where id = ?";
		try(Connection con = DB.getConnection();
				PreparedStatement stmt = con.prepareStatement(sql)){
			stmt.setString(1, loginId);
			try(ResultSet rs = stmt.executeQuery()){
				return rs.next() ? makeManager(rs) : null;
			}	
		}
	}
	
	public static boolean checkPasswd(String loginId, String passwd) throws SQLException, ClassNotFoundException{
		String sql = "select count(*) from manager where id = ? and password = sha1(?) ";
		try(Connection con = DB.getConnection();
				PreparedStatement stmt = con.prepareStatement(sql)){
			stmt.setString(1, loginId);
			stmt.setString(2, passwd);
			try(ResultSet rs = stmt.executeQuery()){
				if(rs.next()){
					if(rs.getInt(1)==1) return true;
					else return false;
				}
			}
		}
		return false;
	}

}
