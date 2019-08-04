package entity;

public class City {
	// again, it's meeeeeeeee- Ivy moda
	private String SolrID ;
	private String ID;
	private String Title;
	public City(String solrID, String iD, String title) {
		super();
		SolrID = solrID;
		ID = iD;
		Title = title;
	}
	public City() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getSolrID() {
		return SolrID;
	}
	public void setSolrID(String solrID) {
		SolrID = solrID;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	
	
	

}
