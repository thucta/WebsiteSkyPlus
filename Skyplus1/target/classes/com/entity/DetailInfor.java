package entity;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "InformationRating")
@XmlAccessorType(XmlAccessType.NONE)
public class DetailInfor {
	@XmlElement(name = "infor")
	private Information information;
	@XmlElement(name = "rating")
	private Long rating;
	@XmlElement(name = "price")
	private Long price;
	@XmlElement(name = "status")
	private int status;

	public DetailInfor() {
		super();
	}

	public DetailInfor(Information information, Long rating, Long price, int status) {
		super();
		this.information = information;
		this.rating = rating;
		this.price = price;
		this.status = status;
	}

	public Information getInformation() {
		return information;
	}

	public void setInformation(Information information) {
		this.information = information;
	}

	public Long getRating() {
		return rating;
	}

	public void setRating(Long rating) {
		this.rating = rating;
	}

	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	};

}
