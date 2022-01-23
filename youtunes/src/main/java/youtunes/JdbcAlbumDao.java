package youtunes;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class JdbcAlbumDao implements AlbumDao {
	
	JdbcManager db;
	public JdbcAlbumDao() {
		
		db = new JdbcManager();
		
	}
	@Override
	public void add(Album entity) {
		
		Connection connection = db.getConnection();
		Album newAlbum = entity;
		if (connection != null) {
			
			try {
				
				Statement statement = connection.createStatement();
				String sql = String.format("INSERT INTO album(title, price, genre, img_url, artist_id) values('%s', %s, '%s', '%s', %s);", 
						newAlbum.getTitle(), newAlbum.getPrice(), newAlbum.getGenre(), newAlbum.getImgUrl(), newAlbum.getArtistId());
				//System.out.println(sql);
				try {
					
					statement.executeUpdate(sql);
				}
				finally {
					
					statement.close();
				}
			}
			catch (SQLException e) {
				
				System.out.println("did not insert new album " + newAlbum.toString());
				System.out.println(e.getMessage());
			}
		}
	}
	@Override
	public List<Album> list() {
		
		Connection connection = db.getConnection();
		ArrayList<Album> albums = new ArrayList<Album>();
		if (connection != null) {
			
			try {
				
				Statement statement = connection.createStatement();
				String sql = "SELECT album_id, title, price, img_url, genre FROM album";
				//System.out.println(sql);
				try {
					
					ResultSet resultSet = statement.executeQuery(sql);
					try {
						
						while (resultSet.next()) {
							
							Album album = new Album();
							album.setAlbumId(resultSet.getLong(1));
							album.setTitle(resultSet.getString(2));
							album.setPrice(resultSet.getDouble(3));
							album.setImgUrl(resultSet.getString(4));
							album.setGenre(resultSet.getString(5));
							albums.add(album);
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
				
				System.out.println("did not get albums " + e.getMessage());
			}
			finally {
				
				db.closeConnection(connection);
			}
		}
		return albums;
		
	}
	@Override
	public Album find(Long key) {
		
		Connection connection = db.getConnection();
		Album album = null; 
		
		if (connection != null) {
			try {
				Statement statement = connection.createStatement(); 
				
				String sql = "SELECT album_id, title, price, img_url, genre, artist_id FROM album WHERE album_id = " + key;
				//System.out.println(sql);
				
				try {
					ResultSet resultSet = statement.executeQuery(sql);
					
					try {
						if (resultSet.next()) {
							album = new Album(resultSet.getLong(1), resultSet.getString(2),
									resultSet.getDouble(3), resultSet.getString(4), resultSet.getString(5), resultSet.getLong(6)); 
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
				System.out.println("Could not get album: " + e.getMessage());
			}
		}
		return album;
	}
	@Override
	public void update(Album entity) {
		
		Connection connection = db.getConnection(); 
		Album updatedAlbum = entity; 
		
		if (connection != null) {
			try {
				Statement statement = connection.createStatement(); 
				String sql = String.format("UPDATE album SET title = '%s', price = %s, genre = '%s', img_url = '%s', artist_id = %s WHERE album_id = %s;", 
						updatedAlbum.getTitle(), updatedAlbum.getPrice(), updatedAlbum.getGenre(),
						updatedAlbum.getImgUrl(), updatedAlbum.getArtistId(), updatedAlbum.getAlbumId());
				
				//System.out.println(sql);
				
				try {
					statement.executeUpdate(sql);
				} 
				finally {
					statement.close();
				}
			}
			catch (SQLException e) {
				System.out.println("did not update album: " + updatedAlbum.toString());
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
				
				String sql = String.format("DELETE FROM album WHERE album_id = %s", key);
				//System.out.println(sql);
				
				try  {
					
					statement.executeUpdate(sql);
				} 
				finally {
					statement.close();
				}
			} 
			catch (SQLException e) {
				
				System.out.println("did not delete ablum: " + key);
				System.out.println(e.getMessage());
			}
		}
	}
}






























