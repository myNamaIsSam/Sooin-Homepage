package Board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DB;

public class EstBoardDAO {

	private static EstBoard makeBoardJob(ResultSet resultSet) throws SQLException {
		EstBoard board = new EstBoard();
		board.setId(resultSet.getInt("id"));
		board.setDate(resultSet.getString("date"));
		board.setTime(resultSet.getString("time"));
		board.setTitle(resultSet.getString("title"));
		board.setContent(change_Code(resultSet.getString("content"), "\n", "<br>"));
		board.setName(resultSet.getString("name"));
		board.setPhonenum(resultSet.getString("phonenum"));
		board.setObject(resultSet.getString("object"));
		board.setType(resultSet.getString("type"));
		board.setPassword(resultSet.getString("password"));
		return board;
	}
	
	public static String change_Code(String line, String oldString, String newString) {
		for (int index = 0; (index = line.indexOf(oldString, index)) >= 0; index += newString.length())
			line = line.substring(0, index) + newString + line.substring(index + oldString.length());
		return line;
	}
	
	/*public static Board selectByCount(int count) throws Exception {
		Board board = null;
		int num = 1;
		int tmp_count = 1;
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			while (tmp_count <= getRecordCount()) {
				board = null;
				connection = DB.getConnection();
				String sql = "SELECT * FROM [Board1] WHERE [num] = ?";
				statement = connection.prepareStatement(sql);
				statement.setInt(1, num);
				resultSet = statement.executeQuery();
				if (resultSet.next())
					board = makeBoard(resultSet);
				if(board!=null){
					System.out.println(num+"은 null아님");
					if(tmp_count == count) break;
					tmp_count++;
				}else if(board==null){
					System.out.println(num+"은 null");
				}
				num++;
			}
			System.out.println("마지막 게시물의 제목 : "+board.getTitle());
		} finally {
			if (resultSet != null)
				resultSet.close();
			if (statement != null)
				statement.close();
			if (connection != null)
				connection.close();
		}
		return board;
	}*/

	public static EstBoard selectByNum(int id) throws Exception {
		EstBoard board = null;
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			connection = DB.getConnection();
			String sql = "select * from est_board where id = ?";
			statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
			resultSet = statement.executeQuery();
			if (resultSet.next())
				board = makeBoardJob(resultSet);
		} finally {
			if (resultSet != null)
				resultSet.close();
			if (statement != null)
				statement.close();
			if (connection != null)
				connection.close();
		}
		return board;
	}

	public static ArrayList<EstBoard> selectPage(int currentPage, int pageSize)
			throws Exception {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			connection = DB.getConnection();
			// id를 기준으로 내림차순으로 정렬해서 테이블을 읽어온다.
			String sql = "select * from est_board order by id desc";
			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery(); 
			
			// 커서 인덱스가 1부터 시작하는 것 같아서 1을 더해준다.
			// 1을 더하지 않으면 페이징이 제대로 안된다.
	        int abPage=(currentPage-1)*pageSize+1;

	        if(!resultSet.next()) {  
	        	pageSize=0;
	        } else {
	        	// 테이블 전체를 읽어와서 커서의 위치를 필요한 곳으로 옮긴다.
	        	resultSet.absolute(abPage); 
	        }
			
			ArrayList<EstBoard> list = new ArrayList<EstBoard>();
			for(int i=0; i<pageSize; i++){
				list.add(makeBoardJob(resultSet));
				if(!resultSet.next()) break;
			}
			return list;
			
		} finally {
			if (resultSet != null)
				resultSet.close();
			if (statement != null)
				statement.close();
			if (connection != null)
				connection.close();
		}
	}
	
	public static int getRecordCount() throws Exception {
		int count = 0;
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			connection = DB.getConnection();
			String sql = "select count(*) from est_board";
			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next())
				count = resultSet.getInt(1);
		} finally {
			if (resultSet != null)
				resultSet.close();
			if (statement != null)
				statement.close();
			if (connection != null)
				connection.close();
		}
		return count;
	}

	public static void insert(String title, String content, 
			String name, String phonenum, String object, String type, 
			String password) throws Exception {
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			connection = DB.getConnection();
			String sql = "insert into est_board(date, time, title, content, "
					+ "name, phonenum, object, type, password) values (now(), now(), ?, ?, ?, ?, ?, ?, sha1(?))";
			statement = connection.prepareStatement(sql);
			statement.setString(1, title);
			statement.setString(2, content);
			statement.setString(3, name);
			statement.setString(4, phonenum);
			statement.setString(5, object);
			statement.setString(6, type);
			statement.setString(7, password);
			statement.executeUpdate();
		} finally {
			if (statement != null)
				statement.close();
			if (connection != null)
				connection.close();
		}
	}
	
	public static void updateInfo(int id, String title, String content, 
			String name, String phonenum, String object, String type) throws Exception {
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			connection = DB.getConnection();
			String sql = "update est_board set title = ?, content = ?,"
					+ "name = ?, phonenum = ?, object = ?, type = ? where id = ? ";
			statement = connection.prepareStatement(sql);
			statement.setString(1, title);
			statement.setString(2, content);
			statement.setString(3, name);
			statement.setString(4, phonenum);
			statement.setString(5, object);
			statement.setString(6, type);
			statement.setInt(7, id);
			statement.executeUpdate();
		} finally {
			if (statement != null)
				statement.close();
			if (connection != null)
				connection.close();
		}
	}

	public static void delete(int id) throws Exception {
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			connection = DB.getConnection();
			String sql = "delete from est_board where id = ?";
			statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
			statement.executeUpdate();
		} finally {
			if (statement != null)
				statement.close();
			if (connection != null)
				connection.close();
		}
	}
	
	public static boolean checkPasswd(int id, String passwd) throws SQLException, ClassNotFoundException{
		String sql = "select count(*) from est_board where id = ? and password = sha1(?) ";
		try(Connection con = DB.getConnection();
				PreparedStatement stmt = con.prepareStatement(sql)){
			stmt.setInt(1, id);
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
