package Board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.xml.ws.Response;

import util.DB;

public class BoardDAO1 {

	private static Board makeBoard(ResultSet resultSet) throws SQLException {
		Board board = new Board();
		board.setId(resultSet.getInt("id"));
		board.setDate(resultSet.getString("date"));
		board.setTime(resultSet.getString("time"));
		board.setTitle(resultSet.getString("title"));
		board.setContent(change_Code(resultSet.getString("content"), "\n", "<br>"));
		board.setView(resultSet.getInt("view"));
		return board;
	}

	public static String change_Code(String line, String oldString, String newString) {
		for (int index = 0; (index = line.indexOf(oldString, index)) >= 0; index += newString.length())
			line = line.substring(0, index) + newString + line.substring(index + oldString.length());
		return line;
	}

	public static Board selectByNum(int id) throws Exception {
		Board board = null;
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			connection = DB.getConnection();
			String sql = "SELECT * FROM noti_board WHERE id = ?";
			statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
			resultSet = statement.executeQuery();
			if (resultSet.next())
				board = makeBoard(resultSet);
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

	public static ArrayList<Board> selectPage(int currentPage, int pageSize) throws Exception {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			connection = DB.getConnection();
			// id를 기준으로 내림차순으로 정렬해서 테이블을 읽어온다.
			String sql = "select * from noti_board order by id desc";
			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery();

			// 커서 인덱스가 1부터 시작하는 것 같아서 1을 더해준다.
			// 1을 더하지 않으면 페이징이 제대로 안된다.
			int abPage = (currentPage - 1) * pageSize + 1;

			if (!resultSet.next()) {
				pageSize = 0;
			} else {
				// 테이블 전체를 읽어와서 커서의 위치를 필요한 곳으로 옮긴다.
				resultSet.absolute(abPage);
			}

			ArrayList<Board> list = new ArrayList<Board>();
			for (int i = 0; i < pageSize; i++) {
				list.add(makeBoard(resultSet));
				if (!resultSet.next())
					break;
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
			String sql = "select count(*) from noti_board";
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
		System.out.println("count : "+count);
		return count;
	}

	public static void insert(String title, String content) throws Exception {
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			connection = DB.getConnection();
			String sql = "insert into noti_board(date, time, title, content, view) values (now(), now(), ?, ?, 0)";
			statement = connection.prepareStatement(sql);
			statement.setString(1, title);
			statement.setString(2, content);
			statement.executeUpdate();
		} finally {
			if (statement != null)
				statement.close();
			if (connection != null)
				connection.close();
		}
	}

	public static void updateViewCount(int id) throws Exception {
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			connection = DB.getConnection();
			String sql = "update noti_board set view = view+1 where id = ?";
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

	public static void updateInfo(int id, String title, String content) throws Exception {
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			connection = DB.getConnection();
			String sql = "update noti_board set title = ?, content = ? where id = ? ";
			statement = connection.prepareStatement(sql);
			statement.setString(1, title);
			statement.setString(2, content);
			statement.setInt(3, id);
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
			String sql = "delete from noti_board where id = ?";
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

}
