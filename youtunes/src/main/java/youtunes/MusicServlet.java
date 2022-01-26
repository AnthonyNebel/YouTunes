package youtunes;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class MusicServlet
 */
@WebServlet(name = "MusicServlet", urlPatterns= {"/youtunes/*"})
public class MusicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MusicServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String base = "/jsp/";
		String url = base + "index.jsp";
		String action = request.getParameter("action");
		
		
		if (action != null) {
			
			switch (action) {
			
				case "contactUs":
					
					url = base + "Contact.jsp";
					break;
				case "aboutUs":
					url = base + "About.jsp";
					break;
					
				case "artistsList":
					url = base + "artists/List.jsp";
					break;
				
				case "newArtist":
					url = base + "artists/New.jsp";
					break;
				
				case "artistDetails":
					url = base + "artists/Details.jsp";
					break;
					
				case "updateArtist":
					updateArtist(request, response);
					url = base + "artists/List.jsp";
					break;
					
				case "deleteArtist": 
					deleteArtist(request, response);
					url = base + "artists/List.jsp";
					break;
					
				case "createArtist":
					createArtist(request, response);
					url = base + "artists/List.jsp";
					break;
					
				case "newAlbum":
					url = base + "albums/New.jsp";
					break;
					
				case "albumDetails":
					url = base + "albums/Details.jsp";
					break;
					
				case "createAlbum":
					createAlbum(request, response);
					url = base + "index.jsp";
					break;
					
				case "updateAlbum":
					updateAlbum(request, response);
					url = base + "index.jsp";
					break;
					
				case "showAlbums":
					url = base + "index.jsp";
					break;
					
				case "deleteAlbum":
					deleteAlbum(request, response);
					url = base + "index.jsp";
					break;
				case "home":
					url = "/jsp/index.jsp";
					break;
			}
		}
		
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url);

		requestDispatcher.forward(request, response);
		
	}
	private void updateArtist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String artistId = request.getParameter("artistId"); 
		
		Artist artistToUpdate = new Artist(); 
		artistToUpdate.setAritstId(Long.parseLong(artistId));
		artistToUpdate.setFirstName(firstName);
		artistToUpdate.setLastName(lastName);
		
		JdbcArtistDao artistDao = new JdbcArtistDao(); 
		artistDao.update(artistToUpdate);
	}
	private void deleteArtist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String artistId = request.getParameter("artistId");
		
		JdbcArtistDao artistDao = new JdbcArtistDao();
		artistDao.remove(Long.parseLong(artistId));
	}
	private void createArtist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String firstName = request.getParameter("lastName");
		String lastName = request.getParameter("firstName");
		
		JdbcArtistDao artistDao = new JdbcArtistDao(); 
		artistDao.add(new Artist(firstName, lastName));
	}
	private void createAlbum(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String price = request.getParameter("price");
		String genre = request.getParameter("genre");
		String imgUrl = request.getParameter("img_url");
		String artistId = request.getParameter("artist");
		
		Album newAlbum = new Album(); 
		newAlbum.setTitle(title);
		newAlbum.setPrice(Double.parseDouble(price));
		newAlbum.setGenre(genre);
		newAlbum.setImgUrl(imgUrl);
		newAlbum.setArtistId(Long.parseLong(artistId));
		
		JdbcAlbumDao albumDao = new JdbcAlbumDao(); 
		albumDao.add(newAlbum);
	}
	private void updateAlbum(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String albumId = request.getParameter("albumId");
		String title = request.getParameter("title");
		String price = request.getParameter("price");
		String imgUrl = request.getParameter("img_url");
		String genre = request.getParameter("genre");
		String artistId = request.getParameter("artist");
		
		Album updatedAlbum = new Album();
		updatedAlbum.setAlbumId(Long.parseLong(albumId));
		updatedAlbum.setTitle(title);
		updatedAlbum.setPrice(Double.parseDouble(price));
		updatedAlbum.setGenre(genre);
		updatedAlbum.setImgUrl(imgUrl);
		updatedAlbum.setArtistId(Long.parseLong(artistId));
		
		JdbcAlbumDao albumDao = new JdbcAlbumDao(); 
		albumDao.update(updatedAlbum);
	}
	private void deleteAlbum(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		
		String albumId = request.getParameter("albumId");
		
		JdbcAlbumDao albumDao = new JdbcAlbumDao(); 
		albumDao.remove(Long.parseLong(albumId));
	}
}