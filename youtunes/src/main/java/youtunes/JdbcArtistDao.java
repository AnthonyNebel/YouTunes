package youtunes;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



public class JdbcArtistDao implements ArtistDao {

	JdbcManager db;
	
	public JdbcArtistDao() {
		
		db = new JdbcManager();
	}
	@Override
	public void add(Artist entity) {
		
		Connection connection = db.getConnection();
		Artist newArtist = entity;
		
		if (connection != null) {
			
			try {
				
				Statement statement = connection.createStatement();
				String sql = "INSERT INTO artist(last_name, first_name) VALUES('" + newArtist.getLastName() + "', '" + newArtist.getFirstName() + "')";
				
				try {
					
					statement.execute(sql);
				}
				finally { 
					
					statement.close();
				}
			}
			catch (SQLException e) {
				
				System.out.println(e.getMessage());
			}
		}
	}
	@Override
	public List<Artist> list() {
		
		Connection connection = db.getConnection();
		ArrayList<Artist> artists = new ArrayList<Artist>();
		
		if (connection != null) {
			
			try {
				
				Statement statement = connection.createStatement();
				String sql = "SELECT artist_id, last_name, first_name FROM artist";
				
				try {
					
					ResultSet resultSet = statement.executeQuery(sql);
					
					try {
						
						while (resultSet.next()) {
							
							Artist artist = new Artist();
							artist.setAritstId(resultSet.getLong(1));
							artist.setLastName(resultSet.getString(2));
							artist.setFirstName(resultSet.getString(3));
							artists.add(artist);
						}
					}
					finally {
						
						resultSet.close();
					}
				}
				finally {
					
					statement.close();
				}		
			}
			catch (SQLException e) {
				
				System.out.println(e.getMessage());
			}
			finally {
				
				db.closeConnection(connection);
			}
		}
		return artists;
		
	}
	@Override
	public Artist find(Long key) {
		
		Connection connection = db.getConnection();
		Artist artist = null;
		if (connection != null) {
			
			try {
				
				Statement statement = connection.createStatement();
				String sql = "SELECT artist_id, last_name, first_name FROM artist WHERE artist_id =" + key;
				
				try {
					
					ResultSet resultSet = statement.executeQuery(sql);
					
					try {
						
						if (resultSet.next()) {
							
							artist = new Artist(resultSet.getLong(1), resultSet.getString(2), resultSet.getString(3));
						}
					}
					finally {
						
						resultSet.close();
					}
				}
				finally {
					
					statement.close();
				}
			}
			catch (SQLException e) {
				
				System.out.println(e.getMessage());
			}
		}
		return artist;
	}
	@Override
	public void update(Artist entity) {
		
		Connection connection = db.getConnection();
		if (connection != null) {
			
			try {
				
				Statement statement = connection.createStatement();
				String sql = "UPDATE artist SET first_name = '" + entity.getFirstName() + "', last_name = '" 
							+ entity.getLastName() + "' WHERE artist_id = " + entity.getArtistId();
				
				try {
					
					statement.executeUpdate(sql);
					
				}
				finally {
					
					statement.close();
				}
				
			}
			catch(SQLException e) {
				
				System.out.println(e.getMessage());
			}
		}
	}
	@Override
	public void remove(Long key) {
		
		Connection connection = db.getConnection();
		
		if (connection != null) {
			
			try {
				
				Statement statement = connection.createStatement();
				String sql = "DELETE FROM artist WHERE artist_id = " + key;
				
				try {
					
					statement.executeUpdate(sql);
				}
				finally {
					
					statement.close();
				}
			}
			catch (SQLException e) {
				
				System.out.println(e.getMessage());
			}
		}
	}
}