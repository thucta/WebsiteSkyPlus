package entity;

public class District {
	private String ID;
	private String SolrID;
	private String TinhThanhTitle;
	private String title;
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getSolrID() {
		return SolrID;
	}
	public void setSolrdID(String solrID) {
		SolrID = solrID;
	}
	public String getTinhThanhTitle() {
		return TinhThanhTitle;
	}
	public void setTinhThanhTitle(String tinhThanhTitle) {
		TinhThanhTitle = tinhThanhTitle;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public District(String iD, String solrdID, String tinhThanhTitle, String title) {
		super();
		ID = iD;
		SolrID = solrdID;
		TinhThanhTitle = tinhThanhTitle;
		this.title = title;
	}
	public District() {
		super();
		// TODO Auto-generated constructor stub
	}

	
}
