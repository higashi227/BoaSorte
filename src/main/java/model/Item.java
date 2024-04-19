package model;

import java.util.ArrayList;

public class Item {
	private int id;
	private String name; 
	private int price;
	private int is_coffee;


	// コンストラクタ
	public Item(int id, String name, int price, int is_coffee) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.is_coffee = is_coffee;
	}

	
	
	//IDのgetter.setterメソッド
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	
	
	//商品名のgetter.setterメソッド
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	
	//金額のgetter.setterメソッド
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	
	
	//コーヒーかどうかのgetter.setter
	public int getIs_coffee() {
		return is_coffee;
	}
	public void setIs_coffee(int is_coffee) {
		this.is_coffee = is_coffee;
	}



	public static ArrayList<Item> getItem() {
		// TODO 自動生成されたメソッド・スタブ
		return null;
	}


}