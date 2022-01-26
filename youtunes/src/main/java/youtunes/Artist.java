package youtunes;

public class Artist {
	
	private long artistId;
	private String lastName;
	private String firstName;
	
	public Artist (long artistId, String lastName, String firstName) {
		
		this.artistId = artistId;
		this.lastName = lastName;
		this.firstName = firstName;
	}
	public Artist (String lastName, String firstName) {
		
		this.lastName = lastName;
		this.firstName = firstName;
	}
	public Artist() {
		
		}
	public void setAritstId(long artistId) {
		this.artistId = artistId; 
	}
	
	public long getArtistId() {
		return artistId;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	public String getFirstName() {
		return firstName;
	}
	@Override
	public String toString() {
		
		return String.format("Artist{artistId=%s, lastName=%s, firstName=%s}", artistId, lastName, firstName);
	}
}