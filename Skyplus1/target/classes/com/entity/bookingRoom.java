package entity;
// Generated Mar 24, 2017 7:27:14 PM by Hibernate Tools 4.3.1.Final


public class bookingRoom {


	public bookingRoom() {
	}

	public bookingRoom(int id, int room, int users, String datein, String detail, int quanlity, String dateout) {
		super();
		this.id = id;
		this.room = room;
		this.users = users;
		this.datein = datein;
		this.detail = detail;
		this.quanlity = quanlity;
		this.dateout = dateout;
	}

	private int id;
	private int room;
	private int users;
	private String datein;
	private String detail;
	private int quanlity;
	private String dateout;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRoom() {
		return room;
	}

	public void setRoom(int room) {
		this.room = room;
	}

	public int getUsers() {
		return users;
	}

	public void setUsers(int users) {
		this.users = users;
	}

	public String getDatein() {
		return datein;
	}

	public void setDatein(String datein) {
		this.datein = datein;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getQuanlity() {
		return quanlity;
	}

	public void setQuanlity(int quanlity) {
		this.quanlity = quanlity;
	}

	public String getDateout() {
		return dateout;
	}

	public void setDateout(String dateout) {
		this.dateout = dateout;
	}

}
