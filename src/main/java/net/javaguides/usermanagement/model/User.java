package net.javaguides.usermanagement.model;

/**
 * User.java
 * This is a model class represents a User entity
 * @author Ramesh Fadatare
 *
 */
public class User {
	protected int id;
	protected String name;
	protected String email;
	protected String brand;
	protected String plateNo;
	public User() {
	}
	
	public User(String name, String email, String brand,String plateNo) {
		super();
		this.name = name;
		this.email = email;
		this.brand = brand;
		this.plateNo = plateNo;
	}

	public User(int id, String name, String email, String brand,String plateNo) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.brand = brand;
		this.plateNo = plateNo;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getPlateNo() {
		return plateNo;
	}

	public void setPlateNo(String plateNo) {
		this.plateNo = plateNo;
	}
	
	
}
