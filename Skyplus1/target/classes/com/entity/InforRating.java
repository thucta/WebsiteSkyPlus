package entity;

import java.io.Serializable;

public class InforRating implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Information inFor;
	private Long rating;
	private Long price;

	public InforRating() {
	}

	public InforRating(Information inFor, Long rating, Long price) {
		this.inFor = inFor;
		this.rating = rating;
		this.price = price;
	}

	public Information getInFor() {
		return inFor;
	}

	public void setInFor(Information inFor) {
		this.inFor = inFor;
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
}
